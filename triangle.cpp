#include "triangle.h"

Triangle::Triangle(const std::array<QPointF, triangleVertixCount> &vertixes):
    _vertixes(vertixes)
{

}

Triangle::Triangle(std::array<QPointF, triangleVertixCount> &&vertixes) :
    _vertixes(std::move(vertixes))
{

}

void Triangle::setPoint(int index, const QPointF &point)
{
    _vertixes[index] = point;
}

QPointF Triangle::vertixByIndex(int index) const
{
    return _vertixes[index];
}

QPointF Triangle::x() const
{
    return _vertixes[0];
}

QPointF Triangle::y() const
{
    return _vertixes[1];
}

QPointF Triangle::z() const
{
    return _vertixes[2];
}
