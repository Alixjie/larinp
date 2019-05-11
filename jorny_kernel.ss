
jorny_kernel：     文件格式 elf32-i386


Disassembly of section .text:

c0100000 <multiboot_header>:
c0100000:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
c0100006:	00 00                	add    %al,(%eax)
c0100008:	fb                   	sti    
c0100009:	4f                   	dec    %edi
c010000a:	52                   	push   %edx
c010000b:	e4                   	.byte 0xe4

c010000c <entry>:
c010000c:	0f 20 e0             	mov    %cr4,%eax
c010000f:	83 c8 10             	or     $0x10,%eax
c0100012:	0f 22 e0             	mov    %eax,%cr4
c0100015:	b8 00 50 10 00       	mov    $0x105000,%eax
c010001a:	0f 22 d8             	mov    %eax,%cr3
c010001d:	0f 20 c0             	mov    %cr0,%eax
c0100020:	0d 00 00 01 80       	or     $0x80010000,%eax
c0100025:	0f 22 c0             	mov    %eax,%cr0
c0100028:	89 1d 00 70 10 c0    	mov    %ebx,0xc0107000
c010002e:	bc 04 80 10 c0       	mov    $0xc0108004,%esp
c0100033:	b8 00 30 10 c0       	mov    $0xc0103000,%eax
c0100038:	ff e0                	jmp    *%eax

c010003a <swtch>:
c010003a:	8b 44 24 04          	mov    0x4(%esp),%eax
c010003e:	8b 54 24 08          	mov    0x8(%esp),%edx
c0100042:	55                   	push   %ebp
c0100043:	53                   	push   %ebx
c0100044:	56                   	push   %esi
c0100045:	57                   	push   %edi
c0100046:	89 20                	mov    %esp,(%eax)
c0100048:	89 d4                	mov    %edx,%esp
c010004a:	5f                   	pop    %edi
c010004b:	5e                   	pop    %esi
c010004c:	5b                   	pop    %ebx
c010004d:	5d                   	pop    %ebp
c010004e:	c3                   	ret    

c010004f <dotsame>:
c010004f:	1e                   	push   %ds
c0100050:	06                   	push   %es
c0100051:	0f a0                	push   %fs
c0100053:	0f a8                	push   %gs
c0100055:	60                   	pusha  
c0100056:	66 b8 10 00          	mov    $0x10,%ax
c010005a:	8e d8                	mov    %eax,%ds
c010005c:	8e c0                	mov    %eax,%es
c010005e:	54                   	push   %esp
c010005f:	e8 5c 0c 00 00       	call   c0100cc0 <intr>
c0100064:	83 c4 04             	add    $0x4,%esp

c0100067 <trapret>:
c0100067:	61                   	popa   
c0100068:	0f a9                	pop    %gs
c010006a:	0f a1                	pop    %fs
c010006c:	07                   	pop    %es
c010006d:	1f                   	pop    %ds
c010006e:	83 c4 08             	add    $0x8,%esp
c0100071:	cf                   	iret   

c0100072 <intr0>:
c0100072:	6a 00                	push   $0x0
c0100074:	6a 00                	push   $0x0
c0100076:	e9 d4 ff ff ff       	jmp    c010004f <dotsame>

c010007b <intr1>:
c010007b:	6a 00                	push   $0x0
c010007d:	6a 01                	push   $0x1
c010007f:	e9 cb ff ff ff       	jmp    c010004f <dotsame>

c0100084 <intr2>:
c0100084:	6a 00                	push   $0x0
c0100086:	6a 02                	push   $0x2
c0100088:	e9 c2 ff ff ff       	jmp    c010004f <dotsame>

c010008d <intr3>:
c010008d:	6a 00                	push   $0x0
c010008f:	6a 03                	push   $0x3
c0100091:	e9 b9 ff ff ff       	jmp    c010004f <dotsame>

c0100096 <intr4>:
c0100096:	6a 00                	push   $0x0
c0100098:	6a 04                	push   $0x4
c010009a:	e9 b0 ff ff ff       	jmp    c010004f <dotsame>

c010009f <intr5>:
c010009f:	6a 00                	push   $0x0
c01000a1:	6a 05                	push   $0x5
c01000a3:	e9 a7 ff ff ff       	jmp    c010004f <dotsame>

c01000a8 <intr6>:
c01000a8:	6a 00                	push   $0x0
c01000aa:	6a 06                	push   $0x6
c01000ac:	e9 9e ff ff ff       	jmp    c010004f <dotsame>

c01000b1 <intr7>:
c01000b1:	6a 00                	push   $0x0
c01000b3:	6a 07                	push   $0x7
c01000b5:	e9 95 ff ff ff       	jmp    c010004f <dotsame>

c01000ba <intr8>:
c01000ba:	6a 08                	push   $0x8
c01000bc:	e9 8e ff ff ff       	jmp    c010004f <dotsame>

c01000c1 <intr9>:
c01000c1:	6a 00                	push   $0x0
c01000c3:	6a 09                	push   $0x9
c01000c5:	e9 85 ff ff ff       	jmp    c010004f <dotsame>

c01000ca <intr10>:
c01000ca:	6a 0a                	push   $0xa
c01000cc:	e9 7e ff ff ff       	jmp    c010004f <dotsame>

c01000d1 <intr11>:
c01000d1:	6a 0b                	push   $0xb
c01000d3:	e9 77 ff ff ff       	jmp    c010004f <dotsame>

c01000d8 <intr12>:
c01000d8:	6a 0c                	push   $0xc
c01000da:	e9 70 ff ff ff       	jmp    c010004f <dotsame>

c01000df <intr13>:
c01000df:	6a 0d                	push   $0xd
c01000e1:	e9 69 ff ff ff       	jmp    c010004f <dotsame>

c01000e6 <intr14>:
c01000e6:	6a 0e                	push   $0xe
c01000e8:	e9 62 ff ff ff       	jmp    c010004f <dotsame>

c01000ed <intr15>:
c01000ed:	6a 00                	push   $0x0
c01000ef:	6a 0f                	push   $0xf
c01000f1:	e9 59 ff ff ff       	jmp    c010004f <dotsame>

c01000f6 <intr16>:
c01000f6:	6a 00                	push   $0x0
c01000f8:	6a 10                	push   $0x10
c01000fa:	e9 50 ff ff ff       	jmp    c010004f <dotsame>

c01000ff <intr17>:
c01000ff:	6a 11                	push   $0x11
c0100101:	e9 49 ff ff ff       	jmp    c010004f <dotsame>

c0100106 <intr18>:
c0100106:	6a 00                	push   $0x0
c0100108:	6a 12                	push   $0x12
c010010a:	e9 40 ff ff ff       	jmp    c010004f <dotsame>

c010010f <intr19>:
c010010f:	6a 00                	push   $0x0
c0100111:	6a 13                	push   $0x13
c0100113:	e9 37 ff ff ff       	jmp    c010004f <dotsame>

c0100118 <intr20>:
c0100118:	6a 00                	push   $0x0
c010011a:	6a 14                	push   $0x14
c010011c:	e9 2e ff ff ff       	jmp    c010004f <dotsame>

c0100121 <intr21>:
c0100121:	6a 00                	push   $0x0
c0100123:	6a 15                	push   $0x15
c0100125:	e9 25 ff ff ff       	jmp    c010004f <dotsame>

c010012a <intr22>:
c010012a:	6a 00                	push   $0x0
c010012c:	6a 16                	push   $0x16
c010012e:	e9 1c ff ff ff       	jmp    c010004f <dotsame>

c0100133 <intr23>:
c0100133:	6a 00                	push   $0x0
c0100135:	6a 17                	push   $0x17
c0100137:	e9 13 ff ff ff       	jmp    c010004f <dotsame>

c010013c <intr24>:
c010013c:	6a 00                	push   $0x0
c010013e:	6a 18                	push   $0x18
c0100140:	e9 0a ff ff ff       	jmp    c010004f <dotsame>

c0100145 <intr25>:
c0100145:	6a 00                	push   $0x0
c0100147:	6a 19                	push   $0x19
c0100149:	e9 01 ff ff ff       	jmp    c010004f <dotsame>

c010014e <intr26>:
c010014e:	6a 00                	push   $0x0
c0100150:	6a 1a                	push   $0x1a
c0100152:	e9 f8 fe ff ff       	jmp    c010004f <dotsame>

c0100157 <intr27>:
c0100157:	6a 00                	push   $0x0
c0100159:	6a 1b                	push   $0x1b
c010015b:	e9 ef fe ff ff       	jmp    c010004f <dotsame>

c0100160 <intr28>:
c0100160:	6a 00                	push   $0x0
c0100162:	6a 1c                	push   $0x1c
c0100164:	e9 e6 fe ff ff       	jmp    c010004f <dotsame>

c0100169 <intr29>:
c0100169:	6a 00                	push   $0x0
c010016b:	6a 1d                	push   $0x1d
c010016d:	e9 dd fe ff ff       	jmp    c010004f <dotsame>

c0100172 <intr30>:
c0100172:	6a 00                	push   $0x0
c0100174:	6a 1e                	push   $0x1e
c0100176:	e9 d4 fe ff ff       	jmp    c010004f <dotsame>

c010017b <intr31>:
c010017b:	6a 00                	push   $0x0
c010017d:	6a 1f                	push   $0x1f
c010017f:	e9 cb fe ff ff       	jmp    c010004f <dotsame>

c0100184 <intr32>:
c0100184:	6a 00                	push   $0x0
c0100186:	6a 20                	push   $0x20
c0100188:	e9 c2 fe ff ff       	jmp    c010004f <dotsame>

c010018d <intr33>:
c010018d:	6a 00                	push   $0x0
c010018f:	6a 21                	push   $0x21
c0100191:	e9 b9 fe ff ff       	jmp    c010004f <dotsame>

c0100196 <intr34>:
c0100196:	6a 00                	push   $0x0
c0100198:	6a 22                	push   $0x22
c010019a:	e9 b0 fe ff ff       	jmp    c010004f <dotsame>

c010019f <intr35>:
c010019f:	6a 00                	push   $0x0
c01001a1:	6a 23                	push   $0x23
c01001a3:	e9 a7 fe ff ff       	jmp    c010004f <dotsame>

c01001a8 <intr36>:
c01001a8:	6a 00                	push   $0x0
c01001aa:	6a 24                	push   $0x24
c01001ac:	e9 9e fe ff ff       	jmp    c010004f <dotsame>

c01001b1 <intr37>:
c01001b1:	6a 00                	push   $0x0
c01001b3:	6a 25                	push   $0x25
c01001b5:	e9 95 fe ff ff       	jmp    c010004f <dotsame>

c01001ba <intr38>:
c01001ba:	6a 00                	push   $0x0
c01001bc:	6a 26                	push   $0x26
c01001be:	e9 8c fe ff ff       	jmp    c010004f <dotsame>

c01001c3 <intr39>:
c01001c3:	6a 00                	push   $0x0
c01001c5:	6a 27                	push   $0x27
c01001c7:	e9 83 fe ff ff       	jmp    c010004f <dotsame>

c01001cc <intr40>:
c01001cc:	6a 00                	push   $0x0
c01001ce:	6a 28                	push   $0x28
c01001d0:	e9 7a fe ff ff       	jmp    c010004f <dotsame>

c01001d5 <intr41>:
c01001d5:	6a 00                	push   $0x0
c01001d7:	6a 29                	push   $0x29
c01001d9:	e9 71 fe ff ff       	jmp    c010004f <dotsame>

c01001de <intr42>:
c01001de:	6a 00                	push   $0x0
c01001e0:	6a 2a                	push   $0x2a
c01001e2:	e9 68 fe ff ff       	jmp    c010004f <dotsame>

c01001e7 <intr43>:
c01001e7:	6a 00                	push   $0x0
c01001e9:	6a 2b                	push   $0x2b
c01001eb:	e9 5f fe ff ff       	jmp    c010004f <dotsame>

c01001f0 <intr44>:
c01001f0:	6a 00                	push   $0x0
c01001f2:	6a 2c                	push   $0x2c
c01001f4:	e9 56 fe ff ff       	jmp    c010004f <dotsame>

c01001f9 <intr45>:
c01001f9:	6a 00                	push   $0x0
c01001fb:	6a 2d                	push   $0x2d
c01001fd:	e9 4d fe ff ff       	jmp    c010004f <dotsame>

c0100202 <intr46>:
c0100202:	6a 00                	push   $0x0
c0100204:	6a 2e                	push   $0x2e
c0100206:	e9 44 fe ff ff       	jmp    c010004f <dotsame>

c010020b <intr47>:
c010020b:	6a 00                	push   $0x0
c010020d:	6a 2f                	push   $0x2f
c010020f:	e9 3b fe ff ff       	jmp    c010004f <dotsame>

c0100214 <intr48>:
c0100214:	6a 00                	push   $0x0
c0100216:	6a 30                	push   $0x30
c0100218:	e9 32 fe ff ff       	jmp    c010004f <dotsame>

c010021d <intr49>:
c010021d:	6a 00                	push   $0x0
c010021f:	6a 31                	push   $0x31
c0100221:	e9 29 fe ff ff       	jmp    c010004f <dotsame>

c0100226 <intr50>:
c0100226:	6a 00                	push   $0x0
c0100228:	6a 32                	push   $0x32
c010022a:	e9 20 fe ff ff       	jmp    c010004f <dotsame>

c010022f <intr51>:
c010022f:	6a 00                	push   $0x0
c0100231:	6a 33                	push   $0x33
c0100233:	e9 17 fe ff ff       	jmp    c010004f <dotsame>

c0100238 <intr52>:
c0100238:	6a 00                	push   $0x0
c010023a:	6a 34                	push   $0x34
c010023c:	e9 0e fe ff ff       	jmp    c010004f <dotsame>

c0100241 <intr53>:
c0100241:	6a 00                	push   $0x0
c0100243:	6a 35                	push   $0x35
c0100245:	e9 05 fe ff ff       	jmp    c010004f <dotsame>

c010024a <intr54>:
c010024a:	6a 00                	push   $0x0
c010024c:	6a 36                	push   $0x36
c010024e:	e9 fc fd ff ff       	jmp    c010004f <dotsame>

c0100253 <intr55>:
c0100253:	6a 00                	push   $0x0
c0100255:	6a 37                	push   $0x37
c0100257:	e9 f3 fd ff ff       	jmp    c010004f <dotsame>

c010025c <intr56>:
c010025c:	6a 00                	push   $0x0
c010025e:	6a 38                	push   $0x38
c0100260:	e9 ea fd ff ff       	jmp    c010004f <dotsame>

c0100265 <intr57>:
c0100265:	6a 00                	push   $0x0
c0100267:	6a 39                	push   $0x39
c0100269:	e9 e1 fd ff ff       	jmp    c010004f <dotsame>

c010026e <intr58>:
c010026e:	6a 00                	push   $0x0
c0100270:	6a 3a                	push   $0x3a
c0100272:	e9 d8 fd ff ff       	jmp    c010004f <dotsame>

c0100277 <intr59>:
c0100277:	6a 00                	push   $0x0
c0100279:	6a 3b                	push   $0x3b
c010027b:	e9 cf fd ff ff       	jmp    c010004f <dotsame>

c0100280 <intr60>:
c0100280:	6a 00                	push   $0x0
c0100282:	6a 3c                	push   $0x3c
c0100284:	e9 c6 fd ff ff       	jmp    c010004f <dotsame>

c0100289 <intr61>:
c0100289:	6a 00                	push   $0x0
c010028b:	6a 3d                	push   $0x3d
c010028d:	e9 bd fd ff ff       	jmp    c010004f <dotsame>

c0100292 <intr62>:
c0100292:	6a 00                	push   $0x0
c0100294:	6a 3e                	push   $0x3e
c0100296:	e9 b4 fd ff ff       	jmp    c010004f <dotsame>

c010029b <intr63>:
c010029b:	6a 00                	push   $0x0
c010029d:	6a 3f                	push   $0x3f
c010029f:	e9 ab fd ff ff       	jmp    c010004f <dotsame>

c01002a4 <intr64>:
c01002a4:	6a 00                	push   $0x0
c01002a6:	6a 40                	push   $0x40
c01002a8:	e9 a2 fd ff ff       	jmp    c010004f <dotsame>

c01002ad <intr65>:
c01002ad:	6a 00                	push   $0x0
c01002af:	6a 41                	push   $0x41
c01002b1:	e9 99 fd ff ff       	jmp    c010004f <dotsame>

c01002b6 <intr66>:
c01002b6:	6a 00                	push   $0x0
c01002b8:	6a 42                	push   $0x42
c01002ba:	e9 90 fd ff ff       	jmp    c010004f <dotsame>

c01002bf <intr67>:
c01002bf:	6a 00                	push   $0x0
c01002c1:	6a 43                	push   $0x43
c01002c3:	e9 87 fd ff ff       	jmp    c010004f <dotsame>

c01002c8 <intr68>:
c01002c8:	6a 00                	push   $0x0
c01002ca:	6a 44                	push   $0x44
c01002cc:	e9 7e fd ff ff       	jmp    c010004f <dotsame>

c01002d1 <intr69>:
c01002d1:	6a 00                	push   $0x0
c01002d3:	6a 45                	push   $0x45
c01002d5:	e9 75 fd ff ff       	jmp    c010004f <dotsame>

c01002da <intr70>:
c01002da:	6a 00                	push   $0x0
c01002dc:	6a 46                	push   $0x46
c01002de:	e9 6c fd ff ff       	jmp    c010004f <dotsame>

c01002e3 <intr71>:
c01002e3:	6a 00                	push   $0x0
c01002e5:	6a 47                	push   $0x47
c01002e7:	e9 63 fd ff ff       	jmp    c010004f <dotsame>

c01002ec <intr72>:
c01002ec:	6a 00                	push   $0x0
c01002ee:	6a 48                	push   $0x48
c01002f0:	e9 5a fd ff ff       	jmp    c010004f <dotsame>

c01002f5 <intr73>:
c01002f5:	6a 00                	push   $0x0
c01002f7:	6a 49                	push   $0x49
c01002f9:	e9 51 fd ff ff       	jmp    c010004f <dotsame>

c01002fe <intr74>:
c01002fe:	6a 00                	push   $0x0
c0100300:	6a 4a                	push   $0x4a
c0100302:	e9 48 fd ff ff       	jmp    c010004f <dotsame>

c0100307 <intr75>:
c0100307:	6a 00                	push   $0x0
c0100309:	6a 4b                	push   $0x4b
c010030b:	e9 3f fd ff ff       	jmp    c010004f <dotsame>

c0100310 <intr76>:
c0100310:	6a 00                	push   $0x0
c0100312:	6a 4c                	push   $0x4c
c0100314:	e9 36 fd ff ff       	jmp    c010004f <dotsame>

c0100319 <intr77>:
c0100319:	6a 00                	push   $0x0
c010031b:	6a 4d                	push   $0x4d
c010031d:	e9 2d fd ff ff       	jmp    c010004f <dotsame>

c0100322 <intr78>:
c0100322:	6a 00                	push   $0x0
c0100324:	6a 4e                	push   $0x4e
c0100326:	e9 24 fd ff ff       	jmp    c010004f <dotsame>

c010032b <intr79>:
c010032b:	6a 00                	push   $0x0
c010032d:	6a 4f                	push   $0x4f
c010032f:	e9 1b fd ff ff       	jmp    c010004f <dotsame>

c0100334 <intr80>:
c0100334:	6a 00                	push   $0x0
c0100336:	6a 50                	push   $0x50
c0100338:	e9 12 fd ff ff       	jmp    c010004f <dotsame>

c010033d <intr81>:
c010033d:	6a 00                	push   $0x0
c010033f:	6a 51                	push   $0x51
c0100341:	e9 09 fd ff ff       	jmp    c010004f <dotsame>

c0100346 <intr82>:
c0100346:	6a 00                	push   $0x0
c0100348:	6a 52                	push   $0x52
c010034a:	e9 00 fd ff ff       	jmp    c010004f <dotsame>

c010034f <intr83>:
c010034f:	6a 00                	push   $0x0
c0100351:	6a 53                	push   $0x53
c0100353:	e9 f7 fc ff ff       	jmp    c010004f <dotsame>

c0100358 <intr84>:
c0100358:	6a 00                	push   $0x0
c010035a:	6a 54                	push   $0x54
c010035c:	e9 ee fc ff ff       	jmp    c010004f <dotsame>

c0100361 <intr85>:
c0100361:	6a 00                	push   $0x0
c0100363:	6a 55                	push   $0x55
c0100365:	e9 e5 fc ff ff       	jmp    c010004f <dotsame>

c010036a <intr86>:
c010036a:	6a 00                	push   $0x0
c010036c:	6a 56                	push   $0x56
c010036e:	e9 dc fc ff ff       	jmp    c010004f <dotsame>

c0100373 <intr87>:
c0100373:	6a 00                	push   $0x0
c0100375:	6a 57                	push   $0x57
c0100377:	e9 d3 fc ff ff       	jmp    c010004f <dotsame>

c010037c <intr88>:
c010037c:	6a 00                	push   $0x0
c010037e:	6a 58                	push   $0x58
c0100380:	e9 ca fc ff ff       	jmp    c010004f <dotsame>

c0100385 <intr89>:
c0100385:	6a 00                	push   $0x0
c0100387:	6a 59                	push   $0x59
c0100389:	e9 c1 fc ff ff       	jmp    c010004f <dotsame>

c010038e <intr90>:
c010038e:	6a 00                	push   $0x0
c0100390:	6a 5a                	push   $0x5a
c0100392:	e9 b8 fc ff ff       	jmp    c010004f <dotsame>

c0100397 <intr91>:
c0100397:	6a 00                	push   $0x0
c0100399:	6a 5b                	push   $0x5b
c010039b:	e9 af fc ff ff       	jmp    c010004f <dotsame>

c01003a0 <intr92>:
c01003a0:	6a 00                	push   $0x0
c01003a2:	6a 5c                	push   $0x5c
c01003a4:	e9 a6 fc ff ff       	jmp    c010004f <dotsame>

c01003a9 <intr93>:
c01003a9:	6a 00                	push   $0x0
c01003ab:	6a 5d                	push   $0x5d
c01003ad:	e9 9d fc ff ff       	jmp    c010004f <dotsame>

c01003b2 <intr94>:
c01003b2:	6a 00                	push   $0x0
c01003b4:	6a 5e                	push   $0x5e
c01003b6:	e9 94 fc ff ff       	jmp    c010004f <dotsame>

c01003bb <intr95>:
c01003bb:	6a 00                	push   $0x0
c01003bd:	6a 5f                	push   $0x5f
c01003bf:	e9 8b fc ff ff       	jmp    c010004f <dotsame>

c01003c4 <intr96>:
c01003c4:	6a 00                	push   $0x0
c01003c6:	6a 60                	push   $0x60
c01003c8:	e9 82 fc ff ff       	jmp    c010004f <dotsame>

c01003cd <intr97>:
c01003cd:	6a 00                	push   $0x0
c01003cf:	6a 61                	push   $0x61
c01003d1:	e9 79 fc ff ff       	jmp    c010004f <dotsame>

c01003d6 <intr98>:
c01003d6:	6a 00                	push   $0x0
c01003d8:	6a 62                	push   $0x62
c01003da:	e9 70 fc ff ff       	jmp    c010004f <dotsame>

c01003df <intr99>:
c01003df:	6a 00                	push   $0x0
c01003e1:	6a 63                	push   $0x63
c01003e3:	e9 67 fc ff ff       	jmp    c010004f <dotsame>

c01003e8 <intr100>:
c01003e8:	6a 00                	push   $0x0
c01003ea:	6a 64                	push   $0x64
c01003ec:	e9 5e fc ff ff       	jmp    c010004f <dotsame>

c01003f1 <intr101>:
c01003f1:	6a 00                	push   $0x0
c01003f3:	6a 65                	push   $0x65
c01003f5:	e9 55 fc ff ff       	jmp    c010004f <dotsame>

c01003fa <intr102>:
c01003fa:	6a 00                	push   $0x0
c01003fc:	6a 66                	push   $0x66
c01003fe:	e9 4c fc ff ff       	jmp    c010004f <dotsame>

c0100403 <intr103>:
c0100403:	6a 00                	push   $0x0
c0100405:	6a 67                	push   $0x67
c0100407:	e9 43 fc ff ff       	jmp    c010004f <dotsame>

c010040c <intr104>:
c010040c:	6a 00                	push   $0x0
c010040e:	6a 68                	push   $0x68
c0100410:	e9 3a fc ff ff       	jmp    c010004f <dotsame>

c0100415 <intr105>:
c0100415:	6a 00                	push   $0x0
c0100417:	6a 69                	push   $0x69
c0100419:	e9 31 fc ff ff       	jmp    c010004f <dotsame>

c010041e <intr106>:
c010041e:	6a 00                	push   $0x0
c0100420:	6a 6a                	push   $0x6a
c0100422:	e9 28 fc ff ff       	jmp    c010004f <dotsame>

c0100427 <intr107>:
c0100427:	6a 00                	push   $0x0
c0100429:	6a 6b                	push   $0x6b
c010042b:	e9 1f fc ff ff       	jmp    c010004f <dotsame>

c0100430 <intr108>:
c0100430:	6a 00                	push   $0x0
c0100432:	6a 6c                	push   $0x6c
c0100434:	e9 16 fc ff ff       	jmp    c010004f <dotsame>

c0100439 <intr109>:
c0100439:	6a 00                	push   $0x0
c010043b:	6a 6d                	push   $0x6d
c010043d:	e9 0d fc ff ff       	jmp    c010004f <dotsame>

c0100442 <intr110>:
c0100442:	6a 00                	push   $0x0
c0100444:	6a 6e                	push   $0x6e
c0100446:	e9 04 fc ff ff       	jmp    c010004f <dotsame>

c010044b <intr111>:
c010044b:	6a 00                	push   $0x0
c010044d:	6a 6f                	push   $0x6f
c010044f:	e9 fb fb ff ff       	jmp    c010004f <dotsame>

c0100454 <intr112>:
c0100454:	6a 00                	push   $0x0
c0100456:	6a 70                	push   $0x70
c0100458:	e9 f2 fb ff ff       	jmp    c010004f <dotsame>

c010045d <intr113>:
c010045d:	6a 00                	push   $0x0
c010045f:	6a 71                	push   $0x71
c0100461:	e9 e9 fb ff ff       	jmp    c010004f <dotsame>

c0100466 <intr114>:
c0100466:	6a 00                	push   $0x0
c0100468:	6a 72                	push   $0x72
c010046a:	e9 e0 fb ff ff       	jmp    c010004f <dotsame>

c010046f <intr115>:
c010046f:	6a 00                	push   $0x0
c0100471:	6a 73                	push   $0x73
c0100473:	e9 d7 fb ff ff       	jmp    c010004f <dotsame>

c0100478 <intr116>:
c0100478:	6a 00                	push   $0x0
c010047a:	6a 74                	push   $0x74
c010047c:	e9 ce fb ff ff       	jmp    c010004f <dotsame>

c0100481 <intr117>:
c0100481:	6a 00                	push   $0x0
c0100483:	6a 75                	push   $0x75
c0100485:	e9 c5 fb ff ff       	jmp    c010004f <dotsame>

c010048a <intr118>:
c010048a:	6a 00                	push   $0x0
c010048c:	6a 76                	push   $0x76
c010048e:	e9 bc fb ff ff       	jmp    c010004f <dotsame>

c0100493 <intr119>:
c0100493:	6a 00                	push   $0x0
c0100495:	6a 77                	push   $0x77
c0100497:	e9 b3 fb ff ff       	jmp    c010004f <dotsame>

c010049c <intr120>:
c010049c:	6a 00                	push   $0x0
c010049e:	6a 78                	push   $0x78
c01004a0:	e9 aa fb ff ff       	jmp    c010004f <dotsame>

c01004a5 <intr121>:
c01004a5:	6a 00                	push   $0x0
c01004a7:	6a 79                	push   $0x79
c01004a9:	e9 a1 fb ff ff       	jmp    c010004f <dotsame>

c01004ae <intr122>:
c01004ae:	6a 00                	push   $0x0
c01004b0:	6a 7a                	push   $0x7a
c01004b2:	e9 98 fb ff ff       	jmp    c010004f <dotsame>

c01004b7 <intr123>:
c01004b7:	6a 00                	push   $0x0
c01004b9:	6a 7b                	push   $0x7b
c01004bb:	e9 8f fb ff ff       	jmp    c010004f <dotsame>

c01004c0 <intr124>:
c01004c0:	6a 00                	push   $0x0
c01004c2:	6a 7c                	push   $0x7c
c01004c4:	e9 86 fb ff ff       	jmp    c010004f <dotsame>

c01004c9 <intr125>:
c01004c9:	6a 00                	push   $0x0
c01004cb:	6a 7d                	push   $0x7d
c01004cd:	e9 7d fb ff ff       	jmp    c010004f <dotsame>

c01004d2 <intr126>:
c01004d2:	6a 00                	push   $0x0
c01004d4:	6a 7e                	push   $0x7e
c01004d6:	e9 74 fb ff ff       	jmp    c010004f <dotsame>

c01004db <intr127>:
c01004db:	6a 00                	push   $0x0
c01004dd:	6a 7f                	push   $0x7f
c01004df:	e9 6b fb ff ff       	jmp    c010004f <dotsame>

c01004e4 <intr128>:
c01004e4:	6a 00                	push   $0x0
c01004e6:	68 80 00 00 00       	push   $0x80
c01004eb:	e9 5f fb ff ff       	jmp    c010004f <dotsame>

c01004f0 <intr129>:
c01004f0:	6a 00                	push   $0x0
c01004f2:	68 81 00 00 00       	push   $0x81
c01004f7:	e9 53 fb ff ff       	jmp    c010004f <dotsame>

c01004fc <intr130>:
c01004fc:	6a 00                	push   $0x0
c01004fe:	68 82 00 00 00       	push   $0x82
c0100503:	e9 47 fb ff ff       	jmp    c010004f <dotsame>

c0100508 <intr131>:
c0100508:	6a 00                	push   $0x0
c010050a:	68 83 00 00 00       	push   $0x83
c010050f:	e9 3b fb ff ff       	jmp    c010004f <dotsame>

c0100514 <intr132>:
c0100514:	6a 00                	push   $0x0
c0100516:	68 84 00 00 00       	push   $0x84
c010051b:	e9 2f fb ff ff       	jmp    c010004f <dotsame>

c0100520 <intr133>:
c0100520:	6a 00                	push   $0x0
c0100522:	68 85 00 00 00       	push   $0x85
c0100527:	e9 23 fb ff ff       	jmp    c010004f <dotsame>

c010052c <intr134>:
c010052c:	6a 00                	push   $0x0
c010052e:	68 86 00 00 00       	push   $0x86
c0100533:	e9 17 fb ff ff       	jmp    c010004f <dotsame>

c0100538 <intr135>:
c0100538:	6a 00                	push   $0x0
c010053a:	68 87 00 00 00       	push   $0x87
c010053f:	e9 0b fb ff ff       	jmp    c010004f <dotsame>

c0100544 <intr136>:
c0100544:	6a 00                	push   $0x0
c0100546:	68 88 00 00 00       	push   $0x88
c010054b:	e9 ff fa ff ff       	jmp    c010004f <dotsame>

c0100550 <intr137>:
c0100550:	6a 00                	push   $0x0
c0100552:	68 89 00 00 00       	push   $0x89
c0100557:	e9 f3 fa ff ff       	jmp    c010004f <dotsame>

c010055c <intr138>:
c010055c:	6a 00                	push   $0x0
c010055e:	68 8a 00 00 00       	push   $0x8a
c0100563:	e9 e7 fa ff ff       	jmp    c010004f <dotsame>

c0100568 <intr139>:
c0100568:	6a 00                	push   $0x0
c010056a:	68 8b 00 00 00       	push   $0x8b
c010056f:	e9 db fa ff ff       	jmp    c010004f <dotsame>

c0100574 <intr140>:
c0100574:	6a 00                	push   $0x0
c0100576:	68 8c 00 00 00       	push   $0x8c
c010057b:	e9 cf fa ff ff       	jmp    c010004f <dotsame>

c0100580 <intr141>:
c0100580:	6a 00                	push   $0x0
c0100582:	68 8d 00 00 00       	push   $0x8d
c0100587:	e9 c3 fa ff ff       	jmp    c010004f <dotsame>

c010058c <intr142>:
c010058c:	6a 00                	push   $0x0
c010058e:	68 8e 00 00 00       	push   $0x8e
c0100593:	e9 b7 fa ff ff       	jmp    c010004f <dotsame>

c0100598 <intr143>:
c0100598:	6a 00                	push   $0x0
c010059a:	68 8f 00 00 00       	push   $0x8f
c010059f:	e9 ab fa ff ff       	jmp    c010004f <dotsame>

c01005a4 <intr144>:
c01005a4:	6a 00                	push   $0x0
c01005a6:	68 90 00 00 00       	push   $0x90
c01005ab:	e9 9f fa ff ff       	jmp    c010004f <dotsame>

c01005b0 <intr145>:
c01005b0:	6a 00                	push   $0x0
c01005b2:	68 91 00 00 00       	push   $0x91
c01005b7:	e9 93 fa ff ff       	jmp    c010004f <dotsame>

c01005bc <intr146>:
c01005bc:	6a 00                	push   $0x0
c01005be:	68 92 00 00 00       	push   $0x92
c01005c3:	e9 87 fa ff ff       	jmp    c010004f <dotsame>

c01005c8 <intr147>:
c01005c8:	6a 00                	push   $0x0
c01005ca:	68 93 00 00 00       	push   $0x93
c01005cf:	e9 7b fa ff ff       	jmp    c010004f <dotsame>

c01005d4 <intr148>:
c01005d4:	6a 00                	push   $0x0
c01005d6:	68 94 00 00 00       	push   $0x94
c01005db:	e9 6f fa ff ff       	jmp    c010004f <dotsame>

c01005e0 <intr149>:
c01005e0:	6a 00                	push   $0x0
c01005e2:	68 95 00 00 00       	push   $0x95
c01005e7:	e9 63 fa ff ff       	jmp    c010004f <dotsame>

c01005ec <intr150>:
c01005ec:	6a 00                	push   $0x0
c01005ee:	68 96 00 00 00       	push   $0x96
c01005f3:	e9 57 fa ff ff       	jmp    c010004f <dotsame>

c01005f8 <intr151>:
c01005f8:	6a 00                	push   $0x0
c01005fa:	68 97 00 00 00       	push   $0x97
c01005ff:	e9 4b fa ff ff       	jmp    c010004f <dotsame>

c0100604 <intr152>:
c0100604:	6a 00                	push   $0x0
c0100606:	68 98 00 00 00       	push   $0x98
c010060b:	e9 3f fa ff ff       	jmp    c010004f <dotsame>

c0100610 <intr153>:
c0100610:	6a 00                	push   $0x0
c0100612:	68 99 00 00 00       	push   $0x99
c0100617:	e9 33 fa ff ff       	jmp    c010004f <dotsame>

c010061c <intr154>:
c010061c:	6a 00                	push   $0x0
c010061e:	68 9a 00 00 00       	push   $0x9a
c0100623:	e9 27 fa ff ff       	jmp    c010004f <dotsame>

c0100628 <intr155>:
c0100628:	6a 00                	push   $0x0
c010062a:	68 9b 00 00 00       	push   $0x9b
c010062f:	e9 1b fa ff ff       	jmp    c010004f <dotsame>

c0100634 <intr156>:
c0100634:	6a 00                	push   $0x0
c0100636:	68 9c 00 00 00       	push   $0x9c
c010063b:	e9 0f fa ff ff       	jmp    c010004f <dotsame>

c0100640 <intr157>:
c0100640:	6a 00                	push   $0x0
c0100642:	68 9d 00 00 00       	push   $0x9d
c0100647:	e9 03 fa ff ff       	jmp    c010004f <dotsame>

c010064c <intr158>:
c010064c:	6a 00                	push   $0x0
c010064e:	68 9e 00 00 00       	push   $0x9e
c0100653:	e9 f7 f9 ff ff       	jmp    c010004f <dotsame>

c0100658 <intr159>:
c0100658:	6a 00                	push   $0x0
c010065a:	68 9f 00 00 00       	push   $0x9f
c010065f:	e9 eb f9 ff ff       	jmp    c010004f <dotsame>

c0100664 <intr160>:
c0100664:	6a 00                	push   $0x0
c0100666:	68 a0 00 00 00       	push   $0xa0
c010066b:	e9 df f9 ff ff       	jmp    c010004f <dotsame>

c0100670 <intr161>:
c0100670:	6a 00                	push   $0x0
c0100672:	68 a1 00 00 00       	push   $0xa1
c0100677:	e9 d3 f9 ff ff       	jmp    c010004f <dotsame>

c010067c <intr162>:
c010067c:	6a 00                	push   $0x0
c010067e:	68 a2 00 00 00       	push   $0xa2
c0100683:	e9 c7 f9 ff ff       	jmp    c010004f <dotsame>

c0100688 <intr163>:
c0100688:	6a 00                	push   $0x0
c010068a:	68 a3 00 00 00       	push   $0xa3
c010068f:	e9 bb f9 ff ff       	jmp    c010004f <dotsame>

c0100694 <intr164>:
c0100694:	6a 00                	push   $0x0
c0100696:	68 a4 00 00 00       	push   $0xa4
c010069b:	e9 af f9 ff ff       	jmp    c010004f <dotsame>

c01006a0 <intr165>:
c01006a0:	6a 00                	push   $0x0
c01006a2:	68 a5 00 00 00       	push   $0xa5
c01006a7:	e9 a3 f9 ff ff       	jmp    c010004f <dotsame>

c01006ac <intr166>:
c01006ac:	6a 00                	push   $0x0
c01006ae:	68 a6 00 00 00       	push   $0xa6
c01006b3:	e9 97 f9 ff ff       	jmp    c010004f <dotsame>

c01006b8 <intr167>:
c01006b8:	6a 00                	push   $0x0
c01006ba:	68 a7 00 00 00       	push   $0xa7
c01006bf:	e9 8b f9 ff ff       	jmp    c010004f <dotsame>

c01006c4 <intr168>:
c01006c4:	6a 00                	push   $0x0
c01006c6:	68 a8 00 00 00       	push   $0xa8
c01006cb:	e9 7f f9 ff ff       	jmp    c010004f <dotsame>

c01006d0 <intr169>:
c01006d0:	6a 00                	push   $0x0
c01006d2:	68 a9 00 00 00       	push   $0xa9
c01006d7:	e9 73 f9 ff ff       	jmp    c010004f <dotsame>

c01006dc <intr170>:
c01006dc:	6a 00                	push   $0x0
c01006de:	68 aa 00 00 00       	push   $0xaa
c01006e3:	e9 67 f9 ff ff       	jmp    c010004f <dotsame>

c01006e8 <intr171>:
c01006e8:	6a 00                	push   $0x0
c01006ea:	68 ab 00 00 00       	push   $0xab
c01006ef:	e9 5b f9 ff ff       	jmp    c010004f <dotsame>

c01006f4 <intr172>:
c01006f4:	6a 00                	push   $0x0
c01006f6:	68 ac 00 00 00       	push   $0xac
c01006fb:	e9 4f f9 ff ff       	jmp    c010004f <dotsame>

c0100700 <intr173>:
c0100700:	6a 00                	push   $0x0
c0100702:	68 ad 00 00 00       	push   $0xad
c0100707:	e9 43 f9 ff ff       	jmp    c010004f <dotsame>

c010070c <intr174>:
c010070c:	6a 00                	push   $0x0
c010070e:	68 ae 00 00 00       	push   $0xae
c0100713:	e9 37 f9 ff ff       	jmp    c010004f <dotsame>

c0100718 <intr175>:
c0100718:	6a 00                	push   $0x0
c010071a:	68 af 00 00 00       	push   $0xaf
c010071f:	e9 2b f9 ff ff       	jmp    c010004f <dotsame>

c0100724 <intr176>:
c0100724:	6a 00                	push   $0x0
c0100726:	68 b0 00 00 00       	push   $0xb0
c010072b:	e9 1f f9 ff ff       	jmp    c010004f <dotsame>

c0100730 <intr177>:
c0100730:	6a 00                	push   $0x0
c0100732:	68 b1 00 00 00       	push   $0xb1
c0100737:	e9 13 f9 ff ff       	jmp    c010004f <dotsame>

c010073c <intr178>:
c010073c:	6a 00                	push   $0x0
c010073e:	68 b2 00 00 00       	push   $0xb2
c0100743:	e9 07 f9 ff ff       	jmp    c010004f <dotsame>

c0100748 <intr179>:
c0100748:	6a 00                	push   $0x0
c010074a:	68 b3 00 00 00       	push   $0xb3
c010074f:	e9 fb f8 ff ff       	jmp    c010004f <dotsame>

c0100754 <intr180>:
c0100754:	6a 00                	push   $0x0
c0100756:	68 b4 00 00 00       	push   $0xb4
c010075b:	e9 ef f8 ff ff       	jmp    c010004f <dotsame>

c0100760 <intr181>:
c0100760:	6a 00                	push   $0x0
c0100762:	68 b5 00 00 00       	push   $0xb5
c0100767:	e9 e3 f8 ff ff       	jmp    c010004f <dotsame>

c010076c <intr182>:
c010076c:	6a 00                	push   $0x0
c010076e:	68 b6 00 00 00       	push   $0xb6
c0100773:	e9 d7 f8 ff ff       	jmp    c010004f <dotsame>

c0100778 <intr183>:
c0100778:	6a 00                	push   $0x0
c010077a:	68 b7 00 00 00       	push   $0xb7
c010077f:	e9 cb f8 ff ff       	jmp    c010004f <dotsame>

c0100784 <intr184>:
c0100784:	6a 00                	push   $0x0
c0100786:	68 b8 00 00 00       	push   $0xb8
c010078b:	e9 bf f8 ff ff       	jmp    c010004f <dotsame>

c0100790 <intr185>:
c0100790:	6a 00                	push   $0x0
c0100792:	68 b9 00 00 00       	push   $0xb9
c0100797:	e9 b3 f8 ff ff       	jmp    c010004f <dotsame>

c010079c <intr186>:
c010079c:	6a 00                	push   $0x0
c010079e:	68 ba 00 00 00       	push   $0xba
c01007a3:	e9 a7 f8 ff ff       	jmp    c010004f <dotsame>

c01007a8 <intr187>:
c01007a8:	6a 00                	push   $0x0
c01007aa:	68 bb 00 00 00       	push   $0xbb
c01007af:	e9 9b f8 ff ff       	jmp    c010004f <dotsame>

c01007b4 <intr188>:
c01007b4:	6a 00                	push   $0x0
c01007b6:	68 bc 00 00 00       	push   $0xbc
c01007bb:	e9 8f f8 ff ff       	jmp    c010004f <dotsame>

c01007c0 <intr189>:
c01007c0:	6a 00                	push   $0x0
c01007c2:	68 bd 00 00 00       	push   $0xbd
c01007c7:	e9 83 f8 ff ff       	jmp    c010004f <dotsame>

c01007cc <intr190>:
c01007cc:	6a 00                	push   $0x0
c01007ce:	68 be 00 00 00       	push   $0xbe
c01007d3:	e9 77 f8 ff ff       	jmp    c010004f <dotsame>

c01007d8 <intr191>:
c01007d8:	6a 00                	push   $0x0
c01007da:	68 bf 00 00 00       	push   $0xbf
c01007df:	e9 6b f8 ff ff       	jmp    c010004f <dotsame>

c01007e4 <intr192>:
c01007e4:	6a 00                	push   $0x0
c01007e6:	68 c0 00 00 00       	push   $0xc0
c01007eb:	e9 5f f8 ff ff       	jmp    c010004f <dotsame>

c01007f0 <intr193>:
c01007f0:	6a 00                	push   $0x0
c01007f2:	68 c1 00 00 00       	push   $0xc1
c01007f7:	e9 53 f8 ff ff       	jmp    c010004f <dotsame>

c01007fc <intr194>:
c01007fc:	6a 00                	push   $0x0
c01007fe:	68 c2 00 00 00       	push   $0xc2
c0100803:	e9 47 f8 ff ff       	jmp    c010004f <dotsame>

c0100808 <intr195>:
c0100808:	6a 00                	push   $0x0
c010080a:	68 c3 00 00 00       	push   $0xc3
c010080f:	e9 3b f8 ff ff       	jmp    c010004f <dotsame>

c0100814 <intr196>:
c0100814:	6a 00                	push   $0x0
c0100816:	68 c4 00 00 00       	push   $0xc4
c010081b:	e9 2f f8 ff ff       	jmp    c010004f <dotsame>

c0100820 <intr197>:
c0100820:	6a 00                	push   $0x0
c0100822:	68 c5 00 00 00       	push   $0xc5
c0100827:	e9 23 f8 ff ff       	jmp    c010004f <dotsame>

c010082c <intr198>:
c010082c:	6a 00                	push   $0x0
c010082e:	68 c6 00 00 00       	push   $0xc6
c0100833:	e9 17 f8 ff ff       	jmp    c010004f <dotsame>

c0100838 <intr199>:
c0100838:	6a 00                	push   $0x0
c010083a:	68 c7 00 00 00       	push   $0xc7
c010083f:	e9 0b f8 ff ff       	jmp    c010004f <dotsame>

c0100844 <intr200>:
c0100844:	6a 00                	push   $0x0
c0100846:	68 c8 00 00 00       	push   $0xc8
c010084b:	e9 ff f7 ff ff       	jmp    c010004f <dotsame>

c0100850 <intr201>:
c0100850:	6a 00                	push   $0x0
c0100852:	68 c9 00 00 00       	push   $0xc9
c0100857:	e9 f3 f7 ff ff       	jmp    c010004f <dotsame>

c010085c <intr202>:
c010085c:	6a 00                	push   $0x0
c010085e:	68 ca 00 00 00       	push   $0xca
c0100863:	e9 e7 f7 ff ff       	jmp    c010004f <dotsame>

c0100868 <intr203>:
c0100868:	6a 00                	push   $0x0
c010086a:	68 cb 00 00 00       	push   $0xcb
c010086f:	e9 db f7 ff ff       	jmp    c010004f <dotsame>

c0100874 <intr204>:
c0100874:	6a 00                	push   $0x0
c0100876:	68 cc 00 00 00       	push   $0xcc
c010087b:	e9 cf f7 ff ff       	jmp    c010004f <dotsame>

c0100880 <intr205>:
c0100880:	6a 00                	push   $0x0
c0100882:	68 cd 00 00 00       	push   $0xcd
c0100887:	e9 c3 f7 ff ff       	jmp    c010004f <dotsame>

c010088c <intr206>:
c010088c:	6a 00                	push   $0x0
c010088e:	68 ce 00 00 00       	push   $0xce
c0100893:	e9 b7 f7 ff ff       	jmp    c010004f <dotsame>

c0100898 <intr207>:
c0100898:	6a 00                	push   $0x0
c010089a:	68 cf 00 00 00       	push   $0xcf
c010089f:	e9 ab f7 ff ff       	jmp    c010004f <dotsame>

c01008a4 <intr208>:
c01008a4:	6a 00                	push   $0x0
c01008a6:	68 d0 00 00 00       	push   $0xd0
c01008ab:	e9 9f f7 ff ff       	jmp    c010004f <dotsame>

c01008b0 <intr209>:
c01008b0:	6a 00                	push   $0x0
c01008b2:	68 d1 00 00 00       	push   $0xd1
c01008b7:	e9 93 f7 ff ff       	jmp    c010004f <dotsame>

c01008bc <intr210>:
c01008bc:	6a 00                	push   $0x0
c01008be:	68 d2 00 00 00       	push   $0xd2
c01008c3:	e9 87 f7 ff ff       	jmp    c010004f <dotsame>

c01008c8 <intr211>:
c01008c8:	6a 00                	push   $0x0
c01008ca:	68 d3 00 00 00       	push   $0xd3
c01008cf:	e9 7b f7 ff ff       	jmp    c010004f <dotsame>

c01008d4 <intr212>:
c01008d4:	6a 00                	push   $0x0
c01008d6:	68 d4 00 00 00       	push   $0xd4
c01008db:	e9 6f f7 ff ff       	jmp    c010004f <dotsame>

c01008e0 <intr213>:
c01008e0:	6a 00                	push   $0x0
c01008e2:	68 d5 00 00 00       	push   $0xd5
c01008e7:	e9 63 f7 ff ff       	jmp    c010004f <dotsame>

c01008ec <intr214>:
c01008ec:	6a 00                	push   $0x0
c01008ee:	68 d6 00 00 00       	push   $0xd6
c01008f3:	e9 57 f7 ff ff       	jmp    c010004f <dotsame>

c01008f8 <intr215>:
c01008f8:	6a 00                	push   $0x0
c01008fa:	68 d7 00 00 00       	push   $0xd7
c01008ff:	e9 4b f7 ff ff       	jmp    c010004f <dotsame>

c0100904 <intr216>:
c0100904:	6a 00                	push   $0x0
c0100906:	68 d8 00 00 00       	push   $0xd8
c010090b:	e9 3f f7 ff ff       	jmp    c010004f <dotsame>

c0100910 <intr217>:
c0100910:	6a 00                	push   $0x0
c0100912:	68 d9 00 00 00       	push   $0xd9
c0100917:	e9 33 f7 ff ff       	jmp    c010004f <dotsame>

c010091c <intr218>:
c010091c:	6a 00                	push   $0x0
c010091e:	68 da 00 00 00       	push   $0xda
c0100923:	e9 27 f7 ff ff       	jmp    c010004f <dotsame>

c0100928 <intr219>:
c0100928:	6a 00                	push   $0x0
c010092a:	68 db 00 00 00       	push   $0xdb
c010092f:	e9 1b f7 ff ff       	jmp    c010004f <dotsame>

c0100934 <intr220>:
c0100934:	6a 00                	push   $0x0
c0100936:	68 dc 00 00 00       	push   $0xdc
c010093b:	e9 0f f7 ff ff       	jmp    c010004f <dotsame>

c0100940 <intr221>:
c0100940:	6a 00                	push   $0x0
c0100942:	68 dd 00 00 00       	push   $0xdd
c0100947:	e9 03 f7 ff ff       	jmp    c010004f <dotsame>

c010094c <intr222>:
c010094c:	6a 00                	push   $0x0
c010094e:	68 de 00 00 00       	push   $0xde
c0100953:	e9 f7 f6 ff ff       	jmp    c010004f <dotsame>

c0100958 <intr223>:
c0100958:	6a 00                	push   $0x0
c010095a:	68 df 00 00 00       	push   $0xdf
c010095f:	e9 eb f6 ff ff       	jmp    c010004f <dotsame>

c0100964 <intr224>:
c0100964:	6a 00                	push   $0x0
c0100966:	68 e0 00 00 00       	push   $0xe0
c010096b:	e9 df f6 ff ff       	jmp    c010004f <dotsame>

c0100970 <intr225>:
c0100970:	6a 00                	push   $0x0
c0100972:	68 e1 00 00 00       	push   $0xe1
c0100977:	e9 d3 f6 ff ff       	jmp    c010004f <dotsame>

c010097c <intr226>:
c010097c:	6a 00                	push   $0x0
c010097e:	68 e2 00 00 00       	push   $0xe2
c0100983:	e9 c7 f6 ff ff       	jmp    c010004f <dotsame>

c0100988 <intr227>:
c0100988:	6a 00                	push   $0x0
c010098a:	68 e3 00 00 00       	push   $0xe3
c010098f:	e9 bb f6 ff ff       	jmp    c010004f <dotsame>

c0100994 <intr228>:
c0100994:	6a 00                	push   $0x0
c0100996:	68 e4 00 00 00       	push   $0xe4
c010099b:	e9 af f6 ff ff       	jmp    c010004f <dotsame>

c01009a0 <intr229>:
c01009a0:	6a 00                	push   $0x0
c01009a2:	68 e5 00 00 00       	push   $0xe5
c01009a7:	e9 a3 f6 ff ff       	jmp    c010004f <dotsame>

c01009ac <intr230>:
c01009ac:	6a 00                	push   $0x0
c01009ae:	68 e6 00 00 00       	push   $0xe6
c01009b3:	e9 97 f6 ff ff       	jmp    c010004f <dotsame>

c01009b8 <intr231>:
c01009b8:	6a 00                	push   $0x0
c01009ba:	68 e7 00 00 00       	push   $0xe7
c01009bf:	e9 8b f6 ff ff       	jmp    c010004f <dotsame>

c01009c4 <intr232>:
c01009c4:	6a 00                	push   $0x0
c01009c6:	68 e8 00 00 00       	push   $0xe8
c01009cb:	e9 7f f6 ff ff       	jmp    c010004f <dotsame>

c01009d0 <intr233>:
c01009d0:	6a 00                	push   $0x0
c01009d2:	68 e9 00 00 00       	push   $0xe9
c01009d7:	e9 73 f6 ff ff       	jmp    c010004f <dotsame>

c01009dc <intr234>:
c01009dc:	6a 00                	push   $0x0
c01009de:	68 ea 00 00 00       	push   $0xea
c01009e3:	e9 67 f6 ff ff       	jmp    c010004f <dotsame>

c01009e8 <intr235>:
c01009e8:	6a 00                	push   $0x0
c01009ea:	68 eb 00 00 00       	push   $0xeb
c01009ef:	e9 5b f6 ff ff       	jmp    c010004f <dotsame>

c01009f4 <intr236>:
c01009f4:	6a 00                	push   $0x0
c01009f6:	68 ec 00 00 00       	push   $0xec
c01009fb:	e9 4f f6 ff ff       	jmp    c010004f <dotsame>

c0100a00 <intr237>:
c0100a00:	6a 00                	push   $0x0
c0100a02:	68 ed 00 00 00       	push   $0xed
c0100a07:	e9 43 f6 ff ff       	jmp    c010004f <dotsame>

c0100a0c <intr238>:
c0100a0c:	6a 00                	push   $0x0
c0100a0e:	68 ee 00 00 00       	push   $0xee
c0100a13:	e9 37 f6 ff ff       	jmp    c010004f <dotsame>

c0100a18 <intr239>:
c0100a18:	6a 00                	push   $0x0
c0100a1a:	68 ef 00 00 00       	push   $0xef
c0100a1f:	e9 2b f6 ff ff       	jmp    c010004f <dotsame>

c0100a24 <intr240>:
c0100a24:	6a 00                	push   $0x0
c0100a26:	68 f0 00 00 00       	push   $0xf0
c0100a2b:	e9 1f f6 ff ff       	jmp    c010004f <dotsame>

c0100a30 <intr241>:
c0100a30:	6a 00                	push   $0x0
c0100a32:	68 f1 00 00 00       	push   $0xf1
c0100a37:	e9 13 f6 ff ff       	jmp    c010004f <dotsame>

c0100a3c <intr242>:
c0100a3c:	6a 00                	push   $0x0
c0100a3e:	68 f2 00 00 00       	push   $0xf2
c0100a43:	e9 07 f6 ff ff       	jmp    c010004f <dotsame>

c0100a48 <intr243>:
c0100a48:	6a 00                	push   $0x0
c0100a4a:	68 f3 00 00 00       	push   $0xf3
c0100a4f:	e9 fb f5 ff ff       	jmp    c010004f <dotsame>

c0100a54 <intr244>:
c0100a54:	6a 00                	push   $0x0
c0100a56:	68 f4 00 00 00       	push   $0xf4
c0100a5b:	e9 ef f5 ff ff       	jmp    c010004f <dotsame>

c0100a60 <intr245>:
c0100a60:	6a 00                	push   $0x0
c0100a62:	68 f5 00 00 00       	push   $0xf5
c0100a67:	e9 e3 f5 ff ff       	jmp    c010004f <dotsame>

c0100a6c <intr246>:
c0100a6c:	6a 00                	push   $0x0
c0100a6e:	68 f6 00 00 00       	push   $0xf6
c0100a73:	e9 d7 f5 ff ff       	jmp    c010004f <dotsame>

c0100a78 <intr247>:
c0100a78:	6a 00                	push   $0x0
c0100a7a:	68 f7 00 00 00       	push   $0xf7
c0100a7f:	e9 cb f5 ff ff       	jmp    c010004f <dotsame>

c0100a84 <intr248>:
c0100a84:	6a 00                	push   $0x0
c0100a86:	68 f8 00 00 00       	push   $0xf8
c0100a8b:	e9 bf f5 ff ff       	jmp    c010004f <dotsame>

c0100a90 <intr249>:
c0100a90:	6a 00                	push   $0x0
c0100a92:	68 f9 00 00 00       	push   $0xf9
c0100a97:	e9 b3 f5 ff ff       	jmp    c010004f <dotsame>

c0100a9c <intr250>:
c0100a9c:	6a 00                	push   $0x0
c0100a9e:	68 fa 00 00 00       	push   $0xfa
c0100aa3:	e9 a7 f5 ff ff       	jmp    c010004f <dotsame>

c0100aa8 <intr251>:
c0100aa8:	6a 00                	push   $0x0
c0100aaa:	68 fb 00 00 00       	push   $0xfb
c0100aaf:	e9 9b f5 ff ff       	jmp    c010004f <dotsame>

c0100ab4 <intr252>:
c0100ab4:	6a 00                	push   $0x0
c0100ab6:	68 fc 00 00 00       	push   $0xfc
c0100abb:	e9 8f f5 ff ff       	jmp    c010004f <dotsame>

c0100ac0 <intr253>:
c0100ac0:	6a 00                	push   $0x0
c0100ac2:	68 fd 00 00 00       	push   $0xfd
c0100ac7:	e9 83 f5 ff ff       	jmp    c010004f <dotsame>

c0100acc <intr254>:
c0100acc:	6a 00                	push   $0x0
c0100ace:	68 fe 00 00 00       	push   $0xfe
c0100ad3:	e9 77 f5 ff ff       	jmp    c010004f <dotsame>

c0100ad8 <intr255>:
c0100ad8:	6a 00                	push   $0x0
c0100ada:	68 ff 00 00 00       	push   $0xff
c0100adf:	e9 6b f5 ff ff       	jmp    c010004f <dotsame>
c0100ae4:	66 90                	xchg   %ax,%ax
c0100ae6:	66 90                	xchg   %ax,%ax
c0100ae8:	66 90                	xchg   %ax,%ax
c0100aea:	66 90                	xchg   %ax,%ax
c0100aec:	66 90                	xchg   %ax,%ax
c0100aee:	66 90                	xchg   %ax,%ax

c0100af0 <ptabinit>:
c0100af0:	55                   	push   %ebp
c0100af1:	89 e5                	mov    %esp,%ebp
c0100af3:	83 ec 10             	sub    $0x10,%esp
c0100af6:	68 67 30 10 c0       	push   $0xc0103067
c0100afb:	68 00 90 10 c0       	push   $0xc0109000
c0100b00:	e8 2b 09 00 00       	call   c0101430 <initlock>
c0100b05:	83 c4 10             	add    $0x10,%esp
c0100b08:	c9                   	leave  
c0100b09:	c3                   	ret    
c0100b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100b10 <getcpu>:
c0100b10:	b8 20 80 10 c0       	mov    $0xc0108020,%eax
c0100b15:	c3                   	ret    
c0100b16:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100b1d:	8d 76 00             	lea    0x0(%esi),%esi

c0100b20 <getproc>:
c0100b20:	55                   	push   %ebp
c0100b21:	89 e5                	mov    %esp,%ebp
c0100b23:	53                   	push   %ebx
c0100b24:	83 ec 04             	sub    $0x4,%esp
c0100b27:	e8 24 09 00 00       	call   c0101450 <pcli>
c0100b2c:	8b 1d c4 80 10 c0    	mov    0xc01080c4,%ebx
c0100b32:	e8 69 09 00 00       	call   c01014a0 <vcli>
c0100b37:	83 c4 04             	add    $0x4,%esp
c0100b3a:	89 d8                	mov    %ebx,%eax
c0100b3c:	5b                   	pop    %ebx
c0100b3d:	5d                   	pop    %ebp
c0100b3e:	c3                   	ret    
c0100b3f:	90                   	nop

c0100b40 <backtouser>:
c0100b40:	c3                   	ret    
c0100b41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100b48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100b4f:	90                   	nop

c0100b50 <scheduler>:
c0100b50:	55                   	push   %ebp
c0100b51:	89 e5                	mov    %esp,%ebp
c0100b53:	53                   	push   %ebx
c0100b54:	83 ec 04             	sub    $0x4,%esp
c0100b57:	c7 05 c4 80 10 c0 00 	movl   $0x0,0xc01080c4
c0100b5e:	00 00 00 
c0100b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100b68:	fb                   	sti    
c0100b69:	83 ec 0c             	sub    $0xc,%esp
c0100b6c:	bb 0c 90 10 c0       	mov    $0xc010900c,%ebx
c0100b71:	68 00 90 10 c0       	push   $0xc0109000
c0100b76:	e8 e5 09 00 00       	call   c0101560 <acquire>
c0100b7b:	83 c4 10             	add    $0x10,%esp
c0100b7e:	66 90                	xchg   %ax,%ax
c0100b80:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
c0100b84:	75 37                	jne    c0100bbd <scheduler+0x6d>
c0100b86:	83 ec 0c             	sub    $0xc,%esp
c0100b89:	89 1d c4 80 10 c0    	mov    %ebx,0xc01080c4
c0100b8f:	53                   	push   %ebx
c0100b90:	e8 2b 17 00 00       	call   c01022c0 <changeuvm>
c0100b95:	58                   	pop    %eax
c0100b96:	5a                   	pop    %edx
c0100b97:	ff 73 1c             	pushl  0x1c(%ebx)
c0100b9a:	68 20 80 10 c0       	push   $0xc0108020
c0100b9f:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
c0100ba6:	e8 8f f4 ff ff       	call   c010003a <swtch>
c0100bab:	e8 70 16 00 00       	call   c0102220 <switchkvm>
c0100bb0:	83 c4 10             	add    $0x10,%esp
c0100bb3:	c7 05 c4 80 10 c0 00 	movl   $0x0,0xc01080c4
c0100bba:	00 00 00 
c0100bbd:	81 c3 84 00 00 00    	add    $0x84,%ebx
c0100bc3:	81 fb 0c b1 10 c0    	cmp    $0xc010b10c,%ebx
c0100bc9:	75 b5                	jne    c0100b80 <scheduler+0x30>
c0100bcb:	83 ec 0c             	sub    $0xc,%esp
c0100bce:	68 00 90 10 c0       	push   $0xc0109000
c0100bd3:	e8 e8 09 00 00       	call   c01015c0 <release>
c0100bd8:	83 c4 10             	add    $0x10,%esp
c0100bdb:	eb 8b                	jmp    c0100b68 <scheduler+0x18>
c0100bdd:	8d 76 00             	lea    0x0(%esi),%esi

c0100be0 <forkret>:
c0100be0:	55                   	push   %ebp
c0100be1:	89 e5                	mov    %esp,%ebp
c0100be3:	83 ec 14             	sub    $0x14,%esp
c0100be6:	68 6f 30 10 c0       	push   $0xc010306f
c0100beb:	e8 c0 11 00 00       	call   c0101db0 <printk>
c0100bf0:	c7 04 24 00 90 10 c0 	movl   $0xc0109000,(%esp)
c0100bf7:	e8 c4 09 00 00       	call   c01015c0 <release>
c0100bfc:	a1 00 44 10 c0       	mov    0xc0104400,%eax
c0100c01:	83 c4 10             	add    $0x10,%esp
c0100c04:	85 c0                	test   %eax,%eax
c0100c06:	74 0a                	je     c0100c12 <forkret+0x32>
c0100c08:	c7 05 00 44 10 c0 00 	movl   $0x0,0xc0104400
c0100c0f:	00 00 00 
c0100c12:	c9                   	leave  
c0100c13:	c3                   	ret    
c0100c14:	66 90                	xchg   %ax,%ax
c0100c16:	66 90                	xchg   %ax,%ax
c0100c18:	66 90                	xchg   %ax,%ax
c0100c1a:	66 90                	xchg   %ax,%ax
c0100c1c:	66 90                	xchg   %ax,%ax
c0100c1e:	66 90                	xchg   %ax,%ax

c0100c20 <idt_init>:
c0100c20:	55                   	push   %ebp
c0100c21:	89 e5                	mov    %esp,%ebp
c0100c23:	83 ec 18             	sub    $0x18,%esp
c0100c26:	e8 95 03 00 00       	call   c0100fc0 <init_8259A>
c0100c2b:	83 ec 0c             	sub    $0xc,%esp
c0100c2e:	6a 64                	push   $0x64
c0100c30:	e8 eb 03 00 00       	call   c0101020 <init_timer>
c0100c35:	83 c4 10             	add    $0x10,%esp
c0100c38:	31 c0                	xor    %eax,%eax
c0100c3a:	b9 40 b1 10 c0       	mov    $0xc010b140,%ecx
c0100c3f:	90                   	nop
c0100c40:	8b 14 85 00 40 10 c0 	mov    -0x3fefc000(,%eax,4),%edx
c0100c47:	c7 04 c5 42 b1 10 c0 	movl   $0x8e000008,-0x3fef4ebe(,%eax,8)
c0100c4e:	08 00 00 8e 
c0100c52:	66 89 14 c5 40 b1 10 	mov    %dx,-0x3fef4ec0(,%eax,8)
c0100c59:	c0 
c0100c5a:	c1 ea 10             	shr    $0x10,%edx
c0100c5d:	66 89 14 c5 46 b1 10 	mov    %dx,-0x3fef4eba(,%eax,8)
c0100c64:	c0 
c0100c65:	83 c0 01             	add    $0x1,%eax
c0100c68:	3d 00 01 00 00       	cmp    $0x100,%eax
c0100c6d:	75 d1                	jne    c0100c40 <idt_init+0x20>
c0100c6f:	a1 00 42 10 c0       	mov    0xc0104200,%eax
c0100c74:	c7 05 42 b5 10 c0 08 	movl   $0xef000008,0xc010b542
c0100c7b:	00 00 ef 
c0100c7e:	66 a3 40 b5 10 c0    	mov    %ax,0xc010b540
c0100c84:	c1 e8 10             	shr    $0x10,%eax
c0100c87:	66 a3 46 b5 10 c0    	mov    %ax,0xc010b546
c0100c8d:	b8 ff 07 00 00       	mov    $0x7ff,%eax
c0100c92:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
c0100c96:	8d 45 f2             	lea    -0xe(%ebp),%eax
c0100c99:	66 89 4d f4          	mov    %cx,-0xc(%ebp)
c0100c9d:	c1 e9 10             	shr    $0x10,%ecx
c0100ca0:	66 89 4d f6          	mov    %cx,-0xa(%ebp)
c0100ca4:	0f 01 18             	lidtl  (%eax)
c0100ca7:	83 ec 08             	sub    $0x8,%esp
c0100caa:	68 89 30 10 c0       	push   $0xc0103089
c0100caf:	68 40 b9 10 c0       	push   $0xc010b940
c0100cb4:	e8 77 07 00 00       	call   c0101430 <initlock>
c0100cb9:	83 c4 10             	add    $0x10,%esp
c0100cbc:	c9                   	leave  
c0100cbd:	c3                   	ret    
c0100cbe:	66 90                	xchg   %ax,%ax

c0100cc0 <intr>:
c0100cc0:	55                   	push   %ebp
c0100cc1:	89 e5                	mov    %esp,%ebp
c0100cc3:	57                   	push   %edi
c0100cc4:	56                   	push   %esi
c0100cc5:	53                   	push   %ebx
c0100cc6:	83 ec 1c             	sub    $0x1c,%esp
c0100cc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100ccc:	8b 43 30             	mov    0x30(%ebx),%eax
c0100ccf:	3d 80 00 00 00       	cmp    $0x80,%eax
c0100cd4:	0f 84 e6 00 00 00    	je     c0100dc0 <intr+0x100>
c0100cda:	83 f8 20             	cmp    $0x20,%eax
c0100cdd:	0f 84 8d 00 00 00    	je     c0100d70 <intr+0xb0>
c0100ce3:	e8 38 fe ff ff       	call   c0100b20 <getproc>
c0100ce8:	85 c0                	test   %eax,%eax
c0100cea:	74 5c                	je     c0100d48 <intr+0x88>
c0100cec:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
c0100cf0:	74 56                	je     c0100d48 <intr+0x88>
c0100cf2:	0f 20 d2             	mov    %cr2,%edx
c0100cf5:	8b 7b 38             	mov    0x38(%ebx),%edi
c0100cf8:	8b 73 34             	mov    0x34(%ebx),%esi
c0100cfb:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0100cfe:	8b 5b 30             	mov    0x30(%ebx),%ebx
c0100d01:	e8 1a fe ff ff       	call   c0100b20 <getproc>
c0100d06:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100d09:	e8 12 fe ff ff       	call   c0100b20 <getproc>
c0100d0e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100d11:	83 ec 04             	sub    $0x4,%esp
c0100d14:	52                   	push   %edx
c0100d15:	57                   	push   %edi
c0100d16:	56                   	push   %esi
c0100d17:	53                   	push   %ebx
c0100d18:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c0100d1b:	83 c3 6c             	add    $0x6c,%ebx
c0100d1e:	53                   	push   %ebx
c0100d1f:	ff 70 10             	pushl  0x10(%eax)
c0100d22:	68 50 31 10 c0       	push   $0xc0103150
c0100d27:	e8 84 10 00 00       	call   c0101db0 <printk>
c0100d2c:	83 c4 20             	add    $0x20,%esp
c0100d2f:	e8 ec fd ff ff       	call   c0100b20 <getproc>
c0100d34:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
c0100d3b:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100d3e:	5b                   	pop    %ebx
c0100d3f:	5e                   	pop    %esi
c0100d40:	5f                   	pop    %edi
c0100d41:	5d                   	pop    %ebp
c0100d42:	c3                   	ret    
c0100d43:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100d47:	90                   	nop
c0100d48:	0f 20 d0             	mov    %cr2,%eax
c0100d4b:	50                   	push   %eax
c0100d4c:	ff 73 38             	pushl  0x38(%ebx)
c0100d4f:	ff 73 30             	pushl  0x30(%ebx)
c0100d52:	68 28 31 10 c0       	push   $0xc0103128
c0100d57:	e8 54 10 00 00       	call   c0101db0 <printk>
c0100d5c:	c7 04 24 99 30 10 c0 	movl   $0xc0103099,(%esp)
c0100d63:	e8 48 10 00 00       	call   c0101db0 <printk>
c0100d68:	83 c4 10             	add    $0x10,%esp
c0100d6b:	eb 85                	jmp    c0100cf2 <intr+0x32>
c0100d6d:	8d 76 00             	lea    0x0(%esi),%esi
c0100d70:	83 ec 0c             	sub    $0xc,%esp
c0100d73:	68 40 b9 10 c0       	push   $0xc010b940
c0100d78:	e8 e3 07 00 00       	call   c0101560 <acquire>
c0100d7d:	a1 20 b1 10 c0       	mov    0xc010b120,%eax
c0100d82:	5a                   	pop    %edx
c0100d83:	59                   	pop    %ecx
c0100d84:	83 c0 01             	add    $0x1,%eax
c0100d87:	50                   	push   %eax
c0100d88:	68 8e 30 10 c0       	push   $0xc010308e
c0100d8d:	a3 20 b1 10 c0       	mov    %eax,0xc010b120
c0100d92:	e8 19 10 00 00       	call   c0101db0 <printk>
c0100d97:	c7 04 24 40 b9 10 c0 	movl   $0xc010b940,(%esp)
c0100d9e:	e8 1d 08 00 00       	call   c01015c0 <release>
c0100da3:	8b 43 30             	mov    0x30(%ebx),%eax
c0100da6:	83 c4 10             	add    $0x10,%esp
c0100da9:	89 45 08             	mov    %eax,0x8(%ebp)
c0100dac:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100daf:	5b                   	pop    %ebx
c0100db0:	5e                   	pop    %esi
c0100db1:	5f                   	pop    %edi
c0100db2:	5d                   	pop    %ebp
c0100db3:	e9 48 02 00 00       	jmp    c0101000 <empty_int>
c0100db8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100dbf:	90                   	nop
c0100dc0:	e8 5b fd ff ff       	call   c0100b20 <getproc>
c0100dc5:	8b 78 24             	mov    0x24(%eax),%edi
c0100dc8:	85 ff                	test   %edi,%edi
c0100dca:	75 1c                	jne    c0100de8 <intr+0x128>
c0100dcc:	e8 4f fd ff ff       	call   c0100b20 <getproc>
c0100dd1:	8b 70 24             	mov    0x24(%eax),%esi
c0100dd4:	85 f6                	test   %esi,%esi
c0100dd6:	0f 85 5f ff ff ff    	jne    c0100d3b <intr+0x7b>
c0100ddc:	8b 43 30             	mov    0x30(%ebx),%eax
c0100ddf:	e9 f6 fe ff ff       	jmp    c0100cda <intr+0x1a>
c0100de4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100de8:	e8 33 fd ff ff       	call   c0100b20 <getproc>
c0100ded:	89 58 18             	mov    %ebx,0x18(%eax)
c0100df0:	eb da                	jmp    c0100dcc <intr+0x10c>
c0100df2:	66 90                	xchg   %ax,%ax
c0100df4:	66 90                	xchg   %ax,%ax
c0100df6:	66 90                	xchg   %ax,%ax
c0100df8:	66 90                	xchg   %ax,%ax
c0100dfa:	66 90                	xchg   %ax,%ax
c0100dfc:	66 90                	xchg   %ax,%ax
c0100dfe:	66 90                	xchg   %ax,%ax

c0100e00 <memcpy>:
c0100e00:	55                   	push   %ebp
c0100e01:	89 e5                	mov    %esp,%ebp
c0100e03:	57                   	push   %edi
c0100e04:	8b 45 10             	mov    0x10(%ebp),%eax
c0100e07:	8b 7d 08             	mov    0x8(%ebp),%edi
c0100e0a:	56                   	push   %esi
c0100e0b:	8b 75 0c             	mov    0xc(%ebp),%esi
c0100e0e:	85 c0                	test   %eax,%eax
c0100e10:	74 0b                	je     c0100e1d <memcpy+0x1d>
c0100e12:	01 f8                	add    %edi,%eax
c0100e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100e18:	a4                   	movsb  %ds:(%esi),%es:(%edi)
c0100e19:	39 c7                	cmp    %eax,%edi
c0100e1b:	75 fb                	jne    c0100e18 <memcpy+0x18>
c0100e1d:	5e                   	pop    %esi
c0100e1e:	5f                   	pop    %edi
c0100e1f:	5d                   	pop    %ebp
c0100e20:	c3                   	ret    
c0100e21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100e28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100e2f:	90                   	nop

c0100e30 <memmove>:
c0100e30:	55                   	push   %ebp
c0100e31:	89 e5                	mov    %esp,%ebp
c0100e33:	57                   	push   %edi
c0100e34:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e37:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100e3a:	56                   	push   %esi
c0100e3b:	8b 75 0c             	mov    0xc(%ebp),%esi
c0100e3e:	39 c6                	cmp    %eax,%esi
c0100e40:	73 26                	jae    c0100e68 <memmove+0x38>
c0100e42:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
c0100e45:	39 f8                	cmp    %edi,%eax
c0100e47:	73 1f                	jae    c0100e68 <memmove+0x38>
c0100e49:	8d 51 ff             	lea    -0x1(%ecx),%edx
c0100e4c:	85 c9                	test   %ecx,%ecx
c0100e4e:	74 0f                	je     c0100e5f <memmove+0x2f>
c0100e50:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
c0100e54:	88 0c 10             	mov    %cl,(%eax,%edx,1)
c0100e57:	83 ea 01             	sub    $0x1,%edx
c0100e5a:	83 fa ff             	cmp    $0xffffffff,%edx
c0100e5d:	75 f1                	jne    c0100e50 <memmove+0x20>
c0100e5f:	5e                   	pop    %esi
c0100e60:	5f                   	pop    %edi
c0100e61:	5d                   	pop    %ebp
c0100e62:	c3                   	ret    
c0100e63:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100e67:	90                   	nop
c0100e68:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
c0100e6b:	89 c7                	mov    %eax,%edi
c0100e6d:	85 c9                	test   %ecx,%ecx
c0100e6f:	74 ee                	je     c0100e5f <memmove+0x2f>
c0100e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100e78:	a4                   	movsb  %ds:(%esi),%es:(%edi)
c0100e79:	39 d6                	cmp    %edx,%esi
c0100e7b:	75 fb                	jne    c0100e78 <memmove+0x48>
c0100e7d:	5e                   	pop    %esi
c0100e7e:	5f                   	pop    %edi
c0100e7f:	5d                   	pop    %ebp
c0100e80:	c3                   	ret    
c0100e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100e88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100e8f:	90                   	nop

c0100e90 <memset>:
c0100e90:	55                   	push   %ebp
c0100e91:	89 e5                	mov    %esp,%ebp
c0100e93:	8b 55 10             	mov    0x10(%ebp),%edx
c0100e96:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e99:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
c0100e9d:	85 d2                	test   %edx,%edx
c0100e9f:	74 11                	je     c0100eb2 <memset+0x22>
c0100ea1:	01 c2                	add    %eax,%edx
c0100ea3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100ea7:	90                   	nop
c0100ea8:	83 c0 01             	add    $0x1,%eax
c0100eab:	88 48 ff             	mov    %cl,-0x1(%eax)
c0100eae:	39 d0                	cmp    %edx,%eax
c0100eb0:	75 f6                	jne    c0100ea8 <memset+0x18>
c0100eb2:	5d                   	pop    %ebp
c0100eb3:	c3                   	ret    
c0100eb4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100ebb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100ebf:	90                   	nop

c0100ec0 <bzero>:
c0100ec0:	55                   	push   %ebp
c0100ec1:	89 e5                	mov    %esp,%ebp
c0100ec3:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100ec6:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ec9:	85 d2                	test   %edx,%edx
c0100ecb:	74 0e                	je     c0100edb <bzero+0x1b>
c0100ecd:	01 c2                	add    %eax,%edx
c0100ecf:	90                   	nop
c0100ed0:	83 c0 01             	add    $0x1,%eax
c0100ed3:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
c0100ed7:	39 d0                	cmp    %edx,%eax
c0100ed9:	75 f5                	jne    c0100ed0 <bzero+0x10>
c0100edb:	5d                   	pop    %ebp
c0100edc:	c3                   	ret    
c0100edd:	8d 76 00             	lea    0x0(%esi),%esi

c0100ee0 <strcmp>:
c0100ee0:	55                   	push   %ebp
c0100ee1:	31 c0                	xor    %eax,%eax
c0100ee3:	89 e5                	mov    %esp,%ebp
c0100ee5:	56                   	push   %esi
c0100ee6:	8b 75 08             	mov    0x8(%ebp),%esi
c0100ee9:	53                   	push   %ebx
c0100eea:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0100eed:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
c0100ef1:	0f b6 0c 03          	movzbl (%ebx,%eax,1),%ecx
c0100ef5:	84 d2                	test   %dl,%dl
c0100ef7:	74 17                	je     c0100f10 <strcmp+0x30>
c0100ef9:	84 c9                	test   %cl,%cl
c0100efb:	74 13                	je     c0100f10 <strcmp+0x30>
c0100efd:	83 c0 01             	add    $0x1,%eax
c0100f00:	38 ca                	cmp    %cl,%dl
c0100f02:	74 e9                	je     c0100eed <strcmp+0xd>
c0100f04:	5b                   	pop    %ebx
c0100f05:	31 c0                	xor    %eax,%eax
c0100f07:	5e                   	pop    %esi
c0100f08:	5d                   	pop    %ebp
c0100f09:	c3                   	ret    
c0100f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100f10:	31 c0                	xor    %eax,%eax
c0100f12:	38 ca                	cmp    %cl,%dl
c0100f14:	5b                   	pop    %ebx
c0100f15:	5e                   	pop    %esi
c0100f16:	0f 94 c0             	sete   %al
c0100f19:	5d                   	pop    %ebp
c0100f1a:	c3                   	ret    
c0100f1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100f1f:	90                   	nop

c0100f20 <safestrcpy>:
c0100f20:	55                   	push   %ebp
c0100f21:	89 e5                	mov    %esp,%ebp
c0100f23:	56                   	push   %esi
c0100f24:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100f27:	8b 45 08             	mov    0x8(%ebp),%eax
c0100f2a:	53                   	push   %ebx
c0100f2b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f2e:	85 c9                	test   %ecx,%ecx
c0100f30:	7e 26                	jle    c0100f58 <safestrcpy+0x38>
c0100f32:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
c0100f36:	89 c1                	mov    %eax,%ecx
c0100f38:	eb 17                	jmp    c0100f51 <safestrcpy+0x31>
c0100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100f40:	83 c2 01             	add    $0x1,%edx
c0100f43:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
c0100f47:	83 c1 01             	add    $0x1,%ecx
c0100f4a:	88 59 ff             	mov    %bl,-0x1(%ecx)
c0100f4d:	84 db                	test   %bl,%bl
c0100f4f:	74 04                	je     c0100f55 <safestrcpy+0x35>
c0100f51:	39 f2                	cmp    %esi,%edx
c0100f53:	75 eb                	jne    c0100f40 <safestrcpy+0x20>
c0100f55:	c6 01 00             	movb   $0x0,(%ecx)
c0100f58:	5b                   	pop    %ebx
c0100f59:	5e                   	pop    %esi
c0100f5a:	5d                   	pop    %ebp
c0100f5b:	c3                   	ret    
c0100f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100f60 <strcat>:
c0100f60:	55                   	push   %ebp
c0100f61:	89 e5                	mov    %esp,%ebp
c0100f63:	53                   	push   %ebx
c0100f64:	8b 45 08             	mov    0x8(%ebp),%eax
c0100f67:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0100f6a:	89 c2                	mov    %eax,%edx
c0100f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100f70:	83 c2 01             	add    $0x1,%edx
c0100f73:	80 7a ff 00          	cmpb   $0x0,-0x1(%edx)
c0100f77:	75 f7                	jne    c0100f70 <strcat+0x10>
c0100f79:	0f b6 0b             	movzbl (%ebx),%ecx
c0100f7c:	84 c9                	test   %cl,%cl
c0100f7e:	74 10                	je     c0100f90 <strcat+0x30>
c0100f80:	83 c3 01             	add    $0x1,%ebx
c0100f83:	83 c2 01             	add    $0x1,%edx
c0100f86:	88 4a ff             	mov    %cl,-0x1(%edx)
c0100f89:	0f b6 0b             	movzbl (%ebx),%ecx
c0100f8c:	84 c9                	test   %cl,%cl
c0100f8e:	75 f0                	jne    c0100f80 <strcat+0x20>
c0100f90:	c6 02 00             	movb   $0x0,(%edx)
c0100f93:	5b                   	pop    %ebx
c0100f94:	5d                   	pop    %ebp
c0100f95:	c3                   	ret    
c0100f96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100f9d:	8d 76 00             	lea    0x0(%esi),%esi

c0100fa0 <strlen>:
c0100fa0:	55                   	push   %ebp
c0100fa1:	31 c0                	xor    %eax,%eax
c0100fa3:	89 e5                	mov    %esp,%ebp
c0100fa5:	8b 55 08             	mov    0x8(%ebp),%edx
c0100fa8:	80 3a 00             	cmpb   $0x0,(%edx)
c0100fab:	74 0c                	je     c0100fb9 <strlen+0x19>
c0100fad:	8d 76 00             	lea    0x0(%esi),%esi
c0100fb0:	83 c0 01             	add    $0x1,%eax
c0100fb3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
c0100fb7:	75 f7                	jne    c0100fb0 <strlen+0x10>
c0100fb9:	5d                   	pop    %ebp
c0100fba:	c3                   	ret    
c0100fbb:	66 90                	xchg   %ax,%ax
c0100fbd:	66 90                	xchg   %ax,%ax
c0100fbf:	90                   	nop

c0100fc0 <init_8259A>:
c0100fc0:	b8 11 00 00 00       	mov    $0x11,%eax
c0100fc5:	e6 20                	out    %al,$0x20
c0100fc7:	e6 a0                	out    %al,$0xa0
c0100fc9:	b8 20 00 00 00       	mov    $0x20,%eax
c0100fce:	e6 21                	out    %al,$0x21
c0100fd0:	b8 28 00 00 00       	mov    $0x28,%eax
c0100fd5:	e6 a1                	out    %al,$0xa1
c0100fd7:	b8 04 00 00 00       	mov    $0x4,%eax
c0100fdc:	e6 21                	out    %al,$0x21
c0100fde:	b8 02 00 00 00       	mov    $0x2,%eax
c0100fe3:	e6 a1                	out    %al,$0xa1
c0100fe5:	b8 01 00 00 00       	mov    $0x1,%eax
c0100fea:	e6 21                	out    %al,$0x21
c0100fec:	e6 a1                	out    %al,$0xa1
c0100fee:	31 c0                	xor    %eax,%eax
c0100ff0:	e6 21                	out    %al,$0x21
c0100ff2:	e6 a1                	out    %al,$0xa1
c0100ff4:	c3                   	ret    
c0100ff5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0101000 <empty_int>:
c0101000:	55                   	push   %ebp
c0101001:	89 e5                	mov    %esp,%ebp
c0101003:	83 7d 08 27          	cmpl   $0x27,0x8(%ebp)
c0101007:	7e 07                	jle    c0101010 <empty_int+0x10>
c0101009:	b8 20 00 00 00       	mov    $0x20,%eax
c010100e:	e6 a0                	out    %al,$0xa0
c0101010:	b8 20 00 00 00       	mov    $0x20,%eax
c0101015:	e6 20                	out    %al,$0x20
c0101017:	5d                   	pop    %ebp
c0101018:	c3                   	ret    
c0101019:	66 90                	xchg   %ax,%ax
c010101b:	66 90                	xchg   %ax,%ax
c010101d:	66 90                	xchg   %ax,%ax
c010101f:	90                   	nop

c0101020 <init_timer>:
c0101020:	55                   	push   %ebp
c0101021:	31 d2                	xor    %edx,%edx
c0101023:	b8 dc 34 12 00       	mov    $0x1234dc,%eax
c0101028:	89 e5                	mov    %esp,%ebp
c010102a:	f7 75 08             	divl   0x8(%ebp)
c010102d:	89 c1                	mov    %eax,%ecx
c010102f:	b8 36 00 00 00       	mov    $0x36,%eax
c0101034:	e6 43                	out    %al,$0x43
c0101036:	89 c8                	mov    %ecx,%eax
c0101038:	e6 40                	out    %al,$0x40
c010103a:	89 c8                	mov    %ecx,%eax
c010103c:	c1 e8 08             	shr    $0x8,%eax
c010103f:	e6 40                	out    %al,$0x40
c0101041:	5d                   	pop    %ebp
c0101042:	c3                   	ret    
c0101043:	66 90                	xchg   %ax,%ax
c0101045:	66 90                	xchg   %ax,%ax
c0101047:	66 90                	xchg   %ax,%ax
c0101049:	66 90                	xchg   %ax,%ax
c010104b:	66 90                	xchg   %ax,%ax
c010104d:	66 90                	xchg   %ax,%ax
c010104f:	90                   	nop

c0101050 <console_clear>:
c0101050:	55                   	push   %ebp
c0101051:	b8 00 80 0b c0       	mov    $0xc00b8000,%eax
c0101056:	89 e5                	mov    %esp,%ebp
c0101058:	56                   	push   %esi
c0101059:	53                   	push   %ebx
c010105a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101060:	ba 20 0f 00 00       	mov    $0xf20,%edx
c0101065:	83 c0 02             	add    $0x2,%eax
c0101068:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c010106c:	3d a0 8f 0b c0       	cmp    $0xc00b8fa0,%eax
c0101071:	75 ed                	jne    c0101060 <console_clear+0x10>
c0101073:	be d4 03 00 00       	mov    $0x3d4,%esi
c0101078:	c6 05 c9 80 10 c0 00 	movb   $0x0,0xc01080c9
c010107f:	b8 0e 00 00 00       	mov    $0xe,%eax
c0101084:	c6 05 c8 80 10 c0 00 	movb   $0x0,0xc01080c8
c010108b:	89 f2                	mov    %esi,%edx
c010108d:	ee                   	out    %al,(%dx)
c010108e:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
c0101093:	31 db                	xor    %ebx,%ebx
c0101095:	89 ca                	mov    %ecx,%edx
c0101097:	89 d8                	mov    %ebx,%eax
c0101099:	ee                   	out    %al,(%dx)
c010109a:	b8 0f 00 00 00       	mov    $0xf,%eax
c010109f:	89 f2                	mov    %esi,%edx
c01010a1:	ee                   	out    %al,(%dx)
c01010a2:	89 ca                	mov    %ecx,%edx
c01010a4:	89 d8                	mov    %ebx,%eax
c01010a6:	ee                   	out    %al,(%dx)
c01010a7:	5b                   	pop    %ebx
c01010a8:	5e                   	pop    %esi
c01010a9:	5d                   	pop    %ebp
c01010aa:	c3                   	ret    
c01010ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01010af:	90                   	nop

c01010b0 <console_putc_color>:
c01010b0:	55                   	push   %ebp
c01010b1:	0f b6 15 c8 80 10 c0 	movzbl 0xc01080c8,%edx
c01010b8:	89 e5                	mov    %esp,%ebp
c01010ba:	57                   	push   %edi
c01010bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01010be:	56                   	push   %esi
c01010bf:	53                   	push   %ebx
c01010c0:	3c 08                	cmp    $0x8,%al
c01010c2:	0f 84 18 01 00 00    	je     c01011e0 <console_putc_color+0x130>
c01010c8:	3c 09                	cmp    $0x9,%al
c01010ca:	74 54                	je     c0101120 <console_putc_color+0x70>
c01010cc:	3c 0d                	cmp    $0xd,%al
c01010ce:	0f 84 3c 01 00 00    	je     c0101210 <console_putc_color+0x160>
c01010d4:	3c 0a                	cmp    $0xa,%al
c01010d6:	74 64                	je     c010113c <console_putc_color+0x8c>
c01010d8:	0f b6 0d c9 80 10 c0 	movzbl 0xc01080c9,%ecx
c01010df:	3c 1f                	cmp    $0x1f,%al
c01010e1:	7e 50                	jle    c0101133 <console_putc_color+0x83>
c01010e3:	0f b6 f2             	movzbl %dl,%esi
c01010e6:	0f b6 f9             	movzbl %cl,%edi
c01010e9:	66 98                	cbtw   
c01010eb:	83 c1 01             	add    $0x1,%ecx
c01010ee:	8d 1c b6             	lea    (%esi,%esi,4),%ebx
c01010f1:	0f b6 75 10          	movzbl 0x10(%ebp),%esi
c01010f5:	88 0d c9 80 10 c0    	mov    %cl,0xc01080c9
c01010fb:	c1 e3 04             	shl    $0x4,%ebx
c01010fe:	01 fb                	add    %edi,%ebx
c0101100:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0101103:	83 e6 0f             	and    $0xf,%esi
c0101106:	c1 e7 04             	shl    $0x4,%edi
c0101109:	09 fe                	or     %edi,%esi
c010110b:	c1 e6 08             	shl    $0x8,%esi
c010110e:	09 f0                	or     %esi,%eax
c0101110:	66 89 84 1b 00 80 0b 	mov    %ax,-0x3ff48000(%ebx,%ebx,1)
c0101117:	c0 
c0101118:	eb 19                	jmp    c0101133 <console_putc_color+0x83>
c010111a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101120:	0f b6 05 c9 80 10 c0 	movzbl 0xc01080c9,%eax
c0101127:	8d 48 08             	lea    0x8(%eax),%ecx
c010112a:	83 e1 f8             	and    $0xfffffff8,%ecx
c010112d:	88 0d c9 80 10 c0    	mov    %cl,0xc01080c9
c0101133:	80 f9 4f             	cmp    $0x4f,%cl
c0101136:	0f 86 c4 00 00 00    	jbe    c0101200 <console_putc_color+0x150>
c010113c:	83 c2 01             	add    $0x1,%edx
c010113f:	c6 05 c9 80 10 c0 00 	movb   $0x0,0xc01080c9
c0101146:	88 15 c8 80 10 c0    	mov    %dl,0xc01080c8
c010114c:	31 db                	xor    %ebx,%ebx
c010114e:	80 fa 18             	cmp    $0x18,%dl
c0101151:	77 3d                	ja     c0101190 <console_putc_color+0xe0>
c0101153:	0f b6 ca             	movzbl %dl,%ecx
c0101156:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
c0101159:	c1 e1 04             	shl    $0x4,%ecx
c010115c:	be d4 03 00 00       	mov    $0x3d4,%esi
c0101161:	01 d9                	add    %ebx,%ecx
c0101163:	b8 0e 00 00 00       	mov    $0xe,%eax
c0101168:	89 f2                	mov    %esi,%edx
c010116a:	ee                   	out    %al,(%dx)
c010116b:	bb d5 03 00 00       	mov    $0x3d5,%ebx
c0101170:	89 c8                	mov    %ecx,%eax
c0101172:	66 c1 e8 08          	shr    $0x8,%ax
c0101176:	89 da                	mov    %ebx,%edx
c0101178:	ee                   	out    %al,(%dx)
c0101179:	b8 0f 00 00 00       	mov    $0xf,%eax
c010117e:	89 f2                	mov    %esi,%edx
c0101180:	ee                   	out    %al,(%dx)
c0101181:	89 da                	mov    %ebx,%edx
c0101183:	89 c8                	mov    %ecx,%eax
c0101185:	ee                   	out    %al,(%dx)
c0101186:	5b                   	pop    %ebx
c0101187:	5e                   	pop    %esi
c0101188:	5f                   	pop    %edi
c0101189:	5d                   	pop    %ebp
c010118a:	c3                   	ret    
c010118b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c010118f:	90                   	nop
c0101190:	b8 a0 80 0b c0       	mov    $0xc00b80a0,%eax
c0101195:	8d 76 00             	lea    0x0(%esi),%esi
c0101198:	0f b7 10             	movzwl (%eax),%edx
c010119b:	83 c0 02             	add    $0x2,%eax
c010119e:	66 89 90 5e ff ff ff 	mov    %dx,-0xa2(%eax)
c01011a5:	3d a0 8f 0b c0       	cmp    $0xc00b8fa0,%eax
c01011aa:	75 ec                	jne    c0101198 <console_putc_color+0xe8>
c01011ac:	b8 00 8f 0b c0       	mov    $0xc00b8f00,%eax
c01011b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01011b8:	ba 20 0f 00 00       	mov    $0xf20,%edx
c01011bd:	83 c0 02             	add    $0x2,%eax
c01011c0:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c01011c4:	3d a0 8f 0b c0       	cmp    $0xc00b8fa0,%eax
c01011c9:	75 ed                	jne    c01011b8 <console_putc_color+0x108>
c01011cb:	c6 05 c8 80 10 c0 18 	movb   $0x18,0xc01080c8
c01011d2:	b9 80 07 00 00       	mov    $0x780,%ecx
c01011d7:	eb 83                	jmp    c010115c <console_putc_color+0xac>
c01011d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01011e0:	0f b6 0d c9 80 10 c0 	movzbl 0xc01080c9,%ecx
c01011e7:	84 c9                	test   %cl,%cl
c01011e9:	74 15                	je     c0101200 <console_putc_color+0x150>
c01011eb:	83 e9 01             	sub    $0x1,%ecx
c01011ee:	88 0d c9 80 10 c0    	mov    %cl,0xc01080c9
c01011f4:	e9 3a ff ff ff       	jmp    c0101133 <console_putc_color+0x83>
c01011f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101200:	0f b6 d9             	movzbl %cl,%ebx
c0101203:	e9 46 ff ff ff       	jmp    c010114e <console_putc_color+0x9e>
c0101208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c010120f:	90                   	nop
c0101210:	c6 05 c9 80 10 c0 00 	movb   $0x0,0xc01080c9
c0101217:	e9 30 ff ff ff       	jmp    c010114c <console_putc_color+0x9c>
c010121c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0101220 <console_write>:
c0101220:	55                   	push   %ebp
c0101221:	89 e5                	mov    %esp,%ebp
c0101223:	53                   	push   %ebx
c0101224:	83 ec 04             	sub    $0x4,%esp
c0101227:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010122a:	0f be 03             	movsbl (%ebx),%eax
c010122d:	84 c0                	test   %al,%al
c010122f:	74 21                	je     c0101252 <console_write+0x32>
c0101231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101238:	83 ec 04             	sub    $0x4,%esp
c010123b:	83 c3 01             	add    $0x1,%ebx
c010123e:	6a 0f                	push   $0xf
c0101240:	6a 00                	push   $0x0
c0101242:	50                   	push   %eax
c0101243:	e8 68 fe ff ff       	call   c01010b0 <console_putc_color>
c0101248:	0f be 03             	movsbl (%ebx),%eax
c010124b:	83 c4 10             	add    $0x10,%esp
c010124e:	84 c0                	test   %al,%al
c0101250:	75 e6                	jne    c0101238 <console_write+0x18>
c0101252:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101255:	c9                   	leave  
c0101256:	c3                   	ret    
c0101257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c010125e:	66 90                	xchg   %ax,%ax

c0101260 <console_write_color>:
c0101260:	55                   	push   %ebp
c0101261:	89 e5                	mov    %esp,%ebp
c0101263:	57                   	push   %edi
c0101264:	56                   	push   %esi
c0101265:	53                   	push   %ebx
c0101266:	83 ec 0c             	sub    $0xc,%esp
c0101269:	8b 7d 08             	mov    0x8(%ebp),%edi
c010126c:	8b 75 0c             	mov    0xc(%ebp),%esi
c010126f:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0101272:	0f be 07             	movsbl (%edi),%eax
c0101275:	84 c0                	test   %al,%al
c0101277:	74 1f                	je     c0101298 <console_write_color+0x38>
c0101279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101280:	83 ec 04             	sub    $0x4,%esp
c0101283:	83 c7 01             	add    $0x1,%edi
c0101286:	53                   	push   %ebx
c0101287:	56                   	push   %esi
c0101288:	50                   	push   %eax
c0101289:	e8 22 fe ff ff       	call   c01010b0 <console_putc_color>
c010128e:	0f be 07             	movsbl (%edi),%eax
c0101291:	83 c4 10             	add    $0x10,%esp
c0101294:	84 c0                	test   %al,%al
c0101296:	75 e8                	jne    c0101280 <console_write_color+0x20>
c0101298:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010129b:	5b                   	pop    %ebx
c010129c:	5e                   	pop    %esi
c010129d:	5f                   	pop    %edi
c010129e:	5d                   	pop    %ebp
c010129f:	c3                   	ret    

c01012a0 <console_write_hex>:
c01012a0:	55                   	push   %ebp
c01012a1:	b8 30 00 00 00       	mov    $0x30,%eax
c01012a6:	89 e5                	mov    %esp,%ebp
c01012a8:	57                   	push   %edi
c01012a9:	bf 9e 30 10 c0       	mov    $0xc010309e,%edi
c01012ae:	56                   	push   %esi
c01012af:	53                   	push   %ebx
c01012b0:	bb 78 00 00 00       	mov    $0x78,%ebx
c01012b5:	83 ec 0c             	sub    $0xc,%esp
c01012b8:	8b 75 10             	mov    0x10(%ebp),%esi
c01012bb:	eb 0a                	jmp    c01012c7 <console_write_hex+0x27>
c01012bd:	8d 76 00             	lea    0x0(%esi),%esi
c01012c0:	0f be c3             	movsbl %bl,%eax
c01012c3:	0f b6 5f 01          	movzbl 0x1(%edi),%ebx
c01012c7:	83 ec 04             	sub    $0x4,%esp
c01012ca:	83 c7 01             	add    $0x1,%edi
c01012cd:	56                   	push   %esi
c01012ce:	ff 75 0c             	pushl  0xc(%ebp)
c01012d1:	50                   	push   %eax
c01012d2:	e8 d9 fd ff ff       	call   c01010b0 <console_putc_color>
c01012d7:	83 c4 10             	add    $0x10,%esp
c01012da:	84 db                	test   %bl,%bl
c01012dc:	75 e2                	jne    c01012c0 <console_write_hex+0x20>
c01012de:	bf 1c 00 00 00       	mov    $0x1c,%edi
c01012e3:	ba 01 00 00 00       	mov    $0x1,%edx
c01012e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01012eb:	eb 23                	jmp    c0101310 <console_write_hex+0x70>
c01012ed:	8d 76 00             	lea    0x0(%esi),%esi
c01012f0:	83 c0 57             	add    $0x57,%eax
c01012f3:	83 ec 04             	sub    $0x4,%esp
c01012f6:	0f b6 c0             	movzbl %al,%eax
c01012f9:	56                   	push   %esi
c01012fa:	ff 75 0c             	pushl  0xc(%ebp)
c01012fd:	50                   	push   %eax
c01012fe:	e8 ad fd ff ff       	call   c01010b0 <console_putc_color>
c0101303:	83 c4 10             	add    $0x10,%esp
c0101306:	31 d2                	xor    %edx,%edx
c0101308:	83 ef 04             	sub    $0x4,%edi
c010130b:	83 ff fc             	cmp    $0xfffffffc,%edi
c010130e:	74 3b                	je     c010134b <console_write_hex+0xab>
c0101310:	89 d8                	mov    %ebx,%eax
c0101312:	89 f9                	mov    %edi,%ecx
c0101314:	d3 e8                	shr    %cl,%eax
c0101316:	83 e0 0f             	and    $0xf,%eax
c0101319:	75 0e                	jne    c0101329 <console_write_hex+0x89>
c010131b:	83 e2 01             	and    $0x1,%edx
c010131e:	89 d1                	mov    %edx,%ecx
c0101320:	ba 01 00 00 00       	mov    $0x1,%edx
c0101325:	84 c9                	test   %cl,%cl
c0101327:	75 df                	jne    c0101308 <console_write_hex+0x68>
c0101329:	83 f8 09             	cmp    $0x9,%eax
c010132c:	77 c2                	ja     c01012f0 <console_write_hex+0x50>
c010132e:	83 ec 04             	sub    $0x4,%esp
c0101331:	83 c0 30             	add    $0x30,%eax
c0101334:	83 ef 04             	sub    $0x4,%edi
c0101337:	56                   	push   %esi
c0101338:	ff 75 0c             	pushl  0xc(%ebp)
c010133b:	50                   	push   %eax
c010133c:	e8 6f fd ff ff       	call   c01010b0 <console_putc_color>
c0101341:	83 c4 10             	add    $0x10,%esp
c0101344:	31 d2                	xor    %edx,%edx
c0101346:	83 ff fc             	cmp    $0xfffffffc,%edi
c0101349:	75 c5                	jne    c0101310 <console_write_hex+0x70>
c010134b:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010134e:	5b                   	pop    %ebx
c010134f:	5e                   	pop    %esi
c0101350:	5f                   	pop    %edi
c0101351:	5d                   	pop    %ebp
c0101352:	c3                   	ret    
c0101353:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c010135a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101360 <console_write_dec>:
c0101360:	55                   	push   %ebp
c0101361:	89 e5                	mov    %esp,%ebp
c0101363:	57                   	push   %edi
c0101364:	56                   	push   %esi
c0101365:	53                   	push   %ebx
c0101366:	83 ec 5c             	sub    $0x5c,%esp
c0101369:	8b 7d 08             	mov    0x8(%ebp),%edi
c010136c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010136f:	8b 75 10             	mov    0x10(%ebp),%esi
c0101372:	85 ff                	test   %edi,%edi
c0101374:	0f 84 96 00 00 00    	je     c0101410 <console_write_dec+0xb0>
c010137a:	31 c9                	xor    %ecx,%ecx
c010137c:	89 5d a4             	mov    %ebx,-0x5c(%ebp)
c010137f:	89 75 a0             	mov    %esi,-0x60(%ebp)
c0101382:	eb 06                	jmp    c010138a <console_write_dec+0x2a>
c0101384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101388:	89 d7                	mov    %edx,%edi
c010138a:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
c010138f:	89 fe                	mov    %edi,%esi
c0101391:	89 cb                	mov    %ecx,%ebx
c0101393:	f7 e7                	mul    %edi
c0101395:	c1 ea 03             	shr    $0x3,%edx
c0101398:	8d 04 92             	lea    (%edx,%edx,4),%eax
c010139b:	01 c0                	add    %eax,%eax
c010139d:	29 c6                	sub    %eax,%esi
c010139f:	89 f0                	mov    %esi,%eax
c01013a1:	83 c0 30             	add    $0x30,%eax
c01013a4:	88 44 0d a8          	mov    %al,-0x58(%ebp,%ecx,1)
c01013a8:	83 c1 01             	add    $0x1,%ecx
c01013ab:	83 ff 09             	cmp    $0x9,%edi
c01013ae:	77 d8                	ja     c0101388 <console_write_dec+0x28>
c01013b0:	89 da                	mov    %ebx,%edx
c01013b2:	c6 44 0d a8 00       	movb   $0x0,-0x58(%ebp,%ecx,1)
c01013b7:	8b 5d a4             	mov    -0x5c(%ebp),%ebx
c01013ba:	8d 45 a8             	lea    -0x58(%ebp),%eax
c01013bd:	c6 44 0d c8 00       	movb   $0x0,-0x38(%ebp,%ecx,1)
c01013c2:	8d 4d c8             	lea    -0x38(%ebp),%ecx
c01013c5:	8b 75 a0             	mov    -0x60(%ebp),%esi
c01013c8:	01 ca                	add    %ecx,%edx
c01013ca:	89 d7                	mov    %edx,%edi
c01013cc:	eb 04                	jmp    c01013d2 <console_write_dec+0x72>
c01013ce:	66 90                	xchg   %ax,%ax
c01013d0:	89 d7                	mov    %edx,%edi
c01013d2:	0f b6 10             	movzbl (%eax),%edx
c01013d5:	83 c0 01             	add    $0x1,%eax
c01013d8:	88 17                	mov    %dl,(%edi)
c01013da:	8d 57 ff             	lea    -0x1(%edi),%edx
c01013dd:	39 cf                	cmp    %ecx,%edi
c01013df:	75 ef                	jne    c01013d0 <console_write_dec+0x70>
c01013e1:	0f be 45 c8          	movsbl -0x38(%ebp),%eax
c01013e5:	84 c0                	test   %al,%al
c01013e7:	74 1f                	je     c0101408 <console_write_dec+0xa8>
c01013e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01013f0:	83 ec 04             	sub    $0x4,%esp
c01013f3:	83 c7 01             	add    $0x1,%edi
c01013f6:	56                   	push   %esi
c01013f7:	53                   	push   %ebx
c01013f8:	50                   	push   %eax
c01013f9:	e8 b2 fc ff ff       	call   c01010b0 <console_putc_color>
c01013fe:	0f be 07             	movsbl (%edi),%eax
c0101401:	83 c4 10             	add    $0x10,%esp
c0101404:	84 c0                	test   %al,%al
c0101406:	75 e8                	jne    c01013f0 <console_write_dec+0x90>
c0101408:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010140b:	5b                   	pop    %ebx
c010140c:	5e                   	pop    %esi
c010140d:	5f                   	pop    %edi
c010140e:	5d                   	pop    %ebp
c010140f:	c3                   	ret    
c0101410:	c7 45 08 30 00 00 00 	movl   $0x30,0x8(%ebp)
c0101417:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010141a:	5b                   	pop    %ebx
c010141b:	5e                   	pop    %esi
c010141c:	5f                   	pop    %edi
c010141d:	5d                   	pop    %ebp
c010141e:	e9 8d fc ff ff       	jmp    c01010b0 <console_putc_color>
c0101423:	66 90                	xchg   %ax,%ax
c0101425:	66 90                	xchg   %ax,%ax
c0101427:	66 90                	xchg   %ax,%ax
c0101429:	66 90                	xchg   %ax,%ax
c010142b:	66 90                	xchg   %ax,%ax
c010142d:	66 90                	xchg   %ax,%ax
c010142f:	90                   	nop

c0101430 <initlock>:
c0101430:	55                   	push   %ebp
c0101431:	89 e5                	mov    %esp,%ebp
c0101433:	8b 45 08             	mov    0x8(%ebp),%eax
c0101436:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101439:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010143f:	89 50 04             	mov    %edx,0x4(%eax)
c0101442:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0101449:	5d                   	pop    %ebp
c010144a:	c3                   	ret    
c010144b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c010144f:	90                   	nop

c0101450 <pcli>:
c0101450:	55                   	push   %ebp
c0101451:	89 e5                	mov    %esp,%ebp
c0101453:	53                   	push   %ebx
c0101454:	83 ec 04             	sub    $0x4,%esp
c0101457:	9c                   	pushf  
c0101458:	5b                   	pop    %ebx
c0101459:	fa                   	cli    
c010145a:	e8 b1 f6 ff ff       	call   c0100b10 <getcpu>
c010145f:	8b 80 9c 00 00 00    	mov    0x9c(%eax),%eax
c0101465:	85 c0                	test   %eax,%eax
c0101467:	74 17                	je     c0101480 <pcli+0x30>
c0101469:	e8 a2 f6 ff ff       	call   c0100b10 <getcpu>
c010146e:	83 80 9c 00 00 00 01 	addl   $0x1,0x9c(%eax)
c0101475:	83 c4 04             	add    $0x4,%esp
c0101478:	5b                   	pop    %ebx
c0101479:	5d                   	pop    %ebp
c010147a:	c3                   	ret    
c010147b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c010147f:	90                   	nop
c0101480:	e8 8b f6 ff ff       	call   c0100b10 <getcpu>
c0101485:	81 e3 00 02 00 00    	and    $0x200,%ebx
c010148b:	89 98 a0 00 00 00    	mov    %ebx,0xa0(%eax)
c0101491:	eb d6                	jmp    c0101469 <pcli+0x19>
c0101493:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c010149a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01014a0 <vcli>:
c01014a0:	55                   	push   %ebp
c01014a1:	89 e5                	mov    %esp,%ebp
c01014a3:	83 ec 08             	sub    $0x8,%esp
c01014a6:	9c                   	pushf  
c01014a7:	58                   	pop    %eax
c01014a8:	f6 c4 02             	test   $0x2,%ah
c01014ab:	75 3b                	jne    c01014e8 <vcli+0x48>
c01014ad:	e8 5e f6 ff ff       	call   c0100b10 <getcpu>
c01014b2:	83 a8 9c 00 00 00 01 	subl   $0x1,0x9c(%eax)
c01014b9:	78 4b                	js     c0101506 <vcli+0x66>
c01014bb:	e8 50 f6 ff ff       	call   c0100b10 <getcpu>
c01014c0:	8b 90 9c 00 00 00    	mov    0x9c(%eax),%edx
c01014c6:	85 d2                	test   %edx,%edx
c01014c8:	74 06                	je     c01014d0 <vcli+0x30>
c01014ca:	c9                   	leave  
c01014cb:	c3                   	ret    
c01014cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01014d0:	e8 3b f6 ff ff       	call   c0100b10 <getcpu>
c01014d5:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
c01014db:	85 c0                	test   %eax,%eax
c01014dd:	74 eb                	je     c01014ca <vcli+0x2a>
c01014df:	fb                   	sti    
c01014e0:	c9                   	leave  
c01014e1:	c3                   	ret    
c01014e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01014e8:	83 ec 0c             	sub    $0xc,%esp
c01014eb:	68 a1 30 10 c0       	push   $0xc01030a1
c01014f0:	e8 bb 08 00 00       	call   c0101db0 <printk>
c01014f5:	83 c4 10             	add    $0x10,%esp
c01014f8:	e8 13 f6 ff ff       	call   c0100b10 <getcpu>
c01014fd:	83 a8 9c 00 00 00 01 	subl   $0x1,0x9c(%eax)
c0101504:	79 b5                	jns    c01014bb <vcli+0x1b>
c0101506:	83 ec 0c             	sub    $0xc,%esp
c0101509:	68 b6 30 10 c0       	push   $0xc01030b6
c010150e:	e8 9d 08 00 00       	call   c0101db0 <printk>
c0101513:	83 c4 10             	add    $0x10,%esp
c0101516:	eb a3                	jmp    c01014bb <vcli+0x1b>
c0101518:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c010151f:	90                   	nop

c0101520 <alrdyhold>:
c0101520:	55                   	push   %ebp
c0101521:	89 e5                	mov    %esp,%ebp
c0101523:	56                   	push   %esi
c0101524:	53                   	push   %ebx
c0101525:	8b 75 08             	mov    0x8(%ebp),%esi
c0101528:	31 db                	xor    %ebx,%ebx
c010152a:	e8 21 ff ff ff       	call   c0101450 <pcli>
c010152f:	8b 06                	mov    (%esi),%eax
c0101531:	85 c0                	test   %eax,%eax
c0101533:	75 0b                	jne    c0101540 <alrdyhold+0x20>
c0101535:	e8 66 ff ff ff       	call   c01014a0 <vcli>
c010153a:	89 d8                	mov    %ebx,%eax
c010153c:	5b                   	pop    %ebx
c010153d:	5e                   	pop    %esi
c010153e:	5d                   	pop    %ebp
c010153f:	c3                   	ret    
c0101540:	8b 5e 08             	mov    0x8(%esi),%ebx
c0101543:	e8 c8 f5 ff ff       	call   c0100b10 <getcpu>
c0101548:	39 c3                	cmp    %eax,%ebx
c010154a:	0f 94 c3             	sete   %bl
c010154d:	e8 4e ff ff ff       	call   c01014a0 <vcli>
c0101552:	0f b6 db             	movzbl %bl,%ebx
c0101555:	89 d8                	mov    %ebx,%eax
c0101557:	5b                   	pop    %ebx
c0101558:	5e                   	pop    %esi
c0101559:	5d                   	pop    %ebp
c010155a:	c3                   	ret    
c010155b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c010155f:	90                   	nop

c0101560 <acquire>:
c0101560:	55                   	push   %ebp
c0101561:	89 e5                	mov    %esp,%ebp
c0101563:	53                   	push   %ebx
c0101564:	83 ec 04             	sub    $0x4,%esp
c0101567:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010156a:	e8 e1 fe ff ff       	call   c0101450 <pcli>
c010156f:	83 ec 0c             	sub    $0xc,%esp
c0101572:	53                   	push   %ebx
c0101573:	e8 a8 ff ff ff       	call   c0101520 <alrdyhold>
c0101578:	83 c4 10             	add    $0x10,%esp
c010157b:	85 c0                	test   %eax,%eax
c010157d:	75 29                	jne    c01015a8 <acquire+0x48>
c010157f:	ba 01 00 00 00       	mov    $0x1,%edx
c0101584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101588:	89 d0                	mov    %edx,%eax
c010158a:	f0 87 03             	lock xchg %eax,(%ebx)
c010158d:	85 c0                	test   %eax,%eax
c010158f:	75 f7                	jne    c0101588 <acquire+0x28>
c0101591:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
c0101596:	e8 75 f5 ff ff       	call   c0100b10 <getcpu>
c010159b:	89 43 08             	mov    %eax,0x8(%ebx)
c010159e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01015a1:	c9                   	leave  
c01015a2:	c3                   	ret    
c01015a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01015a7:	90                   	nop
c01015a8:	83 ec 0c             	sub    $0xc,%esp
c01015ab:	68 bb 30 10 c0       	push   $0xc01030bb
c01015b0:	e8 fb 07 00 00       	call   c0101db0 <printk>
c01015b5:	83 c4 10             	add    $0x10,%esp
c01015b8:	eb c5                	jmp    c010157f <acquire+0x1f>
c01015ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01015c0 <release>:
c01015c0:	55                   	push   %ebp
c01015c1:	89 e5                	mov    %esp,%ebp
c01015c3:	53                   	push   %ebx
c01015c4:	83 ec 10             	sub    $0x10,%esp
c01015c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01015ca:	53                   	push   %ebx
c01015cb:	e8 50 ff ff ff       	call   c0101520 <alrdyhold>
c01015d0:	83 c4 10             	add    $0x10,%esp
c01015d3:	85 c0                	test   %eax,%eax
c01015d5:	74 21                	je     c01015f8 <release+0x38>
c01015d7:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
c01015de:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
c01015e3:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c01015e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01015ec:	c9                   	leave  
c01015ed:	e9 ae fe ff ff       	jmp    c01014a0 <vcli>
c01015f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01015f8:	83 ec 0c             	sub    $0xc,%esp
c01015fb:	68 cc 30 10 c0       	push   $0xc01030cc
c0101600:	e8 ab 07 00 00       	call   c0101db0 <printk>
c0101605:	83 c4 10             	add    $0x10,%esp
c0101608:	eb cd                	jmp    c01015d7 <release+0x17>
c010160a:	66 90                	xchg   %ax,%ax
c010160c:	66 90                	xchg   %ax,%ax
c010160e:	66 90                	xchg   %ax,%ax

c0101610 <number>:
c0101610:	55                   	push   %ebp
c0101611:	89 e5                	mov    %esp,%ebp
c0101613:	57                   	push   %edi
c0101614:	56                   	push   %esi
c0101615:	be 8c 31 10 c0       	mov    $0xc010318c,%esi
c010161a:	53                   	push   %ebx
c010161b:	89 c3                	mov    %eax,%ebx
c010161d:	89 d0                	mov    %edx,%eax
c010161f:	83 ec 54             	sub    $0x54,%esp
c0101622:	8b 55 10             	mov    0x10(%ebp),%edx
c0101625:	89 4d c0             	mov    %ecx,-0x40(%ebp)
c0101628:	b9 b4 31 10 c0       	mov    $0xc01031b4,%ecx
c010162d:	f6 c2 40             	test   $0x40,%dl
c0101630:	89 d7                	mov    %edx,%edi
c0101632:	0f 45 f1             	cmovne %ecx,%esi
c0101635:	83 e7 10             	and    $0x10,%edi
c0101638:	89 7d b0             	mov    %edi,-0x50(%ebp)
c010163b:	0f 85 e7 01 00 00    	jne    c0101828 <number+0x218>
c0101641:	89 d1                	mov    %edx,%ecx
c0101643:	89 d7                	mov    %edx,%edi
c0101645:	83 e1 01             	and    $0x1,%ecx
c0101648:	83 e7 11             	and    $0x11,%edi
c010164b:	83 f9 01             	cmp    $0x1,%ecx
c010164e:	89 7d ac             	mov    %edi,-0x54(%ebp)
c0101651:	19 ff                	sbb    %edi,%edi
c0101653:	89 f9                	mov    %edi,%ecx
c0101655:	83 e1 f0             	and    $0xfffffff0,%ecx
c0101658:	83 c1 30             	add    $0x30,%ecx
c010165b:	88 4d bd             	mov    %cl,-0x43(%ebp)
c010165e:	f6 c2 02             	test   $0x2,%dl
c0101661:	74 08                	je     c010166b <number+0x5b>
c0101663:	85 c0                	test   %eax,%eax
c0101665:	0f 88 35 02 00 00    	js     c01018a0 <number+0x290>
c010166b:	f6 c2 04             	test   $0x4,%dl
c010166e:	0f 84 cc 01 00 00    	je     c0101840 <number+0x230>
c0101674:	c6 45 be 2b          	movb   $0x2b,-0x42(%ebp)
c0101678:	83 6d 08 01          	subl   $0x1,0x8(%ebp)
c010167c:	83 e2 20             	and    $0x20,%edx
c010167f:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101682:	74 16                	je     c010169a <number+0x8a>
c0101684:	83 7d c0 10          	cmpl   $0x10,-0x40(%ebp)
c0101688:	0f 84 4a 02 00 00    	je     c01018d8 <number+0x2c8>
c010168e:	31 d2                	xor    %edx,%edx
c0101690:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
c0101694:	0f 94 c2             	sete   %dl
c0101697:	29 55 08             	sub    %edx,0x8(%ebp)
c010169a:	85 c0                	test   %eax,%eax
c010169c:	0f 85 be 01 00 00    	jne    c0101860 <number+0x250>
c01016a2:	c6 45 d0 30          	movb   $0x30,-0x30(%ebp)
c01016a6:	bf 01 00 00 00       	mov    $0x1,%edi
c01016ab:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
c01016b2:	c6 45 bf 30          	movb   $0x30,-0x41(%ebp)
c01016b6:	c7 45 b4 01 00 00 00 	movl   $0x1,-0x4c(%ebp)
c01016bd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01016c0:	8b 55 08             	mov    0x8(%ebp),%edx
c01016c3:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01016c6:	0f 4c 45 0c          	cmovl  0xc(%ebp),%eax
c01016ca:	8b 4d ac             	mov    -0x54(%ebp),%ecx
c01016cd:	29 c2                	sub    %eax,%edx
c01016cf:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01016d2:	89 55 b8             	mov    %edx,-0x48(%ebp)
c01016d5:	89 d0                	mov    %edx,%eax
c01016d7:	8d 52 ff             	lea    -0x1(%edx),%edx
c01016da:	85 c9                	test   %ecx,%ecx
c01016dc:	75 2c                	jne    c010170a <number+0xfa>
c01016de:	89 c1                	mov    %eax,%ecx
c01016e0:	01 d8                	add    %ebx,%eax
c01016e2:	85 c9                	test   %ecx,%ecx
c01016e4:	0f 8e 05 02 00 00    	jle    c01018ef <number+0x2df>
c01016ea:	0f b6 4d bf          	movzbl -0x41(%ebp),%ecx
c01016ee:	66 90                	xchg   %ax,%ax
c01016f0:	83 c3 01             	add    $0x1,%ebx
c01016f3:	c6 43 ff 20          	movb   $0x20,-0x1(%ebx)
c01016f7:	39 c3                	cmp    %eax,%ebx
c01016f9:	75 f5                	jne    c01016f0 <number+0xe0>
c01016fb:	88 4d bf             	mov    %cl,-0x41(%ebp)
c01016fe:	ba fe ff ff ff       	mov    $0xfffffffe,%edx
c0101703:	c7 45 b8 ff ff ff ff 	movl   $0xffffffff,-0x48(%ebp)
c010170a:	0f b6 45 be          	movzbl -0x42(%ebp),%eax
c010170e:	84 c0                	test   %al,%al
c0101710:	74 05                	je     c0101717 <number+0x107>
c0101712:	88 03                	mov    %al,(%ebx)
c0101714:	83 c3 01             	add    $0x1,%ebx
c0101717:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010171a:	85 c0                	test   %eax,%eax
c010171c:	74 14                	je     c0101732 <number+0x122>
c010171e:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
c0101722:	0f 84 a0 01 00 00    	je     c01018c8 <number+0x2b8>
c0101728:	83 7d c0 10          	cmpl   $0x10,-0x40(%ebp)
c010172c:	0f 84 7e 01 00 00    	je     c01018b0 <number+0x2a0>
c0101732:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0101735:	85 c0                	test   %eax,%eax
c0101737:	75 55                	jne    c010178e <number+0x17e>
c0101739:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010173c:	89 de                	mov    %ebx,%esi
c010173e:	85 c0                	test   %eax,%eax
c0101740:	0f 8e b8 01 00 00    	jle    c01018fe <number+0x2ee>
c0101746:	89 7d c0             	mov    %edi,-0x40(%ebp)
c0101749:	0f b6 4d bf          	movzbl -0x41(%ebp),%ecx
c010174d:	89 d7                	mov    %edx,%edi
c010174f:	0f b6 55 bd          	movzbl -0x43(%ebp),%edx
c0101753:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101757:	90                   	nop
c0101758:	83 c6 01             	add    $0x1,%esi
c010175b:	b8 01 00 00 00       	mov    $0x1,%eax
c0101760:	88 56 ff             	mov    %dl,-0x1(%esi)
c0101763:	29 f0                	sub    %esi,%eax
c0101765:	01 f8                	add    %edi,%eax
c0101767:	01 d8                	add    %ebx,%eax
c0101769:	85 c0                	test   %eax,%eax
c010176b:	7f eb                	jg     c0101758 <number+0x148>
c010176d:	89 fa                	mov    %edi,%edx
c010176f:	b8 00 00 00 00       	mov    $0x0,%eax
c0101774:	88 4d bf             	mov    %cl,-0x41(%ebp)
c0101777:	8b 7d c0             	mov    -0x40(%ebp),%edi
c010177a:	85 d2                	test   %edx,%edx
c010177c:	0f 49 c2             	cmovns %edx,%eax
c010177f:	83 ea 01             	sub    $0x1,%edx
c0101782:	29 c2                	sub    %eax,%edx
c0101784:	8d 5c 03 01          	lea    0x1(%ebx,%eax,1),%ebx
c0101788:	89 55 b8             	mov    %edx,-0x48(%ebp)
c010178b:	83 ea 01             	sub    $0x1,%edx
c010178e:	8b 75 a0             	mov    -0x60(%ebp),%esi
c0101791:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0101794:	89 f0                	mov    %esi,%eax
c0101796:	29 c8                	sub    %ecx,%eax
c0101798:	01 d8                	add    %ebx,%eax
c010179a:	39 f1                	cmp    %esi,%ecx
c010179c:	0f 8d 46 01 00 00    	jge    c01018e8 <number+0x2d8>
c01017a2:	0f b6 4d bf          	movzbl -0x41(%ebp),%ecx
c01017a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01017ad:	8d 76 00             	lea    0x0(%esi),%esi
c01017b0:	83 c3 01             	add    $0x1,%ebx
c01017b3:	c6 43 ff 30          	movb   $0x30,-0x1(%ebx)
c01017b7:	39 d8                	cmp    %ebx,%eax
c01017b9:	75 f5                	jne    c01017b0 <number+0x1a0>
c01017bb:	88 4d bf             	mov    %cl,-0x41(%ebp)
c01017be:	8b 5d a4             	mov    -0x5c(%ebp),%ebx
c01017c1:	89 c6                	mov    %eax,%esi
c01017c3:	0f b6 4d bf          	movzbl -0x41(%ebp),%ecx
c01017c7:	eb 0f                	jmp    c01017d8 <number+0x1c8>
c01017c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01017d0:	0f b6 4c 1d cf       	movzbl -0x31(%ebp,%ebx,1),%ecx
c01017d5:	83 eb 01             	sub    $0x1,%ebx
c01017d8:	83 c6 01             	add    $0x1,%esi
c01017db:	88 4e ff             	mov    %cl,-0x1(%esi)
c01017de:	85 db                	test   %ebx,%ebx
c01017e0:	75 ee                	jne    c01017d0 <number+0x1c0>
c01017e2:	8b 4d b8             	mov    -0x48(%ebp),%ecx
c01017e5:	01 f8                	add    %edi,%eax
c01017e7:	85 c9                	test   %ecx,%ecx
c01017e9:	7e 2e                	jle    c0101819 <number+0x209>
c01017eb:	89 c3                	mov    %eax,%ebx
c01017ed:	be 01 00 00 00       	mov    $0x1,%esi
c01017f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01017f8:	83 c3 01             	add    $0x1,%ebx
c01017fb:	89 f1                	mov    %esi,%ecx
c01017fd:	c6 43 ff 20          	movb   $0x20,-0x1(%ebx)
c0101801:	29 d9                	sub    %ebx,%ecx
c0101803:	01 d1                	add    %edx,%ecx
c0101805:	01 c1                	add    %eax,%ecx
c0101807:	85 c9                	test   %ecx,%ecx
c0101809:	7f ed                	jg     c01017f8 <number+0x1e8>
c010180b:	85 d2                	test   %edx,%edx
c010180d:	b9 00 00 00 00       	mov    $0x0,%ecx
c0101812:	0f 48 d1             	cmovs  %ecx,%edx
c0101815:	8d 44 10 01          	lea    0x1(%eax,%edx,1),%eax
c0101819:	83 c4 54             	add    $0x54,%esp
c010181c:	5b                   	pop    %ebx
c010181d:	5e                   	pop    %esi
c010181e:	5f                   	pop    %edi
c010181f:	5d                   	pop    %ebp
c0101820:	c3                   	ret    
c0101821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101828:	83 e2 fe             	and    $0xfffffffe,%edx
c010182b:	89 7d ac             	mov    %edi,-0x54(%ebp)
c010182e:	c6 45 bd 20          	movb   $0x20,-0x43(%ebp)
c0101832:	f6 c2 02             	test   $0x2,%dl
c0101835:	0f 85 28 fe ff ff    	jne    c0101663 <number+0x53>
c010183b:	e9 2b fe ff ff       	jmp    c010166b <number+0x5b>
c0101840:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0101847:	83 e1 20             	and    $0x20,%ecx
c010184a:	88 4d be             	mov    %cl,-0x42(%ebp)
c010184d:	0f 84 29 fe ff ff    	je     c010167c <number+0x6c>
c0101853:	e9 20 fe ff ff       	jmp    c0101678 <number+0x68>
c0101858:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c010185f:	90                   	nop
c0101860:	31 ff                	xor    %edi,%edi
c0101862:	89 5d b8             	mov    %ebx,-0x48(%ebp)
c0101865:	89 fb                	mov    %edi,%ebx
c0101867:	eb 09                	jmp    c0101872 <number+0x262>
c0101869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101870:	89 fb                	mov    %edi,%ebx
c0101872:	8b 7d c0             	mov    -0x40(%ebp),%edi
c0101875:	31 d2                	xor    %edx,%edx
c0101877:	f7 f7                	div    %edi
c0101879:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
c010187d:	8d 7b 01             	lea    0x1(%ebx),%edi
c0101880:	88 54 3d cf          	mov    %dl,-0x31(%ebp,%edi,1)
c0101884:	85 c0                	test   %eax,%eax
c0101886:	75 e8                	jne    c0101870 <number+0x260>
c0101888:	89 5d a4             	mov    %ebx,-0x5c(%ebp)
c010188b:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c010188e:	89 7d b4             	mov    %edi,-0x4c(%ebp)
c0101891:	88 55 bf             	mov    %dl,-0x41(%ebp)
c0101894:	e9 24 fe ff ff       	jmp    c01016bd <number+0xad>
c0101899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01018a0:	f7 d8                	neg    %eax
c01018a2:	c6 45 be 2d          	movb   $0x2d,-0x42(%ebp)
c01018a6:	e9 cd fd ff ff       	jmp    c0101678 <number+0x68>
c01018ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01018af:	90                   	nop
c01018b0:	0f b6 46 21          	movzbl 0x21(%esi),%eax
c01018b4:	c6 03 30             	movb   $0x30,(%ebx)
c01018b7:	83 c3 02             	add    $0x2,%ebx
c01018ba:	88 43 ff             	mov    %al,-0x1(%ebx)
c01018bd:	e9 70 fe ff ff       	jmp    c0101732 <number+0x122>
c01018c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01018c8:	c6 03 30             	movb   $0x30,(%ebx)
c01018cb:	83 c3 01             	add    $0x1,%ebx
c01018ce:	e9 5f fe ff ff       	jmp    c0101732 <number+0x122>
c01018d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01018d7:	90                   	nop
c01018d8:	83 6d 08 02          	subl   $0x2,0x8(%ebp)
c01018dc:	e9 b9 fd ff ff       	jmp    c010169a <number+0x8a>
c01018e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01018e8:	89 d8                	mov    %ebx,%eax
c01018ea:	e9 cf fe ff ff       	jmp    c01017be <number+0x1ae>
c01018ef:	89 c8                	mov    %ecx,%eax
c01018f1:	89 55 b8             	mov    %edx,-0x48(%ebp)
c01018f4:	83 e8 02             	sub    $0x2,%eax
c01018f7:	89 c2                	mov    %eax,%edx
c01018f9:	e9 0c fe ff ff       	jmp    c010170a <number+0xfa>
c01018fe:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0101901:	83 ea 01             	sub    $0x1,%edx
c0101904:	e9 85 fe ff ff       	jmp    c010178e <number+0x17e>
c0101909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0101910 <vsprintf>:
c0101910:	55                   	push   %ebp
c0101911:	89 e5                	mov    %esp,%ebp
c0101913:	57                   	push   %edi
c0101914:	56                   	push   %esi
c0101915:	89 c6                	mov    %eax,%esi
c0101917:	53                   	push   %ebx
c0101918:	83 ec 2c             	sub    $0x2c,%esp
c010191b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010191e:	0f b6 02             	movzbl (%edx),%eax
c0101921:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0101924:	84 c0                	test   %al,%al
c0101926:	0f 84 e9 03 00 00    	je     c0101d15 <vsprintf+0x405>
c010192c:	89 d1                	mov    %edx,%ecx
c010192e:	eb 13                	jmp    c0101943 <vsprintf+0x33>
c0101930:	88 06                	mov    %al,(%esi)
c0101932:	83 c1 01             	add    $0x1,%ecx
c0101935:	0f b6 01             	movzbl (%ecx),%eax
c0101938:	83 c6 01             	add    $0x1,%esi
c010193b:	84 c0                	test   %al,%al
c010193d:	0f 84 22 01 00 00    	je     c0101a65 <vsprintf+0x155>
c0101943:	3c 25                	cmp    $0x25,%al
c0101945:	75 e9                	jne    c0101930 <vsprintf+0x20>
c0101947:	31 db                	xor    %ebx,%ebx
c0101949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101950:	83 c1 01             	add    $0x1,%ecx
c0101953:	0f be 01             	movsbl (%ecx),%eax
c0101956:	8d 50 e0             	lea    -0x20(%eax),%edx
c0101959:	80 fa 10             	cmp    $0x10,%dl
c010195c:	77 2a                	ja     c0101988 <vsprintf+0x78>
c010195e:	0f b6 d2             	movzbl %dl,%edx
c0101961:	ff 24 95 f8 23 10 c0 	jmp    *-0x3fefdc08(,%edx,4)
c0101968:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c010196f:	90                   	nop
c0101970:	83 c1 01             	add    $0x1,%ecx
c0101973:	0f be 01             	movsbl (%ecx),%eax
c0101976:	83 cb 01             	or     $0x1,%ebx
c0101979:	8d 50 e0             	lea    -0x20(%eax),%edx
c010197c:	80 fa 10             	cmp    $0x10,%dl
c010197f:	76 dd                	jbe    c010195e <vsprintf+0x4e>
c0101981:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101988:	8d 50 d0             	lea    -0x30(%eax),%edx
c010198b:	80 fa 09             	cmp    $0x9,%dl
c010198e:	0f 86 34 01 00 00    	jbe    c0101ac8 <vsprintf+0x1b8>
c0101994:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
c010199b:	3c 2a                	cmp    $0x2a,%al
c010199d:	0f 84 f9 00 00 00    	je     c0101a9c <vsprintf+0x18c>
c01019a3:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%ebp)
c01019aa:	3c 2e                	cmp    $0x2e,%al
c01019ac:	0f 84 c6 00 00 00    	je     c0101a78 <vsprintf+0x168>
c01019b2:	89 c7                	mov    %eax,%edi
c01019b4:	83 e7 df             	and    $0xffffffdf,%edi
c01019b7:	89 fa                	mov    %edi,%edx
c01019b9:	80 fa 4c             	cmp    $0x4c,%dl
c01019bc:	74 08                	je     c01019c6 <vsprintf+0xb6>
c01019be:	3c 68                	cmp    $0x68,%al
c01019c0:	0f 85 dd 03 00 00    	jne    c0101da3 <vsprintf+0x493>
c01019c6:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
c01019ca:	8d 79 01             	lea    0x1(%ecx),%edi
c01019cd:	8d 48 a8             	lea    -0x58(%eax),%ecx
c01019d0:	80 f9 20             	cmp    $0x20,%cl
c01019d3:	0f 87 c3 03 00 00    	ja     c0101d9c <vsprintf+0x48c>
c01019d9:	0f b6 c9             	movzbl %cl,%ecx
c01019dc:	ff 24 8d 3c 24 10 c0 	jmp    *-0x3fefdbc4(,%ecx,4)
c01019e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01019e7:	90                   	nop
c01019e8:	83 cb 10             	or     $0x10,%ebx
c01019eb:	e9 60 ff ff ff       	jmp    c0101950 <vsprintf+0x40>
c01019f0:	83 cb 04             	or     $0x4,%ebx
c01019f3:	e9 58 ff ff ff       	jmp    c0101950 <vsprintf+0x40>
c01019f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01019ff:	90                   	nop
c0101a00:	83 cb 20             	or     $0x20,%ebx
c0101a03:	e9 48 ff ff ff       	jmp    c0101950 <vsprintf+0x40>
c0101a08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101a0f:	90                   	nop
c0101a10:	83 cb 08             	or     $0x8,%ebx
c0101a13:	e9 38 ff ff ff       	jmp    c0101950 <vsprintf+0x40>
c0101a18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101a1f:	90                   	nop
c0101a20:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0101a24:	75 0a                	jne    c0101a30 <vsprintf+0x120>
c0101a26:	c7 45 e0 08 00 00 00 	movl   $0x8,-0x20(%ebp)
c0101a2d:	83 cb 01             	or     $0x1,%ebx
c0101a30:	83 ec 04             	sub    $0x4,%esp
c0101a33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101a36:	53                   	push   %ebx
c0101a37:	ff 75 dc             	pushl  -0x24(%ebp)
c0101a3a:	8d 48 04             	lea    0x4(%eax),%ecx
c0101a3d:	ff 75 e0             	pushl  -0x20(%ebp)
c0101a40:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0101a43:	b9 10 00 00 00       	mov    $0x10,%ecx
c0101a48:	8b 10                	mov    (%eax),%edx
c0101a4a:	89 f0                	mov    %esi,%eax
c0101a4c:	e8 bf fb ff ff       	call   c0101610 <number>
c0101a51:	8d 4f 01             	lea    0x1(%edi),%ecx
c0101a54:	83 c4 10             	add    $0x10,%esp
c0101a57:	89 c6                	mov    %eax,%esi
c0101a59:	0f b6 47 01          	movzbl 0x1(%edi),%eax
c0101a5d:	84 c0                	test   %al,%al
c0101a5f:	0f 85 de fe ff ff    	jne    c0101943 <vsprintf+0x33>
c0101a65:	c6 06 00             	movb   $0x0,(%esi)
c0101a68:	89 f0                	mov    %esi,%eax
c0101a6a:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0101a6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101a70:	5b                   	pop    %ebx
c0101a71:	5e                   	pop    %esi
c0101a72:	5f                   	pop    %edi
c0101a73:	5d                   	pop    %ebp
c0101a74:	c3                   	ret    
c0101a75:	8d 76 00             	lea    0x0(%esi),%esi
c0101a78:	0f be 41 01          	movsbl 0x1(%ecx),%eax
c0101a7c:	8d 79 01             	lea    0x1(%ecx),%edi
c0101a7f:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0101a82:	80 f9 09             	cmp    $0x9,%cl
c0101a85:	0f 86 15 02 00 00    	jbe    c0101ca0 <vsprintf+0x390>
c0101a8b:	89 f9                	mov    %edi,%ecx
c0101a8d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0101a94:	3c 2a                	cmp    $0x2a,%al
c0101a96:	0f 85 16 ff ff ff    	jne    c01019b2 <vsprintf+0xa2>
c0101a9c:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
c0101aa0:	b8 2a 00 00 00       	mov    $0x2a,%eax
c0101aa5:	8d 56 01             	lea    0x1(%esi),%edx
c0101aa8:	3c 25                	cmp    $0x25,%al
c0101aaa:	0f 84 2c 02 00 00    	je     c0101cdc <vsprintf+0x3cc>
c0101ab0:	c6 06 25             	movb   $0x25,(%esi)
c0101ab3:	0f b6 01             	movzbl (%ecx),%eax
c0101ab6:	84 c0                	test   %al,%al
c0101ab8:	0f 85 17 02 00 00    	jne    c0101cd5 <vsprintf+0x3c5>
c0101abe:	89 d6                	mov    %edx,%esi
c0101ac0:	eb a3                	jmp    c0101a65 <vsprintf+0x155>
c0101ac2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101ac8:	31 d2                	xor    %edx,%edx
c0101aca:	89 df                	mov    %ebx,%edi
c0101acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101ad0:	83 c1 01             	add    $0x1,%ecx
c0101ad3:	8d 14 92             	lea    (%edx,%edx,4),%edx
c0101ad6:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
c0101ada:	0f be 01             	movsbl (%ecx),%eax
c0101add:	8d 58 d0             	lea    -0x30(%eax),%ebx
c0101ae0:	80 fb 09             	cmp    $0x9,%bl
c0101ae3:	76 eb                	jbe    c0101ad0 <vsprintf+0x1c0>
c0101ae5:	89 fb                	mov    %edi,%ebx
c0101ae7:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0101aea:	e9 b4 fe ff ff       	jmp    c01019a3 <vsprintf+0x93>
c0101aef:	90                   	nop
c0101af0:	83 cb 02             	or     $0x2,%ebx
c0101af3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101af6:	83 ec 04             	sub    $0x4,%esp
c0101af9:	53                   	push   %ebx
c0101afa:	8d 48 04             	lea    0x4(%eax),%ecx
c0101afd:	ff 75 dc             	pushl  -0x24(%ebp)
c0101b00:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0101b03:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101b08:	ff 75 e0             	pushl  -0x20(%ebp)
c0101b0b:	e9 38 ff ff ff       	jmp    c0101a48 <vsprintf+0x138>
c0101b10:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101b13:	83 ec 0c             	sub    $0xc,%esp
c0101b16:	8d 48 04             	lea    0x4(%eax),%ecx
c0101b19:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c0101b1c:	8b 08                	mov    (%eax),%ecx
c0101b1e:	51                   	push   %ecx
c0101b1f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0101b22:	e8 79 f4 ff ff       	call   c0100fa0 <strlen>
c0101b27:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0101b2a:	83 c4 10             	add    $0x10,%esp
c0101b2d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0101b30:	83 fa ff             	cmp    $0xffffffff,%edx
c0101b33:	0f 84 d4 01 00 00    	je     c0101d0d <vsprintf+0x3fd>
c0101b39:	39 c2                	cmp    %eax,%edx
c0101b3b:	0f 8d cc 01 00 00    	jge    c0101d0d <vsprintf+0x3fd>
c0101b41:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101b44:	83 e8 01             	sub    $0x1,%eax
c0101b47:	83 e3 10             	and    $0x10,%ebx
c0101b4a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101b4d:	0f 84 d2 01 00 00    	je     c0101d25 <vsprintf+0x415>
c0101b53:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101b56:	85 c0                	test   %eax,%eax
c0101b58:	0f 8e 36 02 00 00    	jle    c0101d94 <vsprintf+0x484>
c0101b5e:	01 f0                	add    %esi,%eax
c0101b60:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0101b63:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101b66:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101b6d:	8d 76 00             	lea    0x0(%esi),%esi
c0101b70:	0f b6 19             	movzbl (%ecx),%ebx
c0101b73:	83 c6 01             	add    $0x1,%esi
c0101b76:	83 c1 01             	add    $0x1,%ecx
c0101b79:	88 5e ff             	mov    %bl,-0x1(%esi)
c0101b7c:	39 f0                	cmp    %esi,%eax
c0101b7e:	75 f0                	jne    c0101b70 <vsprintf+0x260>
c0101b80:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101b83:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0101b86:	8d 4f 01             	lea    0x1(%edi),%ecx
c0101b89:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0101b8c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0101b91:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101b94:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0101b97:	7d 30                	jge    c0101bc9 <vsprintf+0x2b9>
c0101b99:	89 7d e0             	mov    %edi,-0x20(%ebp)
c0101b9c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101b9f:	8b 7d dc             	mov    -0x24(%ebp),%edi
c0101ba2:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0101ba5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
c0101ba8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101baf:	90                   	nop
c0101bb0:	83 c6 01             	add    $0x1,%esi
c0101bb3:	89 da                	mov    %ebx,%edx
c0101bb5:	c6 46 ff 20          	movb   $0x20,-0x1(%esi)
c0101bb9:	29 f2                	sub    %esi,%edx
c0101bbb:	01 ca                	add    %ecx,%edx
c0101bbd:	01 c2                	add    %eax,%edx
c0101bbf:	39 d7                	cmp    %edx,%edi
c0101bc1:	7c ed                	jl     c0101bb0 <vsprintf+0x2a0>
c0101bc3:	8b 7d e0             	mov    -0x20(%ebp),%edi
c0101bc6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0101bc9:	0f b6 47 01          	movzbl 0x1(%edi),%eax
c0101bcd:	8b 7d d0             	mov    -0x30(%ebp),%edi
c0101bd0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0101bd3:	e9 63 fd ff ff       	jmp    c010193b <vsprintf+0x2b>
c0101bd8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101bdf:	90                   	nop
c0101be0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101be3:	83 ec 04             	sub    $0x4,%esp
c0101be6:	53                   	push   %ebx
c0101be7:	8d 48 04             	lea    0x4(%eax),%ecx
c0101bea:	ff 75 dc             	pushl  -0x24(%ebp)
c0101bed:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0101bf0:	b9 08 00 00 00       	mov    $0x8,%ecx
c0101bf5:	ff 75 e0             	pushl  -0x20(%ebp)
c0101bf8:	e9 4b fe ff ff       	jmp    c0101a48 <vsprintf+0x138>
c0101bfd:	8d 76 00             	lea    0x0(%esi),%esi
c0101c00:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c0101c03:	89 f2                	mov    %esi,%edx
c0101c05:	2b 55 d8             	sub    -0x28(%ebp),%edx
c0101c08:	8d 4f 01             	lea    0x1(%edi),%ecx
c0101c0b:	8b 03                	mov    (%ebx),%eax
c0101c0d:	89 10                	mov    %edx,(%eax)
c0101c0f:	0f b6 47 01          	movzbl 0x1(%edi),%eax
c0101c13:	8d 7b 04             	lea    0x4(%ebx),%edi
c0101c16:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0101c19:	e9 1d fd ff ff       	jmp    c010193b <vsprintf+0x2b>
c0101c1e:	66 90                	xchg   %ax,%ax
c0101c20:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0101c23:	83 ea 01             	sub    $0x1,%edx
c0101c26:	83 e3 10             	and    $0x10,%ebx
c0101c29:	0f 84 bc 00 00 00    	je     c0101ceb <vsprintf+0x3db>
c0101c2f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101c32:	8d 4f 01             	lea    0x1(%edi),%ecx
c0101c35:	8d 58 04             	lea    0x4(%eax),%ebx
c0101c38:	8b 00                	mov    (%eax),%eax
c0101c3a:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
c0101c3d:	8d 5e 01             	lea    0x1(%esi),%ebx
c0101c40:	88 06                	mov    %al,(%esi)
c0101c42:	8d 74 16 01          	lea    0x1(%esi,%edx,1),%esi
c0101c46:	89 d8                	mov    %ebx,%eax
c0101c48:	85 d2                	test   %edx,%edx
c0101c4a:	0f 8e 26 01 00 00    	jle    c0101d76 <vsprintf+0x466>
c0101c50:	83 c0 01             	add    $0x1,%eax
c0101c53:	c6 40 ff 20          	movb   $0x20,-0x1(%eax)
c0101c57:	39 f0                	cmp    %esi,%eax
c0101c59:	75 f5                	jne    c0101c50 <vsprintf+0x340>
c0101c5b:	8d 34 13             	lea    (%ebx,%edx,1),%esi
c0101c5e:	0f b6 47 01          	movzbl 0x1(%edi),%eax
c0101c62:	e9 d4 fc ff ff       	jmp    c010193b <vsprintf+0x2b>
c0101c67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101c6e:	66 90                	xchg   %ax,%ax
c0101c70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101c73:	83 ec 04             	sub    $0x4,%esp
c0101c76:	53                   	push   %ebx
c0101c77:	8d 48 04             	lea    0x4(%eax),%ecx
c0101c7a:	ff 75 dc             	pushl  -0x24(%ebp)
c0101c7d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0101c80:	b9 02 00 00 00       	mov    $0x2,%ecx
c0101c85:	ff 75 e0             	pushl  -0x20(%ebp)
c0101c88:	e9 bb fd ff ff       	jmp    c0101a48 <vsprintf+0x138>
c0101c8d:	8d 76 00             	lea    0x0(%esi),%esi
c0101c90:	83 cb 40             	or     $0x40,%ebx
c0101c93:	e9 98 fd ff ff       	jmp    c0101a30 <vsprintf+0x120>
c0101c98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101c9f:	90                   	nop
c0101ca0:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0101ca3:	8b 75 e0             	mov    -0x20(%ebp),%esi
c0101ca6:	31 c9                	xor    %ecx,%ecx
c0101ca8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101caf:	90                   	nop
c0101cb0:	8d 14 89             	lea    (%ecx,%ecx,4),%edx
c0101cb3:	83 c7 01             	add    $0x1,%edi
c0101cb6:	8d 4c 50 d0          	lea    -0x30(%eax,%edx,2),%ecx
c0101cba:	0f be 07             	movsbl (%edi),%eax
c0101cbd:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101cc0:	80 fa 09             	cmp    $0x9,%dl
c0101cc3:	76 eb                	jbe    c0101cb0 <vsprintf+0x3a0>
c0101cc5:	89 75 e0             	mov    %esi,-0x20(%ebp)
c0101cc8:	8b 75 dc             	mov    -0x24(%ebp),%esi
c0101ccb:	89 4d dc             	mov    %ecx,-0x24(%ebp)
c0101cce:	89 f9                	mov    %edi,%ecx
c0101cd0:	e9 dd fc ff ff       	jmp    c01019b2 <vsprintf+0xa2>
c0101cd5:	8d 5e 02             	lea    0x2(%esi),%ebx
c0101cd8:	89 d6                	mov    %edx,%esi
c0101cda:	89 da                	mov    %ebx,%edx
c0101cdc:	88 06                	mov    %al,(%esi)
c0101cde:	83 c1 01             	add    $0x1,%ecx
c0101ce1:	0f b6 01             	movzbl (%ecx),%eax
c0101ce4:	89 d6                	mov    %edx,%esi
c0101ce6:	e9 50 fc ff ff       	jmp    c010193b <vsprintf+0x2b>
c0101ceb:	8d 04 16             	lea    (%esi,%edx,1),%eax
c0101cee:	85 d2                	test   %edx,%edx
c0101cf0:	7e 71                	jle    c0101d63 <vsprintf+0x453>
c0101cf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101cf8:	83 c6 01             	add    $0x1,%esi
c0101cfb:	c6 46 ff 20          	movb   $0x20,-0x1(%esi)
c0101cff:	39 c6                	cmp    %eax,%esi
c0101d01:	75 f5                	jne    c0101cf8 <vsprintf+0x3e8>
c0101d03:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0101d08:	e9 22 ff ff ff       	jmp    c0101c2f <vsprintf+0x31f>
c0101d0d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101d10:	e9 2c fe ff ff       	jmp    c0101b41 <vsprintf+0x231>
c0101d15:	8b 75 d8             	mov    -0x28(%ebp),%esi
c0101d18:	31 c0                	xor    %eax,%eax
c0101d1a:	c6 06 00             	movb   $0x0,(%esi)
c0101d1d:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101d20:	5b                   	pop    %ebx
c0101d21:	5e                   	pop    %esi
c0101d22:	5f                   	pop    %edi
c0101d23:	5d                   	pop    %ebp
c0101d24:	c3                   	ret    
c0101d25:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0101d28:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c0101d2b:	89 d0                	mov    %edx,%eax
c0101d2d:	29 d8                	sub    %ebx,%eax
c0101d2f:	01 f0                	add    %esi,%eax
c0101d31:	39 d3                	cmp    %edx,%ebx
c0101d33:	7d 4c                	jge    c0101d81 <vsprintf+0x471>
c0101d35:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0101d38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101d3f:	90                   	nop
c0101d40:	83 c6 01             	add    $0x1,%esi
c0101d43:	c6 46 ff 20          	movb   $0x20,-0x1(%esi)
c0101d47:	39 f0                	cmp    %esi,%eax
c0101d49:	75 f5                	jne    c0101d40 <vsprintf+0x430>
c0101d4b:	89 d0                	mov    %edx,%eax
c0101d4d:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0101d50:	29 c2                	sub    %eax,%edx
c0101d52:	03 55 d4             	add    -0x2c(%ebp),%edx
c0101d55:	8d 42 ff             	lea    -0x1(%edx),%eax
c0101d58:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0101d5b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101d5e:	e9 f0 fd ff ff       	jmp    c0101b53 <vsprintf+0x243>
c0101d63:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d66:	8d 4f 01             	lea    0x1(%edi),%ecx
c0101d69:	8d 58 04             	lea    0x4(%eax),%ebx
c0101d6c:	8b 00                	mov    (%eax),%eax
c0101d6e:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
c0101d71:	8d 5e 01             	lea    0x1(%esi),%ebx
c0101d74:	88 06                	mov    %al,(%esi)
c0101d76:	0f b6 47 01          	movzbl 0x1(%edi),%eax
c0101d7a:	89 de                	mov    %ebx,%esi
c0101d7c:	e9 ba fb ff ff       	jmp    c010193b <vsprintf+0x2b>
c0101d81:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
c0101d84:	89 d0                	mov    %edx,%eax
c0101d86:	83 e8 02             	sub    $0x2,%eax
c0101d89:	89 5d e0             	mov    %ebx,-0x20(%ebp)
c0101d8c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101d8f:	e9 bf fd ff ff       	jmp    c0101b53 <vsprintf+0x243>
c0101d94:	89 75 e4             	mov    %esi,-0x1c(%ebp)
c0101d97:	e9 ea fd ff ff       	jmp    c0101b86 <vsprintf+0x276>
c0101d9c:	89 f9                	mov    %edi,%ecx
c0101d9e:	e9 02 fd ff ff       	jmp    c0101aa5 <vsprintf+0x195>
c0101da3:	89 cf                	mov    %ecx,%edi
c0101da5:	e9 23 fc ff ff       	jmp    c01019cd <vsprintf+0xbd>
c0101daa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101db0 <printk>:
c0101db0:	55                   	push   %ebp
c0101db1:	b8 e0 84 10 c0       	mov    $0xc01084e0,%eax
c0101db6:	89 e5                	mov    %esp,%ebp
c0101db8:	83 ec 08             	sub    $0x8,%esp
c0101dbb:	8b 55 08             	mov    0x8(%ebp),%edx
c0101dbe:	8d 4d 0c             	lea    0xc(%ebp),%ecx
c0101dc1:	e8 4a fb ff ff       	call   c0101910 <vsprintf>
c0101dc6:	83 ec 0c             	sub    $0xc,%esp
c0101dc9:	68 e0 84 10 c0       	push   $0xc01084e0
c0101dce:	c6 80 e0 84 10 c0 00 	movb   $0x0,-0x3fef7b20(%eax)
c0101dd5:	e8 46 f4 ff ff       	call   c0101220 <console_write>
c0101dda:	83 c4 10             	add    $0x10,%esp
c0101ddd:	c9                   	leave  
c0101dde:	c3                   	ret    
c0101ddf:	90                   	nop

c0101de0 <printk_color>:
c0101de0:	55                   	push   %ebp
c0101de1:	b8 e0 80 10 c0       	mov    $0xc01080e0,%eax
c0101de6:	89 e5                	mov    %esp,%ebp
c0101de8:	83 ec 08             	sub    $0x8,%esp
c0101deb:	8b 55 10             	mov    0x10(%ebp),%edx
c0101dee:	8d 4d 14             	lea    0x14(%ebp),%ecx
c0101df1:	e8 1a fb ff ff       	call   c0101910 <vsprintf>
c0101df6:	83 ec 04             	sub    $0x4,%esp
c0101df9:	ff 75 0c             	pushl  0xc(%ebp)
c0101dfc:	ff 75 08             	pushl  0x8(%ebp)
c0101dff:	68 e0 80 10 c0       	push   $0xc01080e0
c0101e04:	c6 80 e0 80 10 c0 00 	movb   $0x0,-0x3fef7f20(%eax)
c0101e0b:	e8 50 f4 ff ff       	call   c0101260 <console_write_color>
c0101e10:	83 c4 10             	add    $0x10,%esp
c0101e13:	c9                   	leave  
c0101e14:	c3                   	ret    
c0101e15:	66 90                	xchg   %ax,%ax
c0101e17:	66 90                	xchg   %ax,%ax
c0101e19:	66 90                	xchg   %ax,%ax
c0101e1b:	66 90                	xchg   %ax,%ax
c0101e1d:	66 90                	xchg   %ax,%ax
c0101e1f:	90                   	nop

c0101e20 <memfree>:
c0101e20:	55                   	push   %ebp
c0101e21:	89 e5                	mov    %esp,%ebp
c0101e23:	53                   	push   %ebx
c0101e24:	83 ec 04             	sub    $0x4,%esp
c0101e27:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101e2a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
c0101e30:	75 15                	jne    c0101e47 <memfree+0x27>
c0101e32:	81 fb 60 b9 10 c0    	cmp    $0xc010b960,%ebx
c0101e38:	72 0d                	jb     c0101e47 <memfree+0x27>
c0101e3a:	8d 83 00 00 00 40    	lea    0x40000000(%ebx),%eax
c0101e40:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
c0101e45:	76 10                	jbe    c0101e57 <memfree+0x37>
c0101e47:	83 ec 0c             	sub    $0xc,%esp
c0101e4a:	68 d4 30 10 c0       	push   $0xc01030d4
c0101e4f:	e8 5c ff ff ff       	call   c0101db0 <printk>
c0101e54:	83 c4 10             	add    $0x10,%esp
c0101e57:	83 ec 04             	sub    $0x4,%esp
c0101e5a:	68 00 10 00 00       	push   $0x1000
c0101e5f:	6a 01                	push   $0x1
c0101e61:	53                   	push   %ebx
c0101e62:	e8 29 f0 ff ff       	call   c0100e90 <memset>
c0101e67:	c7 04 24 4c b9 10 c0 	movl   $0xc010b94c,(%esp)
c0101e6e:	e8 ed f6 ff ff       	call   c0101560 <acquire>
c0101e73:	a1 58 b9 10 c0       	mov    0xc010b958,%eax
c0101e78:	83 c4 10             	add    $0x10,%esp
c0101e7b:	89 03                	mov    %eax,(%ebx)
c0101e7d:	89 1d 58 b9 10 c0    	mov    %ebx,0xc010b958
c0101e83:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101e86:	c7 45 08 4c b9 10 c0 	movl   $0xc010b94c,0x8(%ebp)
c0101e8d:	c9                   	leave  
c0101e8e:	e9 2d f7 ff ff       	jmp    c01015c0 <release>
c0101e93:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101e9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101ea0 <dorecycle>:
c0101ea0:	55                   	push   %ebp
c0101ea1:	89 e5                	mov    %esp,%ebp
c0101ea3:	57                   	push   %edi
c0101ea4:	56                   	push   %esi
c0101ea5:	53                   	push   %ebx
c0101ea6:	83 ec 0c             	sub    $0xc,%esp
c0101ea9:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101eac:	8b 75 0c             	mov    0xc(%ebp),%esi
c0101eaf:	8d 9f ff 0f 00 00    	lea    0xfff(%edi),%ebx
c0101eb5:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
c0101ebb:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
c0101ec1:	39 c6                	cmp    %eax,%esi
c0101ec3:	72 21                	jb     c0101ee6 <dorecycle+0x46>
c0101ec5:	8d 76 00             	lea    0x0(%esi),%esi
c0101ec8:	83 ec 0c             	sub    $0xc,%esp
c0101ecb:	89 c3                	mov    %eax,%ebx
c0101ecd:	8d 80 00 f0 ff ff    	lea    -0x1000(%eax),%eax
c0101ed3:	50                   	push   %eax
c0101ed4:	e8 47 ff ff ff       	call   c0101e20 <memfree>
c0101ed9:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
c0101edf:	83 c4 10             	add    $0x10,%esp
c0101ee2:	39 c6                	cmp    %eax,%esi
c0101ee4:	73 e2                	jae    c0101ec8 <dorecycle+0x28>
c0101ee6:	29 fb                	sub    %edi,%ebx
c0101ee8:	c7 45 08 da 30 10 c0 	movl   $0xc01030da,0x8(%ebp)
c0101eef:	c1 eb 0c             	shr    $0xc,%ebx
c0101ef2:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0101ef5:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101ef8:	5b                   	pop    %ebx
c0101ef9:	5e                   	pop    %esi
c0101efa:	5f                   	pop    %edi
c0101efb:	5d                   	pop    %ebp
c0101efc:	e9 af fe ff ff       	jmp    c0101db0 <printk>
c0101f01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101f08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101f0f:	90                   	nop

c0101f10 <recyclemem>:
c0101f10:	55                   	push   %ebp
c0101f11:	89 e5                	mov    %esp,%ebp
c0101f13:	56                   	push   %esi
c0101f14:	53                   	push   %ebx
c0101f15:	8b 75 0c             	mov    0xc(%ebp),%esi
c0101f18:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101f1b:	83 ec 08             	sub    $0x8,%esp
c0101f1e:	68 f0 30 10 c0       	push   $0xc01030f0
c0101f23:	68 4c b9 10 c0       	push   $0xc010b94c
c0101f28:	e8 03 f5 ff ff       	call   c0101430 <initlock>
c0101f2d:	89 75 0c             	mov    %esi,0xc(%ebp)
c0101f30:	83 c4 10             	add    $0x10,%esp
c0101f33:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0101f36:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0101f39:	5b                   	pop    %ebx
c0101f3a:	5e                   	pop    %esi
c0101f3b:	5d                   	pop    %ebp
c0101f3c:	e9 5f ff ff ff       	jmp    c0101ea0 <dorecycle>
c0101f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101f48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101f4f:	90                   	nop

c0101f50 <memalloc>:
c0101f50:	55                   	push   %ebp
c0101f51:	89 e5                	mov    %esp,%ebp
c0101f53:	53                   	push   %ebx
c0101f54:	83 ec 10             	sub    $0x10,%esp
c0101f57:	68 4c b9 10 c0       	push   $0xc010b94c
c0101f5c:	e8 ff f5 ff ff       	call   c0101560 <acquire>
c0101f61:	8b 1d 58 b9 10 c0    	mov    0xc010b958,%ebx
c0101f67:	83 c4 10             	add    $0x10,%esp
c0101f6a:	85 db                	test   %ebx,%ebx
c0101f6c:	74 07                	je     c0101f75 <memalloc+0x25>
c0101f6e:	8b 03                	mov    (%ebx),%eax
c0101f70:	a3 58 b9 10 c0       	mov    %eax,0xc010b958
c0101f75:	83 ec 0c             	sub    $0xc,%esp
c0101f78:	68 4c b9 10 c0       	push   $0xc010b94c
c0101f7d:	e8 3e f6 ff ff       	call   c01015c0 <release>
c0101f82:	89 d8                	mov    %ebx,%eax
c0101f84:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101f87:	c9                   	leave  
c0101f88:	c3                   	ret    
c0101f89:	66 90                	xchg   %ax,%ax
c0101f8b:	66 90                	xchg   %ax,%ax
c0101f8d:	66 90                	xchg   %ax,%ax
c0101f8f:	90                   	nop

c0101f90 <mapping>:
c0101f90:	55                   	push   %ebp
c0101f91:	89 e5                	mov    %esp,%ebp
c0101f93:	57                   	push   %edi
c0101f94:	89 d7                	mov    %edx,%edi
c0101f96:	56                   	push   %esi
c0101f97:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
c0101f9d:	53                   	push   %ebx
c0101f9e:	83 ec 1c             	sub    $0x1c,%esp
c0101fa1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101fa4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
c0101fa8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101fad:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101fb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fb3:	29 f8                	sub    %edi,%eax
c0101fb5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101fb8:	eb 40                	jmp    c0101ffa <mapping+0x6a>
c0101fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101fc0:	89 f8                	mov    %edi,%eax
c0101fc2:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
c0101fc8:	c1 e8 0a             	shr    $0xa,%eax
c0101fcb:	81 eb 00 00 00 40    	sub    $0x40000000,%ebx
c0101fd1:	25 fc 0f 00 00       	and    $0xffc,%eax
c0101fd6:	01 c3                	add    %eax,%ebx
c0101fd8:	74 75                	je     c010204f <mapping+0xbf>
c0101fda:	f6 03 01             	testb  $0x1,(%ebx)
c0101fdd:	0f 85 7d 00 00 00    	jne    c0102060 <mapping+0xd0>
c0101fe3:	0b 75 0c             	or     0xc(%ebp),%esi
c0101fe6:	83 ce 01             	or     $0x1,%esi
c0101fe9:	89 33                	mov    %esi,(%ebx)
c0101feb:	3b 7d dc             	cmp    -0x24(%ebp),%edi
c0101fee:	0f 84 8d 00 00 00    	je     c0102081 <mapping+0xf1>
c0101ff4:	81 c7 00 10 00 00    	add    $0x1000,%edi
c0101ffa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ffd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102000:	8d 34 38             	lea    (%eax,%edi,1),%esi
c0102003:	89 f8                	mov    %edi,%eax
c0102005:	c1 e8 16             	shr    $0x16,%eax
c0102008:	8d 0c 82             	lea    (%edx,%eax,4),%ecx
c010200b:	8b 19                	mov    (%ecx),%ebx
c010200d:	f6 c3 01             	test   $0x1,%bl
c0102010:	75 ae                	jne    c0101fc0 <mapping+0x30>
c0102012:	89 4d d8             	mov    %ecx,-0x28(%ebp)
c0102015:	e8 36 ff ff ff       	call   c0101f50 <memalloc>
c010201a:	89 c3                	mov    %eax,%ebx
c010201c:	85 c0                	test   %eax,%eax
c010201e:	74 2f                	je     c010204f <mapping+0xbf>
c0102020:	83 ec 04             	sub    $0x4,%esp
c0102023:	68 00 10 00 00       	push   $0x1000
c0102028:	6a 00                	push   $0x0
c010202a:	50                   	push   %eax
c010202b:	e8 60 ee ff ff       	call   c0100e90 <memset>
c0102030:	8d 83 00 00 00 40    	lea    0x40000000(%ebx),%eax
c0102036:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0102039:	83 c4 10             	add    $0x10,%esp
c010203c:	83 c8 07             	or     $0x7,%eax
c010203f:	89 01                	mov    %eax,(%ecx)
c0102041:	89 f8                	mov    %edi,%eax
c0102043:	c1 e8 0a             	shr    $0xa,%eax
c0102046:	25 fc 0f 00 00       	and    $0xffc,%eax
c010204b:	01 c3                	add    %eax,%ebx
c010204d:	75 8b                	jne    c0101fda <mapping+0x4a>
c010204f:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0102052:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102057:	5b                   	pop    %ebx
c0102058:	5e                   	pop    %esi
c0102059:	5f                   	pop    %edi
c010205a:	5d                   	pop    %ebp
c010205b:	c3                   	ret    
c010205c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102060:	83 ec 0c             	sub    $0xc,%esp
c0102063:	68 f5 30 10 c0       	push   $0xc01030f5
c0102068:	e8 43 fd ff ff       	call   c0101db0 <printk>
c010206d:	0b 75 0c             	or     0xc(%ebp),%esi
c0102070:	83 c4 10             	add    $0x10,%esp
c0102073:	83 ce 01             	or     $0x1,%esi
c0102076:	89 33                	mov    %esi,(%ebx)
c0102078:	3b 7d dc             	cmp    -0x24(%ebp),%edi
c010207b:	0f 85 73 ff ff ff    	jne    c0101ff4 <mapping+0x64>
c0102081:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0102084:	31 c0                	xor    %eax,%eax
c0102086:	5b                   	pop    %ebx
c0102087:	5e                   	pop    %esi
c0102088:	5f                   	pop    %edi
c0102089:	5d                   	pop    %ebp
c010208a:	c3                   	ret    
c010208b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c010208f:	90                   	nop

c0102090 <gdt_init>:
c0102090:	55                   	push   %ebp
c0102091:	89 e5                	mov    %esp,%ebp
c0102093:	83 ec 18             	sub    $0x18,%esp
c0102096:	e8 75 ea ff ff       	call   c0100b10 <getcpu>
c010209b:	ba 2f 00 00 00       	mov    $0x2f,%edx
c01020a0:	c7 40 74 ff ff 00 00 	movl   $0xffff,0x74(%eax)
c01020a7:	83 c0 6c             	add    $0x6c,%eax
c01020aa:	c7 40 0c 00 9a cf 00 	movl   $0xcf9a00,0xc(%eax)
c01020b1:	c7 40 10 ff ff 00 00 	movl   $0xffff,0x10(%eax)
c01020b8:	c7 40 14 00 92 cf 00 	movl   $0xcf9200,0x14(%eax)
c01020bf:	c7 40 18 ff ff 00 00 	movl   $0xffff,0x18(%eax)
c01020c6:	c7 40 1c 00 fa cf 00 	movl   $0xcffa00,0x1c(%eax)
c01020cd:	c7 40 20 ff ff 00 00 	movl   $0xffff,0x20(%eax)
c01020d4:	c7 40 24 00 f2 cf 00 	movl   $0xcff200,0x24(%eax)
c01020db:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
c01020df:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
c01020e3:	c1 e8 10             	shr    $0x10,%eax
c01020e6:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
c01020ea:	8d 45 f2             	lea    -0xe(%ebp),%eax
c01020ed:	0f 01 10             	lgdtl  (%eax)
c01020f0:	c9                   	leave  
c01020f1:	c3                   	ret    
c01020f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01020f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0102100 <dct_phy_mem>:
c0102100:	8b 15 00 70 10 c0    	mov    0xc0107000,%edx
c0102106:	8d 82 00 00 00 c0    	lea    -0x40000000(%edx),%eax
c010210c:	a3 00 70 10 c0       	mov    %eax,0xc0107000
c0102111:	8b 82 30 00 00 c0    	mov    -0x3fffffd0(%edx),%eax
c0102117:	8b 8a 2c 00 00 c0    	mov    -0x3fffffd4(%edx),%ecx
c010211d:	01 c1                	add    %eax,%ecx
c010211f:	89 ca                	mov    %ecx,%edx
c0102121:	39 c8                	cmp    %ecx,%eax
c0102123:	72 12                	jb     c0102137 <dct_phy_mem+0x37>
c0102125:	eb 41                	jmp    c0102168 <dct_phy_mem+0x68>
c0102127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c010212e:	66 90                	xchg   %ax,%ax
c0102130:	83 c0 18             	add    $0x18,%eax
c0102133:	39 d0                	cmp    %edx,%eax
c0102135:	73 31                	jae    c0102168 <dct_phy_mem+0x68>
c0102137:	83 78 14 01          	cmpl   $0x1,0x14(%eax)
c010213b:	75 f3                	jne    c0102130 <dct_phy_mem+0x30>
c010213d:	81 78 04 00 00 10 00 	cmpl   $0x100000,0x4(%eax)
c0102144:	75 ea                	jne    c0102130 <dct_phy_mem+0x30>
c0102146:	8b 40 0c             	mov    0xc(%eax),%eax
c0102149:	05 00 00 10 00       	add    $0x100000,%eax
c010214e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102153:	a3 0c b1 10 c0       	mov    %eax,0xc010b10c
c0102158:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
c010215d:	77 0a                	ja     c0102169 <dct_phy_mem+0x69>
c010215f:	a3 28 60 10 c0       	mov    %eax,0xc0106028
c0102164:	c3                   	ret    
c0102165:	8d 76 00             	lea    0x0(%esi),%esi
c0102168:	c3                   	ret    
c0102169:	c7 05 0c b1 10 c0 00 	movl   $0x20000000,0xc010b10c
c0102170:	00 00 20 
c0102173:	c3                   	ret    
c0102174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c010217b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c010217f:	90                   	nop

c0102180 <build_kvm>:
c0102180:	55                   	push   %ebp
c0102181:	89 e5                	mov    %esp,%ebp
c0102183:	56                   	push   %esi
c0102184:	53                   	push   %ebx
c0102185:	e8 c6 fd ff ff       	call   c0101f50 <memalloc>
c010218a:	89 c6                	mov    %eax,%esi
c010218c:	85 c0                	test   %eax,%eax
c010218e:	74 42                	je     c01021d2 <build_kvm+0x52>
c0102190:	83 ec 04             	sub    $0x4,%esp
c0102193:	bb 00 60 10 c0       	mov    $0xc0106000,%ebx
c0102198:	68 00 10 00 00       	push   $0x1000
c010219d:	6a 00                	push   $0x0
c010219f:	50                   	push   %eax
c01021a0:	e8 eb ec ff ff       	call   c0100e90 <memset>
c01021a5:	83 c4 10             	add    $0x10,%esp
c01021a8:	8b 43 04             	mov    0x4(%ebx),%eax
c01021ab:	83 ec 08             	sub    $0x8,%esp
c01021ae:	8b 4b 08             	mov    0x8(%ebx),%ecx
c01021b1:	ff 73 0c             	pushl  0xc(%ebx)
c01021b4:	8b 13                	mov    (%ebx),%edx
c01021b6:	50                   	push   %eax
c01021b7:	29 c1                	sub    %eax,%ecx
c01021b9:	89 f0                	mov    %esi,%eax
c01021bb:	e8 d0 fd ff ff       	call   c0101f90 <mapping>
c01021c0:	83 c4 10             	add    $0x10,%esp
c01021c3:	85 c0                	test   %eax,%eax
c01021c5:	78 19                	js     c01021e0 <build_kvm+0x60>
c01021c7:	83 c3 10             	add    $0x10,%ebx
c01021ca:	81 fb 30 60 10 c0    	cmp    $0xc0106030,%ebx
c01021d0:	75 d6                	jne    c01021a8 <build_kvm+0x28>
c01021d2:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01021d5:	89 f0                	mov    %esi,%eax
c01021d7:	5b                   	pop    %ebx
c01021d8:	5e                   	pop    %esi
c01021d9:	5d                   	pop    %ebp
c01021da:	c3                   	ret    
c01021db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01021df:	90                   	nop
c01021e0:	83 ec 0c             	sub    $0xc,%esp
c01021e3:	56                   	push   %esi
c01021e4:	31 f6                	xor    %esi,%esi
c01021e6:	e8 35 fc ff ff       	call   c0101e20 <memfree>
c01021eb:	83 c4 10             	add    $0x10,%esp
c01021ee:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01021f1:	89 f0                	mov    %esi,%eax
c01021f3:	5b                   	pop    %ebx
c01021f4:	5e                   	pop    %esi
c01021f5:	5d                   	pop    %ebp
c01021f6:	c3                   	ret    
c01021f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01021fe:	66 90                	xchg   %ax,%ax

c0102200 <build_kpgdir>:
c0102200:	55                   	push   %ebp
c0102201:	89 e5                	mov    %esp,%ebp
c0102203:	83 ec 08             	sub    $0x8,%esp
c0102206:	e8 75 ff ff ff       	call   c0102180 <build_kvm>
c010220b:	a3 5c b9 10 c0       	mov    %eax,0xc010b95c
c0102210:	05 00 00 00 40       	add    $0x40000000,%eax
c0102215:	0f 22 d8             	mov    %eax,%cr3
c0102218:	c9                   	leave  
c0102219:	c3                   	ret    
c010221a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0102220 <switchkvm>:
c0102220:	a1 5c b9 10 c0       	mov    0xc010b95c,%eax
c0102225:	05 00 00 00 40       	add    $0x40000000,%eax
c010222a:	0f 22 d8             	mov    %eax,%cr3
c010222d:	c3                   	ret    
c010222e:	66 90                	xchg   %ax,%ax

c0102230 <firstuvm>:
c0102230:	55                   	push   %ebp
c0102231:	89 e5                	mov    %esp,%ebp
c0102233:	57                   	push   %edi
c0102234:	56                   	push   %esi
c0102235:	53                   	push   %ebx
c0102236:	83 ec 1c             	sub    $0x1c,%esp
c0102239:	8b 45 08             	mov    0x8(%ebp),%eax
c010223c:	8b 75 10             	mov    0x10(%ebp),%esi
c010223f:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0102242:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102245:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
c010224b:	77 53                	ja     c01022a0 <firstuvm+0x70>
c010224d:	e8 fe fc ff ff       	call   c0101f50 <memalloc>
c0102252:	83 ec 04             	sub    $0x4,%esp
c0102255:	68 00 10 00 00       	push   $0x1000
c010225a:	89 c3                	mov    %eax,%ebx
c010225c:	6a 00                	push   $0x0
c010225e:	50                   	push   %eax
c010225f:	e8 2c ec ff ff       	call   c0100e90 <memset>
c0102264:	58                   	pop    %eax
c0102265:	8d 83 00 00 00 40    	lea    0x40000000(%ebx),%eax
c010226b:	5a                   	pop    %edx
c010226c:	6a 06                	push   $0x6
c010226e:	b9 00 10 00 00       	mov    $0x1000,%ecx
c0102273:	31 d2                	xor    %edx,%edx
c0102275:	50                   	push   %eax
c0102276:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102279:	e8 12 fd ff ff       	call   c0101f90 <mapping>
c010227e:	89 75 10             	mov    %esi,0x10(%ebp)
c0102281:	83 c4 10             	add    $0x10,%esp
c0102284:	89 7d 0c             	mov    %edi,0xc(%ebp)
c0102287:	89 5d 08             	mov    %ebx,0x8(%ebp)
c010228a:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010228d:	5b                   	pop    %ebx
c010228e:	5e                   	pop    %esi
c010228f:	5f                   	pop    %edi
c0102290:	5d                   	pop    %ebp
c0102291:	e9 9a eb ff ff       	jmp    c0100e30 <memmove>
c0102296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c010229d:	8d 76 00             	lea    0x0(%esi),%esi
c01022a0:	83 ec 0c             	sub    $0xc,%esp
c01022a3:	68 dc 31 10 c0       	push   $0xc01031dc
c01022a8:	e8 03 fb ff ff       	call   c0101db0 <printk>
c01022ad:	83 c4 10             	add    $0x10,%esp
c01022b0:	eb 9b                	jmp    c010224d <firstuvm+0x1d>
c01022b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01022b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01022c0 <changeuvm>:
c01022c0:	55                   	push   %ebp
c01022c1:	89 e5                	mov    %esp,%ebp
c01022c3:	57                   	push   %edi
c01022c4:	56                   	push   %esi
c01022c5:	53                   	push   %ebx
c01022c6:	83 ec 1c             	sub    $0x1c,%esp
c01022c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01022cc:	85 db                	test   %ebx,%ebx
c01022ce:	0f 84 cc 00 00 00    	je     c01023a0 <changeuvm+0xe0>
c01022d4:	8b 43 08             	mov    0x8(%ebx),%eax
c01022d7:	85 c0                	test   %eax,%eax
c01022d9:	0f 84 e1 00 00 00    	je     c01023c0 <changeuvm+0x100>
c01022df:	8b 43 04             	mov    0x4(%ebx),%eax
c01022e2:	85 c0                	test   %eax,%eax
c01022e4:	0f 84 f6 00 00 00    	je     c01023e0 <changeuvm+0x120>
c01022ea:	e8 61 f1 ff ff       	call   c0101450 <pcli>
c01022ef:	e8 1c e8 ff ff       	call   c0100b10 <getcpu>
c01022f4:	89 c6                	mov    %eax,%esi
c01022f6:	e8 15 e8 ff ff       	call   c0100b10 <getcpu>
c01022fb:	89 c7                	mov    %eax,%edi
c01022fd:	e8 0e e8 ff ff       	call   c0100b10 <getcpu>
c0102302:	83 c7 04             	add    $0x4,%edi
c0102305:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102308:	e8 03 e8 ff ff       	call   c0100b10 <getcpu>
c010230d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0102310:	ba 67 00 00 00       	mov    $0x67,%edx
c0102315:	66 89 be 96 00 00 00 	mov    %di,0x96(%esi)
c010231c:	83 c0 04             	add    $0x4,%eax
c010231f:	66 89 96 94 00 00 00 	mov    %dx,0x94(%esi)
c0102326:	bf ff ff ff ff       	mov    $0xffffffff,%edi
c010232b:	83 c1 04             	add    $0x4,%ecx
c010232e:	c1 e8 18             	shr    $0x18,%eax
c0102331:	c1 e9 10             	shr    $0x10,%ecx
c0102334:	88 86 9b 00 00 00    	mov    %al,0x9b(%esi)
c010233a:	88 8e 98 00 00 00    	mov    %cl,0x98(%esi)
c0102340:	b9 99 40 00 00       	mov    $0x4099,%ecx
c0102345:	66 89 8e 99 00 00 00 	mov    %cx,0x99(%esi)
c010234c:	be 10 00 00 00       	mov    $0x10,%esi
c0102351:	e8 ba e7 ff ff       	call   c0100b10 <getcpu>
c0102356:	80 a0 99 00 00 00 ef 	andb   $0xef,0x99(%eax)
c010235d:	e8 ae e7 ff ff       	call   c0100b10 <getcpu>
c0102362:	66 89 70 0c          	mov    %si,0xc(%eax)
c0102366:	8b 73 08             	mov    0x8(%ebx),%esi
c0102369:	81 c6 00 10 00 00    	add    $0x1000,%esi
c010236f:	e8 9c e7 ff ff       	call   c0100b10 <getcpu>
c0102374:	89 70 08             	mov    %esi,0x8(%eax)
c0102377:	e8 94 e7 ff ff       	call   c0100b10 <getcpu>
c010237c:	66 89 78 6a          	mov    %di,0x6a(%eax)
c0102380:	b8 28 00 00 00       	mov    $0x28,%eax
c0102385:	0f 00 d8             	ltr    %ax
c0102388:	8b 43 04             	mov    0x4(%ebx),%eax
c010238b:	05 00 00 00 40       	add    $0x40000000,%eax
c0102390:	0f 22 d8             	mov    %eax,%cr3
c0102393:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0102396:	5b                   	pop    %ebx
c0102397:	5e                   	pop    %esi
c0102398:	5f                   	pop    %edi
c0102399:	5d                   	pop    %ebp
c010239a:	e9 01 f1 ff ff       	jmp    c01014a0 <vcli>
c010239f:	90                   	nop
c01023a0:	83 ec 0c             	sub    $0xc,%esp
c01023a3:	68 07 31 10 c0       	push   $0xc0103107
c01023a8:	e8 03 fa ff ff       	call   c0101db0 <printk>
c01023ad:	8b 43 08             	mov    0x8(%ebx),%eax
c01023b0:	83 c4 10             	add    $0x10,%esp
c01023b3:	85 c0                	test   %eax,%eax
c01023b5:	0f 85 24 ff ff ff    	jne    c01022df <changeuvm+0x1f>
c01023bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01023bf:	90                   	nop
c01023c0:	83 ec 0c             	sub    $0xc,%esp
c01023c3:	68 13 31 10 c0       	push   $0xc0103113
c01023c8:	e8 e3 f9 ff ff       	call   c0101db0 <printk>
c01023cd:	8b 43 04             	mov    0x4(%ebx),%eax
c01023d0:	83 c4 10             	add    $0x10,%esp
c01023d3:	85 c0                	test   %eax,%eax
c01023d5:	0f 85 0f ff ff ff    	jne    c01022ea <changeuvm+0x2a>
c01023db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01023df:	90                   	nop
c01023e0:	83 ec 0c             	sub    $0xc,%esp
c01023e3:	68 1e 31 10 c0       	push   $0xc010311e
c01023e8:	e8 c3 f9 ff ff       	call   c0101db0 <printk>
c01023ed:	83 c4 10             	add    $0x10,%esp
c01023f0:	e9 f5 fe ff ff       	jmp    c01022ea <changeuvm+0x2a>
c01023f5:	66 90                	xchg   %ax,%ax
c01023f7:	90                   	nop
c01023f8:	10 1a                	adc    %bl,(%edx)
c01023fa:	10 c0                	adc    %al,%al
c01023fc:	88 19                	mov    %bl,(%ecx)
c01023fe:	10 c0                	adc    %al,%al
c0102400:	88 19                	mov    %bl,(%ecx)
c0102402:	10 c0                	adc    %al,%al
c0102404:	00 1a                	add    %bl,(%edx)
c0102406:	10 c0                	adc    %al,%al
c0102408:	88 19                	mov    %bl,(%ecx)
c010240a:	10 c0                	adc    %al,%al
c010240c:	88 19                	mov    %bl,(%ecx)
c010240e:	10 c0                	adc    %al,%al
c0102410:	88 19                	mov    %bl,(%ecx)
c0102412:	10 c0                	adc    %al,%al
c0102414:	88 19                	mov    %bl,(%ecx)
c0102416:	10 c0                	adc    %al,%al
c0102418:	88 19                	mov    %bl,(%ecx)
c010241a:	10 c0                	adc    %al,%al
c010241c:	88 19                	mov    %bl,(%ecx)
c010241e:	10 c0                	adc    %al,%al
c0102420:	88 19                	mov    %bl,(%ecx)
c0102422:	10 c0                	adc    %al,%al
c0102424:	f0 19 10             	lock sbb %edx,(%eax)
c0102427:	c0 88 19 10 c0 e8 19 	rorb   $0x19,-0x173fefe7(%eax)
c010242e:	10 c0                	adc    %al,%al
c0102430:	88 19                	mov    %bl,(%ecx)
c0102432:	10 c0                	adc    %al,%al
c0102434:	88 19                	mov    %bl,(%ecx)
c0102436:	10 c0                	adc    %al,%al
c0102438:	70 19                	jo     c0102453 <changeuvm+0x193>
c010243a:	10 c0                	adc    %al,%al
c010243c:	30 1a                	xor    %bl,(%edx)
c010243e:	10 c0                	adc    %al,%al
c0102440:	9c                   	pushf  
c0102441:	1d 10 c0 9c 1d       	sbb    $0x1d9cc010,%eax
c0102446:	10 c0                	adc    %al,%al
c0102448:	9c                   	pushf  
c0102449:	1d 10 c0 9c 1d       	sbb    $0x1d9cc010,%eax
c010244e:	10 c0                	adc    %al,%al
c0102450:	9c                   	pushf  
c0102451:	1d 10 c0 9c 1d       	sbb    $0x1d9cc010,%eax
c0102456:	10 c0                	adc    %al,%al
c0102458:	9c                   	pushf  
c0102459:	1d 10 c0 9c 1d       	sbb    $0x1d9cc010,%eax
c010245e:	10 c0                	adc    %al,%al
c0102460:	9c                   	pushf  
c0102461:	1d 10 c0 70 1c       	sbb    $0x1c70c010,%eax
c0102466:	10 c0                	adc    %al,%al
c0102468:	20 1c 10             	and    %bl,(%eax,%edx,1)
c010246b:	c0 f0 1a             	shl    $0x1a,%al
c010246e:	10 c0                	adc    %al,%al
c0102470:	9c                   	pushf  
c0102471:	1d 10 c0 9c 1d       	sbb    $0x1d9cc010,%eax
c0102476:	10 c0                	adc    %al,%al
c0102478:	9c                   	pushf  
c0102479:	1d 10 c0 9c 1d       	sbb    $0x1d9cc010,%eax
c010247e:	10 c0                	adc    %al,%al
c0102480:	f0 1a 10             	lock sbb (%eax),%dl
c0102483:	c0 9c 1d 10 c0 9c 1d 	rcrb   $0x10,0x1d9cc010(%ebp,%ebx,1)
c010248a:	10 
c010248b:	c0 9c 1d 10 c0 9c 1d 	rcrb   $0x10,0x1d9cc010(%ebp,%ebx,1)
c0102492:	10 
c0102493:	c0 00 1c             	rolb   $0x1c,(%eax)
c0102496:	10 c0                	adc    %al,%al
c0102498:	e0 1b                	loopne c01024b5 <changeuvm+0x1f5>
c010249a:	10 c0                	adc    %al,%al
c010249c:	20 1a                	and    %bl,(%edx)
c010249e:	10 c0                	adc    %al,%al
c01024a0:	9c                   	pushf  
c01024a1:	1d 10 c0 9c 1d       	sbb    $0x1d9cc010,%eax
c01024a6:	10 c0                	adc    %al,%al
c01024a8:	10 1b                	adc    %bl,(%ebx)
c01024aa:	10 c0                	adc    %al,%al
c01024ac:	9c                   	pushf  
c01024ad:	1d 10 c0 f3 1a       	sbb    $0x1af3c010,%eax
c01024b2:	10 c0                	adc    %al,%al
c01024b4:	9c                   	pushf  
c01024b5:	1d 10 c0 9c 1d       	sbb    $0x1d9cc010,%eax
c01024ba:	10 c0                	adc    %al,%al
c01024bc:	90                   	nop
c01024bd:	1c 10                	sbb    $0x10,%al
c01024bf:	c0 66 90 66          	shlb   $0x66,-0x70(%esi)
c01024c3:	90                   	nop
c01024c4:	66 90                	xchg   %ax,%ax
c01024c6:	66 90                	xchg   %ax,%ax
c01024c8:	66 90                	xchg   %ax,%ax
c01024ca:	66 90                	xchg   %ax,%ax
c01024cc:	66 90                	xchg   %ax,%ax
c01024ce:	66 90                	xchg   %ax,%ax
c01024d0:	66 90                	xchg   %ax,%ax
c01024d2:	66 90                	xchg   %ax,%ax
c01024d4:	66 90                	xchg   %ax,%ax
c01024d6:	66 90                	xchg   %ax,%ax
c01024d8:	66 90                	xchg   %ax,%ax
c01024da:	66 90                	xchg   %ax,%ax
c01024dc:	66 90                	xchg   %ax,%ax
c01024de:	66 90                	xchg   %ax,%ax
c01024e0:	66 90                	xchg   %ax,%ax
c01024e2:	66 90                	xchg   %ax,%ax
c01024e4:	66 90                	xchg   %ax,%ax
c01024e6:	66 90                	xchg   %ax,%ax
c01024e8:	66 90                	xchg   %ax,%ax
c01024ea:	66 90                	xchg   %ax,%ax
c01024ec:	66 90                	xchg   %ax,%ax
c01024ee:	66 90                	xchg   %ax,%ax
c01024f0:	66 90                	xchg   %ax,%ax
c01024f2:	66 90                	xchg   %ax,%ax
c01024f4:	66 90                	xchg   %ax,%ax
c01024f6:	66 90                	xchg   %ax,%ax
c01024f8:	66 90                	xchg   %ax,%ax
c01024fa:	66 90                	xchg   %ax,%ax
c01024fc:	66 90                	xchg   %ax,%ax
c01024fe:	66 90                	xchg   %ax,%ax
c0102500:	66 90                	xchg   %ax,%ax
c0102502:	66 90                	xchg   %ax,%ax
c0102504:	66 90                	xchg   %ax,%ax
c0102506:	66 90                	xchg   %ax,%ax
c0102508:	66 90                	xchg   %ax,%ax
c010250a:	66 90                	xchg   %ax,%ax
c010250c:	66 90                	xchg   %ax,%ax
c010250e:	66 90                	xchg   %ax,%ax
c0102510:	66 90                	xchg   %ax,%ax
c0102512:	66 90                	xchg   %ax,%ax
c0102514:	66 90                	xchg   %ax,%ax
c0102516:	66 90                	xchg   %ax,%ax
c0102518:	66 90                	xchg   %ax,%ax
c010251a:	66 90                	xchg   %ax,%ax
c010251c:	66 90                	xchg   %ax,%ax
c010251e:	66 90                	xchg   %ax,%ax
c0102520:	66 90                	xchg   %ax,%ax
c0102522:	66 90                	xchg   %ax,%ax
c0102524:	66 90                	xchg   %ax,%ax
c0102526:	66 90                	xchg   %ax,%ax
c0102528:	66 90                	xchg   %ax,%ax
c010252a:	66 90                	xchg   %ax,%ax
c010252c:	66 90                	xchg   %ax,%ax
c010252e:	66 90                	xchg   %ax,%ax
c0102530:	66 90                	xchg   %ax,%ax
c0102532:	66 90                	xchg   %ax,%ax
c0102534:	66 90                	xchg   %ax,%ax
c0102536:	66 90                	xchg   %ax,%ax
c0102538:	66 90                	xchg   %ax,%ax
c010253a:	66 90                	xchg   %ax,%ax
c010253c:	66 90                	xchg   %ax,%ax
c010253e:	66 90                	xchg   %ax,%ax
c0102540:	66 90                	xchg   %ax,%ax
c0102542:	66 90                	xchg   %ax,%ax
c0102544:	66 90                	xchg   %ax,%ax
c0102546:	66 90                	xchg   %ax,%ax
c0102548:	66 90                	xchg   %ax,%ax
c010254a:	66 90                	xchg   %ax,%ax
c010254c:	66 90                	xchg   %ax,%ax
c010254e:	66 90                	xchg   %ax,%ax
c0102550:	66 90                	xchg   %ax,%ax
c0102552:	66 90                	xchg   %ax,%ax
c0102554:	66 90                	xchg   %ax,%ax
c0102556:	66 90                	xchg   %ax,%ax
c0102558:	66 90                	xchg   %ax,%ax
c010255a:	66 90                	xchg   %ax,%ax
c010255c:	66 90                	xchg   %ax,%ax
c010255e:	66 90                	xchg   %ax,%ax
c0102560:	66 90                	xchg   %ax,%ax
c0102562:	66 90                	xchg   %ax,%ax
c0102564:	66 90                	xchg   %ax,%ax
c0102566:	66 90                	xchg   %ax,%ax
c0102568:	66 90                	xchg   %ax,%ax
c010256a:	66 90                	xchg   %ax,%ax
c010256c:	66 90                	xchg   %ax,%ax
c010256e:	66 90                	xchg   %ax,%ax
c0102570:	66 90                	xchg   %ax,%ax
c0102572:	66 90                	xchg   %ax,%ax
c0102574:	66 90                	xchg   %ax,%ax
c0102576:	66 90                	xchg   %ax,%ax
c0102578:	66 90                	xchg   %ax,%ax
c010257a:	66 90                	xchg   %ax,%ax
c010257c:	66 90                	xchg   %ax,%ax
c010257e:	66 90                	xchg   %ax,%ax
c0102580:	66 90                	xchg   %ax,%ax
c0102582:	66 90                	xchg   %ax,%ax
c0102584:	66 90                	xchg   %ax,%ax
c0102586:	66 90                	xchg   %ax,%ax
c0102588:	66 90                	xchg   %ax,%ax
c010258a:	66 90                	xchg   %ax,%ax
c010258c:	66 90                	xchg   %ax,%ax
c010258e:	66 90                	xchg   %ax,%ax
c0102590:	66 90                	xchg   %ax,%ax
c0102592:	66 90                	xchg   %ax,%ax
c0102594:	66 90                	xchg   %ax,%ax
c0102596:	66 90                	xchg   %ax,%ax
c0102598:	66 90                	xchg   %ax,%ax
c010259a:	66 90                	xchg   %ax,%ax
c010259c:	66 90                	xchg   %ax,%ax
c010259e:	66 90                	xchg   %ax,%ax
c01025a0:	66 90                	xchg   %ax,%ax
c01025a2:	66 90                	xchg   %ax,%ax
c01025a4:	66 90                	xchg   %ax,%ax
c01025a6:	66 90                	xchg   %ax,%ax
c01025a8:	66 90                	xchg   %ax,%ax
c01025aa:	66 90                	xchg   %ax,%ax
c01025ac:	66 90                	xchg   %ax,%ax
c01025ae:	66 90                	xchg   %ax,%ax
c01025b0:	66 90                	xchg   %ax,%ax
c01025b2:	66 90                	xchg   %ax,%ax
c01025b4:	66 90                	xchg   %ax,%ax
c01025b6:	66 90                	xchg   %ax,%ax
c01025b8:	66 90                	xchg   %ax,%ax
c01025ba:	66 90                	xchg   %ax,%ax
c01025bc:	66 90                	xchg   %ax,%ax
c01025be:	66 90                	xchg   %ax,%ax
c01025c0:	66 90                	xchg   %ax,%ax
c01025c2:	66 90                	xchg   %ax,%ax
c01025c4:	66 90                	xchg   %ax,%ax
c01025c6:	66 90                	xchg   %ax,%ax
c01025c8:	66 90                	xchg   %ax,%ax
c01025ca:	66 90                	xchg   %ax,%ax
c01025cc:	66 90                	xchg   %ax,%ax
c01025ce:	66 90                	xchg   %ax,%ax
c01025d0:	66 90                	xchg   %ax,%ax
c01025d2:	66 90                	xchg   %ax,%ax
c01025d4:	66 90                	xchg   %ax,%ax
c01025d6:	66 90                	xchg   %ax,%ax
c01025d8:	66 90                	xchg   %ax,%ax
c01025da:	66 90                	xchg   %ax,%ax
c01025dc:	66 90                	xchg   %ax,%ax
c01025de:	66 90                	xchg   %ax,%ax
c01025e0:	66 90                	xchg   %ax,%ax
c01025e2:	66 90                	xchg   %ax,%ax
c01025e4:	66 90                	xchg   %ax,%ax
c01025e6:	66 90                	xchg   %ax,%ax
c01025e8:	66 90                	xchg   %ax,%ax
c01025ea:	66 90                	xchg   %ax,%ax
c01025ec:	66 90                	xchg   %ax,%ax
c01025ee:	66 90                	xchg   %ax,%ax
c01025f0:	66 90                	xchg   %ax,%ax
c01025f2:	66 90                	xchg   %ax,%ax
c01025f4:	66 90                	xchg   %ax,%ax
c01025f6:	66 90                	xchg   %ax,%ax
c01025f8:	66 90                	xchg   %ax,%ax
c01025fa:	66 90                	xchg   %ax,%ax
c01025fc:	66 90                	xchg   %ax,%ax
c01025fe:	66 90                	xchg   %ax,%ax
c0102600:	66 90                	xchg   %ax,%ax
c0102602:	66 90                	xchg   %ax,%ax
c0102604:	66 90                	xchg   %ax,%ax
c0102606:	66 90                	xchg   %ax,%ax
c0102608:	66 90                	xchg   %ax,%ax
c010260a:	66 90                	xchg   %ax,%ax
c010260c:	66 90                	xchg   %ax,%ax
c010260e:	66 90                	xchg   %ax,%ax
c0102610:	66 90                	xchg   %ax,%ax
c0102612:	66 90                	xchg   %ax,%ax
c0102614:	66 90                	xchg   %ax,%ax
c0102616:	66 90                	xchg   %ax,%ax
c0102618:	66 90                	xchg   %ax,%ax
c010261a:	66 90                	xchg   %ax,%ax
c010261c:	66 90                	xchg   %ax,%ax
c010261e:	66 90                	xchg   %ax,%ax
c0102620:	66 90                	xchg   %ax,%ax
c0102622:	66 90                	xchg   %ax,%ax
c0102624:	66 90                	xchg   %ax,%ax
c0102626:	66 90                	xchg   %ax,%ax
c0102628:	66 90                	xchg   %ax,%ax
c010262a:	66 90                	xchg   %ax,%ax
c010262c:	66 90                	xchg   %ax,%ax
c010262e:	66 90                	xchg   %ax,%ax
c0102630:	66 90                	xchg   %ax,%ax
c0102632:	66 90                	xchg   %ax,%ax
c0102634:	66 90                	xchg   %ax,%ax
c0102636:	66 90                	xchg   %ax,%ax
c0102638:	66 90                	xchg   %ax,%ax
c010263a:	66 90                	xchg   %ax,%ax
c010263c:	66 90                	xchg   %ax,%ax
c010263e:	66 90                	xchg   %ax,%ax
c0102640:	66 90                	xchg   %ax,%ax
c0102642:	66 90                	xchg   %ax,%ax
c0102644:	66 90                	xchg   %ax,%ax
c0102646:	66 90                	xchg   %ax,%ax
c0102648:	66 90                	xchg   %ax,%ax
c010264a:	66 90                	xchg   %ax,%ax
c010264c:	66 90                	xchg   %ax,%ax
c010264e:	66 90                	xchg   %ax,%ax
c0102650:	66 90                	xchg   %ax,%ax
c0102652:	66 90                	xchg   %ax,%ax
c0102654:	66 90                	xchg   %ax,%ax
c0102656:	66 90                	xchg   %ax,%ax
c0102658:	66 90                	xchg   %ax,%ax
c010265a:	66 90                	xchg   %ax,%ax
c010265c:	66 90                	xchg   %ax,%ax
c010265e:	66 90                	xchg   %ax,%ax
c0102660:	66 90                	xchg   %ax,%ax
c0102662:	66 90                	xchg   %ax,%ax
c0102664:	66 90                	xchg   %ax,%ax
c0102666:	66 90                	xchg   %ax,%ax
c0102668:	66 90                	xchg   %ax,%ax
c010266a:	66 90                	xchg   %ax,%ax
c010266c:	66 90                	xchg   %ax,%ax
c010266e:	66 90                	xchg   %ax,%ax
c0102670:	66 90                	xchg   %ax,%ax
c0102672:	66 90                	xchg   %ax,%ax
c0102674:	66 90                	xchg   %ax,%ax
c0102676:	66 90                	xchg   %ax,%ax
c0102678:	66 90                	xchg   %ax,%ax
c010267a:	66 90                	xchg   %ax,%ax
c010267c:	66 90                	xchg   %ax,%ax
c010267e:	66 90                	xchg   %ax,%ax
c0102680:	66 90                	xchg   %ax,%ax
c0102682:	66 90                	xchg   %ax,%ax
c0102684:	66 90                	xchg   %ax,%ax
c0102686:	66 90                	xchg   %ax,%ax
c0102688:	66 90                	xchg   %ax,%ax
c010268a:	66 90                	xchg   %ax,%ax
c010268c:	66 90                	xchg   %ax,%ax
c010268e:	66 90                	xchg   %ax,%ax
c0102690:	66 90                	xchg   %ax,%ax
c0102692:	66 90                	xchg   %ax,%ax
c0102694:	66 90                	xchg   %ax,%ax
c0102696:	66 90                	xchg   %ax,%ax
c0102698:	66 90                	xchg   %ax,%ax
c010269a:	66 90                	xchg   %ax,%ax
c010269c:	66 90                	xchg   %ax,%ax
c010269e:	66 90                	xchg   %ax,%ax
c01026a0:	66 90                	xchg   %ax,%ax
c01026a2:	66 90                	xchg   %ax,%ax
c01026a4:	66 90                	xchg   %ax,%ax
c01026a6:	66 90                	xchg   %ax,%ax
c01026a8:	66 90                	xchg   %ax,%ax
c01026aa:	66 90                	xchg   %ax,%ax
c01026ac:	66 90                	xchg   %ax,%ax
c01026ae:	66 90                	xchg   %ax,%ax
c01026b0:	66 90                	xchg   %ax,%ax
c01026b2:	66 90                	xchg   %ax,%ax
c01026b4:	66 90                	xchg   %ax,%ax
c01026b6:	66 90                	xchg   %ax,%ax
c01026b8:	66 90                	xchg   %ax,%ax
c01026ba:	66 90                	xchg   %ax,%ax
c01026bc:	66 90                	xchg   %ax,%ax
c01026be:	66 90                	xchg   %ax,%ax
c01026c0:	66 90                	xchg   %ax,%ax
c01026c2:	66 90                	xchg   %ax,%ax
c01026c4:	66 90                	xchg   %ax,%ax
c01026c6:	66 90                	xchg   %ax,%ax
c01026c8:	66 90                	xchg   %ax,%ax
c01026ca:	66 90                	xchg   %ax,%ax
c01026cc:	66 90                	xchg   %ax,%ax
c01026ce:	66 90                	xchg   %ax,%ax
c01026d0:	66 90                	xchg   %ax,%ax
c01026d2:	66 90                	xchg   %ax,%ax
c01026d4:	66 90                	xchg   %ax,%ax
c01026d6:	66 90                	xchg   %ax,%ax
c01026d8:	66 90                	xchg   %ax,%ax
c01026da:	66 90                	xchg   %ax,%ax
c01026dc:	66 90                	xchg   %ax,%ax
c01026de:	66 90                	xchg   %ax,%ax
c01026e0:	66 90                	xchg   %ax,%ax
c01026e2:	66 90                	xchg   %ax,%ax
c01026e4:	66 90                	xchg   %ax,%ax
c01026e6:	66 90                	xchg   %ax,%ax
c01026e8:	66 90                	xchg   %ax,%ax
c01026ea:	66 90                	xchg   %ax,%ax
c01026ec:	66 90                	xchg   %ax,%ax
c01026ee:	66 90                	xchg   %ax,%ax
c01026f0:	66 90                	xchg   %ax,%ax
c01026f2:	66 90                	xchg   %ax,%ax
c01026f4:	66 90                	xchg   %ax,%ax
c01026f6:	66 90                	xchg   %ax,%ax
c01026f8:	66 90                	xchg   %ax,%ax
c01026fa:	66 90                	xchg   %ax,%ax
c01026fc:	66 90                	xchg   %ax,%ax
c01026fe:	66 90                	xchg   %ax,%ax
c0102700:	66 90                	xchg   %ax,%ax
c0102702:	66 90                	xchg   %ax,%ax
c0102704:	66 90                	xchg   %ax,%ax
c0102706:	66 90                	xchg   %ax,%ax
c0102708:	66 90                	xchg   %ax,%ax
c010270a:	66 90                	xchg   %ax,%ax
c010270c:	66 90                	xchg   %ax,%ax
c010270e:	66 90                	xchg   %ax,%ax
c0102710:	66 90                	xchg   %ax,%ax
c0102712:	66 90                	xchg   %ax,%ax
c0102714:	66 90                	xchg   %ax,%ax
c0102716:	66 90                	xchg   %ax,%ax
c0102718:	66 90                	xchg   %ax,%ax
c010271a:	66 90                	xchg   %ax,%ax
c010271c:	66 90                	xchg   %ax,%ax
c010271e:	66 90                	xchg   %ax,%ax
c0102720:	66 90                	xchg   %ax,%ax
c0102722:	66 90                	xchg   %ax,%ax
c0102724:	66 90                	xchg   %ax,%ax
c0102726:	66 90                	xchg   %ax,%ax
c0102728:	66 90                	xchg   %ax,%ax
c010272a:	66 90                	xchg   %ax,%ax
c010272c:	66 90                	xchg   %ax,%ax
c010272e:	66 90                	xchg   %ax,%ax
c0102730:	66 90                	xchg   %ax,%ax
c0102732:	66 90                	xchg   %ax,%ax
c0102734:	66 90                	xchg   %ax,%ax
c0102736:	66 90                	xchg   %ax,%ax
c0102738:	66 90                	xchg   %ax,%ax
c010273a:	66 90                	xchg   %ax,%ax
c010273c:	66 90                	xchg   %ax,%ax
c010273e:	66 90                	xchg   %ax,%ax
c0102740:	66 90                	xchg   %ax,%ax
c0102742:	66 90                	xchg   %ax,%ax
c0102744:	66 90                	xchg   %ax,%ax
c0102746:	66 90                	xchg   %ax,%ax
c0102748:	66 90                	xchg   %ax,%ax
c010274a:	66 90                	xchg   %ax,%ax
c010274c:	66 90                	xchg   %ax,%ax
c010274e:	66 90                	xchg   %ax,%ax
c0102750:	66 90                	xchg   %ax,%ax
c0102752:	66 90                	xchg   %ax,%ax
c0102754:	66 90                	xchg   %ax,%ax
c0102756:	66 90                	xchg   %ax,%ax
c0102758:	66 90                	xchg   %ax,%ax
c010275a:	66 90                	xchg   %ax,%ax
c010275c:	66 90                	xchg   %ax,%ax
c010275e:	66 90                	xchg   %ax,%ax
c0102760:	66 90                	xchg   %ax,%ax
c0102762:	66 90                	xchg   %ax,%ax
c0102764:	66 90                	xchg   %ax,%ax
c0102766:	66 90                	xchg   %ax,%ax
c0102768:	66 90                	xchg   %ax,%ax
c010276a:	66 90                	xchg   %ax,%ax
c010276c:	66 90                	xchg   %ax,%ax
c010276e:	66 90                	xchg   %ax,%ax
c0102770:	66 90                	xchg   %ax,%ax
c0102772:	66 90                	xchg   %ax,%ax
c0102774:	66 90                	xchg   %ax,%ax
c0102776:	66 90                	xchg   %ax,%ax
c0102778:	66 90                	xchg   %ax,%ax
c010277a:	66 90                	xchg   %ax,%ax
c010277c:	66 90                	xchg   %ax,%ax
c010277e:	66 90                	xchg   %ax,%ax
c0102780:	66 90                	xchg   %ax,%ax
c0102782:	66 90                	xchg   %ax,%ax
c0102784:	66 90                	xchg   %ax,%ax
c0102786:	66 90                	xchg   %ax,%ax
c0102788:	66 90                	xchg   %ax,%ax
c010278a:	66 90                	xchg   %ax,%ax
c010278c:	66 90                	xchg   %ax,%ax
c010278e:	66 90                	xchg   %ax,%ax
c0102790:	66 90                	xchg   %ax,%ax
c0102792:	66 90                	xchg   %ax,%ax
c0102794:	66 90                	xchg   %ax,%ax
c0102796:	66 90                	xchg   %ax,%ax
c0102798:	66 90                	xchg   %ax,%ax
c010279a:	66 90                	xchg   %ax,%ax
c010279c:	66 90                	xchg   %ax,%ax
c010279e:	66 90                	xchg   %ax,%ax
c01027a0:	66 90                	xchg   %ax,%ax
c01027a2:	66 90                	xchg   %ax,%ax
c01027a4:	66 90                	xchg   %ax,%ax
c01027a6:	66 90                	xchg   %ax,%ax
c01027a8:	66 90                	xchg   %ax,%ax
c01027aa:	66 90                	xchg   %ax,%ax
c01027ac:	66 90                	xchg   %ax,%ax
c01027ae:	66 90                	xchg   %ax,%ax
c01027b0:	66 90                	xchg   %ax,%ax
c01027b2:	66 90                	xchg   %ax,%ax
c01027b4:	66 90                	xchg   %ax,%ax
c01027b6:	66 90                	xchg   %ax,%ax
c01027b8:	66 90                	xchg   %ax,%ax
c01027ba:	66 90                	xchg   %ax,%ax
c01027bc:	66 90                	xchg   %ax,%ax
c01027be:	66 90                	xchg   %ax,%ax
c01027c0:	66 90                	xchg   %ax,%ax
c01027c2:	66 90                	xchg   %ax,%ax
c01027c4:	66 90                	xchg   %ax,%ax
c01027c6:	66 90                	xchg   %ax,%ax
c01027c8:	66 90                	xchg   %ax,%ax
c01027ca:	66 90                	xchg   %ax,%ax
c01027cc:	66 90                	xchg   %ax,%ax
c01027ce:	66 90                	xchg   %ax,%ax
c01027d0:	66 90                	xchg   %ax,%ax
c01027d2:	66 90                	xchg   %ax,%ax
c01027d4:	66 90                	xchg   %ax,%ax
c01027d6:	66 90                	xchg   %ax,%ax
c01027d8:	66 90                	xchg   %ax,%ax
c01027da:	66 90                	xchg   %ax,%ax
c01027dc:	66 90                	xchg   %ax,%ax
c01027de:	66 90                	xchg   %ax,%ax
c01027e0:	66 90                	xchg   %ax,%ax
c01027e2:	66 90                	xchg   %ax,%ax
c01027e4:	66 90                	xchg   %ax,%ax
c01027e6:	66 90                	xchg   %ax,%ax
c01027e8:	66 90                	xchg   %ax,%ax
c01027ea:	66 90                	xchg   %ax,%ax
c01027ec:	66 90                	xchg   %ax,%ax
c01027ee:	66 90                	xchg   %ax,%ax
c01027f0:	66 90                	xchg   %ax,%ax
c01027f2:	66 90                	xchg   %ax,%ax
c01027f4:	66 90                	xchg   %ax,%ax
c01027f6:	66 90                	xchg   %ax,%ax
c01027f8:	66 90                	xchg   %ax,%ax
c01027fa:	66 90                	xchg   %ax,%ax
c01027fc:	66 90                	xchg   %ax,%ax
c01027fe:	66 90                	xchg   %ax,%ax
c0102800:	66 90                	xchg   %ax,%ax
c0102802:	66 90                	xchg   %ax,%ax
c0102804:	66 90                	xchg   %ax,%ax
c0102806:	66 90                	xchg   %ax,%ax
c0102808:	66 90                	xchg   %ax,%ax
c010280a:	66 90                	xchg   %ax,%ax
c010280c:	66 90                	xchg   %ax,%ax
c010280e:	66 90                	xchg   %ax,%ax
c0102810:	66 90                	xchg   %ax,%ax
c0102812:	66 90                	xchg   %ax,%ax
c0102814:	66 90                	xchg   %ax,%ax
c0102816:	66 90                	xchg   %ax,%ax
c0102818:	66 90                	xchg   %ax,%ax
c010281a:	66 90                	xchg   %ax,%ax
c010281c:	66 90                	xchg   %ax,%ax
c010281e:	66 90                	xchg   %ax,%ax
c0102820:	66 90                	xchg   %ax,%ax
c0102822:	66 90                	xchg   %ax,%ax
c0102824:	66 90                	xchg   %ax,%ax
c0102826:	66 90                	xchg   %ax,%ax
c0102828:	66 90                	xchg   %ax,%ax
c010282a:	66 90                	xchg   %ax,%ax
c010282c:	66 90                	xchg   %ax,%ax
c010282e:	66 90                	xchg   %ax,%ax
c0102830:	66 90                	xchg   %ax,%ax
c0102832:	66 90                	xchg   %ax,%ax
c0102834:	66 90                	xchg   %ax,%ax
c0102836:	66 90                	xchg   %ax,%ax
c0102838:	66 90                	xchg   %ax,%ax
c010283a:	66 90                	xchg   %ax,%ax
c010283c:	66 90                	xchg   %ax,%ax
c010283e:	66 90                	xchg   %ax,%ax
c0102840:	66 90                	xchg   %ax,%ax
c0102842:	66 90                	xchg   %ax,%ax
c0102844:	66 90                	xchg   %ax,%ax
c0102846:	66 90                	xchg   %ax,%ax
c0102848:	66 90                	xchg   %ax,%ax
c010284a:	66 90                	xchg   %ax,%ax
c010284c:	66 90                	xchg   %ax,%ax
c010284e:	66 90                	xchg   %ax,%ax
c0102850:	66 90                	xchg   %ax,%ax
c0102852:	66 90                	xchg   %ax,%ax
c0102854:	66 90                	xchg   %ax,%ax
c0102856:	66 90                	xchg   %ax,%ax
c0102858:	66 90                	xchg   %ax,%ax
c010285a:	66 90                	xchg   %ax,%ax
c010285c:	66 90                	xchg   %ax,%ax
c010285e:	66 90                	xchg   %ax,%ax
c0102860:	66 90                	xchg   %ax,%ax
c0102862:	66 90                	xchg   %ax,%ax
c0102864:	66 90                	xchg   %ax,%ax
c0102866:	66 90                	xchg   %ax,%ax
c0102868:	66 90                	xchg   %ax,%ax
c010286a:	66 90                	xchg   %ax,%ax
c010286c:	66 90                	xchg   %ax,%ax
c010286e:	66 90                	xchg   %ax,%ax
c0102870:	66 90                	xchg   %ax,%ax
c0102872:	66 90                	xchg   %ax,%ax
c0102874:	66 90                	xchg   %ax,%ax
c0102876:	66 90                	xchg   %ax,%ax
c0102878:	66 90                	xchg   %ax,%ax
c010287a:	66 90                	xchg   %ax,%ax
c010287c:	66 90                	xchg   %ax,%ax
c010287e:	66 90                	xchg   %ax,%ax
c0102880:	66 90                	xchg   %ax,%ax
c0102882:	66 90                	xchg   %ax,%ax
c0102884:	66 90                	xchg   %ax,%ax
c0102886:	66 90                	xchg   %ax,%ax
c0102888:	66 90                	xchg   %ax,%ax
c010288a:	66 90                	xchg   %ax,%ax
c010288c:	66 90                	xchg   %ax,%ax
c010288e:	66 90                	xchg   %ax,%ax
c0102890:	66 90                	xchg   %ax,%ax
c0102892:	66 90                	xchg   %ax,%ax
c0102894:	66 90                	xchg   %ax,%ax
c0102896:	66 90                	xchg   %ax,%ax
c0102898:	66 90                	xchg   %ax,%ax
c010289a:	66 90                	xchg   %ax,%ax
c010289c:	66 90                	xchg   %ax,%ax
c010289e:	66 90                	xchg   %ax,%ax
c01028a0:	66 90                	xchg   %ax,%ax
c01028a2:	66 90                	xchg   %ax,%ax
c01028a4:	66 90                	xchg   %ax,%ax
c01028a6:	66 90                	xchg   %ax,%ax
c01028a8:	66 90                	xchg   %ax,%ax
c01028aa:	66 90                	xchg   %ax,%ax
c01028ac:	66 90                	xchg   %ax,%ax
c01028ae:	66 90                	xchg   %ax,%ax
c01028b0:	66 90                	xchg   %ax,%ax
c01028b2:	66 90                	xchg   %ax,%ax
c01028b4:	66 90                	xchg   %ax,%ax
c01028b6:	66 90                	xchg   %ax,%ax
c01028b8:	66 90                	xchg   %ax,%ax
c01028ba:	66 90                	xchg   %ax,%ax
c01028bc:	66 90                	xchg   %ax,%ax
c01028be:	66 90                	xchg   %ax,%ax
c01028c0:	66 90                	xchg   %ax,%ax
c01028c2:	66 90                	xchg   %ax,%ax
c01028c4:	66 90                	xchg   %ax,%ax
c01028c6:	66 90                	xchg   %ax,%ax
c01028c8:	66 90                	xchg   %ax,%ax
c01028ca:	66 90                	xchg   %ax,%ax
c01028cc:	66 90                	xchg   %ax,%ax
c01028ce:	66 90                	xchg   %ax,%ax
c01028d0:	66 90                	xchg   %ax,%ax
c01028d2:	66 90                	xchg   %ax,%ax
c01028d4:	66 90                	xchg   %ax,%ax
c01028d6:	66 90                	xchg   %ax,%ax
c01028d8:	66 90                	xchg   %ax,%ax
c01028da:	66 90                	xchg   %ax,%ax
c01028dc:	66 90                	xchg   %ax,%ax
c01028de:	66 90                	xchg   %ax,%ax
c01028e0:	66 90                	xchg   %ax,%ax
c01028e2:	66 90                	xchg   %ax,%ax
c01028e4:	66 90                	xchg   %ax,%ax
c01028e6:	66 90                	xchg   %ax,%ax
c01028e8:	66 90                	xchg   %ax,%ax
c01028ea:	66 90                	xchg   %ax,%ax
c01028ec:	66 90                	xchg   %ax,%ax
c01028ee:	66 90                	xchg   %ax,%ax
c01028f0:	66 90                	xchg   %ax,%ax
c01028f2:	66 90                	xchg   %ax,%ax
c01028f4:	66 90                	xchg   %ax,%ax
c01028f6:	66 90                	xchg   %ax,%ax
c01028f8:	66 90                	xchg   %ax,%ax
c01028fa:	66 90                	xchg   %ax,%ax
c01028fc:	66 90                	xchg   %ax,%ax
c01028fe:	66 90                	xchg   %ax,%ax
c0102900:	66 90                	xchg   %ax,%ax
c0102902:	66 90                	xchg   %ax,%ax
c0102904:	66 90                	xchg   %ax,%ax
c0102906:	66 90                	xchg   %ax,%ax
c0102908:	66 90                	xchg   %ax,%ax
c010290a:	66 90                	xchg   %ax,%ax
c010290c:	66 90                	xchg   %ax,%ax
c010290e:	66 90                	xchg   %ax,%ax
c0102910:	66 90                	xchg   %ax,%ax
c0102912:	66 90                	xchg   %ax,%ax
c0102914:	66 90                	xchg   %ax,%ax
c0102916:	66 90                	xchg   %ax,%ax
c0102918:	66 90                	xchg   %ax,%ax
c010291a:	66 90                	xchg   %ax,%ax
c010291c:	66 90                	xchg   %ax,%ax
c010291e:	66 90                	xchg   %ax,%ax
c0102920:	66 90                	xchg   %ax,%ax
c0102922:	66 90                	xchg   %ax,%ax
c0102924:	66 90                	xchg   %ax,%ax
c0102926:	66 90                	xchg   %ax,%ax
c0102928:	66 90                	xchg   %ax,%ax
c010292a:	66 90                	xchg   %ax,%ax
c010292c:	66 90                	xchg   %ax,%ax
c010292e:	66 90                	xchg   %ax,%ax
c0102930:	66 90                	xchg   %ax,%ax
c0102932:	66 90                	xchg   %ax,%ax
c0102934:	66 90                	xchg   %ax,%ax
c0102936:	66 90                	xchg   %ax,%ax
c0102938:	66 90                	xchg   %ax,%ax
c010293a:	66 90                	xchg   %ax,%ax
c010293c:	66 90                	xchg   %ax,%ax
c010293e:	66 90                	xchg   %ax,%ax
c0102940:	66 90                	xchg   %ax,%ax
c0102942:	66 90                	xchg   %ax,%ax
c0102944:	66 90                	xchg   %ax,%ax
c0102946:	66 90                	xchg   %ax,%ax
c0102948:	66 90                	xchg   %ax,%ax
c010294a:	66 90                	xchg   %ax,%ax
c010294c:	66 90                	xchg   %ax,%ax
c010294e:	66 90                	xchg   %ax,%ax
c0102950:	66 90                	xchg   %ax,%ax
c0102952:	66 90                	xchg   %ax,%ax
c0102954:	66 90                	xchg   %ax,%ax
c0102956:	66 90                	xchg   %ax,%ax
c0102958:	66 90                	xchg   %ax,%ax
c010295a:	66 90                	xchg   %ax,%ax
c010295c:	66 90                	xchg   %ax,%ax
c010295e:	66 90                	xchg   %ax,%ax
c0102960:	66 90                	xchg   %ax,%ax
c0102962:	66 90                	xchg   %ax,%ax
c0102964:	66 90                	xchg   %ax,%ax
c0102966:	66 90                	xchg   %ax,%ax
c0102968:	66 90                	xchg   %ax,%ax
c010296a:	66 90                	xchg   %ax,%ax
c010296c:	66 90                	xchg   %ax,%ax
c010296e:	66 90                	xchg   %ax,%ax
c0102970:	66 90                	xchg   %ax,%ax
c0102972:	66 90                	xchg   %ax,%ax
c0102974:	66 90                	xchg   %ax,%ax
c0102976:	66 90                	xchg   %ax,%ax
c0102978:	66 90                	xchg   %ax,%ax
c010297a:	66 90                	xchg   %ax,%ax
c010297c:	66 90                	xchg   %ax,%ax
c010297e:	66 90                	xchg   %ax,%ax
c0102980:	66 90                	xchg   %ax,%ax
c0102982:	66 90                	xchg   %ax,%ax
c0102984:	66 90                	xchg   %ax,%ax
c0102986:	66 90                	xchg   %ax,%ax
c0102988:	66 90                	xchg   %ax,%ax
c010298a:	66 90                	xchg   %ax,%ax
c010298c:	66 90                	xchg   %ax,%ax
c010298e:	66 90                	xchg   %ax,%ax
c0102990:	66 90                	xchg   %ax,%ax
c0102992:	66 90                	xchg   %ax,%ax
c0102994:	66 90                	xchg   %ax,%ax
c0102996:	66 90                	xchg   %ax,%ax
c0102998:	66 90                	xchg   %ax,%ax
c010299a:	66 90                	xchg   %ax,%ax
c010299c:	66 90                	xchg   %ax,%ax
c010299e:	66 90                	xchg   %ax,%ax
c01029a0:	66 90                	xchg   %ax,%ax
c01029a2:	66 90                	xchg   %ax,%ax
c01029a4:	66 90                	xchg   %ax,%ax
c01029a6:	66 90                	xchg   %ax,%ax
c01029a8:	66 90                	xchg   %ax,%ax
c01029aa:	66 90                	xchg   %ax,%ax
c01029ac:	66 90                	xchg   %ax,%ax
c01029ae:	66 90                	xchg   %ax,%ax
c01029b0:	66 90                	xchg   %ax,%ax
c01029b2:	66 90                	xchg   %ax,%ax
c01029b4:	66 90                	xchg   %ax,%ax
c01029b6:	66 90                	xchg   %ax,%ax
c01029b8:	66 90                	xchg   %ax,%ax
c01029ba:	66 90                	xchg   %ax,%ax
c01029bc:	66 90                	xchg   %ax,%ax
c01029be:	66 90                	xchg   %ax,%ax
c01029c0:	66 90                	xchg   %ax,%ax
c01029c2:	66 90                	xchg   %ax,%ax
c01029c4:	66 90                	xchg   %ax,%ax
c01029c6:	66 90                	xchg   %ax,%ax
c01029c8:	66 90                	xchg   %ax,%ax
c01029ca:	66 90                	xchg   %ax,%ax
c01029cc:	66 90                	xchg   %ax,%ax
c01029ce:	66 90                	xchg   %ax,%ax
c01029d0:	66 90                	xchg   %ax,%ax
c01029d2:	66 90                	xchg   %ax,%ax
c01029d4:	66 90                	xchg   %ax,%ax
c01029d6:	66 90                	xchg   %ax,%ax
c01029d8:	66 90                	xchg   %ax,%ax
c01029da:	66 90                	xchg   %ax,%ax
c01029dc:	66 90                	xchg   %ax,%ax
c01029de:	66 90                	xchg   %ax,%ax
c01029e0:	66 90                	xchg   %ax,%ax
c01029e2:	66 90                	xchg   %ax,%ax
c01029e4:	66 90                	xchg   %ax,%ax
c01029e6:	66 90                	xchg   %ax,%ax
c01029e8:	66 90                	xchg   %ax,%ax
c01029ea:	66 90                	xchg   %ax,%ax
c01029ec:	66 90                	xchg   %ax,%ax
c01029ee:	66 90                	xchg   %ax,%ax
c01029f0:	66 90                	xchg   %ax,%ax
c01029f2:	66 90                	xchg   %ax,%ax
c01029f4:	66 90                	xchg   %ax,%ax
c01029f6:	66 90                	xchg   %ax,%ax
c01029f8:	66 90                	xchg   %ax,%ax
c01029fa:	66 90                	xchg   %ax,%ax
c01029fc:	66 90                	xchg   %ax,%ax
c01029fe:	66 90                	xchg   %ax,%ax
c0102a00:	66 90                	xchg   %ax,%ax
c0102a02:	66 90                	xchg   %ax,%ax
c0102a04:	66 90                	xchg   %ax,%ax
c0102a06:	66 90                	xchg   %ax,%ax
c0102a08:	66 90                	xchg   %ax,%ax
c0102a0a:	66 90                	xchg   %ax,%ax
c0102a0c:	66 90                	xchg   %ax,%ax
c0102a0e:	66 90                	xchg   %ax,%ax
c0102a10:	66 90                	xchg   %ax,%ax
c0102a12:	66 90                	xchg   %ax,%ax
c0102a14:	66 90                	xchg   %ax,%ax
c0102a16:	66 90                	xchg   %ax,%ax
c0102a18:	66 90                	xchg   %ax,%ax
c0102a1a:	66 90                	xchg   %ax,%ax
c0102a1c:	66 90                	xchg   %ax,%ax
c0102a1e:	66 90                	xchg   %ax,%ax
c0102a20:	66 90                	xchg   %ax,%ax
c0102a22:	66 90                	xchg   %ax,%ax
c0102a24:	66 90                	xchg   %ax,%ax
c0102a26:	66 90                	xchg   %ax,%ax
c0102a28:	66 90                	xchg   %ax,%ax
c0102a2a:	66 90                	xchg   %ax,%ax
c0102a2c:	66 90                	xchg   %ax,%ax
c0102a2e:	66 90                	xchg   %ax,%ax
c0102a30:	66 90                	xchg   %ax,%ax
c0102a32:	66 90                	xchg   %ax,%ax
c0102a34:	66 90                	xchg   %ax,%ax
c0102a36:	66 90                	xchg   %ax,%ax
c0102a38:	66 90                	xchg   %ax,%ax
c0102a3a:	66 90                	xchg   %ax,%ax
c0102a3c:	66 90                	xchg   %ax,%ax
c0102a3e:	66 90                	xchg   %ax,%ax
c0102a40:	66 90                	xchg   %ax,%ax
c0102a42:	66 90                	xchg   %ax,%ax
c0102a44:	66 90                	xchg   %ax,%ax
c0102a46:	66 90                	xchg   %ax,%ax
c0102a48:	66 90                	xchg   %ax,%ax
c0102a4a:	66 90                	xchg   %ax,%ax
c0102a4c:	66 90                	xchg   %ax,%ax
c0102a4e:	66 90                	xchg   %ax,%ax
c0102a50:	66 90                	xchg   %ax,%ax
c0102a52:	66 90                	xchg   %ax,%ax
c0102a54:	66 90                	xchg   %ax,%ax
c0102a56:	66 90                	xchg   %ax,%ax
c0102a58:	66 90                	xchg   %ax,%ax
c0102a5a:	66 90                	xchg   %ax,%ax
c0102a5c:	66 90                	xchg   %ax,%ax
c0102a5e:	66 90                	xchg   %ax,%ax
c0102a60:	66 90                	xchg   %ax,%ax
c0102a62:	66 90                	xchg   %ax,%ax
c0102a64:	66 90                	xchg   %ax,%ax
c0102a66:	66 90                	xchg   %ax,%ax
c0102a68:	66 90                	xchg   %ax,%ax
c0102a6a:	66 90                	xchg   %ax,%ax
c0102a6c:	66 90                	xchg   %ax,%ax
c0102a6e:	66 90                	xchg   %ax,%ax
c0102a70:	66 90                	xchg   %ax,%ax
c0102a72:	66 90                	xchg   %ax,%ax
c0102a74:	66 90                	xchg   %ax,%ax
c0102a76:	66 90                	xchg   %ax,%ax
c0102a78:	66 90                	xchg   %ax,%ax
c0102a7a:	66 90                	xchg   %ax,%ax
c0102a7c:	66 90                	xchg   %ax,%ax
c0102a7e:	66 90                	xchg   %ax,%ax
c0102a80:	66 90                	xchg   %ax,%ax
c0102a82:	66 90                	xchg   %ax,%ax
c0102a84:	66 90                	xchg   %ax,%ax
c0102a86:	66 90                	xchg   %ax,%ax
c0102a88:	66 90                	xchg   %ax,%ax
c0102a8a:	66 90                	xchg   %ax,%ax
c0102a8c:	66 90                	xchg   %ax,%ax
c0102a8e:	66 90                	xchg   %ax,%ax
c0102a90:	66 90                	xchg   %ax,%ax
c0102a92:	66 90                	xchg   %ax,%ax
c0102a94:	66 90                	xchg   %ax,%ax
c0102a96:	66 90                	xchg   %ax,%ax
c0102a98:	66 90                	xchg   %ax,%ax
c0102a9a:	66 90                	xchg   %ax,%ax
c0102a9c:	66 90                	xchg   %ax,%ax
c0102a9e:	66 90                	xchg   %ax,%ax
c0102aa0:	66 90                	xchg   %ax,%ax
c0102aa2:	66 90                	xchg   %ax,%ax
c0102aa4:	66 90                	xchg   %ax,%ax
c0102aa6:	66 90                	xchg   %ax,%ax
c0102aa8:	66 90                	xchg   %ax,%ax
c0102aaa:	66 90                	xchg   %ax,%ax
c0102aac:	66 90                	xchg   %ax,%ax
c0102aae:	66 90                	xchg   %ax,%ax
c0102ab0:	66 90                	xchg   %ax,%ax
c0102ab2:	66 90                	xchg   %ax,%ax
c0102ab4:	66 90                	xchg   %ax,%ax
c0102ab6:	66 90                	xchg   %ax,%ax
c0102ab8:	66 90                	xchg   %ax,%ax
c0102aba:	66 90                	xchg   %ax,%ax
c0102abc:	66 90                	xchg   %ax,%ax
c0102abe:	66 90                	xchg   %ax,%ax
c0102ac0:	66 90                	xchg   %ax,%ax
c0102ac2:	66 90                	xchg   %ax,%ax
c0102ac4:	66 90                	xchg   %ax,%ax
c0102ac6:	66 90                	xchg   %ax,%ax
c0102ac8:	66 90                	xchg   %ax,%ax
c0102aca:	66 90                	xchg   %ax,%ax
c0102acc:	66 90                	xchg   %ax,%ax
c0102ace:	66 90                	xchg   %ax,%ax
c0102ad0:	66 90                	xchg   %ax,%ax
c0102ad2:	66 90                	xchg   %ax,%ax
c0102ad4:	66 90                	xchg   %ax,%ax
c0102ad6:	66 90                	xchg   %ax,%ax
c0102ad8:	66 90                	xchg   %ax,%ax
c0102ada:	66 90                	xchg   %ax,%ax
c0102adc:	66 90                	xchg   %ax,%ax
c0102ade:	66 90                	xchg   %ax,%ax
c0102ae0:	66 90                	xchg   %ax,%ax
c0102ae2:	66 90                	xchg   %ax,%ax
c0102ae4:	66 90                	xchg   %ax,%ax
c0102ae6:	66 90                	xchg   %ax,%ax
c0102ae8:	66 90                	xchg   %ax,%ax
c0102aea:	66 90                	xchg   %ax,%ax
c0102aec:	66 90                	xchg   %ax,%ax
c0102aee:	66 90                	xchg   %ax,%ax
c0102af0:	66 90                	xchg   %ax,%ax
c0102af2:	66 90                	xchg   %ax,%ax
c0102af4:	66 90                	xchg   %ax,%ax
c0102af6:	66 90                	xchg   %ax,%ax
c0102af8:	66 90                	xchg   %ax,%ax
c0102afa:	66 90                	xchg   %ax,%ax
c0102afc:	66 90                	xchg   %ax,%ax
c0102afe:	66 90                	xchg   %ax,%ax
c0102b00:	66 90                	xchg   %ax,%ax
c0102b02:	66 90                	xchg   %ax,%ax
c0102b04:	66 90                	xchg   %ax,%ax
c0102b06:	66 90                	xchg   %ax,%ax
c0102b08:	66 90                	xchg   %ax,%ax
c0102b0a:	66 90                	xchg   %ax,%ax
c0102b0c:	66 90                	xchg   %ax,%ax
c0102b0e:	66 90                	xchg   %ax,%ax
c0102b10:	66 90                	xchg   %ax,%ax
c0102b12:	66 90                	xchg   %ax,%ax
c0102b14:	66 90                	xchg   %ax,%ax
c0102b16:	66 90                	xchg   %ax,%ax
c0102b18:	66 90                	xchg   %ax,%ax
c0102b1a:	66 90                	xchg   %ax,%ax
c0102b1c:	66 90                	xchg   %ax,%ax
c0102b1e:	66 90                	xchg   %ax,%ax
c0102b20:	66 90                	xchg   %ax,%ax
c0102b22:	66 90                	xchg   %ax,%ax
c0102b24:	66 90                	xchg   %ax,%ax
c0102b26:	66 90                	xchg   %ax,%ax
c0102b28:	66 90                	xchg   %ax,%ax
c0102b2a:	66 90                	xchg   %ax,%ax
c0102b2c:	66 90                	xchg   %ax,%ax
c0102b2e:	66 90                	xchg   %ax,%ax
c0102b30:	66 90                	xchg   %ax,%ax
c0102b32:	66 90                	xchg   %ax,%ax
c0102b34:	66 90                	xchg   %ax,%ax
c0102b36:	66 90                	xchg   %ax,%ax
c0102b38:	66 90                	xchg   %ax,%ax
c0102b3a:	66 90                	xchg   %ax,%ax
c0102b3c:	66 90                	xchg   %ax,%ax
c0102b3e:	66 90                	xchg   %ax,%ax
c0102b40:	66 90                	xchg   %ax,%ax
c0102b42:	66 90                	xchg   %ax,%ax
c0102b44:	66 90                	xchg   %ax,%ax
c0102b46:	66 90                	xchg   %ax,%ax
c0102b48:	66 90                	xchg   %ax,%ax
c0102b4a:	66 90                	xchg   %ax,%ax
c0102b4c:	66 90                	xchg   %ax,%ax
c0102b4e:	66 90                	xchg   %ax,%ax
c0102b50:	66 90                	xchg   %ax,%ax
c0102b52:	66 90                	xchg   %ax,%ax
c0102b54:	66 90                	xchg   %ax,%ax
c0102b56:	66 90                	xchg   %ax,%ax
c0102b58:	66 90                	xchg   %ax,%ax
c0102b5a:	66 90                	xchg   %ax,%ax
c0102b5c:	66 90                	xchg   %ax,%ax
c0102b5e:	66 90                	xchg   %ax,%ax
c0102b60:	66 90                	xchg   %ax,%ax
c0102b62:	66 90                	xchg   %ax,%ax
c0102b64:	66 90                	xchg   %ax,%ax
c0102b66:	66 90                	xchg   %ax,%ax
c0102b68:	66 90                	xchg   %ax,%ax
c0102b6a:	66 90                	xchg   %ax,%ax
c0102b6c:	66 90                	xchg   %ax,%ax
c0102b6e:	66 90                	xchg   %ax,%ax
c0102b70:	66 90                	xchg   %ax,%ax
c0102b72:	66 90                	xchg   %ax,%ax
c0102b74:	66 90                	xchg   %ax,%ax
c0102b76:	66 90                	xchg   %ax,%ax
c0102b78:	66 90                	xchg   %ax,%ax
c0102b7a:	66 90                	xchg   %ax,%ax
c0102b7c:	66 90                	xchg   %ax,%ax
c0102b7e:	66 90                	xchg   %ax,%ax
c0102b80:	66 90                	xchg   %ax,%ax
c0102b82:	66 90                	xchg   %ax,%ax
c0102b84:	66 90                	xchg   %ax,%ax
c0102b86:	66 90                	xchg   %ax,%ax
c0102b88:	66 90                	xchg   %ax,%ax
c0102b8a:	66 90                	xchg   %ax,%ax
c0102b8c:	66 90                	xchg   %ax,%ax
c0102b8e:	66 90                	xchg   %ax,%ax
c0102b90:	66 90                	xchg   %ax,%ax
c0102b92:	66 90                	xchg   %ax,%ax
c0102b94:	66 90                	xchg   %ax,%ax
c0102b96:	66 90                	xchg   %ax,%ax
c0102b98:	66 90                	xchg   %ax,%ax
c0102b9a:	66 90                	xchg   %ax,%ax
c0102b9c:	66 90                	xchg   %ax,%ax
c0102b9e:	66 90                	xchg   %ax,%ax
c0102ba0:	66 90                	xchg   %ax,%ax
c0102ba2:	66 90                	xchg   %ax,%ax
c0102ba4:	66 90                	xchg   %ax,%ax
c0102ba6:	66 90                	xchg   %ax,%ax
c0102ba8:	66 90                	xchg   %ax,%ax
c0102baa:	66 90                	xchg   %ax,%ax
c0102bac:	66 90                	xchg   %ax,%ax
c0102bae:	66 90                	xchg   %ax,%ax
c0102bb0:	66 90                	xchg   %ax,%ax
c0102bb2:	66 90                	xchg   %ax,%ax
c0102bb4:	66 90                	xchg   %ax,%ax
c0102bb6:	66 90                	xchg   %ax,%ax
c0102bb8:	66 90                	xchg   %ax,%ax
c0102bba:	66 90                	xchg   %ax,%ax
c0102bbc:	66 90                	xchg   %ax,%ax
c0102bbe:	66 90                	xchg   %ax,%ax
c0102bc0:	66 90                	xchg   %ax,%ax
c0102bc2:	66 90                	xchg   %ax,%ax
c0102bc4:	66 90                	xchg   %ax,%ax
c0102bc6:	66 90                	xchg   %ax,%ax
c0102bc8:	66 90                	xchg   %ax,%ax
c0102bca:	66 90                	xchg   %ax,%ax
c0102bcc:	66 90                	xchg   %ax,%ax
c0102bce:	66 90                	xchg   %ax,%ax
c0102bd0:	66 90                	xchg   %ax,%ax
c0102bd2:	66 90                	xchg   %ax,%ax
c0102bd4:	66 90                	xchg   %ax,%ax
c0102bd6:	66 90                	xchg   %ax,%ax
c0102bd8:	66 90                	xchg   %ax,%ax
c0102bda:	66 90                	xchg   %ax,%ax
c0102bdc:	66 90                	xchg   %ax,%ax
c0102bde:	66 90                	xchg   %ax,%ax
c0102be0:	66 90                	xchg   %ax,%ax
c0102be2:	66 90                	xchg   %ax,%ax
c0102be4:	66 90                	xchg   %ax,%ax
c0102be6:	66 90                	xchg   %ax,%ax
c0102be8:	66 90                	xchg   %ax,%ax
c0102bea:	66 90                	xchg   %ax,%ax
c0102bec:	66 90                	xchg   %ax,%ax
c0102bee:	66 90                	xchg   %ax,%ax
c0102bf0:	66 90                	xchg   %ax,%ax
c0102bf2:	66 90                	xchg   %ax,%ax
c0102bf4:	66 90                	xchg   %ax,%ax
c0102bf6:	66 90                	xchg   %ax,%ax
c0102bf8:	66 90                	xchg   %ax,%ax
c0102bfa:	66 90                	xchg   %ax,%ax
c0102bfc:	66 90                	xchg   %ax,%ax
c0102bfe:	66 90                	xchg   %ax,%ax
c0102c00:	66 90                	xchg   %ax,%ax
c0102c02:	66 90                	xchg   %ax,%ax
c0102c04:	66 90                	xchg   %ax,%ax
c0102c06:	66 90                	xchg   %ax,%ax
c0102c08:	66 90                	xchg   %ax,%ax
c0102c0a:	66 90                	xchg   %ax,%ax
c0102c0c:	66 90                	xchg   %ax,%ax
c0102c0e:	66 90                	xchg   %ax,%ax
c0102c10:	66 90                	xchg   %ax,%ax
c0102c12:	66 90                	xchg   %ax,%ax
c0102c14:	66 90                	xchg   %ax,%ax
c0102c16:	66 90                	xchg   %ax,%ax
c0102c18:	66 90                	xchg   %ax,%ax
c0102c1a:	66 90                	xchg   %ax,%ax
c0102c1c:	66 90                	xchg   %ax,%ax
c0102c1e:	66 90                	xchg   %ax,%ax
c0102c20:	66 90                	xchg   %ax,%ax
c0102c22:	66 90                	xchg   %ax,%ax
c0102c24:	66 90                	xchg   %ax,%ax
c0102c26:	66 90                	xchg   %ax,%ax
c0102c28:	66 90                	xchg   %ax,%ax
c0102c2a:	66 90                	xchg   %ax,%ax
c0102c2c:	66 90                	xchg   %ax,%ax
c0102c2e:	66 90                	xchg   %ax,%ax
c0102c30:	66 90                	xchg   %ax,%ax
c0102c32:	66 90                	xchg   %ax,%ax
c0102c34:	66 90                	xchg   %ax,%ax
c0102c36:	66 90                	xchg   %ax,%ax
c0102c38:	66 90                	xchg   %ax,%ax
c0102c3a:	66 90                	xchg   %ax,%ax
c0102c3c:	66 90                	xchg   %ax,%ax
c0102c3e:	66 90                	xchg   %ax,%ax
c0102c40:	66 90                	xchg   %ax,%ax
c0102c42:	66 90                	xchg   %ax,%ax
c0102c44:	66 90                	xchg   %ax,%ax
c0102c46:	66 90                	xchg   %ax,%ax
c0102c48:	66 90                	xchg   %ax,%ax
c0102c4a:	66 90                	xchg   %ax,%ax
c0102c4c:	66 90                	xchg   %ax,%ax
c0102c4e:	66 90                	xchg   %ax,%ax
c0102c50:	66 90                	xchg   %ax,%ax
c0102c52:	66 90                	xchg   %ax,%ax
c0102c54:	66 90                	xchg   %ax,%ax
c0102c56:	66 90                	xchg   %ax,%ax
c0102c58:	66 90                	xchg   %ax,%ax
c0102c5a:	66 90                	xchg   %ax,%ax
c0102c5c:	66 90                	xchg   %ax,%ax
c0102c5e:	66 90                	xchg   %ax,%ax
c0102c60:	66 90                	xchg   %ax,%ax
c0102c62:	66 90                	xchg   %ax,%ax
c0102c64:	66 90                	xchg   %ax,%ax
c0102c66:	66 90                	xchg   %ax,%ax
c0102c68:	66 90                	xchg   %ax,%ax
c0102c6a:	66 90                	xchg   %ax,%ax
c0102c6c:	66 90                	xchg   %ax,%ax
c0102c6e:	66 90                	xchg   %ax,%ax
c0102c70:	66 90                	xchg   %ax,%ax
c0102c72:	66 90                	xchg   %ax,%ax
c0102c74:	66 90                	xchg   %ax,%ax
c0102c76:	66 90                	xchg   %ax,%ax
c0102c78:	66 90                	xchg   %ax,%ax
c0102c7a:	66 90                	xchg   %ax,%ax
c0102c7c:	66 90                	xchg   %ax,%ax
c0102c7e:	66 90                	xchg   %ax,%ax
c0102c80:	66 90                	xchg   %ax,%ax
c0102c82:	66 90                	xchg   %ax,%ax
c0102c84:	66 90                	xchg   %ax,%ax
c0102c86:	66 90                	xchg   %ax,%ax
c0102c88:	66 90                	xchg   %ax,%ax
c0102c8a:	66 90                	xchg   %ax,%ax
c0102c8c:	66 90                	xchg   %ax,%ax
c0102c8e:	66 90                	xchg   %ax,%ax
c0102c90:	66 90                	xchg   %ax,%ax
c0102c92:	66 90                	xchg   %ax,%ax
c0102c94:	66 90                	xchg   %ax,%ax
c0102c96:	66 90                	xchg   %ax,%ax
c0102c98:	66 90                	xchg   %ax,%ax
c0102c9a:	66 90                	xchg   %ax,%ax
c0102c9c:	66 90                	xchg   %ax,%ax
c0102c9e:	66 90                	xchg   %ax,%ax
c0102ca0:	66 90                	xchg   %ax,%ax
c0102ca2:	66 90                	xchg   %ax,%ax
c0102ca4:	66 90                	xchg   %ax,%ax
c0102ca6:	66 90                	xchg   %ax,%ax
c0102ca8:	66 90                	xchg   %ax,%ax
c0102caa:	66 90                	xchg   %ax,%ax
c0102cac:	66 90                	xchg   %ax,%ax
c0102cae:	66 90                	xchg   %ax,%ax
c0102cb0:	66 90                	xchg   %ax,%ax
c0102cb2:	66 90                	xchg   %ax,%ax
c0102cb4:	66 90                	xchg   %ax,%ax
c0102cb6:	66 90                	xchg   %ax,%ax
c0102cb8:	66 90                	xchg   %ax,%ax
c0102cba:	66 90                	xchg   %ax,%ax
c0102cbc:	66 90                	xchg   %ax,%ax
c0102cbe:	66 90                	xchg   %ax,%ax
c0102cc0:	66 90                	xchg   %ax,%ax
c0102cc2:	66 90                	xchg   %ax,%ax
c0102cc4:	66 90                	xchg   %ax,%ax
c0102cc6:	66 90                	xchg   %ax,%ax
c0102cc8:	66 90                	xchg   %ax,%ax
c0102cca:	66 90                	xchg   %ax,%ax
c0102ccc:	66 90                	xchg   %ax,%ax
c0102cce:	66 90                	xchg   %ax,%ax
c0102cd0:	66 90                	xchg   %ax,%ax
c0102cd2:	66 90                	xchg   %ax,%ax
c0102cd4:	66 90                	xchg   %ax,%ax
c0102cd6:	66 90                	xchg   %ax,%ax
c0102cd8:	66 90                	xchg   %ax,%ax
c0102cda:	66 90                	xchg   %ax,%ax
c0102cdc:	66 90                	xchg   %ax,%ax
c0102cde:	66 90                	xchg   %ax,%ax
c0102ce0:	66 90                	xchg   %ax,%ax
c0102ce2:	66 90                	xchg   %ax,%ax
c0102ce4:	66 90                	xchg   %ax,%ax
c0102ce6:	66 90                	xchg   %ax,%ax
c0102ce8:	66 90                	xchg   %ax,%ax
c0102cea:	66 90                	xchg   %ax,%ax
c0102cec:	66 90                	xchg   %ax,%ax
c0102cee:	66 90                	xchg   %ax,%ax
c0102cf0:	66 90                	xchg   %ax,%ax
c0102cf2:	66 90                	xchg   %ax,%ax
c0102cf4:	66 90                	xchg   %ax,%ax
c0102cf6:	66 90                	xchg   %ax,%ax
c0102cf8:	66 90                	xchg   %ax,%ax
c0102cfa:	66 90                	xchg   %ax,%ax
c0102cfc:	66 90                	xchg   %ax,%ax
c0102cfe:	66 90                	xchg   %ax,%ax
c0102d00:	66 90                	xchg   %ax,%ax
c0102d02:	66 90                	xchg   %ax,%ax
c0102d04:	66 90                	xchg   %ax,%ax
c0102d06:	66 90                	xchg   %ax,%ax
c0102d08:	66 90                	xchg   %ax,%ax
c0102d0a:	66 90                	xchg   %ax,%ax
c0102d0c:	66 90                	xchg   %ax,%ax
c0102d0e:	66 90                	xchg   %ax,%ax
c0102d10:	66 90                	xchg   %ax,%ax
c0102d12:	66 90                	xchg   %ax,%ax
c0102d14:	66 90                	xchg   %ax,%ax
c0102d16:	66 90                	xchg   %ax,%ax
c0102d18:	66 90                	xchg   %ax,%ax
c0102d1a:	66 90                	xchg   %ax,%ax
c0102d1c:	66 90                	xchg   %ax,%ax
c0102d1e:	66 90                	xchg   %ax,%ax
c0102d20:	66 90                	xchg   %ax,%ax
c0102d22:	66 90                	xchg   %ax,%ax
c0102d24:	66 90                	xchg   %ax,%ax
c0102d26:	66 90                	xchg   %ax,%ax
c0102d28:	66 90                	xchg   %ax,%ax
c0102d2a:	66 90                	xchg   %ax,%ax
c0102d2c:	66 90                	xchg   %ax,%ax
c0102d2e:	66 90                	xchg   %ax,%ax
c0102d30:	66 90                	xchg   %ax,%ax
c0102d32:	66 90                	xchg   %ax,%ax
c0102d34:	66 90                	xchg   %ax,%ax
c0102d36:	66 90                	xchg   %ax,%ax
c0102d38:	66 90                	xchg   %ax,%ax
c0102d3a:	66 90                	xchg   %ax,%ax
c0102d3c:	66 90                	xchg   %ax,%ax
c0102d3e:	66 90                	xchg   %ax,%ax
c0102d40:	66 90                	xchg   %ax,%ax
c0102d42:	66 90                	xchg   %ax,%ax
c0102d44:	66 90                	xchg   %ax,%ax
c0102d46:	66 90                	xchg   %ax,%ax
c0102d48:	66 90                	xchg   %ax,%ax
c0102d4a:	66 90                	xchg   %ax,%ax
c0102d4c:	66 90                	xchg   %ax,%ax
c0102d4e:	66 90                	xchg   %ax,%ax
c0102d50:	66 90                	xchg   %ax,%ax
c0102d52:	66 90                	xchg   %ax,%ax
c0102d54:	66 90                	xchg   %ax,%ax
c0102d56:	66 90                	xchg   %ax,%ax
c0102d58:	66 90                	xchg   %ax,%ax
c0102d5a:	66 90                	xchg   %ax,%ax
c0102d5c:	66 90                	xchg   %ax,%ax
c0102d5e:	66 90                	xchg   %ax,%ax
c0102d60:	66 90                	xchg   %ax,%ax
c0102d62:	66 90                	xchg   %ax,%ax
c0102d64:	66 90                	xchg   %ax,%ax
c0102d66:	66 90                	xchg   %ax,%ax
c0102d68:	66 90                	xchg   %ax,%ax
c0102d6a:	66 90                	xchg   %ax,%ax
c0102d6c:	66 90                	xchg   %ax,%ax
c0102d6e:	66 90                	xchg   %ax,%ax
c0102d70:	66 90                	xchg   %ax,%ax
c0102d72:	66 90                	xchg   %ax,%ax
c0102d74:	66 90                	xchg   %ax,%ax
c0102d76:	66 90                	xchg   %ax,%ax
c0102d78:	66 90                	xchg   %ax,%ax
c0102d7a:	66 90                	xchg   %ax,%ax
c0102d7c:	66 90                	xchg   %ax,%ax
c0102d7e:	66 90                	xchg   %ax,%ax
c0102d80:	66 90                	xchg   %ax,%ax
c0102d82:	66 90                	xchg   %ax,%ax
c0102d84:	66 90                	xchg   %ax,%ax
c0102d86:	66 90                	xchg   %ax,%ax
c0102d88:	66 90                	xchg   %ax,%ax
c0102d8a:	66 90                	xchg   %ax,%ax
c0102d8c:	66 90                	xchg   %ax,%ax
c0102d8e:	66 90                	xchg   %ax,%ax
c0102d90:	66 90                	xchg   %ax,%ax
c0102d92:	66 90                	xchg   %ax,%ax
c0102d94:	66 90                	xchg   %ax,%ax
c0102d96:	66 90                	xchg   %ax,%ax
c0102d98:	66 90                	xchg   %ax,%ax
c0102d9a:	66 90                	xchg   %ax,%ax
c0102d9c:	66 90                	xchg   %ax,%ax
c0102d9e:	66 90                	xchg   %ax,%ax
c0102da0:	66 90                	xchg   %ax,%ax
c0102da2:	66 90                	xchg   %ax,%ax
c0102da4:	66 90                	xchg   %ax,%ax
c0102da6:	66 90                	xchg   %ax,%ax
c0102da8:	66 90                	xchg   %ax,%ax
c0102daa:	66 90                	xchg   %ax,%ax
c0102dac:	66 90                	xchg   %ax,%ax
c0102dae:	66 90                	xchg   %ax,%ax
c0102db0:	66 90                	xchg   %ax,%ax
c0102db2:	66 90                	xchg   %ax,%ax
c0102db4:	66 90                	xchg   %ax,%ax
c0102db6:	66 90                	xchg   %ax,%ax
c0102db8:	66 90                	xchg   %ax,%ax
c0102dba:	66 90                	xchg   %ax,%ax
c0102dbc:	66 90                	xchg   %ax,%ax
c0102dbe:	66 90                	xchg   %ax,%ax
c0102dc0:	66 90                	xchg   %ax,%ax
c0102dc2:	66 90                	xchg   %ax,%ax
c0102dc4:	66 90                	xchg   %ax,%ax
c0102dc6:	66 90                	xchg   %ax,%ax
c0102dc8:	66 90                	xchg   %ax,%ax
c0102dca:	66 90                	xchg   %ax,%ax
c0102dcc:	66 90                	xchg   %ax,%ax
c0102dce:	66 90                	xchg   %ax,%ax
c0102dd0:	66 90                	xchg   %ax,%ax
c0102dd2:	66 90                	xchg   %ax,%ax
c0102dd4:	66 90                	xchg   %ax,%ax
c0102dd6:	66 90                	xchg   %ax,%ax
c0102dd8:	66 90                	xchg   %ax,%ax
c0102dda:	66 90                	xchg   %ax,%ax
c0102ddc:	66 90                	xchg   %ax,%ax
c0102dde:	66 90                	xchg   %ax,%ax
c0102de0:	66 90                	xchg   %ax,%ax
c0102de2:	66 90                	xchg   %ax,%ax
c0102de4:	66 90                	xchg   %ax,%ax
c0102de6:	66 90                	xchg   %ax,%ax
c0102de8:	66 90                	xchg   %ax,%ax
c0102dea:	66 90                	xchg   %ax,%ax
c0102dec:	66 90                	xchg   %ax,%ax
c0102dee:	66 90                	xchg   %ax,%ax
c0102df0:	66 90                	xchg   %ax,%ax
c0102df2:	66 90                	xchg   %ax,%ax
c0102df4:	66 90                	xchg   %ax,%ax
c0102df6:	66 90                	xchg   %ax,%ax
c0102df8:	66 90                	xchg   %ax,%ax
c0102dfa:	66 90                	xchg   %ax,%ax
c0102dfc:	66 90                	xchg   %ax,%ax
c0102dfe:	66 90                	xchg   %ax,%ax
c0102e00:	66 90                	xchg   %ax,%ax
c0102e02:	66 90                	xchg   %ax,%ax
c0102e04:	66 90                	xchg   %ax,%ax
c0102e06:	66 90                	xchg   %ax,%ax
c0102e08:	66 90                	xchg   %ax,%ax
c0102e0a:	66 90                	xchg   %ax,%ax
c0102e0c:	66 90                	xchg   %ax,%ax
c0102e0e:	66 90                	xchg   %ax,%ax
c0102e10:	66 90                	xchg   %ax,%ax
c0102e12:	66 90                	xchg   %ax,%ax
c0102e14:	66 90                	xchg   %ax,%ax
c0102e16:	66 90                	xchg   %ax,%ax
c0102e18:	66 90                	xchg   %ax,%ax
c0102e1a:	66 90                	xchg   %ax,%ax
c0102e1c:	66 90                	xchg   %ax,%ax
c0102e1e:	66 90                	xchg   %ax,%ax
c0102e20:	66 90                	xchg   %ax,%ax
c0102e22:	66 90                	xchg   %ax,%ax
c0102e24:	66 90                	xchg   %ax,%ax
c0102e26:	66 90                	xchg   %ax,%ax
c0102e28:	66 90                	xchg   %ax,%ax
c0102e2a:	66 90                	xchg   %ax,%ax
c0102e2c:	66 90                	xchg   %ax,%ax
c0102e2e:	66 90                	xchg   %ax,%ax
c0102e30:	66 90                	xchg   %ax,%ax
c0102e32:	66 90                	xchg   %ax,%ax
c0102e34:	66 90                	xchg   %ax,%ax
c0102e36:	66 90                	xchg   %ax,%ax
c0102e38:	66 90                	xchg   %ax,%ax
c0102e3a:	66 90                	xchg   %ax,%ax
c0102e3c:	66 90                	xchg   %ax,%ax
c0102e3e:	66 90                	xchg   %ax,%ax
c0102e40:	66 90                	xchg   %ax,%ax
c0102e42:	66 90                	xchg   %ax,%ax
c0102e44:	66 90                	xchg   %ax,%ax
c0102e46:	66 90                	xchg   %ax,%ax
c0102e48:	66 90                	xchg   %ax,%ax
c0102e4a:	66 90                	xchg   %ax,%ax
c0102e4c:	66 90                	xchg   %ax,%ax
c0102e4e:	66 90                	xchg   %ax,%ax
c0102e50:	66 90                	xchg   %ax,%ax
c0102e52:	66 90                	xchg   %ax,%ax
c0102e54:	66 90                	xchg   %ax,%ax
c0102e56:	66 90                	xchg   %ax,%ax
c0102e58:	66 90                	xchg   %ax,%ax
c0102e5a:	66 90                	xchg   %ax,%ax
c0102e5c:	66 90                	xchg   %ax,%ax
c0102e5e:	66 90                	xchg   %ax,%ax
c0102e60:	66 90                	xchg   %ax,%ax
c0102e62:	66 90                	xchg   %ax,%ax
c0102e64:	66 90                	xchg   %ax,%ax
c0102e66:	66 90                	xchg   %ax,%ax
c0102e68:	66 90                	xchg   %ax,%ax
c0102e6a:	66 90                	xchg   %ax,%ax
c0102e6c:	66 90                	xchg   %ax,%ax
c0102e6e:	66 90                	xchg   %ax,%ax
c0102e70:	66 90                	xchg   %ax,%ax
c0102e72:	66 90                	xchg   %ax,%ax
c0102e74:	66 90                	xchg   %ax,%ax
c0102e76:	66 90                	xchg   %ax,%ax
c0102e78:	66 90                	xchg   %ax,%ax
c0102e7a:	66 90                	xchg   %ax,%ax
c0102e7c:	66 90                	xchg   %ax,%ax
c0102e7e:	66 90                	xchg   %ax,%ax
c0102e80:	66 90                	xchg   %ax,%ax
c0102e82:	66 90                	xchg   %ax,%ax
c0102e84:	66 90                	xchg   %ax,%ax
c0102e86:	66 90                	xchg   %ax,%ax
c0102e88:	66 90                	xchg   %ax,%ax
c0102e8a:	66 90                	xchg   %ax,%ax
c0102e8c:	66 90                	xchg   %ax,%ax
c0102e8e:	66 90                	xchg   %ax,%ax
c0102e90:	66 90                	xchg   %ax,%ax
c0102e92:	66 90                	xchg   %ax,%ax
c0102e94:	66 90                	xchg   %ax,%ax
c0102e96:	66 90                	xchg   %ax,%ax
c0102e98:	66 90                	xchg   %ax,%ax
c0102e9a:	66 90                	xchg   %ax,%ax
c0102e9c:	66 90                	xchg   %ax,%ax
c0102e9e:	66 90                	xchg   %ax,%ax
c0102ea0:	66 90                	xchg   %ax,%ax
c0102ea2:	66 90                	xchg   %ax,%ax
c0102ea4:	66 90                	xchg   %ax,%ax
c0102ea6:	66 90                	xchg   %ax,%ax
c0102ea8:	66 90                	xchg   %ax,%ax
c0102eaa:	66 90                	xchg   %ax,%ax
c0102eac:	66 90                	xchg   %ax,%ax
c0102eae:	66 90                	xchg   %ax,%ax
c0102eb0:	66 90                	xchg   %ax,%ax
c0102eb2:	66 90                	xchg   %ax,%ax
c0102eb4:	66 90                	xchg   %ax,%ax
c0102eb6:	66 90                	xchg   %ax,%ax
c0102eb8:	66 90                	xchg   %ax,%ax
c0102eba:	66 90                	xchg   %ax,%ax
c0102ebc:	66 90                	xchg   %ax,%ax
c0102ebe:	66 90                	xchg   %ax,%ax
c0102ec0:	66 90                	xchg   %ax,%ax
c0102ec2:	66 90                	xchg   %ax,%ax
c0102ec4:	66 90                	xchg   %ax,%ax
c0102ec6:	66 90                	xchg   %ax,%ax
c0102ec8:	66 90                	xchg   %ax,%ax
c0102eca:	66 90                	xchg   %ax,%ax
c0102ecc:	66 90                	xchg   %ax,%ax
c0102ece:	66 90                	xchg   %ax,%ax
c0102ed0:	66 90                	xchg   %ax,%ax
c0102ed2:	66 90                	xchg   %ax,%ax
c0102ed4:	66 90                	xchg   %ax,%ax
c0102ed6:	66 90                	xchg   %ax,%ax
c0102ed8:	66 90                	xchg   %ax,%ax
c0102eda:	66 90                	xchg   %ax,%ax
c0102edc:	66 90                	xchg   %ax,%ax
c0102ede:	66 90                	xchg   %ax,%ax
c0102ee0:	66 90                	xchg   %ax,%ax
c0102ee2:	66 90                	xchg   %ax,%ax
c0102ee4:	66 90                	xchg   %ax,%ax
c0102ee6:	66 90                	xchg   %ax,%ax
c0102ee8:	66 90                	xchg   %ax,%ax
c0102eea:	66 90                	xchg   %ax,%ax
c0102eec:	66 90                	xchg   %ax,%ax
c0102eee:	66 90                	xchg   %ax,%ax
c0102ef0:	66 90                	xchg   %ax,%ax
c0102ef2:	66 90                	xchg   %ax,%ax
c0102ef4:	66 90                	xchg   %ax,%ax
c0102ef6:	66 90                	xchg   %ax,%ax
c0102ef8:	66 90                	xchg   %ax,%ax
c0102efa:	66 90                	xchg   %ax,%ax
c0102efc:	66 90                	xchg   %ax,%ax
c0102efe:	66 90                	xchg   %ax,%ax
c0102f00:	66 90                	xchg   %ax,%ax
c0102f02:	66 90                	xchg   %ax,%ax
c0102f04:	66 90                	xchg   %ax,%ax
c0102f06:	66 90                	xchg   %ax,%ax
c0102f08:	66 90                	xchg   %ax,%ax
c0102f0a:	66 90                	xchg   %ax,%ax
c0102f0c:	66 90                	xchg   %ax,%ax
c0102f0e:	66 90                	xchg   %ax,%ax
c0102f10:	66 90                	xchg   %ax,%ax
c0102f12:	66 90                	xchg   %ax,%ax
c0102f14:	66 90                	xchg   %ax,%ax
c0102f16:	66 90                	xchg   %ax,%ax
c0102f18:	66 90                	xchg   %ax,%ax
c0102f1a:	66 90                	xchg   %ax,%ax
c0102f1c:	66 90                	xchg   %ax,%ax
c0102f1e:	66 90                	xchg   %ax,%ax
c0102f20:	66 90                	xchg   %ax,%ax
c0102f22:	66 90                	xchg   %ax,%ax
c0102f24:	66 90                	xchg   %ax,%ax
c0102f26:	66 90                	xchg   %ax,%ax
c0102f28:	66 90                	xchg   %ax,%ax
c0102f2a:	66 90                	xchg   %ax,%ax
c0102f2c:	66 90                	xchg   %ax,%ax
c0102f2e:	66 90                	xchg   %ax,%ax
c0102f30:	66 90                	xchg   %ax,%ax
c0102f32:	66 90                	xchg   %ax,%ax
c0102f34:	66 90                	xchg   %ax,%ax
c0102f36:	66 90                	xchg   %ax,%ax
c0102f38:	66 90                	xchg   %ax,%ax
c0102f3a:	66 90                	xchg   %ax,%ax
c0102f3c:	66 90                	xchg   %ax,%ax
c0102f3e:	66 90                	xchg   %ax,%ax
c0102f40:	66 90                	xchg   %ax,%ax
c0102f42:	66 90                	xchg   %ax,%ax
c0102f44:	66 90                	xchg   %ax,%ax
c0102f46:	66 90                	xchg   %ax,%ax
c0102f48:	66 90                	xchg   %ax,%ax
c0102f4a:	66 90                	xchg   %ax,%ax
c0102f4c:	66 90                	xchg   %ax,%ax
c0102f4e:	66 90                	xchg   %ax,%ax
c0102f50:	66 90                	xchg   %ax,%ax
c0102f52:	66 90                	xchg   %ax,%ax
c0102f54:	66 90                	xchg   %ax,%ax
c0102f56:	66 90                	xchg   %ax,%ax
c0102f58:	66 90                	xchg   %ax,%ax
c0102f5a:	66 90                	xchg   %ax,%ax
c0102f5c:	66 90                	xchg   %ax,%ax
c0102f5e:	66 90                	xchg   %ax,%ax
c0102f60:	66 90                	xchg   %ax,%ax
c0102f62:	66 90                	xchg   %ax,%ax
c0102f64:	66 90                	xchg   %ax,%ax
c0102f66:	66 90                	xchg   %ax,%ax
c0102f68:	66 90                	xchg   %ax,%ax
c0102f6a:	66 90                	xchg   %ax,%ax
c0102f6c:	66 90                	xchg   %ax,%ax
c0102f6e:	66 90                	xchg   %ax,%ax
c0102f70:	66 90                	xchg   %ax,%ax
c0102f72:	66 90                	xchg   %ax,%ax
c0102f74:	66 90                	xchg   %ax,%ax
c0102f76:	66 90                	xchg   %ax,%ax
c0102f78:	66 90                	xchg   %ax,%ax
c0102f7a:	66 90                	xchg   %ax,%ax
c0102f7c:	66 90                	xchg   %ax,%ax
c0102f7e:	66 90                	xchg   %ax,%ax
c0102f80:	66 90                	xchg   %ax,%ax
c0102f82:	66 90                	xchg   %ax,%ax
c0102f84:	66 90                	xchg   %ax,%ax
c0102f86:	66 90                	xchg   %ax,%ax
c0102f88:	66 90                	xchg   %ax,%ax
c0102f8a:	66 90                	xchg   %ax,%ax
c0102f8c:	66 90                	xchg   %ax,%ax
c0102f8e:	66 90                	xchg   %ax,%ax
c0102f90:	66 90                	xchg   %ax,%ax
c0102f92:	66 90                	xchg   %ax,%ax
c0102f94:	66 90                	xchg   %ax,%ax
c0102f96:	66 90                	xchg   %ax,%ax
c0102f98:	66 90                	xchg   %ax,%ax
c0102f9a:	66 90                	xchg   %ax,%ax
c0102f9c:	66 90                	xchg   %ax,%ax
c0102f9e:	66 90                	xchg   %ax,%ax
c0102fa0:	66 90                	xchg   %ax,%ax
c0102fa2:	66 90                	xchg   %ax,%ax
c0102fa4:	66 90                	xchg   %ax,%ax
c0102fa6:	66 90                	xchg   %ax,%ax
c0102fa8:	66 90                	xchg   %ax,%ax
c0102faa:	66 90                	xchg   %ax,%ax
c0102fac:	66 90                	xchg   %ax,%ax
c0102fae:	66 90                	xchg   %ax,%ax
c0102fb0:	66 90                	xchg   %ax,%ax
c0102fb2:	66 90                	xchg   %ax,%ax
c0102fb4:	66 90                	xchg   %ax,%ax
c0102fb6:	66 90                	xchg   %ax,%ax
c0102fb8:	66 90                	xchg   %ax,%ax
c0102fba:	66 90                	xchg   %ax,%ax
c0102fbc:	66 90                	xchg   %ax,%ax
c0102fbe:	66 90                	xchg   %ax,%ax
c0102fc0:	66 90                	xchg   %ax,%ax
c0102fc2:	66 90                	xchg   %ax,%ax
c0102fc4:	66 90                	xchg   %ax,%ax
c0102fc6:	66 90                	xchg   %ax,%ax
c0102fc8:	66 90                	xchg   %ax,%ax
c0102fca:	66 90                	xchg   %ax,%ax
c0102fcc:	66 90                	xchg   %ax,%ax
c0102fce:	66 90                	xchg   %ax,%ax
c0102fd0:	66 90                	xchg   %ax,%ax
c0102fd2:	66 90                	xchg   %ax,%ax
c0102fd4:	66 90                	xchg   %ax,%ax
c0102fd6:	66 90                	xchg   %ax,%ax
c0102fd8:	66 90                	xchg   %ax,%ax
c0102fda:	66 90                	xchg   %ax,%ax
c0102fdc:	66 90                	xchg   %ax,%ax
c0102fde:	66 90                	xchg   %ax,%ax
c0102fe0:	66 90                	xchg   %ax,%ax
c0102fe2:	66 90                	xchg   %ax,%ax
c0102fe4:	66 90                	xchg   %ax,%ax
c0102fe6:	66 90                	xchg   %ax,%ax
c0102fe8:	66 90                	xchg   %ax,%ax
c0102fea:	66 90                	xchg   %ax,%ax
c0102fec:	66 90                	xchg   %ax,%ax
c0102fee:	66 90                	xchg   %ax,%ax
c0102ff0:	66 90                	xchg   %ax,%ax
c0102ff2:	66 90                	xchg   %ax,%ax
c0102ff4:	66 90                	xchg   %ax,%ax
c0102ff6:	66 90                	xchg   %ax,%ax
c0102ff8:	66 90                	xchg   %ax,%ax
c0102ffa:	66 90                	xchg   %ax,%ax
c0102ffc:	66 90                	xchg   %ax,%ax
c0102ffe:	66 90                	xchg   %ax,%ax

Disassembly of section .text.startup:

c0103000 <main>:
c0103000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
c0103004:	83 e4 f0             	and    $0xfffffff0,%esp
c0103007:	ff 71 fc             	pushl  -0x4(%ecx)
c010300a:	55                   	push   %ebp
c010300b:	89 e5                	mov    %esp,%ebp
c010300d:	51                   	push   %ecx
c010300e:	83 ec 04             	sub    $0x4,%esp
c0103011:	e8 3a e0 ff ff       	call   c0101050 <console_clear>
c0103016:	83 ec 08             	sub    $0x8,%esp
c0103019:	68 00 00 40 c0       	push   $0xc0400000
c010301e:	68 60 b9 10 c0       	push   $0xc010b960
c0103023:	e8 e8 ee ff ff       	call   c0101f10 <recyclemem>
c0103028:	e8 d3 f0 ff ff       	call   c0102100 <dct_phy_mem>
c010302d:	e8 ce f1 ff ff       	call   c0102200 <build_kpgdir>
c0103032:	e8 59 f0 ff ff       	call   c0102090 <gdt_init>
c0103037:	e8 e4 db ff ff       	call   c0100c20 <idt_init>
c010303c:	e8 af da ff ff       	call   c0100af0 <ptabinit>
c0103041:	58                   	pop    %eax
c0103042:	a1 0c b1 10 c0       	mov    0xc010b10c,%eax
c0103047:	5a                   	pop    %edx
c0103048:	2d 00 00 00 40       	sub    $0x40000000,%eax
c010304d:	50                   	push   %eax
c010304e:	68 00 00 40 c0       	push   $0xc0400000
c0103053:	e8 48 ee ff ff       	call   c0101ea0 <dorecycle>
c0103058:	e8 e3 da ff ff       	call   c0100b40 <backtouser>
c010305d:	e8 ee da ff ff       	call   c0100b50 <scheduler>
c0103062:	83 c4 10             	add    $0x10,%esp
c0103065:	eb fe                	jmp    c0103065 <main+0x65>
