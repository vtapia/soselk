#!/bin/bash
# First iteration of sosreport feeder

LOGSTASH_IP="10.230.65.1"

SFCASENUM=$1
SOSREPORTDIR=$2


#function create-conf {
#	HOST=$(cat hostname)
#	INDEX="${SFCASENUM}-${HOST}"
#}

function xmit_logs {
	echo "= syslog ="
	ls -rv ${SOSREPORTDIR}/var/log/syslog* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3000

	echo "= nova ="
	ls -rv ${SOSREPORTDIR}/var/log/nova/nova* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3001

	echo "= neutron ="
	ls -rv ${SOSREPORTDIR}/var/log/neutron/neutron* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3002

	echo "= glance ="
	# ls -rv ${SOSREPORTDIR}/var/log/syslog* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3003

	echo "= keystone ="
	# ls -rv ${SOSREPORTDIR}/var/log/syslog* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3004

	echo "= ceilometer ="
	# ls -rv ${SOSREPORTDIR}/var/log/syslog* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3005

	echo "= heat ="
	# ls -rv ${SOSREPORTDIR}/var/log/syslog* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3006

	echo "= rabbitmq ="
	# ls -rv ${SOSREPORTDIR}/var/log/syslog* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3007

	echo "= horizon ="
	# ls -rv ${SOSREPORTDIR}/var/log/syslog* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3008

	echo "= libvirt ="
	ls -rv ${SOSREPORTDIR}/var/log/libvirt/qemu/*.log | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3009

	echo "= ovs ="
	ls -rv ${SOSREPORTDIR}/var/log/openvswitch/ovs* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3010

	echo "= ceph ="
	ls -rv ${SOSREPORTDIR}/var/log/ceph/ceph-osd* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3011

	echo "= auth ="
	ls -rv ${SOSREPORTDIR}/var/log/auth* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3012

	echo "= kern ="
	ls -rv ${SOSREPORTDIR}/var/log/kern.* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3013
	ls -rv ${SOSREPORTDIR}/var/log/dmesg | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3013

	echo "= apt ="
	ls -rv ${SOSREPORTDIR}/var/log/syslog* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3014

	echo "= cloud-init ="
	ls -rv ${SOSREPORTDIR}/var/log/cloud-init* | xargs zcat -f | nc -q0 ${LOGSTASH_IP} 3015
}

xmit_logs
