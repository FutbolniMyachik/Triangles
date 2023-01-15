#include "math.h"

using Edge = std::pair<QPointF, QPointF>;

double skew(const QPointF &p0, const QPointF &p1)
{
    return p0.x() * p1.y() - p0.y() * p1.x();
}

bool edgePointsOnDifferentSides(const Edge &intersectedEdge, const Edge &intersectingEdge)
{
    const QPointF intersectedVec = intersectedEdge.second - intersectedEdge.first;
    return skew(intersectedVec, intersectingEdge.first - intersectedEdge.first) *
            skew(intersectedVec, intersectingEdge.second - intersectedEdge.first) <= 0;
}

Edge edgeByIndex(const Triangle &triangle, unsigned index)
{
    return {triangle.vertixByIndex(index % triangleVertixCount),
                triangle.vertixByIndex((index + 1) % triangleVertixCount)};
}

bool twoTriangleIntersect(const Triangle &triangle0, const Triangle &triangle1)
{
    for (int i = 0; i < triangleVertixCount; ++i) {
        Edge edge0 = edgeByIndex(triangle0, i);
        for (int j = 0; j < triangleVertixCount; ++j) {
            Edge edge1 = edgeByIndex(triangle1, j);
            if (edgePointsOnDifferentSides(edge0, edge1) && edgePointsOnDifferentSides(edge1, edge0))
                return true;
        }
    }
    return false;
}

int calcNumberOfIntersecting(const QVector<Triangle> &triangles)
{
    int result = 0;
    const int triangleCount = triangles.size();
    for (int i = 0; i < triangleCount; ++i) {
        for (int j = i + 1; j < triangleCount; ++j) {
            result += twoTriangleIntersect(triangles[i], triangles[j]);
        }
    }
    return result;
}
