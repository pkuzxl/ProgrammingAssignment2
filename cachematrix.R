## The overall function computes the inverse of a matrix in a effective way by storing the inverse into the cache and checking if the inverse has been calculated and stored in the cache to save the time of recalculating.

## The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to 
##1, set the value of the matrix
##2, get the value of the matrix
##3, set the value of the inverse
##4, get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() {
		x
	}
	setinverse <- function(inverse) {
	m <<- solve
	}
	getinverse <- function() {m
	}
	list(set=set, get=get,
		setinverse = setinverse,
		getinverse = getinverse)
}



## The following function calculates the inverse of the special "vector" created by the above function. It first checks to see if the inverse has been calculated yet, if so, it get the inverse from the cache and skip the computation. Otherwise, it calculate the inverse of the data, and sets the value of the inverse into the cache. 

cacheSolve <- function(x, ...) {
	m <- x$getinverse()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setinverse(m)
	m        ## Return a matrix that is the inverse of 'x'
}
