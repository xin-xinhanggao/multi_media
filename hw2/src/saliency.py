# system imports
import os

# library imports
import cv2
import numpy as np
from skimage.color import rgb2lab
from skimage.io import imread, imsave


N_THRESHOLDS = 10


def activate_boolean_map(bool_map):
    """
        Performs activation on a single boolean map.
    """

    # use the boolean map as a mask for flood filling
    activation = np.array(bool_map, dtype=np.uint8)
    mask_shape = (bool_map.shape[0] + 2, bool_map.shape[1] + 2)
    ffill_mask = np.zeros(mask_shape, dtype=np.uint8)

    # top and bottom rows
    for i in range(0, activation.shape[0]):
        for j in [0, activation.shape[1] - 1]:
            if activation[i,j]:
                cv2.floodFill(activation, ffill_mask, (j, i), 0)

    # left and right columns
    for i in [0, activation.shape[0] - 1]:
        for j in range(0, activation.shape[1]):
            if activation[i,j]:
                cv2.floodFill(activation, ffill_mask, (j, i), 0)

    return activation

def compute_saliency(img):
    """
        Computes Boolean Map Saliency (BMS).
    """

    img_lab = rgb2lab(img)
    img_lab -= img_lab.min()
    img_lab /= img_lab.max()
    thresholds = np.arange(0, 1, 1.0 / N_THRESHOLDS)[1:]

    # compute boolean maps
    bool_maps = []
    for thresh in thresholds:
        img_lab_T = img_lab.transpose(2, 0, 1)
        img_thresh = (img_lab_T > thresh)
        bool_maps.extend(list(img_thresh))

    # compute mean attention map
    attn_map = np.zeros(img_lab.shape[:2], dtype=np.float)
    for bool_map in bool_maps:
        attn_map += activate_boolean_map(bool_map)
    attn_map /= N_THRESHOLDS

    # gaussian smoothing
    attn_map = cv2.GaussianBlur(attn_map, (0, 0), 3)

    # perform normalization
    norm = np.sqrt((attn_map**2).sum())
    attn_map /= norm
    attn_map /= attn_map.max() / 255

    return attn_map.astype(np.uint8)

