#include "trianglemodel.h"

TriangleModel::TriangleModel()
{

}

void TriangleModel::addTriangle(const Triangle &triangle)
{
    beginInsertRows({}, _triangles.size(), _triangles.size());
    _triangles.push_back(triangle);
    endInsertRows();
}

int TriangleModel::rowCount(const QModelIndex &parent) const
{
    return parent.isValid() ? 0 : _triangles.size();
}

QVariant TriangleModel::data(const QModelIndex &index, int role) const
{
    return role != Roles::TriangleRole ? QAbstractItemModel::data(index, role)
                                       : index.isValid() ? _triangles.at(index.row()) : QVariant();
}
