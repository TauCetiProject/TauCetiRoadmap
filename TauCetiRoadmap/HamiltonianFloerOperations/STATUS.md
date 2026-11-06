<!--tauceti-status:v1 {"roadmap":"HamiltonianFloerOperations","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
# Status: HamiltonianFloerOperations

This file documents the status of the HamiltonianFloerOperations roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** H1's coefficient algebra is essentially complete in abstract form, including the cochain regrading. H2 and H3 are well under way on the explicit domain ℂ ∖ {0, 1}, but their analytic results still map into a symplectic vector space, not a closed manifold. H6's product laws exist as formal algebra waiting for counts. There are no moduli spaces, counts, compactness or gluing, and H5 and H7 have not begun.

### Named results

- **The pair-of-pants energy identity** — for a Floer solution on the pair of pants with the standard end perturbation, the energy is the input actions minus the output action, corrected by curvature. This gives H3's energy and action bounds, but only for a vector-space target ([`lintegral_floerEnergyDensity_pairOfPantsPerturbation_eq`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PairOfPants/Action.html#TauCeti.SymplecticForm.lintegral_floerEnergyDensity_pairOfPantsPerturbation_eq)).
- **The Floer energy identity on rectangles** — energy is symplectic area plus the boundary term of K minus the curvature R_K. The pair-of-pants version is assembled from it ([`integral_floerEnergyDensity`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Energy.html#TauCeti.SymplecticForm.integral_floerEnergyDensity)).
- **Uniform curvature bounds under neck-stretching** — inserting a neck of any length where K is cylindrical leaves the integrated curvature bounded independently of the length, as H3 requires ([`integral_abs_hamiltonianCurvature_neckStretch_le`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Neck.html#TauCeti.SymplecticForm.integral_abs_hamiltonianCurvature_neckStretch_le)).
- **Bubbles are holomorphic for the frozen structure** — rescaled limits of Floer solutions with domain-dependent J are holomorphic for J frozen at the bubbling point, and a bubble's area is at most the energy concentrating there ([`isComplexLinearMap_of_tendsto_rescale`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Rescaling.html#TauCeti.SymplecticForm.isComplexLinearMap_of_tendsto_rescale)).
- **Associativity on cohomology from a kernel homotopy** — if the two broken triple products differ by the boundary of a homotopy kernel, the product is associative on cocycles up to coboundaries, with Koszul signs. Commutativity, unit and continuation laws have the same form ([`kernelProduct_kernelProduct_sub_kernelProduct_kernelProduct_mem_coboundaries`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovModule/Associativity.html#TauCeti.NovikovModule.kernelProduct_kernelProduct_sub_kernelProduct_kernelProduct_mem_coboundaries)).

### Notable definitions and infrastructure

- **The pair-of-pants perturbation** — [`pairOfPantsPerturbation`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PairOfPants/Basic.html#TauCeti.Floer.pairOfPantsPerturbation) is the one-form on ℂ ∖ {0, 1} equal to H_q dt far out on each cylindrical end. All estimates on the actual domain are stated for it, and a [plumbing map](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/ThricePuncturedSphere/Plumbing.html#TauCeti.ThricePuncturedSphere.Puncture.plumbingMap_image_union) glues two such domains into the four-punctured sphere that associativity needs.
- **The cochain regrading** — [`regradeEquivalence`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/Embedding/Regrade.html#ChainComplex.regradeEquivalence) gives C^k = K_(n−k) as an equivalence of categories, with homology identified degree by degree. It moves the product from degree −n to degree zero.
- **Kernel products on completed modules** — [`kernelProduct`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovModule/Bilinear.html#TauCeti.NovikovModule.kernelProduct) turns a supported coefficient kernel into a Novikov-bilinear map. Its [operator readout](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovModule/Readout.html#TauCeti.NovikovModule.kernelReadout) converts a count functional into an operator with H4's graded sign. Rigid pair-of-pants counts are meant to supply the kernel.

### Roadmap coverage

H1 is done in abstract form: period group, caps and recapping, the graded Novikov ring with its monotone Laurent model and residue grading, the coefficient comparison and the regrading. It lacks the Hurewicz image and Chern class of an actual manifold, G7's class group, and regraded orientation lines. H2 is partial. It has the three-ended domain with end charts, truncations and plumbing, the end perturbation, plumbed tame and compatible structures, Cayley paths and the Floer linearization. Stable domain charts, corner-data extension and manifold-target data are missing. H3 is partial. It has energy identities, bounds and coercivity on the pair of pants for a vector-space target, uniform curvature bounds over stretched and interpolated families, and the first bubbling step. Compactness and the manifold-target integrated identity are missing. H4 has only localized Hamiltonian variations realizing every direction of the Floer operator; there is no Fredholm theory, transversality, gluing or orientation. H6 has the bilinear product and its formal laws, but no counts, no m2 and no unit cycle. H5 and H7 are untouched, and no H8 check has been done.

## The frontier

- **The energy identity on a manifold target** — integrate the existing pointwise manifold identity over the truncated pair of pants, so the action and energy bounds hold in a closed symplectic manifold.
- **Gromov–Floer compactness** — rescaling, the frozen-J limit, the area bound and point picking exist. Convergence modulo bubbling, energy quantization, breaking at the ends and parameter faces remain.
- **Attaching Γ and caps to a manifold** — take the period group to be the spherical Hurewicz image with true area and Chern class, and instantiate G7's class group. This waits on Hurewicz and Chern-class interfaces from lower roadmaps.
- **The Fredholm problem on the punctured domain** — extend the linearization to the weighted operator on S with end asymptotics, and use the localized variations for transversality. This consumes HeegaardFloer F0–F2.
- **Counts feeding H6** — the product laws hold for any kernels obeying the boundary identities. Supplying them needs rigid and one-dimensional moduli spaces with oriented boundary, so this is blocked on compactness and H4.
