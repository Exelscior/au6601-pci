# Driver for PCI driver for Alcor Micro AU6601 Secure Digital Host Controller Interface
#
# Copyright(c) Joshua Logan <joshua.logan@eveco.re>
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 3, or (at your option) any
# later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, see <http://www.gnu.org/licenses/>.
#
# Original Author:
#   Oleksij Rempel <linux@rempel-privat.de>
#
# Author:
#   Joshua Logan <joshua.logan@eveco.re>
#
# Makefile for the PCI-Express Card Reader drivers.
#

TARGET_MODULE := au6601-pci
KVERSION := $(shell uname -r)

#EXTRA_CFLAGS := -Idrivers/scsi 

obj-m += $(TARGET_MODULE).o

$(TARGET_MODULE)-objs := au6601.o

default:
	make -C /lib/modules/$(KVERSION)/build/ SUBDIRS=$(PWD) modules
install:
	cp $(TARGET_MODULE).ko /lib/modules/$(KVERSION)/kernel/drivers/scsi -f
clean:
	rm -f *.o *.ko
	rm -f $(TARGET_MODULE).mod.c

