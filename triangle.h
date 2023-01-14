#ifndef TRIANGLE_H
#define TRIANGLE_H

#include <QPointF>
#include <array>
#include <QVariant>

class Triangle
{
public:
    explicit Triangle(const std::array<QPointF, 3> &vertixes);
    explicit Triangle(std::array<QPointF, 3> &&vertixes);

    QPointF x() const;
    QPointF y() const;
    QPointF z() const;
private:
    std::array<QPointF, 3> _vertixes;
};

Q_DECLARE_METATYPE(Triangle)

#endif // TRIANGLE_H
