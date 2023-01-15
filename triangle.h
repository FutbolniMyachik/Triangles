#ifndef TRIANGLE_H
#define TRIANGLE_H

#include "constants.h"
#include <QPointF>
#include <array>
#include <QVariant>

class Triangle
{
public:
    explicit Triangle(const std::array<QPointF, triangleVertixCount> &vertixes);
    explicit Triangle(std::array<QPointF, triangleVertixCount> &&vertixes);

    void setPoint(int index, const QPointF &point);

    QPointF vertixByIndex(int index) const;
    QPointF x() const;
    QPointF y() const;
    QPointF z() const;
private:
    std::array<QPointF, triangleVertixCount> _vertixes;
};

Q_DECLARE_METATYPE(Triangle)

#endif // TRIANGLE_H
