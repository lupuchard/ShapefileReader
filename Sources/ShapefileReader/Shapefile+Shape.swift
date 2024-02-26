import Foundation

public extension Shapefile {

    enum Shape: Equatable {
        case point(Point)
        case polyLine(PolyLine)
        case polygon(Polygon)
        case multiPoint(MultiPoint)
        case pointZ(PointZ)
        case polyLineZ(PolyLineZ)
        case polygonZ(PolygonZ)
        case multiPointZ(MultiPointZ)
        case pointM(PointM)
        case polyLineM(PolyLineM)
        case polygonM(PolygonM)
        case multiPointM(MultiPointM)
        case multiPatch(MultiPatch)
    }
}

// MARK: Types of shape

extension Shapefile.Shape {

    /// A `Point` consists of a pair of double-precision coordinates in the order X,Y.
    public struct Point: Equatable {
        public let x: Double
        public let y: Double
    }

    /// A `PolyLine` is an ordered set of vertices that consists of one or more parts. A part is a connected sequence of two or more points. Parts may or may not be connected to one another. Parts may or may not intersect one another.
    public struct PolyLine: Equatable {
        public let minBoundingBox: Shapefile.BoundingBox
        public let parts: [Int]
        public let points: [Point]
    }

    /// A `Polygon` consists of one or more rings. A ring is a connected sequence of four or more points that form a closed, non-self-intersecting loop. A polygon may contain multiple outer rings. The order of vertices or orientation for a ring indicates which side of the ring is the interior of the polygon. The neighborhood to the right of an observer walking along the ring in vertex order is the neighborhood inside the polygon. Vertices of rings defining holes in polygons are in a counterclockwise direction. Vertices for a single, ringed polygon are, therefore, always in clockwise order. The rings of a polygon are referred to as its parts.
    public struct Polygon: Equatable {
        public let minBoundingBox: Shapefile.BoundingBox
        public let parts: [Int]
        public let points: [Point]
    }

    /// A `MultiPoint` represents a set of points.
    public struct MultiPoint: Equatable {
        public let minBoundingBox: Shapefile.BoundingBox
        public let points: [Point]
    }

    /// A `PointZ` consists of a triplet of double-precision coordinates in the order X, Y, Z plus a measure.
    public struct PointZ: Equatable {
        public let x: Double
        public let y: Double
        public let z: Double
        public let m: Double?
    }

    /// A `PolyLineZ` consists of one or more parts. A part is a connected sequence of two or more points. Parts may or may not be connected to one another. Parts may or may not intersect one another.
    public struct PolyLineZ: Equatable {
        public let minBoundingBox: Shapefile.BoundingBox
        public let parts: [Int]
        public let points: [Point]
        public let zRange: ClosedRange<Double>
        public let zValues: [Double]
        public let mRange: ClosedRange<Double>?
        public let mValues: [Double?]?
    }

    /// A `PolygonZ` consists of a number of rings. A ring is a closed, non-self-intersecting loop. A `PolygonZ` may contain multiple outer rings. The rings of a `PolygonZ` are referred to as its parts.
    public struct PolygonZ: Equatable {
        public let minBoundingBox: Shapefile.BoundingBox
        public let parts: [Int]
        public let points: [Point]
        public let zRange: ClosedRange<Double>
        public let zValues: [Double]
        public let mRange: ClosedRange<Double>?
        public let mValues: [Double?]?
    }

    /// A `MultiPointZ` represents a set of PointZs.
    public struct MultiPointZ: Equatable {
        public let minBoundingBox: Shapefile.BoundingBox
        public let points: [Point]
        public let zRange: ClosedRange<Double>
        public let zValues: [Double]
        public let mRange: ClosedRange<Double>?
        public let mValues: [Double?]?
    }

    /// A `PointM` consists of a pair of double-precision coordinates in the order X, Y, plus a measure M.
    public struct PointM: Equatable {
        public let x: Double
        public let y: Double
        public let m: Double
    }

    /// A shapefile `PolyLineM` consists of one or more parts. A part is a connected sequence of two or more points. Parts may or may not be connected to one another. Parts may or may not intersect one another.
    public struct PolyLineM: Equatable {
        public let minBoundingBox: Shapefile.BoundingBox
        public let parts: [Int]
        public let points: [Point]
        public let mRange: ClosedRange<Double>?
        public let mValues: [Double?]?
    }

    /// A `PolygonM` consists of a number of rings. A ring is a closed, non-self-intersecting loop. Note that intersections are calculated in X,Y space, not in X,Y,M space. A `PolygonM` may contain multiple outer rings. The rings of a `PolygonM` are referred to as its parts.
    public struct PolygonM: Equatable {
        public let minBoundingBox: Shapefile.BoundingBox
        public let parts: [Int]
        public let points: [Point]
        public let mRange: ClosedRange<Double>?
        public let mValues: [Double?]?
    }

    /// A `MultiPointM` represents a set of PointMs.
    public struct MultiPointM: Equatable {
        public let minBoundingBox: Shapefile.BoundingBox
        public let points: [Point]
        public let mRange: ClosedRange<Double>?
        public let mValues: [Double?]?
    }

    /// A `MultiPatch` consists of a number of surface patches. Each surface patch describes a surface. The surface patches of a `MultiPatch` are referred to as its parts, and the type of part controls how the order of vertices of an `MultiPatch` part is interpreted.
    public struct MultiPatch: Equatable {
        public enum PartType: Int {
            case triangleStrip = 0
            case triangleFan = 1
            case outerRing = 2
            case innerRing = 3
            case firstRing = 4
            case ring = 5
        }

        public let minBoundingBox: Shapefile.BoundingBox
        public let parts: [Int]
        public let partTypes: [PartType]
        public let points: [Point]
        public let zRange: ClosedRange<Double>
        public let zValues: [Double]
        public let mRange: ClosedRange<Double>?
        public let mValues: [Double?]?
    }
}