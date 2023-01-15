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
    Q_INVOKABLE int intersectCount() const;
    Q_SIGNAL void intersectingCountChanged(int intersectingCount);

    Q_INVOKABLE void removeTriangle(int index);
    Q_INVOKABLE void addTriangle(const QPointF &x, const QPointF &y, const QPointF &z);

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    bool setData(const QModelIndex &index, const QVariant &value, int role);
    QHash<int, QByteArray> roleNames() const;
    Qt::ItemFlags flags(const QModelIndex &index) const;
private:
    void calcItersectCount();

    QVector<Triangle> _triangles;
    int _intersectingCount = 0;
};

#endif // TRIANGLEMODEL_H
