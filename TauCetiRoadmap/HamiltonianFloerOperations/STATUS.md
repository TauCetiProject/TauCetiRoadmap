<!--tauceti-status:v1 {"roadmap":"HamiltonianFloerOperations","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
# Status: HamiltonianFloerOperations

This file documents the status of the HamiltonianFloerOperations roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** H1 is complete in abstract form. H3's energy theory and end convergence hold on a manifold, but compactness away from the ends only on a vector space. H4 has linear and pre-gluing estimates on a vector space, but no Fredholm theory on the punctured domain, gluing or orientations. H6 and half of H7 are formal algebra waiting for counts; H5 has not begun.

### Named results

- **Breaking at the end in a closed manifold** — a finite-energy Floer half-cylinder in a compact manifold converges to a periodic orbit along its end ([`exists_mem_periodicSolutions_tendstoUniformly_of_floer`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/HalfCylinder/Manifold.html#TauCeti.SmoothTwoForm.IsNondegenerate.exists_mem_periodicSolutions_tendstoUniformly_of_floer)).
- **The pair-of-pants energy identity** — on a manifold target, the energy of a Floer pair of pants is the input actions minus the output action, corrected by curvature ([`integral_floerEnergyDensity_pairOfPantsPerturbation`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PairOfPants/Energy/Asymptotic.html#TauCeti.SmoothTwoForm.IsNondegenerate.integral_floerEnergyDensity_pairOfPantsPerturbation)). It also holds for PSS planes, the capped cylinder and the plumbed sphere.
- **The weighted estimate on an end** — at a nondegenerate orbit, the linearized Floer operator controls its argument in an exponentially weighted L² norm for all small weights, on a vector-space target ([`eventually_exists_mem_forall_setIntegral_exp_mul_le_mul_setIntegral_floerLinearization`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/EndLinearization.html#TauCeti.SymplecticForm.eventually_exists_mem_forall_setIntegral_exp_mul_le_mul_setIntegral_floerLinearization)).
- **The pre-gluing error is exponentially small** — splicing two Floer cylinders that meet at a nondegenerate orbit along a neck of length R gives a map whose Floer operator decays exponentially in R ([`exists_eventually_norm_floerOperator_preglue_le_of_floerOperator_eq_zero`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Pregluing.html#TauCeti.SymplecticForm.exists_eventually_norm_floerOperator_preglue_le_of_floerOperator_eq_zero)). With the [quadratic estimate](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/QuadraticEstimate.html#TauCeti.SymplecticForm.exists_pos_forall_norm_floerOperator_sub_floerOperator_sub_floerLinearization_le), this is what a Newton iteration needs.
- **Product laws from kernel homotopies** — if the relevant broken products differ by the boundary of a homotopy kernel, class-indexed counts are associative, [graded commutative](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Cap/Product.html#TauCeti.Floer.novikovProductOfMatrix_sub_negOnePowCast_smul_novikovProductOfMatrix_mem_coboundaries) and compatible with continuation on cohomology ([`cohomologyProduct_kernelProduct_coefficientComparison_assoc`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Cap/Product.html#TauCeti.Floer.cohomologyProduct_kernelProduct_coefficientComparison_assoc)).

### Notable definitions and infrastructure

- **Area on π₂** — [`sphereIntegralHom`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/Integration/Sphere.html#TauCeti.sphereIntegralHom) integrates a closed two-form over classes in π₂, as a homomorphism invariant under change of base point. This is the true area map that H1's cap classes have so far taken as given.
- **Cap classes and kernel products** — caps form a [torsor under the spherical period group](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Cap/Loop.html#TauCeti.Floer.SphericalCapClass.instAddTorsor), and [`kernelProduct`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovModule/Bilinear.html#TauCeti.NovikovModule.kernelProduct) turns a supported coefficient kernel into a bilinear map on completed Novikov modules. Rigid counts are meant to supply the kernel.
- **The capping structure on a manifold** — the [capping almost complex structure](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PairOfPants/AlmostComplex/Manifold/Capping.html#TauCeti.SmoothTwoForm.Compatible.contMDiff_cappingAlmostComplex) plumbs PSS planes into the ends of the pair of pants, smoothly in the neck length. With the continuation-neck and exchange structures, every family of H6 and H7 now carries smooth compatible data on a manifold.

### Roadmap coverage

H1 is done in abstract form, with caps on actual spaces and the true area on π₂; the first Chern class, G7's class group and the regraded orientation lines are missing. H2 is partial: every product, exchange, continuation and capped family carries smooth data on a manifold, but stable domain charts and corner jets are missing. H3 is partial: energy identities, end convergence, rescaling and the translation slice hold on a manifold, while convergence off bubbling points (now over parameter windows) holds only on a vector space; sphere trees and parameter faces are missing. H4 is partial: end estimates, pre-gluing, cokernel-detecting variations and continuity of complex orientations exist, but no Fredholm theory on the punctured domain, regular moduli, gluing theorem or oriented moduli. H6 has only formal laws, with no counts, m2 or unit cycle. H7 has its algebraic half and the comparison family's data, but not the Morse quantum operation or any moduli. H5 is untouched. Of H8's checks, the dense-period example and the algebraic Γ = 0 reduction are done; identifying time-independent Floer cylinders with gradient lines starts the small Morse Hamiltonian check.

## The frontier

- **Gromov–Floer compactness on a manifold** — end convergence and rescaling hold on a manifold; convergence off bubbling points must follow, then sphere trees and parameter faces.
- **The Fredholm problem on the punctured domain** — weighted end estimates exist on a vector space. The weighted Sobolev operator on S and its index are next, consuming HeegaardFloer F0–F2.
- **Gluing** — the pre-gluing error and quadratic estimate are in place for two cylinders. A uniformly bounded right inverse on the glued domain and the Newton iteration remain; both need the Fredholm setup.
- **Orientations** — complex orientations of determinant lines vary continuously. Orienting moduli with H4's ordered end, sphere and node conventions remains.
- **Attaching Γ to a closed symplectic manifold** — the area on π₂ exists. Instantiating the cap classes with it, the first Chern class and G7's class group remain.
