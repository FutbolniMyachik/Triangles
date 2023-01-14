#include "triangle.h"

Triangle::Triangle(const std::array<QPointF, 3> &vertixes) :
    _vertixes(vertixes)
{

}

Triangle::Triangle(std::array<QPointF, 3> &&vertixes) :
    _vertixes(std::move(vertixes))
{

}

void Triangle::setVertix(int index, const QPointF &vertix)
{
    _vertixes[index] = vertix;
    emit vertixChanged(index, _vertixes[index]);
}
