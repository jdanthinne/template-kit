/// Returns `true` if the supplied dictionary contains a given key.
///
///     containsKey(<dictionary>, <string>
///
public final class ContainsKey: TagRenderer {
    /// Creates a new `Contains` tag renderer.
    public init() {}

    /// See `TagRenderer`.
    public func render(tag: TagContext) throws -> Future<TemplateData> {
        /// Require two parameters.
        try tag.requireParameterCount(2)

        let res: TemplateData

        /// Convert first param to a dictionary and second to string or return false.
        if let dictionary = tag.parameters[0].dictionary,
            let compare = tag.parameters[1].string {
            /// Return `true` if the dictionary contains the key.
            res = .bool(dictionary.keys.contains(compare))
        } else {
            res = .bool(false)
        }

        return Future.map(on: tag) { res }
    }
}
