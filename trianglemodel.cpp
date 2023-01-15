#include "trianglemodel.h"

#include "math.h"

TriangleModel::TriangleModel()
{
}

int TriangleModel::intersectCount() const
{
    return _intersectingCount;
}

void TriangleModel::removeTriangle(int index)
{
    beginRemoveRows({}, index, index);
    _triangles.remove(index);
    endRemoveRows();
    calcItersectCount();
}

void TriangleModel::addTriangle(const QPointF &x, const QPointF &y, const QPointF &z)
{
    beginInsertRows({}, _triangles.size(), _triangles.size());
    _triangles.push_back(Triangle({x, y, z}));
    endInsertRows();
    calcItersectCount();
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

bool TriangleModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (role < Roles::TriangleRole || !index.isValid())
        return QAbstractListModel::setData(index, value, role);
    switch (role) {
    case XPoint:
        _triangles[index.row()].setPoint(0, value.toPointF());
        calcItersectCount();
        break;
    case YPoint:
        _triangles[index.row()].setPoint(1, value.toPointF());
        calcItersectCount();
        break;
    case ZPoint:
        _triangles[index.row()].setPoint(2, value.toPointF());
        calcItersectCount();
        break;
    }
    emit dataChanged(index, index, {role});
    return true;
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

Qt::ItemFlags TriangleModel::flags(const QModelIndex &index) const
{
    return QAbstractListModel::flags(index) | Qt::ItemIsEditable;
}

void TriangleModel::calcItersectCount()
{
    _intersectingCount = calcNumberOfIntersecting(_triangles);
    emit intersectingCountChanged(_intersectingCount);
}
