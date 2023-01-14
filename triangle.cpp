#include "triangle.h"

Triangle::Triangle(const std::array<QPointF, 3> &vertixes):
    _vertixes(vertixes)
{

}

Triangle::Triangle(std::array<QPointF, 3> &&vertixes) :
    _vertixes(std::move(vertixes))
{

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
