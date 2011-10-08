
TYPE =
  RPC_REQUEST: 0x03,
  TABULAR_RESULT: 0x04,
  LOGIN7: 0x10,
  PRELOGIN: 0x12

STATUS =
  NORMAL: 0x00,
  EOM: 0x01,                      # End Of Message (last packet).
  IGNORE: 0x02,                   # EOM must also be set.
  RESETCONNECTION: 0x08,
  RESETCONNECTIONSKIPTRAN: 0x10

OFFSET =
  Type: 0,
  Status: 1,
  Length: 2,
  SPID: 4,
  PacketID: 6,
  Window: 7

DEFAULT_SPID = 0;
DEFAULT_PACKETID = 0;
DEFAULT_WINDOW = 0;

class Packet
  constructor: (@Type) ->
    @buffer = new Buffer(8)

    @buffer.writeUInt8(@Type, OFFSET.Type)
    @buffer.writeUInt8(STATUS.NORMAL, OFFSET.Status)
    @buffer.writeUInt16BE(@buffer.length, OFFSET.Length)
    @buffer.writeUInt16BE(DEFAULT_SPID, OFFSET.SPID)
    @buffer.writeUInt8(DEFAULT_PACKETID, OFFSET.PacketID)
    @buffer.writeUInt8(DEFAULT_WINDOW, OFFSET.Window)

exports.Packet = Packet
exports.TYPE = TYPE