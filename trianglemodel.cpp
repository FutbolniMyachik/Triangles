#include "trianglemodel.h"

TriangleModel::TriangleModel()
{
}

void TriangleModel::addTriangle(const QPointF &x, const QPointF &y, const QPointF &z)
{
    beginInsertRows({}, _triangles.size(), _triangles.size());
    _triangles.push_back(Triangle({x, y, z}));
    endInsertRows();
}

int TriangleModel::rowCount(const QModelIndex &parent) const
{
    return _triangles.size();
}

QVariant TriangleModel::data(const QModelIndex &index, int role) const
{
    if (role < Roles::TriangleRole || !index.isValid())
        return QVariant();
    switch (role) {
    case TriangleRole:
        return QVariant::fromValue(_triangles[index.row()]);
    case XPoint:
        return _triangles[index.row()].x();
    case YPoint:
        return _triangles[index.row()].y();
    case ZPoint:
        return _triangles[index.row()].z();
    }
    return QVariant();
}

QHash<int, QByteArray> TriangleModel::roleNames() const
{
    QHash<int,QByteArray> roles = QAbstractListModel::roleNames();
    roles.insert(Roles::TriangleRole, "triangle");
    roles.insert(Roles::XPoint, "xPoint");
    roles.insert(Roles::YPoint, "yPoint");
    roles.insert(Roles::ZPoint, "zPoint");
    return roles;
}
