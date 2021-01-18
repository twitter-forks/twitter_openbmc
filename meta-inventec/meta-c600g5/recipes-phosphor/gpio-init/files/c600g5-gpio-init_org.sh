#!/bin/sh
# C600G5 GPIO initialization

# GROUP A-Z
GPIO_A0=0
GPIO_A1=1
GPIO_A2=2
GPIO_A3=3
GPIO_A4=4
GPIO_A5=5
GPIO_A6=6
GPIO_A7=7
GPIO_B0=8
GPIO_B1=9
GPIO_B2=10
GPIO_B3=11
GPIO_B4=12
GPIO_B5=13
GPIO_B6=14
GPIO_B7=15
GPIO_C0=16
GPIO_C1=17
GPIO_C2=18
GPIO_C3=19
GPIO_C4=20
GPIO_C5=21
GPIO_C6=22
GPIO_C7=23
GPIO_D0=24
GPIO_D1=25
GPIO_D2=26
GPIO_D3=27
GPIO_D4=28
GPIO_D5=29
GPIO_D6=30
GPIO_D7=31
GPIO_E0=32
GPIO_E1=33
GPIO_E2=34
GPIO_E3=35
GPIO_E4=36
GPIO_E5=37
GPIO_E6=38
GPIO_E7=39
GPIO_F0=40
GPIO_F1=41
GPIO_F2=42
GPIO_F3=43
GPIO_F4=44
GPIO_F5=45
GPIO_F6=46
GPIO_F7=47
GPIO_G0=48
GPIO_G1=49
GPIO_G2=50
GPIO_G3=51
GPIO_G4=52
GPIO_G5=53
GPIO_G6=54
GPIO_G7=55
GPIO_H0=56
GPIO_H1=57
GPIO_H2=58
GPIO_H3=59
GPIO_H4=60
GPIO_H5=61
GPIO_H6=62
GPIO_H7=63
GPIO_I0=64
GPIO_I1=65
GPIO_I2=66
GPIO_I3=67
GPIO_I4=68
GPIO_I5=69
GPIO_I6=70
GPIO_I7=71
GPIO_J0=72
GPIO_J1=73
GPIO_J2=74
GPIO_J3=75
GPIO_J4=76
GPIO_J5=77
GPIO_J6=78
GPIO_J7=79
GPIO_K0=80
GPIO_K1=81
GPIO_K2=82
GPIO_K3=83
GPIO_K4=84
GPIO_K5=85
GPIO_K6=86
GPIO_K7=87
GPIO_L0=88
GPIO_L1=89
GPIO_L2=90
GPIO_L3=91
GPIO_L4=92
GPIO_L5=93
GPIO_L6=94
GPIO_L7=95
GPIO_M0=96
GPIO_M1=97
GPIO_M2=98
GPIO_M3=99
GPIO_M4=100
GPIO_M5=101
GPIO_M6=102
GPIO_M7=103
GPIO_N0=104
GPIO_N1=105
GPIO_N2=106
GPIO_N3=107
GPIO_N4=108
GPIO_N5=109
GPIO_N6=110
GPIO_N7=111
GPIO_O0=112
GPIO_O1=113
GPIO_O2=114
GPIO_O3=115
GPIO_O4=116
GPIO_O5=117
GPIO_O6=118
GPIO_O7=119
GPIO_P0=120
GPIO_P1=121
GPIO_P2=122
GPIO_P3=123
GPIO_P4=124
GPIO_P5=125
GPIO_P6=126
GPIO_P7=127
GPIO_Q0=128
GPIO_Q1=129
GPIO_Q2=130
GPIO_Q3=131
GPIO_Q4=132
GPIO_Q5=133
GPIO_Q6=134
GPIO_Q7=135
GPIO_R0=136
GPIO_R1=137
GPIO_R2=138
GPIO_R3=139
GPIO_R4=140
GPIO_R5=141
GPIO_R6=142
GPIO_R7=143
GPIO_S0=144
GPIO_S1=145
GPIO_S2=146
GPIO_S3=147
GPIO_S4=148
GPIO_S5=149
GPIO_S6=150
GPIO_S7=151
GPIO_T0=152
GPIO_T1=153
GPIO_T2=154
GPIO_T3=155
GPIO_T4=156
GPIO_T5=157
GPIO_T6=158
GPIO_T7=159
GPIO_U0=160
GPIO_U1=161
GPIO_U2=162
GPIO_U3=163
GPIO_U4=164
GPIO_U5=165
GPIO_U6=166
GPIO_U7=167
GPIO_V0=168
GPIO_V1=169
GPIO_V2=170
GPIO_V3=171
GPIO_V4=172
GPIO_V5=173
GPIO_V6=174
GPIO_V7=175
GPIO_W0=176
GPIO_W1=177
GPIO_W2=178
GPIO_W3=179
GPIO_W4=180
GPIO_W5=181
GPIO_W6=182
GPIO_W7=183
GPIO_X0=184
GPIO_X1=185
GPIO_X2=186
GPIO_X3=187
GPIO_X4=188
GPIO_X5=189
GPIO_X6=190
GPIO_X7=191
GPIO_Y0=192
GPIO_Y1=193
GPIO_Y2=194
GPIO_Y3=195
GPIO_Y4=196
GPIO_Y5=197
GPIO_Y6=198
GPIO_Y7=199
GPIO_Z0=200
GPIO_Z1=201
GPIO_Z2=202
GPIO_Z3=203
GPIO_Z4=204
GPIO_Z5=205
GPIO_Z6=206
GPIO_Z7=207

# GROUP AA
GPIO_AA0=208
GPIO_AA1=209
GPIO_AA2=210
GPIO_AA3=211
GPIO_AA4=212
GPIO_AA5=213
GPIO_AA6=214
GPIO_AA7=215

# GROUP AB
GPIO_AB0=216
GPIO_AB1=217
GPIO_AB2=218
GPIO_AB3=219

# GROUP AC
GPIO_AC0=220
GPIO_AC1=221
GPIO_AC2=222
GPIO_AC3=223
GPIO_AC4=224
GPIO_AC5=225
GPIO_AC6=226
GPIO_AC7=227

GPIO_SYSFS=/sys/class/gpio
GPIO_EXPORT=${GPIO_SYSFS}/export
GPIO_BASE=$(cat ${GPIO_SYSFS}/gpio*/base)

gpio_export() {
    local gpio=$(($1 + ${GPIO_BASE}))
    local gpio_path=${GPIO_SYSFS}/gpio${gpio}

    if [ ! -d "${gpio_path}" ]; then
        echo ${gpio} > ${GPIO_EXPORT}
    fi
}

gpio_set_direction() {
    local gpio=$(($1 + ${GPIO_BASE}))
    local dir_path=${GPIO_SYSFS}/gpio${gpio}/direction
    local dir=$2

    if [ -f "${dir_path}" ]; then
        echo ${dir} > ${dir_path}
    fi
}

gpio_set_value() {
    local gpio=$(($1 + ${GPIO_BASE}))
    local val_path=${GPIO_SYSFS}/gpio${gpio}/value
    local val=$2

    if [ -f "${val_path}" ]; then
        echo ${val} > ${val_path}
    fi
}

# direction: in/out
# value: 0/1

# Init GPIO to output high
gpio_out_high="\
    ${GPIO_A6}\
    ${GPIO_A7}\
    ${GPIO_E1}\
    ${GPIO_E3}\
    ${GPIO_E5}\
    ${GPIO_E7}\
    ${GPIO_F0}\
    ${GPIO_F1}\
    ${GPIO_F2}\
    ${GPIO_F3}\
    ${GPIO_F4}\
    ${GPIO_F5}\
    ${GPIO_F6}\
    ${GPIO_F7}\
    ${GPIO_G1}\
    ${GPIO_G2}\
    ${GPIO_G3}\
    ${GPIO_G4}\
    ${GPIO_G7}\
    ${GPIO_H0}\
    ${GPIO_H5}\
    ${GPIO_H6}\
    ${GPIO_H7}\
    ${GPIO_M1}\
    ${GPIO_M4}\
    ${GPIO_M5}\
    ${GPIO_M6}\
    ${GPIO_M7}\
    ${GPIO_Q7}\
    ${GPIO_T6}\
    ${GPIO_Y0}\
    ${GPIO_Z2}\
    ${GPIO_Z3}\
    ${GPIO_AA1}\
    ${GPIO_AA2}\
    ${GPIO_AB1}\
    ${GPIO_AB3}\
"
for i in ${gpio_out_high}
do
    gpioset gpiochip0 ${i}=1
    # gpio_export ${i}
    # gpio_set_direction ${i} out
    # gpio_set_value ${i} 1
done

# Init GPIO to output low
gpio_out_low="\
    ${GPIO_B0}\
    ${GPIO_B1}\
    ${GPIO_B2}\
    ${GPIO_B3}\
    ${GPIO_B4}\
    ${GPIO_B7}\
    ${GPIO_D7}\
    ${GPIO_H1}\
    ${GPIO_H2}\
    ${GPIO_I0}\
    ${GPIO_I1}\
    ${GPIO_I2}\
    ${GPIO_I3}\
    ${GPIO_M0}\
    ${GPIO_N5}\
    ${GPIO_N6}\
    ${GPIO_AB0}\
"
for i in ${gpio_out_low}
do
    gpioset gpiochip0 ${i}=0
    # gpio_export ${i}
    # gpio_set_direction ${i} out
    # gpio_set_value ${i} 0
done

# Init GPIO to input
gpio_in="\
    ${GPIO_A0}\
    ${GPIO_A1}\
    ${GPIO_A2}\
    ${GPIO_A3}\
    ${GPIO_D0}\
    ${GPIO_D1}\
    ${GPIO_D2}\
    ${GPIO_D3}\
    ${GPIO_D4}\
    ${GPIO_D5}\
    ${GPIO_D6}\
    ${GPIO_E0}\
    ${GPIO_E2}\
    ${GPIO_E4}\
    ${GPIO_E6}\
    ${GPIO_G0}\
    ${GPIO_G5}\
    ${GPIO_G6}\
    ${GPIO_H3}\
    ${GPIO_H4}\
    ${GPIO_M2}\
    ${GPIO_M3}\
    ${GPIO_P4}\
    ${GPIO_P5}\
    ${GPIO_P6}\
    ${GPIO_P7}\
    ${GPIO_Q6}\
    ${GPIO_R1}\
    ${GPIO_R2}\
    ${GPIO_R3}\
    ${GPIO_R4}\
    ${GPIO_R5}\
    ${GPIO_S0}\
    ${GPIO_S1}\
    ${GPIO_S2}\
    ${GPIO_S3}\
    ${GPIO_S4}\
    ${GPIO_S5}\
    ${GPIO_S6}\
    ${GPIO_S7}\
    ${GPIO_U2}\
    ${GPIO_U3}\
    ${GPIO_Y1}\
    ${GPIO_Y2}\
    ${GPIO_Y3}\
    ${GPIO_Z0}\
    ${GPIO_Z1}\
    ${GPIO_Z4}\
    ${GPIO_Z5}\
    ${GPIO_Z6}\
    ${GPIO_Z7}\
    ${GPIO_AA0}\
    ${GPIO_AA3}\
    ${GPIO_AA4}\
    ${GPIO_AA5}\
    ${GPIO_AA6}\
    ${GPIO_AA7}\
    ${GPIO_AB2}\
"
# for i in ${gpio_in}
# do
    # gpio_export ${i}
    # gpio_set_direction ${i} in
# done

exit 0