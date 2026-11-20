<!--tauceti-status:v1 {"roadmap":"HamiltonianFloerOperations","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
# Status: HamiltonianFloerOperations

This file documents the status of the HamiltonianFloerOperations roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** H1 is complete in abstract form, and caps now carry an action on an actual manifold. H3's energy theory and end convergence hold on a manifold, but compactness off bubbling points holds there only inside one chart. H4 has the first Sobolev theorems, for a cylinder into a vector space. There is no punctured-domain Fredholm theory, gluing or orientation of moduli. H6 and half of H7 are formal algebra waiting for counts, and H5 has not begun.

### Named results

- **The linearized operator is semi-Fredholm** — along a Floer trajectory between nondegenerate orbits, the linearized operator from W^{1,2}(ℝ × S¹) to L² has [finite-dimensional kernel](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/SobolevRealization.html#TauCeti.SymplecticForm.finiteDimensional_ker_floerSobolevOperator) and [closed range](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/SobolevRealization.html#TauCeti.SymplecticForm.isClosed_range_floerSobolevOperator), for a vector-space target.
- **Breaking at the ends in a closed manifold** — a finite-energy Floer pair of pants converges to a periodic orbit along each of its three ends ([`exists_mem_periodicSolutions_tendstoUniformly_endChart_of_floer`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PairOfPants/End/Manifold.html#TauCeti.SmoothTwoForm.IsNondegenerate.exists_mem_periodicSolutions_tendstoUniformly_endChart_of_floer)). Half-cylinders and PSS planes satisfy the same result.
- **The pair-of-pants energy identity** — on a manifold target, the energy of a Floer pair of pants is the input actions minus the output action, corrected by curvature ([`integral_floerEnergyDensity_pairOfPantsPerturbation`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PairOfPants/Energy/Asymptotic.html#TauCeti.SmoothTwoForm.IsNondegenerate.integral_floerEnergyDensity_pairOfPantsPerturbation)). Its analogues cover the continuation, exchange, capped, plumbed and associativity families.
- **The pre-gluing error is exponentially small** — gluing a Floer cylinder to an end of a Floer pair of pants along a neck of length R gives a map whose Floer operator decays exponentially in R ([`exists_eventually_norm_floerOperator_pairOfPantsPreglue_comp_le_of_floer`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PairOfPants/Pregluing.html#TauCeti.SymplecticForm.exists_eventually_norm_floerOperator_pairOfPantsPreglue_comp_le_of_floer)). It is proved for a vector-space target.
- **Product and PSS laws from kernel homotopies** — given the relevant homotopies, class-indexed counts form an associative, graded-commutative, unital product on cohomology, and the PSS maps are [multiplicative on cohomology](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Cap/Comparison.html#TauCeti.Floer.cohomologyMap_cohomologyProduct_kernelProduct_coefficientComparison).

### Notable definitions and infrastructure

- **Sobolev space on the cylinder** — [`CylinderSobolev.H1`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Cylinder.html#TauCeti.CylinderSobolev.H1) is W^{1,2}(ℝ × S¹, V), with Rellich's theorem and Peetre's argument.
- **Capped action on a manifold** — [`RawCap.action`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Cap/Action.html#TauCeti.Floer.RawCap.action) is defined on a manifold. It obeys the recapping law, and it is computed by any smooth cap; a smooth loop has a smooth cap exactly when it is null-homotopic. With [`sphereIntegralHom`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/Integration/Sphere.html#TauCeti.sphereIntegralHom), this attaches H1's action to an actual symplectic manifold.
- **Cap classes and kernel products** — caps form a [torsor under the spherical period group](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Cap/Loop.html#TauCeti.Floer.SphericalCapClass.instAddTorsor), and [`kernelProduct`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovModule/Bilinear.html#TauCeti.NovikovModule.kernelProduct) turns a supported coefficient kernel into a bilinear map on completed Novikov modules.

### Roadmap coverage

H1 is done in abstract form, with caps, area and action on actual spaces. The first Chern class on a manifold, G7's class group and the regraded orientation lines are missing. H2 is partial: every product, exchange, continuation, capped and associativity family carries smooth data on a manifold, and the thrice-punctured sphere has no nontrivial puncture-preserving automorphisms. Stable domain charts and corner jets are missing. H3 is partial. Energy identities, uniform curvature bounds, end convergence and class splitting at sphere bubbles hold on a manifold. Convergence off bubbling points holds on a manifold only for solutions inside one symplectic chart, and sphere trees, broken limits and parameter faces are missing. H4 is partial: end estimates, pre-gluing, the formal adjoint and semi-Fredholm theory hold on the cylinder, for a vector-space target. There is no Fredholm index, operator on the punctured domain, regular moduli, gluing theorem or oriented moduli. H6 has only formal laws, now including the unit, but no counts, m2 or unit cycle. H7 has its algebraic half and the comparison family's data, but not the Morse quantum operation or any moduli. H5 is untouched. Three of H8's checks are done: the dense-period example, the algebraic Γ = 0 reduction and the coefficient side of the S² check. The small Morse Hamiltonian check has begun.

## The frontier

- **Fredholm index on the cylinder** — kernel and closed range are done. A finite-dimensional cokernel, presumably through the formal adjoint and Green's formula already present, gives Fredholmness and then the index.
- **The Fredholm problem on the punctured domain** — the weighted operator on S and its index are next, consuming HeegaardFloer F0–F2.
- **Gromov–Floer compactness on a manifold** — chart-local convergence off bubbling points and convergence where energy density is bounded must be patched into a global statement. Sphere trees, Floer breaking and parameter faces come after that.
- **Gluing and orientations** — pre-gluing and quadratic estimates exist. A uniformly bounded right inverse, the Newton iteration and oriented moduli remain, all after the Fredholm setup.
- **Attaching Γ to a closed symplectic manifold** — area and action exist on a manifold. The first Chern class and G7's class group remain.
