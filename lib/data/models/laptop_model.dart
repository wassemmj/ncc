class LaptopModel {
  String? processorGeneration;
  String? processorFamily;
  String? processorSpeed;
  String? processorCash;
  String? numberOfCoures;
  String? ramCapacity;
  String? memoryType;
  String? storageCapacity;
  String? storageType;
  String? graphicManufacturer;
  String? graphicModel;
  String? graphicMemorySource;
  String? displaySize;
  String? displaTechnology;
  String? displayResolution;
  String? keyboard;
  String? keyboardBacklight;
  String? ports;
  String? opticalDrive;
  String? audio;
  String? camera;
  String? caseModel;
  String? lightType;
  String? powerSupply;
  String? multiMedia;
  String? networking;
  String? batteryNumberOfCells;
  String? operationSystem;
  String? warranty;

  LaptopModel({
    this.processorGeneration,
    this.processorFamily,
    this.processorSpeed,
    this.processorCash,
    this.numberOfCoures,
    this.ramCapacity,
    this.memoryType,
    this.storageCapacity,
    this.storageType,
    this.graphicManufacturer,
    this.graphicModel,
    this.graphicMemorySource,
    this.displaySize,
    this.displaTechnology,
    this.displayResolution,
    this.keyboard,
    this.keyboardBacklight,
    this.ports,
    this.opticalDrive,
    this.audio,
    this.camera,
    this.caseModel,
    this.lightType,
    this.powerSupply,
    this.multiMedia,
    this.networking,
    this.batteryNumberOfCells,
    this.operationSystem,
    this.warranty,
  });

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Processor_Generation'] = processorGeneration;
    _data['Processor_Family'] = processorFamily;
    _data['Processor_Speed'] = processorSpeed;
    _data['Processor_Cash'] = processorCash;
    _data['Number_Of_Coures'] = numberOfCoures;
    _data['Ram_Capacity'] = ramCapacity;
    _data['Memory_Type'] = memoryType;
    _data['Storage_Capacity'] = storageCapacity;
    _data['Storage_Type'] = storageType;
    _data['Graphic_Manufacturer'] = graphicManufacturer;
    _data['Graphic_Model'] = graphicModel;
    _data['Graphic_Memory_Source'] = graphicMemorySource;
    _data['Display_Size'] = displaySize;
    _data['Displa_Technology'] = displaTechnology;
    _data['Display_Resolution'] = displayResolution;
    _data['Keyboard'] = keyboard;
    _data['Keyboard_Backlight'] = keyboardBacklight;
    _data['Ports'] = ports;
    _data['Optical_Drive'] = opticalDrive;
    _data['Audio'] = audio;
    _data['Camera'] = camera;
    _data['Case_Model'] = caseModel;
    _data['Light_Type'] = lightType;
    _data['Power_Supply'] = powerSupply;
    _data['multiMedia'] = multiMedia;
    _data['Networking'] = networking;
    _data['Battery_Number_Of_Cells'] = batteryNumberOfCells;
    _data['Operation_System'] = operationSystem;
    _data['Warranty'] = warranty;
    return _data;
  }

  factory LaptopModel.fromMap(Map<String, dynamic> map) {
    return LaptopModel(
      processorGeneration: map['processorGeneration'] as String,
      processorFamily: map['processorFamily'] as String,
      processorSpeed: map['processorSpeed'] as String,
      processorCash: map['processorCash'] as String,
      numberOfCoures: map['numberOfCoures'] as String,
      ramCapacity: map['ramCapacity'] as String,
      memoryType: map['memoryType'] as String,
      storageCapacity: map['storageCapacity'] as String,
      storageType: map['storageType'] as String,
      graphicManufacturer: map['graphicManufacturer'] as String,
      graphicModel: map['graphicModel'] as String,
      graphicMemorySource: map['graphicMemorySource'] as String,
      displaySize: map['displaySize'] as String,
      displaTechnology: map['displaTechnology'] as String,
      displayResolution: map['displayResolution'] as String,
      keyboard: map['keyboard'] as String,
      keyboardBacklight: map['keyboardBacklight'] as String,
      ports: map['ports'] as String,
      opticalDrive: map['opticalDrive'] as String,
      audio: map['audio'] as String,
      camera: map['camera'] as String,
      caseModel: map['caseModel'] as String,
      lightType: map['lightType'] as String,
      powerSupply: map['powerSupply'] as String,
      multiMedia: map['multiMedia'] as String,
      networking: map['networking'] as String,
      batteryNumberOfCells: map['batteryNumberOfCells'] as String,
      operationSystem: map['operationSystem'] as String,
      warranty: map['warranty'] as String,
    );
  }
}