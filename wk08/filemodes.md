`fopen` call            | `open` call   
------------------------|----------------------
`fopen(FilePath, "r")`  | open(filename, O_RDONLY)         
`fopen(FilePath, "a")`  | open(filename, O_WRONLY \| O_CREAT \| O_APPEND)              
`fopen(FilePath, "w")`  | open(filename, O_WRONLY \| O_CREAT \| O_TRUNC)              
`fopen(FilePath, "r+")` | open(filename, O_RDWR)              
`fopen(FilePath, "w+")` | open(filename, O_RDWR \| O_CREAT \| O_TRUNC)               

flag            | meaning
----------------|---------------
`O_RDONLY`      | file opened in read only mode - can't use writing functions like printf
`O_WRONLY`      | file opened in write only mode - can't use scanning functions like scanf, used for fopen write and append modes
`O_RDWR`        | file opened in read + write mode
`O_CREAT`       | if the file doesn't exist, it will be created
`O_TRUNC`       | when the file is opened, it is truncated (wiped)
`O_APPEND`      | when the file is opened, seek to the end, this is not truncated