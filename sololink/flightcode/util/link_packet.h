#ifndef LINK_PACKET_H
#define LINK_PACKET_H

#include <stdint.h>

static const int PKT_MTU = 1500; /* MTU  */

static const int MAX_PAYLOAD = 1444; /* 1500 MTU minus the header HDR_LEN 56 */



struct LinkPacket {

    uint64_t tf_recv_us;
    uint64_t tf_send_us;
    uint64_t tc_recv_us;
    uint64_t tc_send_us;
    uint64_t stm_recv_us;
    uint32_t seq;
    uint32_t data1;
    uint32_t data2;
    uint32_t data3;
    uint8_t payload[MAX_PAYLOAD];

    // everything but the payload
    static const int HDR_LEN = 56;
};

// just bytes in 'payload' 
struct MAVPacket {
    uint8_t payload[PKT_MTU];
};


// union GenericPacket {
//     struct LinkPacket linkpkt;
//     struct MAVPacket  mavpkt;
// }; // after the anonymous union definition, the members of the anonymous union are considered to have been defined in the scope in which the anonymous union is declared


#endif // LINK_PACKET_H
