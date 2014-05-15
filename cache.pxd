"""
Header file for cache.pyx

Jonas Toft Arnfred, 2013-05-08
"""
cimport numpy

cdef class Grid_Cache :

    cdef int rows
    cdef int cols
    cdef public int margin
    cdef int width
    cdef int height
    cdef public int cell_width
    cdef public int cell_height
    cdef public int block_width
    cdef public int block_height
    cdef numpy.ndarray data
    cdef public object last_cell
    cdef public object last_block
    cdef object grid
    # Methods
    cdef object frame(self, int col, int row, int width, int height)
    cdef object get_cell(self, int col, int row)
    cdef numpy.ndarray[numpy.int_t] center(self, int col, int row)
    cdef object cache(self, int col, int row)
    cpdef object block(self, double x, double y)
    cdef object cell(self, double x, double y)
    cpdef get(self, double x, double y)

    cpdef object get_neighbor(self, int col, int row, double pos_x, double pos_y)

cdef class Metric_Cache :
    cdef public char* path
    cdef public object thumb
    cdef public object original
    # methods
    cdef object load(self, char* dir = ?)
    cdef create_thumbnail(self, char* path, int thumb_x, int thumb_y)
    cdef create_image(self, char* path, int max_size, char* metric)
