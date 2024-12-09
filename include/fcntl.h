//
// Created by Oniar_Pie on 2024/10/7.
//

#ifndef GMS_FCNTL_H
#define GMS_FCNTL_H

#define F_DUPFD     1
#define F_GETFD     2
#define F_SETFD     3
#define F_GETFL     4
#define F_SETFL     5
#define F_GETLK     6
#define F_SETLK     7
#define F_SETLKW    8

#define FD_CLOEXEC 1


#define	O_RDONLY	00000000	/* Open read-only */
#define	O_WRONLY	00000001	/* Open write-only */
#define	O_RDWR		00000002	/* Open read/write */
#define	O_ACCMODE	00000003	/* Mask for file access modes */

#define	O_CREAT		00000100	/* Create file if it does not exist */
#define	O_EXCL		00000200	/* Fail if file already exists */
#define	O_NOCTTY	00000400	/* Do not assign controlling terminal */
#define	O_TRUNC		00001000	/* If the file exists and is a regular file, and the file is successfully opened O_RDWR or O_WRONLY, its length shall be truncated to 0 */
#define	O_APPEND	00002000	/* the file offset shall be set to the end of the file */
#define	O_NONBLOCK	00004000	/* Non-blocking I/O mode */

#define	O_EXEC		00010000	/* Open for execute only (non-directory files) */
#define	O_SEARCH	00020000	/* Open directory for search only */
#define	O_DIRECTORY	00040000	/* must be a directory */
#define	O_NOFOLLOW	00100000	/* Do not follow symbolic links */


int open(const char *path, int oflag);
int close(int fildes);
#endif //GMS_FCNTL_H
