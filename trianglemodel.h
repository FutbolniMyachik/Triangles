#ifndef TRIANGLEMODEL_H
#define TRIANGLEMODEL_H

#include <QAbstractListModel>

#include "triangle.h"

class TriangleModel : public QAbstractListModel
{
    Q_OBJECT
public:
    TriangleModel();
    enum Roles {
        TriangleRole = Qt::ItemDataRole::UserRole + 1,
        XPoint,
        YPoint,
        ZPoint
    };
    Q_INVOKABLE void addTriangle(const QPointF &x, const QPointF &y, const QPointF &z);

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;
private:
    QVector<Triangle> _triangles;
};

#endif // TRIANGLEMODEL_H
