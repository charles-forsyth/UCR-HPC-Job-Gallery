import numpy as np
import time


def nbody_step(pos, vel, mass, G=6.67430e-11, dt=0.01):
    n = pos.shape[0]
    acc = np.zeros_like(pos)
    for i in range(n):
        for j in range(n):
            if i != j:
                r = pos[j] - pos[i]
                dist_sq = np.sum(r**2)
                dist = np.sqrt(dist_sq)
                f = G * mass[j] / (dist_sq + 1e-9)
                acc[i] += f * r / dist
    vel += acc * dt
    pos += vel * dt
    return pos, vel


def main():
    n_bodies = 100
    steps = 100

    # Initialize random positions and velocities
    pos = np.random.rand(n_bodies, 3) * 1e9  # Scale for astronomical distances
    vel = np.random.randn(n_bodies, 3) * 1e3
    mass = np.random.rand(n_bodies) * 1e24  # Planet/Star masses

    start_time = time.time()
    for step in range(steps):
        pos, vel = nbody_step(pos, vel, mass)
        if step % 10 == 0:
            print(f"Step {step}/{steps} complete.")

    end_time = time.time()
    print(f"Simulation complete. Time elapsed: {end_time - start_time:.4f}s")


if __name__ == "__main__":
    main()
