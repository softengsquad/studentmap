
/// Holds information about the building types. This object
/// is to be used when fetching information from the **database**.
/// 1. University - "uni"
/// 2. Supermarket - "mark"
/// 3. Social - "soc"
class Building{

    final int id;
    final String name;
    final String addressLine1;
    final String addressLine2;
    final String postcode;
    final String type; // The building type 
  
    Building({
      required this.id,
      required this.name,
      required this.addressLine1,
      required this.addressLine2,
      required this.postcode,
      required this.type
    });
}