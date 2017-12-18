#!/bin/sh

dnf update --assumeyes &&
    dnf install --assumeyes gnupg &&
    dnf install --assumeyes gnupg && 
    dnf install --assumeyes pass &&
    dnf install --assumeyes findutils &&
    dnf update --assumeyes &&
    dnf clean all