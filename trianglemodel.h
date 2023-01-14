#ifndef TRIANGLEMODEL_H
#define TRIANGLEMODEL_H

#include <QAbstractListModel>

#include "triangle.h"

class TriangleModel : public QAbstractListModel
{
public:
    TriangleModel();

    // QAbstractItemModel interface
public:
    enum Roles {
        TriangleRole = Qt::ItemDataRole::UserRole + 1
    };
    void addTriangle(const Triangle &triangle);
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
private:
    QVector<Triangle> _triangles;
};

#endif // TRIANGLEMODEL_H
