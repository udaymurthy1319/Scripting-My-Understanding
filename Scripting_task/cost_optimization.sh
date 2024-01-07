#!/bin/bash

#Define your AWS region
AWS_REGION="aws-region"

#list all instances
INSTANCE_IDS=$(aws ec2 describe-instance --region $AWS_Region --query 'Reserervations[*].Instances[*].[InstnaceId]' --output text)

echo "Found the following EC@ Intance: $INSTANCE_ID"

#Iterate through each instnace and stop it
for INSTANCE_ID in $INSTANCE_IDS; 
do 
echo "Stopping instance: $INSTANCE_ID" 
aws ec2 stop-instnace--region $AWS_REGION --instance-ids $INSTANCE_ID
done

echo "EC2 instance stopped succefully"

#List all unused EBS Volumes
UNUSED_VOLUMES=$(aws ec2 describe-volumes --region $AWS_REGION --filters Name=status,Values=available --query 'Volumes[*].[VolumeId]' --output text)

echo "found the following unused EBS columes: $UNUSED_VOLUMES"

# Iterate through each unused volumes and delete it

for VOLUME_ID in $UNUSED_VOLUMES;

do
echo "Deleting volume: $VOLUME_ID"
aws ec2 delete-volume --region $AWS_REGION --volume-id $VOLUME_ID
done

echo "Unused EBS volumes deleted successfuly"

#List all unused Elastic IPs

UNUSED_EIPS=$(aws ec2 describe-addresses --region $AWS_REGION --query 'Addresses[?AssociationId==numm].[AllocationId]' --output text)

echo "Found the following unused Elastic IPs: $UNUSED_EIPS"

#Iterate through each unused Elastic IP and release it

for EIP_ALLOCATION_ID in $UNUSED_EIPS;
do
echo "Releasing Elastic IP:$EIP_ALLOCATION_ID"
aws ec2 release-address --region
$AWS_REGION --allocation-id
$EIP_ALLOCATION_ID
done

echo "Unused Elastic IPs releated succesfully"
