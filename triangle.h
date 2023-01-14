#ifndef TRIANGLE_H
#define TRIANGLE_H

#include <QPointF>
#include <QObject>

class Triangle : public QObject
{
    Q_OBJECT
public:
    Triangle(const std::array<QPointF, 3> &vertixes);
    Triangle(std::array<QPointF, 3> &&vertixes);

    Q_SLOT void setVertix(int index, const QPointF &vertix);

    Q_SIGNAL void vertixChanged(int index, const QPointF &vertix);
private:
    std::array<QPointF, 3> _vertixes;
};

#endif // TRIANGLE_H
