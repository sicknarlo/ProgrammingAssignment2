#makeCacheMatrix creates a list of 4 functions: set, get, setInverse, and getInverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL  # sets i to null by default
  set <- function(y) {    #this takes an input matrix and "sets" it.  it also resets i as null if a new matrix is named   
    x <<- y
    i <<- NULL
  }
  get <- function() x   #this function calls a matrix that has been set
  setinverse <- function(inverse) i <<- inverse  #this function sets the inverse as "i" of the matrix
  getinverse <- function() i #this calls the cached inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function first checks to see if an inverse exists in the previously made cache.
##if it does, it simply retrieves it.  if one does not exist, it uses solve() to create and then store the
##inverse.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {w$set
    message("inverse exists.  retrieving")
    return(i)
  }
  m_data <- x$get()
  i <- solve(m_data)
  x$setinverse(i)
  i
}
