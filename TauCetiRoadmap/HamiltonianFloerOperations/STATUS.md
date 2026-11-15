<!--tauceti-status:v1 {"roadmap":"HamiltonianFloerOperations","to_sha":"a6027b1d24fcb935c53bd5b50d11b40991cda418","ts":"2026-11-11T08:00:01Z"}-->
# Status: HamiltonianFloerOperations

This file documents the status of the HamiltonianFloerOperations roadmap up until `a6027b1` (2026-11-11T08:00:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** H1 is complete in abstract form, and H3's energy theory now holds on a manifold target for the pair of pants and every family the product and PSS comparison need. Breaking, compactness and the first Fredholm statements exist only for a vector-space target. H6 and the algebraic half of H7 are formal algebra waiting for counts. There are no moduli spaces, counts, gluing or orientations, and H5 has not begun.

### Named results

- **The pair-of-pants energy identity** — on a manifold target, the energy of a Floer pair of pants is the input actions minus the output action, corrected by curvature. ([`integral_floerEnergyDensity_pairOfPantsPerturbation`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PairOfPants/Energy/Asymptotic.html#TauCeti.SmoothTwoForm.IsNondegenerate.integral_floerEnergyDensity_pairOfPantsPerturbation)).
- **Breaking at the ends** — a finite-energy Floer pair of pants converges to a periodic orbit along each end, with the end actions as limits. This is for a vector-space target ([`exists_periodic_hasDerivAt_tendstoUniformly_endChart_of_floer`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PairOfPants/End/Orbit.html#TauCeti.SymplecticForm.exists_periodic_hasDerivAt_tendstoUniformly_endChart_of_floer)). At a nondegenerate orbit the convergence is [exponential](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/ExponentialDecay.html#TauCeti.SymplecticForm.exists_pos_eventually_norm_sub_le_exp).
- **Invertibility of the asymptotic operator** — at a nondegenerate orbit the loop operator ζ ↦ ζ′ − S_tζ is an isomorphism H¹ → H⁰, as are its small weighted shifts. This is the end input to H4's Fredholm theory ([`isInvertible_loopOperator_of_isNondegenerateFixedPt`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/AsymptoticOperator.html#TauCeti.SymplecticForm.isInvertible_loopOperator_of_isNondegenerateFixedPt)).
- **Associativity on cohomology from a kernel homotopy** — if the two broken triple products differ by the boundary of a homotopy kernel, the product is associative on cohomology, with Koszul signs. Commutativity, unit and continuation laws have the same form ([`kernelProduct_kernelProduct_sub_kernelProduct_kernelProduct_mem_coboundaries`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovModule/Associativity.html#TauCeti.NovikovModule.kernelProduct_kernelProduct_sub_kernelProduct_kernelProduct_mem_coboundaries)).

### Notable definitions and infrastructure

- **Cap classes** — the caps of a contractible loop form a torsor under the [spherical period group](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Cap/Loop.html#TauCeti.Floer.SphericalCapClass.instAddTorsor), and they [glue along a pair of pants](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Cap/PairOfPants.html#TauCeti.Floer.SphericalCapClass.pantsGlue) equivariantly in each input. The product of class-indexed counts is [independent of the reference caps](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Cap/Product.html#TauCeti.Floer.novikovProductOfMatrix_coefficientComparison_vadd).
- **Kernel products and matrix maps** — [`kernelProduct`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovModule/Bilinear.html#TauCeti.NovikovModule.kernelProduct) turns a supported coefficient kernel into a bilinear map on completed modules, and [`novikovMapOfMatrix`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovModule/MapOfMatrix.html#TauCeti.NovikovModule.novikovMapOfMatrix) does the same for differentials and continuation maps given by finite matrices of Novikov series. Rigid counts are meant to supply both.
- **The capped comparison family** — the [capped structure](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PairOfPants/AlmostComplex/Manifold/Capped.html#TauCeti.SmoothTwoForm.Compatible.cappedAlmostComplex) caps the three ends of the pair of pants with PSS planes along necks of length L. It runs from the domain-independent J₀ to long necks, and its energy is [bounded uniformly](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PairOfPants/Energy/Capped.html#TauCeti.SmoothTwoForm.IsNondegenerate.abs_integral_floerEnergyDensity_cappedComparisonPerturbation_sub_le).

### Roadmap coverage

H1 is done in abstract form, now including cap torsors and pair-of-pants gluing over an actual space; area and Chern number still enter as given homomorphisms, and G7's class group and the regraded orientation lines are missing. H2 is partial: the domain, plumbing, moving ends and the exchange and capped families carry smooth data on a manifold, but stable domain charts and corner jets are missing. H3 is partial: energy identities and curvature bounds hold on a manifold, while breaking, exponential decay and convergence off bubbling points hold only on a vector space; manifold compactness, sphere trees and parameter faces are missing. H4 is partial: asymptotic-operator invertibility and cokernel-detecting variations exist, but no Fredholm theory on the punctured domain, transversality, gluing or orientation. H6 has only formal laws, with no counts, m2 or unit cycle. H7 has its algebraic half and the comparison family's data, but not the Morse quantum operation or any moduli. H5 is untouched. Of H8's checks, only the dense-period example and the algebraic Γ = 0 reduction are done.

## The frontier

- **Gromov–Floer compactness on a manifold** — rescaling and the frozen-J bubble hold on a manifold, and convergence off bubbling points and breaking at the ends hold on a vector space. The manifold version, sphere trees and parameter faces remain.
- **The Fredholm problem on the punctured domain** — invertibility at the ends and convergence of the weighted linearization to the stationary operator exist. The weighted Sobolev operator on S and its index are next. This consumes HeegaardFloer F0–F2.
- **Transversality** — localized Hamiltonian variations and compatible J-variations detect cokernel elements at injective points. Turning this into regular moduli spaces needs the Fredholm setup above.
- **Attaching Γ to a closed symplectic manifold** — cap classes exist for any homomorphisms on H₂. What remains is to instantiate them with the true area and first Chern class, and with G7's class group.
- **Counts feeding H6** — the product laws hold for any kernels obeying the boundary identities. Supplying them needs rigid and one-dimensional moduli spaces with oriented boundary, so this is blocked on compactness and H4.
