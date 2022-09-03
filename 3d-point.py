# # Import libraries
# import matplotlib.pyplot as plt
# from mpl_toolkits.mplot3d import Axes3D
# import numpy as np
#
#
# # Create axis
# axes = [5, 5, 5]
#
# # Create Data
# data = np.ones(axes)
#
# # Control Transparency
# alpha = 0.5
#
# # Control colour
# colors = np.empty(axes + [4], dtype=np.float32)
#
# colors[0] = [1, 0, 0, alpha] # red
# colors[1] = [0, 1, 0, alpha] # green
# colors[2] = [0, 0, 1, alpha] # blue
# colors[3] = [1, 1, 0, alpha] # yellow
# colors[4] = [1, 1, 1, alpha] # grey
#
# # Plot figure
# fig = plt.figure()
# ax = fig.add_subplot(111, projection='3d')
#
# # Voxels is used to customizations of
# # the sizes, positions and colors.
# ax.voxels(data, facecolors=colors, edgecolors='grey')
#
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

fig = plt.figure()
ax = fig.gca(projection='3d')
# Make grid
voxels = np.zeros((6, 6, 6))
# Activate single Voxel
voxels[0, 0, 0] = True

x,y,z = np.indices(np.array(voxels.shape)+1)

ax.voxels(x*0.1, y * 0.5, z, voxels, edgecolor="k")
ax.set_xlabel('0 - Dim')
ax.set_ylabel('1 - Dim')
ax.set_zlabel('2 - Dim')

# plt.show()

plt.savefig('test.png')
