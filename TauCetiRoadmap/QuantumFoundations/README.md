# Roadmap: mathematical foundations of quantum systems

**Summary.** Build the mathematical interface between operational quantum models and Hilbert-space quantum mechanics: states, questions, observables and outcome laws; measurements, instruments and dilation; projection logics and their probability measures; expectation, uncertainty and dynamics; von Neumann operational models and the intrinsic criteria that single them out among all operational systems; composite systems, Fock models and representations of the canonical commutation relations; ray symmetries and projective representations; and the concrete particle models (free particle, Euclidean-invariant Hamiltonians, spin, oscillator, angular momentum, hydrogen). A quantum postulate is data or a hypothesis of a model, never a theorem about all mathematical systems; every statement below carries the hypotheses under which it is proved. The end theorems are the Kakutani–Mackey Hilbertization theorems (Layer 0), the operational-to-logic reconstruction and the Segal/Mackey comparisons (Layer 1), Naimark dilation and the repeatability characterization of sharp instruments (Layer 2), the Alfsen–Shultz, Iochum–Shultz and Connes characterizations of the normal state spaces of von Neumann algebras (Layer 5), the second-quantization domain theory and the Gaussian realization of bosonic Fock space (Layer 6), Uhlhorn's theorem (Layer 7), the classification of Euclidean-invariant scalar and spin Hamiltonians (Layers 8–9), and the complete spectral analysis of the hydrogen atom through Coulomb wave functions (Layer 9).

## Scope and ownership

This roadmap owns, by layer:

- Layer 0: the cross-space fundamental theorem of projective geometry for vector spaces of dimension at least three over ℝ or ℂ; the complex and real Kakutani–Mackey theorems (an order-reversing involution of the closed-subspace lattice of a Banach space with trivial intersections is the orthogonal complement of an equivalent Hilbert norm), including the one-way closed-hyperplane automatic-continuity lemma; quaternionic Hilbert logics; the normability and Hilbertizability of Tychonoff products of Banach spaces.
- Layer 1: operational systems with their six axioms, the corrected notion of a question, the two mutually inverse presentations of an operational system and a Mackey logic, the Boolean and Hilbert models, operational actions of logic automorphisms, the horizontal sums MO_n, Segal systems with all their states and the canonical order, the distributive subclass as a JB-algebra with its quadratic representation and projection order, Pulmannová's necessary and internal embedding conditions, the bounded Hilbert comparison, the adapter to the VonNeumannAlgebras V0 state carrier, and the Gudder–Boyce realization of a Segal system in a weak Mackey model.
- Layer 2: effects, POVMs and PVMs on measurable outcome spaces with their outcome laws in vector and normal states; outcome-label transport; Naimark dilation (finite-outcome and general measurable); normal instruments, Lüders instruments, weak and strong repeatability and the characterization of sharp observables admitting a normal repeatable instrument.
- Layer 3: the operational reading of the projection logic of a Hilbert space, the identification of countably additive logic probabilities with normal states through VonNeumannAlgebras 12.J, the complete-additivity version for nonseparable spaces, and the positive trace-class eigen-expansion adapter to the native compact self-adjoint spectral theorem.
- Layer 4: outcome laws and moments of unbounded observables, expectation and variance, the uncertainty relations with exact domains, the Heisenberg picture on an invariant core, constants of motion, antiunitary time reversal, CP-semigroup dynamics, the extension of half-line monoid homomorphisms to ℝ, the unitary-group lift of continuous ray representations of ℝ, superselection sectors, and the all-state first-moment uniqueness theorem for the full PVM carrier.
- Layer 5: the operational model of a W*-algebra with all its normal states and real PVMs, its type theory read through projection lattices, the normal-state consequences of VonNeumannAlgebras V12.J.Scalar, the Alfsen–Shultz dynamical-correspondence criterion, the Iochum–Shultz spectral/elliptic/global 3-ball criterion with an explicit O(3) extension, Connes' oriented self-dual cones (Theorems 5.2 and 5.8 of Connes 1974), uniqueness of full presentations, full-model operational actions including type I₂, bare logic automorphisms, and standard-form implementation with its continuity theory.
- Layer 6: tensor products of model data, partial trace, entanglement and Schmidt decomposition; the second-quantization API `dΓ`, `Γ` and their domains on the OperatorAlgebraDynamics D8 Fock carriers; creation and annihilation domains, CCR/CAR on explicit domains, occupation bases, Fock irreducibility, the Segal-field normalization adapter and the strong-continuity and norm-jump theorems for the Weyl group; the Gaussian/Hermite realization of bosonic Fock space; the universal-CCR sign adapter, an explicit nonregular representation, the Weyl-pair dictionary to MetaplecticAutomorphicForms' Stone–von Neumann theorem and the Fock/Schrödinger intertwiner; the cutoff oscillator.
- Layer 7: Uhlhorn's theorem on complex Hilbert spaces of dimension at least three, the adapter from projection-lattice orthoautomorphisms to ray maps, the comparison of globally continuous with locally continuous multiplier classes, the SU(3) charge/isospin conventions and finite-dimensional symmetry-breaking models.
- Layer 8: coordinate-change unitaries and smooth flow pullbacks with their Stone generators, the free Hamiltonian with its propagator kernel, spectrum and Cauchy-problem adapters, the classification of Euclidean-invariant scalar Hamiltonians as Borel functions of the Laplacian, and continuous representatives of L² classes.
- Layer 9: Euclidean-invariant spin-j Hamiltonians, the one-mode oscillator and Hermite ladder, angular momentum on `L²(ℝ³)` and `L²(S²)`, Kummer and Tricomi functions with their all-parameter interface, Coulomb wave functions and the complete spectral representation of the hydrogen atom, countable tensor products and composite outcome laws, the Dirac-operator metric example, the quantum-model applications of NoncompactQuantumSymmetry's induced representations, and the explicit one-parameter family of regular CCR representations whose inequivalence RelativisticQuantumFieldTheory proves.

It leaves to named roadmaps, which it consumes and never re-plans:

- Rays, the unitary–antiunitary group and Wigner's theorem (NoncompactQuantumSymmetry P.1); strong-operator Polish groups, coefficient Borel structures, the local section of `U(H)→PU(H)`, Pettis's theorem and the Borel characters of ℝ (P.2); normalized locally continuous multipliers, the twisted cocycle law for antiunitary lifts, coboundaries, `H²_lc` and the topological extension theorem (P.3); Lie smoothing, differentiation, integration, `H²_lc(ℝⁿ,𝕋)` as alternating forms, `H²_lc(SO(3),𝕋)≅ℤ/2` and the Whitehead lemmas (P.4); free-particle position, momentum and Fourier transform on `L²(ℝ³)` (P.5); the permutation projectors of completed tensor powers (P.6); imprimitivity, Mackey analysis and the Euclidean, Galilei, Poincaré and de Sitter models (M0–M6).
- The finite-dimensional Gleason theorem (VonNeumannAlgebras V12.J.Frame), its dimension-two sgn frame function, the orthoautomorphism of `P(M₂(ℂ))` commuting with the antipodal map, with its non-Born pullback (V12.J.Bloch), the Mackey–Gleason–Bunce–Wright extension theorem whose `B(H)` case is Gleason's theorem (V12.J.Scalar), Dye's theorem (V12.J.Dye), the enriched comparison theorem (V12.J.Enriched) and central splitting (V12.J.CentralSplitting); states and GNS (V0), the bicommutant theorem (V1), the projection lattice, Hilbert tensor products and the incomplete tensor product (V2), type theory (V3, V5, V6), preduals and normality (V4), closed affiliated operators and the natural cone (V10), standard forms and Kadison–Sakai innerness (V11), injective classification (V13).
- Pure states, irreducible representations, CP maps and Stinespring dilation, spatial C*-tensor products (CStarAlgebras C2, C4, C5); interior tensor products and regular module operators (HilbertModules H3, H6); CAR and Weyl algebras, regular representations, Fock carriers and basic field operators (OperatorAlgebraDynamics D8).
- The spectral theorem, Stone's theorem, PVMs and the bounded Borel calculus (SelfAdjointSpectralTheory), the unbounded Borel calculus, strong commutation, deficiency theory, Friedrichs extensions, singular endpoints, analytic vectors, Kato–Rellich, relatively compact perturbations and tensor sums (UnboundedOperators), trace-class operators and approximation numbers (OperatorIdeals).
- The unitary Stone–von Neumann theorem for the real Heisenberg group (MetaplecticAutomorphicForms §1.2); Stieltjes inversion with its half-atom endpoint terms (RandomMatrices §3.1); spherical harmonics and the spectral decomposition of the sphere Laplacian (RiemannianGeometry R8); Clifford-module commutator norms and intrinsic distances (RiemannianGeometry R7.8); Clifford traces (SpinGeometry G1.3); real Clifford classification (SpinRepresentations Layer 7); compact representations and Peter–Weyl (CompactGroups); SU(2) weights and complete reducibility (LieHighestWeight); Lie functor, automatic smoothness and simply connected covers (LieGroups); Laguerre polynomials and bases (LaguerreJacobi); Hermite bases (OrthogonalL2Bases); weak derivatives and Sobolev spaces (PDE Lane A); compact quantum metric spaces (CompactQuantumMetricSpaces).
- Free fields, Wightman and Haag–Kastler axioms, spin–statistics, Shale implementability and the inequivalence of the regular representations of Layer 9.9 (RelativisticQuantumFieldTheory), which consumes this roadmap and supplies nothing to it.

## Conventions

Inner products are conjugate-linear in the first variable and linear in the second. Hilbert spaces are complex unless a real or quaternionic space is named; `B(H)` is the algebra of bounded operators, `P(H)` the lattice of orthogonal projections, identified with closed subspaces. A unit vector ψ determines the vector state `A↦⟪ψ,Aψ⟫`, which depends only on the ray of ψ. A density operator is a positive trace-class ρ with `Tr ρ=1`; it determines the normal state `A↦Tr(ρA)`. In finite dimension every state is a density matrix; in infinite dimension a density operator describes a normal state only.

An effect is a bounded self-adjoint `E` with `0≤E≤1`. For a measurable outcome space `(Ω,Σ)` a POVM is a map `E:Σ→B(H)` with `E(∅)=0`, `E(Ω)=1`, `0≤E(S)≤1` and weak-operator countable additivity; a PVM has projection values and `E(S)E(T)=E(S∩T)`. Countable sums of orthogonal projections converge in the strong operator topology, never as a norm `tsum`. The outcome law of a self-adjoint observable `A` with spectral PVM `P_A` in the vector state ψ is `B↦‖P_A(B)ψ‖²`, in the normal state ρ it is `B↦Tr(ρP_A(B))`.

Stone generators follow SelfAdjointSpectralTheory: `U(t)=exp(itA)`. Physical time evolution is `exp(−itH)`, so the physical Hamiltonian is `H=−A`; ℏ=1 unless a Planck constant is named. The Fourier transform is Mathlib's `Ff(ξ)=∫f(x)e^(−2πix·ξ)dx`; position is `Q_jf=x_jf`, momentum `P_j=−i∂_j` on its Sobolev domain, so `FP_jF⁻¹` is multiplication by `2πξ_j` and `exp(itP)` translates by `x↦x+t`; NoncompactQuantumSymmetry P.5's transform `F_ℏ` is `F` followed by the unitary dilation of §8.1. The Weyl convention is OperatorAlgebraDynamics D8's `W(f)W(g)=exp(−i Im⟨f,g⟩/2)W(f+g)`. Projective lifts satisfy `U_gU_h=ω(g,h)U_(gh)` with ω in the twisted-cocycle convention of NoncompactQuantumSymmetry P.3. Natural-number subtraction, division by zero and other junk values of total functions never enter a statement: every expectation carries its integrability hypothesis, every conditioned state its positive-probability hypothesis.

## Exact supplier contracts

### From Mathlib

`Projectivization` (`ℙ K V`, `Projectivization.mk`, `rep`, `map`) for rays and projective spaces; `ClosedSubmodule` with its orthogonal complement `ᗮ` for closed-subspace lattices; `InnerProductSpace`, `LinearIsometryEquiv` (`≃ₗᵢ[ℂ]`) and conjugate-linear `≃ₗᵢ⋆[ℂ]` for unitary and antiunitary operators; `Submodule.starProjection` and `orthogonalProjection`; `Orthonormal`, `OrthonormalBasis`, `HilbertBasis`; `Matrix.PosSemidef`, `Matrix.IsHermitian`, `Matrix.trace`, `IsStarProjection`; `IsCommJordan` (`Mathlib/Algebra/Jordan/Basic.lean`); `lp (fun i => H i) 2` with `evalCLM`, `single` and `IsHilbertSum`; `MeasureTheory.Lp`, `AEEqFun`, `Lp.compMeasurePreserving`, `Lp.fourierTransformₗᵢ` (`Mathlib/Analysis/Fourier/LpSpace.lean`), `SchwartzMap`; `ProbabilityTheory.IsGaussian` (`Mathlib/Probability/Distributions/Gaussian/Basic.lean`) and `MeasureTheory.Measure.ext_of_charFun` (`Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean`, which needs a complete space); `Polynomial.hermite`; `Complex.regularizedHGFun` with `regularizedHGFunCoeff_add_one` and `radius_regularizedHGFunSeries_eq_top` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`); `Complex.Gamma` with `Complex.Gamma_neg_nat_eq_zero`; `MeasureTheory.resolventTransform` (`Mathlib/MeasureTheory/Measure/ResolventTransform.lean`, `∫(λ−z)⁻¹dμ(λ)`); `Circle` and `Circle.toUnits`; `unitary`; the continuous functional calculus; `ContinuousLinearMap.finite_dimensional_eigenspace` (compact operator, nonzero eigenvalue).

### From Tau Ceti

`TauCeti.ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` and `hasSum_smul_repr_of_apply_eq_smul` (`TauCeti/Analysis/InnerProductSpace/Spectrum.lean`: a compact symmetric operator on a complete inner-product space has a Hilbert eigenbasis, with no separability hypothesis); `TauCeti.gaussianHermiteHilbertBasis` and `TauCeti.gaussianHermitePiBasis` (`TauCeti/Probability/Distributions/Gaussian/Hermite/Basis.lean` and `Pi/Basis.lean`, the latter with a `Fintype` index); `TauCeti.hermiteFunction`, `hermiteFunction_oscillator`, `hermiteHilbertBasis` and `hasSum_hermiteFunctionLp_expansion` (`TauCeti/Analysis/SpecialFunctions/Hermite/Function/*`); `TauCeti.Semigroups.IsClassicalSolution`, `IsMildSolution`, `StronglyContinuousSemigroup.isClassicalSolution_realOperator` and `isMildSolution_realOperator` (`TauCeti/Analysis/Semigroups/CauchyProblem/Basic.lean`); `TauCeti.existsUnique_eq_expUnitHom_complex` (`TauCeti/Geometry/Lie/Exponential/Units/Complex.lean`).

### From TauCetiRoadmap.VonNeumannAlgebras

V0 supplies the normalized positive-functional state carrier, its convex structure and GNS; V1 the bicommutant theorem; V2 the projection lattice with meets, joins, complements, orthogonality, `V2.NonmodularProjectionLattice`, `V2.BorelCalculus`, the completed Hilbert tensor product with its elementary-tensor and dense-span API, and the incomplete tensor product with its raw-prefix Cauchy criterion and reference-equivalence theorem; V3 type I and finite-dimensional algebras; V4.Core the trace pairing and duality, V4.PositivePredual the positive spanning and self-adjoint base norm, V4.Normality the normal-state and vector-functional decomposition, V4.0.Decomposition the separable central decomposition; V5.LatticeFinite finiteness and modularity; V6.LatticeTypes the lattice type criteria and central parts; V8 group factors; V10.ClosedOperators the multiplier form of a self-adjoint operator, V10.Affiliation the affiliated PVM comparison, V10.ModularTheory the natural cone and its complex self-duality; V11 standard forms, their implementers and Kadison–Sakai innerness; V12.J.Maps, V12.J.Frame, V12.J.Bloch, V12.J.Scalar, V12.J.Dye, V12.J.Enriched and V12.J.CentralSplitting as named in Layers 3 and 5; V13 injective classification. These sections are consumed with their own hypotheses; no separability is added where V imposes none.

### From TauCetiRoadmap.CStarAlgebras, HilbertModules and OperatorAlgebraDynamics

CStarAlgebras C2 supplies pure states as extreme points, irreducibility of the cyclic GNS representation of a pure state, the scalar-commutant criterion and the weak-star closed convex hull theorem; C4 CP maps and Stinespring dilation; C5 the spatial C*-tensor product. HilbertModules H3 supplies interior tensor products and H6 deficiency spaces and the self-adjoint extension classification. OperatorAlgebraDynamics D8 supplies CAR(h) and the universal Weyl algebra with its convention, regular representations, the symmetric and antisymmetric Fock carriers, creation and annihilation operators, the Weyl field operators on their invariant domain with `[Φ(f),Φ(g)]=i Im⟨f,g⟩`, the vacuum characteristic function `exp(−‖h‖²/4)`, `‖W(f)−1‖=2`, simplicity and symplectic functoriality; D1 and D3 covariant pairs and Green induction as consumed through NoncompactQuantumSymmetry.

### From TauCetiRoadmap.OperatorTheory

SelfAdjointSpectralTheory supplies `LinearPMap` domains and closures, Stone's theorem and its uniqueness and commutation theorems (SA-E26, SA-E28–SA-E30), the measurable-space and bounded-Borel-function carriers (SA-B01, SA-B37, SA-B39), the bounded spectral theorem with `T=∫x dP` (SA-B31, SA-B35), direct sums (SA-B72, SA-B80), the unbounded spectral PVM with domain-preserving projections (SA-E01–SA-E13), PVM uniqueness, bounded compatibility and multiplication-operator projections (SA-E44–SA-E47). UnboundedOperators supplies the spectral-integral domain and calculus (UO-A01–UO-A08), strong commutation and joint PVMs (UO-B03, UO-B04), essential spectrum and spectral types (UO-C02, UO-C03), closed forms and Friedrichs extensions (UO-D06), singular endpoints (UO-D07), graph cores and the bounded-commutator obstruction (UO-E01), Nelson's theorem (UO-E03), worked Hermite cores (UO-E05), three-dimensional `L²+L∞` potentials (UO-E06), tensor operators and sums (UO-F02, UO-F03). OperatorIdeals supplies compactness of trace-class operators (OI-A29) and the summable approximation numbers of the trace-class gauge (OI-B29, OI-B30).

### From the other named roadmaps

| Supplier | Interface consumed here | First consumer |
| --- | --- | --- |
| NoncompactQuantumSymmetry P.1–P.6 | rays, `UA(H)`, `PUA(H)`, Wigner's theorem; Polish structure, coefficient Borel structures, local sections, Pettis's theorem, Borel characters of ℝ; twisted cocycle law, coboundaries, `H²_lc`, topological extensions, the Borel patching of local sections; smoothing, integration, `H²_lc(ℝⁿ,𝕋)`, the SO(3) spin class and `U(2)→SO(3)`, Whitehead lemmas; position, momentum, Fourier transform and Schwartz core on `L²(ℝ³)`; permutation projectors | §4.3 (ℝ-lifts), §6.2, §7.1–7.2, §8.2 |
| NoncompactQuantumSymmetry M0–M6 | Gårding vectors and Casimirs (M0); imprimitivity, Borel multipliers and the section/trivialization comparison (M1); the Mackey machine (M2); Euclidean and Galilei models, including the localized spin model and its radius/little-circle decomposition (M3); Poincaré models and `M4.SpatialLocalization` (M4); de Sitter, `M5.AffineG5` and contractions (M5); tensor decompositions (M6) | §7.2, §9.1, §9.8 |
| MetaplecticAutomorphicForms §1.2 | the unitary Stone–von Neumann theorem for the real Heisenberg group and its Hilbert multiplicity form | §6.6 |
| RandomMatrices §3.1 | Stieltjes inversion for `resolventTransform` with half-atom endpoint terms, the atom formula `μ{a}=lim η Im m(a+iη)` and the density formula | §9.5 |
| RiemannianGeometry R8.1–R8.2, R7.8 | harmonic polynomials, spherical eigenfunctions and completeness on `S²`; Clifford-module commutator norms and intrinsic distance | §9.3, §9.7 |
| SpinGeometry G1.3; SpinRepresentations Layer 7 | Clifford scalar trace with its positivity hypotheses; real Clifford classification and Bott periodicity | §9.7 |
| CompactGroups Layers 1–5; LieHighestWeight Layers 2, 4, 5; LieGroups Layers 2, 3, 5 | unitarization, Peter–Weyl; SU(2) weights and Clebsch–Gordan, complete reducibility; closed-subgroup theorem and automatic smoothness, Lie functor, simply connected covers | §7.3, §9.1 |
| LaguerreJacobi A1–A4, B1–B4 | generalized Laguerre polynomials, recurrences, Rodrigues formula, weighted orthogonality constant `Γ(k+a+1)/k!` and the complete weighted bases for `a>−1` | §9.5 |
| OrthogonalL2Bases A3′, B3, Part D | the Gaussian Hermite basis, product bases and multidimensional Hermite bases | §6.5 |
| PDE Lane A | weak derivatives, Sobolev spaces `H¹`, `H²` and distributional calculus | §8.1 |
| CompactQuantumMetricSpaces 1.4, 3.3, 3.6 | the Lip-norm compactness criterion, states as probability measures and the spectral-triple metric criterion | §9.7 (deferral) |

## How to read the build

Layer 0 is pure linear algebra and Banach-space theory: projective collineations and the Hilbertization of a Banach space from its subspace lattice. Layer 1 defines operational systems and Mackey logics, proves that they present each other, and develops Segal systems to the point where their Hilbert comparison needs only the bounded spectral theorem. Layer 2 builds measurements and instruments on Hilbert spaces, Layer 3 reads the projection logic of `B(H)` and its probability measures through VonNeumannAlgebras 12.J, and Layer 4 adds unbounded observables, uncertainty and dynamics. Layer 5 generalizes Layers 2–4 to an arbitrary W*-algebra and proves the intrinsic characterizations of its normal state space. Layer 6 constructs composite and Fock models on the D8 carriers and Layer 7 the ray-symmetry theory that is not already in NoncompactQuantumSymmetry P.1–P.4. Layers 8 and 9 are the concrete particle models. Each target's `*Needs:*` line lists its statement and route inputs item by item; a different proof route of the same statement is never blocked by an unrelated layer.

## Layer 0: projective geometry and Hilbertization

### 0.1 Collineations between projective spaces

Let `𝕂` be ℝ or ℂ and let `V`, `W` be `𝕂`-vector spaces with `3 ≤ Module.rank 𝕂 V`, of finite or infinite dimension. Points of `ℙ 𝕂 V` are one-dimensional subspaces; the projective line through two points `x,y` is the set of points whose representatives lie in `span{x.rep,y.rep}`. Define `Projectivization.PreservesLines f`, for `f : ℙ 𝕂 V → ℙ 𝕂 W`, to mean that for all points `x,y,z` the representative of `z` lies in the span of those of `x,y` exactly when the representative of `f z` lies in the span of those of `f x, f y`. Prove the cross-space fundamental theorem of projective geometry, `projectiveCollineation_semilinear`: every bijection `f` that preserves lines is induced by a bijective σ-semilinear map `S : V →ₛₗ[σ] W` for a field automorphism σ of `𝕂`, that is `f = Projectivization.map S`, and σ is determined by `f` (Artin, *Geometric Algebra*, Chapter II, Theorem 2.26, stated there for a space onto itself; the cross-space form follows by composing with a fixed linear isomorphism once `W` is known to have the same dimension, which line preservation and bijectivity give). Prove `projectiveCollineation_unique_scalar`: two inducing pairs `(σ,S)`, `(σ′,S′)` have `σ=σ′` and `S′=cS` for a nonzero scalar `c`; this uniqueness needs only rank at least two. For `𝕂=ℝ` prove `σ=id`: a field automorphism preserves squares, hence the order, and fixes ℚ, so by density it fixes ℝ. For `𝕂=ℂ` the automorphism is arbitrary; nothing in this layer supplies continuity, boundedness or a Hilbert structure, and the Banach applications of §0.2 and §7.1 obtain them from their own hypotheses.

- `projectiveCollineation_semilinear`: a line-preserving bijection of projective spaces of rank at least three is `Projectivization.map` of a semilinear equivalence, with a unique field automorphism.
- `projectiveCollineation_unique_scalar`: the semilinear map is unique up to a nonzero scalar.
- For a semilinear equivalence `S`, `Projectivization.map S` is a line-preserving bijection (the converse), with the composition and inverse laws.

*Needs:* Mathlib `Projectivization`, `Projectivization.map`, `LinearEquiv` over a ring homomorphism, `Module.rank`.

**Checks.**

- On `ℙ ℝ ℝ²` every bijection preserves lines, because there is only one line: the bijection that swaps the points of `e₁` and `e₂` and fixes every other point is line-preserving but not induced by any linear map, since a linear map fixing the three points `e₁+e₂`, `e₁−e₂` and `e₁+2e₂` of `ℙ ℝ ℝ²` is a scalar and fixes `e₁` too. The rank hypothesis `3 ≤ rank` cannot be dropped.
- On `ℙ ℝ ℝ³` the map induced by `diag(1,2,3)` is a collineation and its unique inducing linear map up to scalar is `diag(1,2,3)`: the only linear maps inducing the identity on `ℙ ℝ ℝ³` are scalars, which a direct check on `e₁,e₂,e₃,e₁+e₂+e₃` gives.
- On `ℙ ℂ ℂ³` coordinatewise complex conjugation is a collineation induced by the conjugate-linear `S = conj`, with `σ = conj ≠ id`; the theorem must not conclude `σ = id` over ℂ. A wild automorphism τ of ℂ gives a collineation `Projectivization.map (τ⊗1)` whose `S` is unbounded for every norm on `ℂ³`, so no continuity is implied.

### 0.2 The complex Kakutani–Mackey theorem

Let `B` be an infinite-dimensional complex Banach space and `L(B)` its lattice of closed subspaces, carried by `ClosedSubmodule ℂ B`. Suppose `X ↦ X⊥` is a map `L(B)→L(B)` with `X ≤ Y → Y⊥ ≤ X⊥`, `(X⊥)⊥ = X` and `X ∩ X⊥ = {0}` for all `X,Y`. Prove `kakutaniMackey_complex`: there is a complete complex inner-product space `H` and a continuous linear equivalence `e : B ≃L[ℂ] H` such that for every closed `X`, `v ∈ X⊥` holds exactly when `e v` is orthogonal to `e(X)` (Pankov 2020, Theorem 3.16). Equivalently, the pulled-back inner product makes `B` a Hilbert space whose norm is equivalent to the given one and whose orthogonal complements are the prescribed ones; it is topological equivalence, not equality of norms. The involution is order-reversing, so it sends lines to closed hyperplanes, not atoms to atoms, and double complementation is a lattice statement that must not be confused with reflexivity `B ≃ B**`.

Route. Define the point map `κ : ℙ ℂ B → ℙ ℂ B*`, `κ(ℂx) = ((ℂx)⊥)⁰` with `⁰` the annihilator in the continuous dual: the complement of a line is a closed hyperplane, so this annihilator is a line of `B*`. Prove from the incidence and double-complement laws that κ is a line-preserving bijection, and apply §0.1 to obtain a semilinear bijection `S : B → B*` inducing κ; prove the image formula `S(X) = (X⊥)⁰` for every closed subspace `X` (the forward inclusion from `X⊥ ⊆ (ℂx)⊥ = ker(Sx)` for `x ∈ X`, the reverse by writing a nonzero functional in `(X⊥)⁰` as a multiple of some `Sx` and applying the involution). Hence `S` carries every closed hyperplane of `B` to a closed hyperplane of `B*`.

Own the one-way closed-hyperplane automatic-continuity lemma: for infinite-dimensional complex Banach spaces `X,Y`, a bijective σ-semilinear map `E : X → Y` sending every closed hyperplane of `X` to a closed hyperplane of `Y` has `σ ∈ {id, conj}` and `E`, `E⁻¹` bounded. Construct a normalized biorthogonal sequence `f_n(x_m) = δ_nm` inductively (choose each unit `x_n` in the intersection of the previous kernels and extend by Hahn–Banach), let `g_n` be the functional with kernel `E(ker f_n)` and `g_n(Ex_n)=1`, so `g_n(Ex) = σ(f_n(x))`; if σ were discontinuous it would be unbounded near 0, so choose `|λ_n| ≤ 2^(−n)` with `|σ(λ_n)| > n‖g_n‖`, and the convergent series `x = Σλ_nx_n` contradicts `|g_n(Ex)| ≤ ‖g_n‖‖Ex‖`. A continuous automorphism fixes ℝ and sends `i` to `±i`. For boundedness, each `f∘E⁻¹` with `f ∈ X*` has closed hyperplane kernel `E(ker f)`, hence is continuous; testing a convergent graph sequence against every `f` proves `E⁻¹` has closed graph, and the closed graph and inverse mapping theorems give boundedness of both maps. This uses completeness and no reflexivity.

Set `h(x,y) = (Sx)(y)`. The polarity gives `h(x,y)=0 ↔ h(y,x)=0`; prove the reflexive-form lemma that `h` is then proportional to its transpose or adjoint. In the linear case the form is symmetric or alternating; an alternating form has zero diagonal and a nondegenerate symmetric complex bilinear form in dimension at least two has a nonzero isotropic vector, so both contradict `X ∩ X⊥ = {0}`: σ is conjugation. In the conjugate-linear case prove `h* = ch` with `|c|=1`, rescale by a phase to make `h` Hermitian, and use continuity and connectedness of the unit sphere to show the nonzero diagonal has constant sign; change the sign if needed. With `C=‖S‖`, `D=‖S⁻¹‖` prove `‖x‖_h ≤ √C‖x‖`, `‖Sx‖ ≤ √C‖x‖_h` and `‖x‖ ≤ D√C‖x‖_h`, which give completeness of the new norm and identify the prescribed complement with `h`-orthogonality.

- `kakutaniMackey_complex`: the prescribed-complement Hilbertization of an infinite-dimensional complex Banach space.
- The closed-hyperplane automatic-continuity lemma, with σ identified and `E`, `E⁻¹` bounded.
- The image formula `S(X) = (X⊥)⁰` and the equivalent-norm estimates with the constants `√C` and `D√C`.

*Needs:* §0.1; Mathlib `ClosedSubmodule`, `NormedSpace.Dual`, Hahn–Banach, the closed graph and inverse mapping theorems.

**Checks.**

- On a Hilbert space `H` with its usual orthogonal complement, the theorem must return an inner product whose complement is the usual one: for `H=ℓ²` and the line `ℂe₁`, `(ℂe₁)⊥ = {x : x₁=0}` and the annihilator point `κ(ℂe₁)` is the functional `x ↦ x₁`, so `S e₁` is a multiple of `⟨e₁,·⟩`, as the Riesz map gives.
- A complex Banach space that is not isomorphic to a Hilbert space, for example `ℓ¹`, admits no such involution; the theorem is consistent because a Hilbertizable Banach space has type and cotype 2, which `ℓ¹` lacks, and the conclusion is an equivalence of norms, not an isometry: on `ℓ²` with the equivalent norm `‖x‖ + |x₁|` the same lattice involution is realized by the original inner product, whose norm differs from the given one.
- The trivial-intersection hypothesis is needed: on `ℓ²` let `J = diag(1,−1,1,1,…)` and put `X⊥ = (JX)ᗮ`. This map is order-reversing and involutive, because `J` is a self-adjoint unitary and `(JY)ᗮ = J(Yᗮ)`, but the line `X = ℂ(e₁+e₂)` lies in its own image, since `⟨J(e₁+e₂), e₁+e₂⟩ = ⟨e₁−e₂, e₁+e₂⟩ = 1 − 1 = 0`. For `J = 1` the same recipe is the usual complement and the theorem returns the standard inner product up to a positive scalar.

### 0.3 The real Kakutani–Mackey theorem and finite-dimensional existence

Let `B` be a real Banach space with `3 ≤ Module.rank ℝ B`, finite or infinite dimension. Prove `kakutaniMackey_real`: every map `X ↦ X⊥` on `ClosedSubmodule ℝ B` that is order-reversing, involutive and has `X ∩ X⊥ = {0}` is the orthogonal complement of an equivalent complete real inner-product norm, in the same form as §0.2 (Kakutani–Mackey 1944, Theorems 1 and 2). Use `κ(ℝx) = ((ℝx)⊥)⁰` in the continuous real dual, the same incidence and image formulas, and §0.1 over ℝ, whose automorphism is the identity, so `S : B → B*` is real-linear. In infinite dimension prove continuity by the real closed-hyperplane argument of §0.2 (each `f∘S⁻¹` has a closed hyperplane kernel) and the closed graph and inverse mapping theorems; in finite dimension `S` and `S⁻¹` are continuous automatically. The reflexive form `h(x,y) = (Sx)(y)` is symmetric or alternating, nonzero diagonals exclude the alternating case, continuity on the connected unit sphere (dimension at least two) makes the diagonal of constant sign, and a sign change makes `h` positive definite; the equivalent-norm estimates are those of §0.2.

Also prove the existence statement in every finite dimension: a finite-dimensional real Banach space admits an equivalent Euclidean norm (pull back the standard inner product through a basis and use finite-dimensional norm equivalence). Thus in dimensions zero, one and two the existence of some order-reversing involution with trivial intersections is equivalent to the existence of some equivalent Hilbert realization, while for dimension at least three the stronger statement realizes the given involution; in dimensions zero and one the involution is unique and realized.

- `kakutaniMackey_real`: prescribed-complement Hilbertization of a real Banach space of rank at least three.
- Finite-dimensional existence of an equivalent Euclidean norm in every dimension.
- In dimension two the prescribed-complement statement is false (Checks), so the rank hypothesis is sharp.

*Needs:* §0.1, §0.2 (the hyperplane continuity argument); Mathlib finite-dimensional norm equivalence, `ClosedSubmodule`.

**Checks.**

- On `ℝ²` the closed subspaces other than `0` and `ℝ²` are the lines, a circle `ℙ ℝ ℝ²`; an involution with trivial intersections is any fixed-point-free involution of this circle. The involutions coming from inner products are `θ ↦ θ+π/2` after a linear change of coordinates, hence homeomorphisms; the set-theoretic involution that swaps the lines of slopes `0` and `1`, swaps their Euclidean perpendiculars (slopes `∞` and `−1`) with each other, and swaps every other line with its Euclidean perpendicular is order-reversing, involutive and fixed-point-free but discontinuous (lines of slope near `0` go near `∞` while the slope-`0` line goes to slope `1`), so no inner product induces it.
- On `ℝ³` with the usual complement the theorem returns a positive multiple of the standard form: the form `h` is determined up to a positive scalar because `h` and `h′` with the same orthogonality relation have `h′ = ch` by the reflexive-form lemma, and `c>0` by positivity of `h(e₁,e₁)`.
- The indefinite form `x₁y₁+x₂y₂−x₃y₃` on `ℝ³` gives an order-reversing involution without trivial intersections: the line `ℝ(1,0,1)` satisfies `h((1,0,1),(1,0,1)) = 1−1 = 0`, so it lies in its own complement. The hypothesis `X ∩ X⊥ = {0}` excludes exactly such forms.

### 0.4 Quaternionic Hilbert logics

Define a right quaternionic Hilbert space (a right ℍ-module with an ℍ-valued inner product `⟨x,y⟩`, conjugate-linear in the first and right-linear in the second variable, complete for `‖x‖ = ⟨x,x⟩^(1/2)`), its closed right-linear subspaces, right-Hermitian orthocomplementation `X ↦ X⊥` and the orthogonal projections. Prove that `X ↦ X⊥` is an order-reversing involution with `X ∩ X⊥ = {0}`, that the closed right subspaces form an orthomodular lattice, and that countable orthogonal families of projections have strong sums which are projections. Define the outcome law of a projection `P` in a unit vector `ψ` as `‖Pψ‖²` and prove it is a countably additive probability on the projection logic. This is a separate model target: no quaternionic Banach Hilbertization theorem is asserted.

- The closed right-subspace lattice is orthomodular with the stated complement.
- Countable orthogonal sums of projections converge strongly to projections.
- Unit-vector outcome laws are countably additive probabilities.

*Needs:* Mathlib quaternions `ℍ`, complete normed modules; §0.2 for the convention comparison only.

**Checks.**

- On `ℍ` itself the only closed right subspaces are `0` and `ℍ`; the outcome law of the identity in any unit vector is `1` and of `0` is `0`.
- On `ℍ²` the right subspaces `e₁ℍ` and `(e₁+e₂)ℍ` are not orthogonal: `⟨e₁, e₁+e₂⟩ = 1 ≠ 0`; a left-linear convention would make `(e₁+e₂)q` fail to lie in the subspace for noncentral `q`, so right-linearity is forced by the inner-product convention.
- The quaternionic transition probability `|⟨x,y⟩|²` for unit `x,y` is invariant under `x ↦ xq`, `y ↦ yq′` with unit quaternions `q,q′`, since `|⟨xq,yq′⟩| = |q̄⟨x,y⟩q′| = |⟨x,y⟩|`; a complex-scalar-only invariance would miss the noncentral phases.

### 0.5 Tychonoff products and Hilbert sums

For a family `(E_i)_(i∈I)` of real or complex Banach spaces give `∏_i E_i` the product topology and call `i` active when `E_i ≠ 0`. Prove that this topological vector space is normable exactly when finitely many indices are active: a norm ball would contain a basic neighbourhood restricting finitely many coordinates `F`, and an active `j ∉ F` would put an entire coordinate line in the ball; conversely discard the zero factors and use the finite sum norm. Prove that the product admits an equivalent complete Hilbert norm exactly when the active set is finite and every active factor admits one, identifying each factor with the quotient by a closed coordinate kernel in one direction and using the finite orthogonal sum in the other. For arbitrary Hilbert families use Mathlib's `lp (fun i => H_i) 2` with `evalCLM`, `single`, `hasSum_single` and `IsHilbertSum`; prove the square-summability description and the density of finitely supported vectors through that API, and record that the `ℓ²` topology is not the product topology once infinitely many factors are active. SelfAdjointSpectralTheory SA-B72 and SA-B80 own direct sums of PVMs and of bounded operators.

- The product of Banach spaces is normable iff finitely many factors are nonzero.
- The product is Hilbertizable iff finitely many factors are nonzero and each is Hilbertizable.
- The `ℓ²` sum has dense finitely supported vectors and its topology is strictly finer than the product topology when infinitely many factors are nonzero.

*Needs:* Mathlib `Pi` topology, `lp`, `IsHilbertSum`; §0.3 for the finite-dimensional Hilbertization of factors.

**Checks.**

- `ℝ^ℕ` with the product topology is metrizable and not normable: the ball of any candidate norm contains a set `{x : |x_1|,…,|x_k| < ε}`, which contains the whole line `ℝe_(k+1)`.
- `∏_(n∈ℕ) E_n` with `E_n = 0` for `n ≥ 2` and `E_0 = E_1 = ℝ` is normable and Hilbertizable; the active set is `{0,1}`.
- In `lp (fun n : ℕ => ℂ) 2` the sequence `x^(k) = (1,…,1,0,…)` with `k` ones converges coordinatewise but not in `ℓ²`, since `‖x^(k)−x^(l)‖² = |k−l|`; the two topologies differ.

### Examples

The complex Kakutani–Mackey theorem applied to `B = ℓ²` with the involution `X ↦ (JX)ᗮ` for a bounded invertible positive `J` returns the inner product `⟨Jx,y⟩`, whose norm `⟨Jx,x⟩^(1/2)` is equivalent to the `ℓ²` norm with constants `‖J⁻¹‖^(−1/2)` and `‖J‖^(1/2)`; for `J = diag(1,1/2,1/3,…)` the equivalence fails, and indeed that `J` is not invertible, so `X ↦ (JX)ᗮ` is then not involutive: `(J(e₁)ᗮ)` is fine, but `J` does not map closed subspaces onto closed subspaces (the range of `J` is dense and proper).

### Dependencies

§0.1 depends on Mathlib only; §0.2 and §0.3 depend on §0.1; §0.4 and §0.5 depend on Mathlib only. No later layer is an input to Layer 0.

## Layer 1: operational systems, Mackey logics and Segal systems

### 1.1 Operational systems and questions

An operational system is a set of states `S`, a set of observables `O` and numbers `p(A,α,E) ∈ [0,1]` for `A ∈ O`, `α ∈ S` and Borel `E ⊆ ℝ`, satisfying:

- (a) outcome laws: `p(A,α,∅)=0`, `p(A,α,ℝ)=1` and `p(A,α,⋃ᵢEᵢ) = Σᵢ p(A,α,Eᵢ)` for countable disjoint Borel families;
- (b) separation: if `p(A,α,E) = p(B,α,E)` for all `α,E` then `A=B`, and if `p(A,α,E) = p(A,β,E)` for all `A,E` then `α=β`;
- (c) Borel functions: for every Borel `f : ℝ → ℝ` and `A ∈ O` there is `f(A) ∈ O` with `p(f(A),α,E) = p(A,α,f⁻¹(E))`, unique by (b); identity and composition hold by the pushforward laws, constants give constant observables, and this supplies `A²` and `1−Q` without defining `A+B` for unrelated observables;
- (d) countable mixing: for `αᵢ ∈ S` and `tᵢ ≥ 0` with `Σᵢtᵢ = 1` there is `α ∈ S` with `p(A,α,E) = Σᵢ tᵢ p(A,αᵢ,E)`, unique by (b); zero weights are allowed;
- (e) orthogonal joins: on questions (defined next) set `q ≤ r ↔ ∀α, p(q,α,{1}) ≤ p(r,α,{1})` and `q′ = (1−id)(q)`; every countable family with `qᵢ ≤ qⱼ′` for `i≠j` has a least upper bound in this order;
- (f) realization: every normalized question-valued Borel measure `E ↦ L_E` on ℝ (`L_∅=0`, `L_ℝ=1`, disjoint events orthogonal, `L_(⋃Eᵢ) = ⋁ L_(Eᵢ)` for countable disjoint families) is `E ↦ χ_E(A)` for some `A ∈ O`.

A question is an observable `Q` with `p(Q,α,{0,1}) = 1` for every state α; this is a property of `Q`, not of a state. Prove that in the Hilbert model (self-adjoint `Q`, all normal states) the question condition holds exactly when `Q` is an orthogonal projection, and that in the abstract system `Q` is a question exactly when `Q² = Q`: (c) makes `Q` and `Q²` have the same outcome laws because `x² = x` on `{0,1}`, and (b) gives `Q² = Q`; conversely, if `Q² = Q` then every outcome law `μ` of `Q` is invariant under `x ↦ x²`, so `μ((−∞,0)) = 0`, and with `F(r) = μ([0,r])` the identity `F(r) = F(√r)` iterated with continuity from below gives `μ((0,1)) = 0` and iterated upward gives `μ((1,∞)) = 0`, hence `μ({0,1}) = 1`. Own these distribution-function steps. Prove that the alternative predicate `∀α ∀E, p(Q,α,E) ∈ {0,1}` is not the projection criterion: it fails for a nontrivial projection in the state `I/2` and holds for `Q = 2I`.

The adopted Mackey bridge: require that the question order and `q′` form a nontrivial orthomodular poset with countable orthogonal joins, with `0,1` the constant questions. Prove evaluation additivity from (a), (c) and (f) rather than postulating it: for pairwise orthogonal `q_n` put `q = ⋁ q_n`, `r_0 = q′`, `r_(n+1) = q_n`, and `L_E = ⋁{r_k : k ∈ E}` (empty join `0`); prove subjoins over disjoint index sets are orthogonal and regroup, so `L` is a normalized question-valued measure with `L_ℝ = q′ ∨ q = 1`; realize `L_E = χ_E(A)` by (f), get `m_α(L_E) = p(A,α,E)` for `m_α(a) = p(a,α,{1})` by (c), and apply (a) to the singletons `{n+1}` to obtain `m_α(q) = Σ_n m_α(q_n)`. Thus each `m_α` is a countably additive probability on the logic.

- A question is an idempotent observable; in the Hilbert model, a projection.
- Each state evaluation `m_α` is a countably additive logic probability, derived from (a), (c), (f) and the bridge.
- The operations `A ↦ f(A)` form an action of Borel functions under composition.

*Needs:* Mathlib Borel measures on ℝ, `MeasureTheory.Measure.map`; VonNeumannAlgebras V2 for the Hilbert model's projection lattice; SelfAdjointSpectralTheory SA-B31 for the bounded spectral calculus in the Hilbert model.

**Checks.**

- `Q = diag(1,0)` on `ℂ²` in the state `ρ = I/2` has `p(Q,ρ,{1}) = 1/2`, so the alternative predicate fails for a projection, while `p(Q,ρ,{0,1}) = 1` holds; `Q = 2I` has outcome law `δ_2`, so the alternative predicate holds but `Q² = 4I ≠ Q`.
- The squaring-invariant measure argument: `μ = δ_(1/2)` is not squaring-invariant (`1/4 ≠ 1/2`), `μ = (δ_0+δ_1)/2` is; the only squaring-invariant Borel probabilities are supported on `{0,1}`, so `(δ_0+δ_1)/2` and `δ_1` are admissible outcome laws of a question and `δ_2` is not.
- In (e) the join of a two-element orthogonal family `{p, 1−p}` is `1`; the join of the empty family is `0`; no axiom asserts that one member of an orthogonal family equals `1`, which fails for `{p,1−p}` with `p` a nontrivial projection.

### 1.2 The two presentations and the Hilbert and Boolean models

From a nontrivial orthomodular poset `L` with countable orthogonal joins and a nonempty, full, countably convex family `J` of countably additive probabilities on `L` (full: `(∀m∈J, m(a) ≤ m(b)) → a ≤ b`; countably convex: `Σᵢtᵢmᵢ ∈ J` for `tᵢ ≥ 0`, `Σtᵢ = 1`, with convergence and countable additivity proved by nonnegative sum interchange), define the operational system with `S = J`, `O` all normalized `L`-valued Borel measures on ℝ, and `p(A,m,E) = m(A(E))`. For `a ∈ L` the binary observable is `A_a(E) = ⋁({a : 1∈E} ∪ {a′ : 0∈E})`. Prove (a)–(f): separation of states by binary observables, of observables by fullness, (c) by pushforward, (d) by countable convex closure, (e) by the joins of `L`, (f) by the measure itself; prove that every operational question is `A_a` for exactly one `a ∈ L`.

Conversely, from an operational system with the bridge of §1.1 put `q_E^A = χ_E(A)`. Prove `E ↦ q_E^A` is a normalized logic-valued measure (disjoint `E,F` give orthogonality from `m_α(q_E^A) ≤ 1 − m_α(q_F^A)` for all α and fullness; countable unions from evaluation additivity and (a)). Prove Principle II: `A ↦ (E ↦ q_E^A)` is a bijection from `O` onto all normalized logic-valued measures ((f) for surjectivity, the probability identity and (b) for injectivity); Principle III: `α ↦ m_α` is a bijection from `S` onto a full, countably convex family `J`; and the reconstruction `p(A,α,E) = m_α(q_E^A)`. Prove the two presentations are mutually inverse up to the stated bijections.

The Hilbert model (Principle IV) is the postulate that the question logic is isomorphic, as an orthomodular poset with countable orthogonal joins, to `P(H)` for a nonzero complex Hilbert space `H`; it is extra data, not a consequence of (a)–(f). The W*-model (Principle IV′) uses `L = P(M)` for a unital weak-operator-closed `*`-subalgebra `M ⊆ B(H)`, with the lattice embedding `P(M) ↪ P(H)` preserving complements and arbitrary joins and meets, and makes no converse claim about arbitrary sublattices. The Boolean model takes a nonempty measurable space `(Ω,Σ)`, `L = Σ`, `J` all probability measures (full, because it contains the Dirac measures) and `O` the measurable real functions acting by preimage; prove the converse realization of a `Σ`-valued Borel measure by the measurable function reconstructed from rational sublevel sets.

- The operational system of `(L,J)` satisfies (a)–(f) and its questions are exactly the binary observables.
- Principles II and III and the reconstruction formula, with `J` the image of `S`.
- The Hilbert, W* and Boolean models satisfy the bridge; the Boolean model's questions are the measurable sets.

*Needs:* §1.1; Mathlib measurable spaces and probability measures; VonNeumannAlgebras V2 (projection lattice), V1 (weak-operator closure).

**Checks.**

- For `L = {0,1}` and `J = {δ}` the operational system has one state, and its observables are the Dirac-type measures `E ↦ 1 if t∈E` for one real `t` each; both presentations are inverse to each other, with `O ≅ ℝ`.
- For the Boolean model on a two-point space with `J` all probability measures, the question `{ω₁}` is `A_a` for `a = {ω₁}`; a family `J` consisting of the single measure `(δ_(ω₁)+δ_(ω₂))/2` is countably convex but not full, since `m({ω₁}) = m({ω₂})` while `{ω₁} ≰ {ω₂}`, so Principle III's fullness is a real condition.
- In the Hilbert model on `ℂ²`, `K(H)+ℂ1 = B(ℂ²)` is a von Neumann algebra, but on infinite-dimensional `H` the unital `*`-algebra `K(H)+ℂ1` is weakly dense and not weakly closed, so Principle IV′ requires actual weak closure, not density (VonNeumannAlgebras V1 proves the density).

### 1.3 Logic automorphisms and operational actions

On the orthomodular poset `L` of §1.1 a logic automorphism is an `OrderIso L L` preserving the orthocomplement; prove it preserves every existing join, in particular countable orthogonal joins, and build identity, composition, inverse and action APIs. For a selected full, countably convex family `S` of probabilities on `L` and a selected family `O` of `L`-valued Borel measures, a logic automorphism α induces an operational symmetry exactly when `{ω∘α⁻¹ : ω∈S} = S` and `{α∘E : E∈O} = O`; this is an additional condition. For a group action `g ↦ α_g` prove the forced laws `(g·ω)(p) = ω(α_(g⁻¹)p)`, `E_(g·A)(B) = α_g(E_A(B))` and `p(g·A, g·ω, B) = p(A,ω,B)`. Conversely, under question representability (every `q ∈ L` is `E_A(B)` for some available `A` and Borel `B`, so that (c) supplies the binary observable `1_B(A)`), state and observable separation and fullness, reconstruct the logic automorphism from a probability-preserving action: prove independence of the representation `q = E_A(B)`, preservation of complements and countable orthogonal joins, the group laws, and `g·f(A) = f(g·A)` from (c) and separation. The full-observable presentation of §1.2 satisfies question representability; a selected family alone need not.

- Logic automorphisms preserve all joins, and operational symmetries are the automorphisms stabilizing the selected families.
- The forced state and observable transport laws for a group action.
- Reconstruction of the automorphism from a probability-preserving action under question representability.

*Needs:* §1.1, §1.2; Mathlib `OrderIso`, group actions.

**Checks.**

- On the four-element Boolean algebra `{0,a,a′,1}` the complement-preserving order automorphisms are the identity and `a ↔ a′`; with `S` all probabilities, both are operational symmetries; with `S = {ω}` for `ω(a) = 1/3`, only the identity is, since `ω∘swap` has `ω(a′) = 2/3 ≠ 1/3`.
- Question representability fails for the selected family `O = {A_a}` on the six-element logic of §1.4 when `O` omits the binary observable of `b`: no `E_A(B)` equals `b`, so an action on `(S,O)` need not determine `α_g(b)`.
- For `L = P(ℂ²)` and the unitary action `g ↦ Ad(U_g)`, `(g·ω)(p) = ω(U_g⁻¹pU_g)` and `p(g·A,g·ω,B) = p(A,ω,B)` is the invariance of `Tr(ρP)` under simultaneous conjugation; the formula `ω∘α_g` in place of `ω∘α_(g⁻¹)` would give a right action.

### 1.4 Horizontal sums and the model boundary

Let `MO_n` (`n ≥ 2`) be the horizontal sum of `n` four-element Boolean algebras: `0`, `1` and `2n` atoms `a_i, a_i′` with `a_i ⊥ a_i′` and distinct atoms otherwise incomparable. Prove it is an orthomodular lattice, that its full probability-state space is `[0,1]ⁿ` via `ω(a_i) = s_i`, that this space is full and countably convex, and compute its automorphism group as the wreath product `C₂ ≀ S_n` of order `2ⁿn!`: `(p,e)` sends `(i,b)` to `(p(i), b+e_i)` in `ℤ/2`, with `(p,e)(q,f) = (p∘q, (f_i + e_(q(i)))_i)`. Prove `MO_n` is not `P(M)` for any complex von Neumann algebra `M`: a finite projection set forces `M` abelian (a nonabelian summand contains a matrix-unit corner, hence infinitely many rank-one projections), while `MO_n` is not Boolean. Prove that `MO_2` is realized as a projection sublattice of `M₂(ℂ)` by `0,1,p,1−p,q,1−q` for distinct nonorthogonal rank-one `p,q`, closed under meets, joins and complement, but that no meet-preserving embedding realizes every state of `[0,1]²` by a normal state: the vertex `s=1,t=0` would need support at most `a ∧ b′ = 0`.

- `MO_n` is orthomodular, with full countably convex state space `[0,1]ⁿ` and automorphism group `C₂ ≀ S_n`.
- `MO_n` is not the projection lattice of a von Neumann algebra.
- `MO_2` embeds in `P(M₂(ℂ))` as a sublattice while its full state space does not embed into the normal states.

*Needs:* §1.2, §1.3; VonNeumannAlgebras V2 (projection lattice of `M₂(ℂ)`), V3 (matrix units).

**Checks.**

- `|Aut(MO_2)| = 2²·2! = 8` and `Aut(MO_2) ≅ (C₂×C₂)⋊S₂`; the element `(id, (1,0))` swaps `a_1 ↔ a_1′` and fixes `a_2`, and `((12),(0,0))` swaps the two blocks.
- The composition law: `(p,e)(q,f)` applied to `(i,b)` gives `(p(q(i)), b + f_i + e_(q(i)))`, which matches `(p∘q, (f_i+e_(q(i)))_i)`; the formula `(f_i + e_i)_i` would fail for `p = id`, `q = (12)`, `e = (1,0)`, `f = (0,0)` at `i = 1`.
- In `M₂(ℂ)` with `p = diag(1,0)` and `q = (1/2)·[[1,1],[1,1]]`, `p ∧ q = 0` and `p ∨ q = 1`, so `{0,1,p,1−p,q,1−q}` is closed under the lattice operations; the vertex state `s=1,t=0` of `[0,1]²` would be a normal state ω with `ω(p) = 1` and `ω(q) = 0`, forcing support in `p ∧ (1−q) = 0`.

### 1.5 Segal systems, states and the canonical order

A Segal system is a nonzero real Banach space `A` with a distinguished nonzero unit `1` and power maps `x ↦ xⁿ`, `n ∈ ℕ`, with `x⁰ = 1`, `x¹ = x`, the composition law `f[g[x]] = (f.comp g)[x]` for real polynomials evaluated by `f[x] = Σ_k f.coeff(k)·xᵏ`, the norm laws `‖x²‖ = ‖x‖²` and `‖x²−y²‖ ≤ max(‖x‖²,‖y‖²)`, and continuity of the square map (Segal 1947, Postulates I–IV). No bilinear product is assumed. Build the polynomial API, the singly generated commutative real Banach algebra `C(x)` with its continuous functional calculus, spectrum, spectral-radius formula, positive square roots and order bounds, and prove `‖1‖ = 1`. An algebraic state is a real-linear `φ : A → ℝ` with `φ(1) = 1` and `φ(x²) ≥ 0`; prove that states separate points, the norm formula `‖x‖ = sup_φ |φ(x)|` and `|φ(x)| ≤ ‖x‖`, so every algebraic state is continuous of norm one. Write `Σ(A)` for all states and define the canonical order `x ≤_Σ y ↔ ∀φ∈Σ(A), φ(x) ≤ φ(y)`; prove its ordered-vector-space laws, closedness of the cone, `−‖x‖1 ≤_Σ x ≤_Σ ‖x‖1`, and that the positive cone is the closed convex cone generated by squares (Hahn–Banach separation and state normalization owned here). Recover the positive-operator order on `B(H)_sa` and the coordinatewise order on `ℝ²`.

For a nonempty `M ⊆ Σ(A)` call `M` point-full if equal values on `M` force equality in `A`, order-determining if `(∀m∈M, m(x) ≤ m(y)) → x ≤_Σ y`, and norming if `‖x‖ = sup_(m∈M)|m(x)|`. Prove norming ⇔ order-determining ⇒ point-full: if `m(z) ≥ 0` on `M` and `c = ‖z‖`, the values of `c1−z` on `M` lie in `[0,c]`, so norming gives `‖c1−z‖ ≤ c` and the bound for every `φ ∈ Σ(A)` gives `φ(z) ≥ 0`; conversely with `r = sup_M |m(x)|` order determination gives `−r1 ≤_Σ x ≤_Σ r1` and the norm formula finishes. The canonical order always uses `Σ(A)`.

- The singly generated functional calculus, spectrum and square roots of a Segal system.
- States separate points and are norm one; the canonical order and its cone description.
- Norming ⇔ order-determining ⇒ point-full for a selected state family.

*Needs:* Mathlib real Banach spaces, `Polynomial`, Hahn–Banach, the continuous functional calculus for commutative Banach algebras.

**Checks.**

- `A = ℝ²` with coordinatewise powers and supremum norm: the states are `m_w(x,y) = wx + (1−w)y`, `w ∈ [0,1]`; the canonical order is coordinatewise; `‖(1,−1)‖ = 1 = sup_w |2w−1|`.
- Selected point-full families need not be order-determining: `m_w` for `w ∈ [1/10,1/5]` is convex and point-full, and compares `(1,0) ≤_M (0,1)` because `w ≤ 1−w`, while `(1,0) ≤_Σ (0,1)` is false (`1 ≤ 0` fails at `w = 1`).
- Logic fullness does not supply the norm bridge: `m_w` for `w ∈ [1/4,3/4]` is countably convex and full on the four-element projection lattice `{0,(1,0),(0,1),1}` of `ℝ²`, separates `ℝ²`, but is neither norming nor order-determining: every selected state is nonnegative on `(−1,3)` (`3−4w ≥ 0`), which is not canonically positive, and `sup_w |m_w(1,−1)| = 1/2 < 1 = ‖(1,−1)‖`; the selected expectation norm violates the square law, since `(1,−1)² = (1,1)` has value `1` while the square of `1/2` is `1/4`.

### 1.6 The distributive subclass as a JB-algebra

Let `P(A) = {p : p² = p}` with the inherited order and `p ⊥ q ↔ p+q ≤_Σ 1`; define compatibility by pairwise orthogonal `p₀,q₀,c ∈ P(A)` with `p = p₀+c`, `q = q₀+c`. Keep the polarizations `x∘ₛy = ¼((x+y)²−(x−y)²)` and `x∘ₚy = ½((x+y)²−x²−y²)` distinct until equal. In the distributive subclass, where `x∘ₛ(y+z) = x∘ₛy + x∘ₛz`, prove symmetry, additivity in both variables and real bilinearity (rational homogeneity, then continuity of polarization), `x∘ₛx = x²`, hence `∘ₛ = ∘ₚ`; from `(x²)² = x⁴` prove power-associativity, and with the two Segal norm axioms prove the Jordan identity and the JB norm laws by the Banach-power-associative argument (Iochum–Loupias 1985, Propositions I.4–I.5, Theorem V.1 and Corollary V.3). Construct Mathlib's `IsCommJordan` instance for this product.

Own the projection-order API of the resulting unital JB-algebra by the quadratic representation `U_a b = 2a∘(a∘b) − a²∘b`: prove from the JB norm laws and the singly generated calculus that the square cone is closed, convex, equal to the canonical cone, with positive invertibles exactly the elements bounded below by some `ε1`; own Shirshov–Cohn speciality, Macdonald's theorem, the fundamental formula `U_(U_a b) = U_a U_b U_a` and `(U_b a)² = U_b U_a (b²)`; define Jordan invertibility by `a∘b = 1`, `a²∘b = a`, prove uniqueness, equivalence with invertibility of `U_a`, `U_(a⁻¹) = U_a⁻¹`, that the inverse lies in `C(a)` and that invertibility in `A` agrees with invertibility in `C(a)` (if `0` were in the `C(a)`-spectrum of an invertible `a`, unit vectors `y_n ∈ C(a)` with `a∘y_n → 0` give `U_a(y_n²) = (a∘y_n)² → 0`, contradicting the lower bound from `U_a⁻¹` and `‖y_n²‖ = 1`). Prove `U_a(A₊) ⊆ A₊` for every `a` (Alfsen–Shultz–Størmer 1978, Proposition 2.7): for invertible `a`, `U_a(A₊^×)` is convex, consists of invertibles and contains `1`, so a negative spectral value would put a noninvertible element on a segment to `1`; extend to positive inputs by `b+ε1 → b`; for arbitrary `a` and positive invertible `c` use `b = c^(1/2)` and `(U_b a)² = U_b U_a(c)` with `U_(b⁻¹)` positive. Prove the Peirce decomposition for an idempotent `p` and the positive-block vanishing lemma: `x ≥ 0`, `U_p x = 0` gives `x = x_(1/2) + x_0` and positivity of `U_(sp+(1−p))x = s x_(1/2) + x_0` for all real `s` forces `x_(1/2) = 0`, so `x = U_(1−p)x`. Deduce `p ≤ e ⇔ p∘e = p` for idempotents (Alfsen–Shultz–Størmer 1978, Corollary 2.10) and that `p+q ≤_Σ 1` makes `p+q` the idempotent join of `p` and `q`: this is Pulmannová's condition (β) in the distributive subclass.

- `IsCommJordan` and the JB norm laws for the distributive subclass.
- The quadratic representation, Jordan inverses, `U_a(A₊) ⊆ A₊` and the Peirce block lemma.
- `p ≤ e ⇔ p∘e = p`, and orthogonal idempotents have join `p+q`.

*Needs:* §1.5; Mathlib `IsCommJordan`; Iochum–Loupias, Alfsen–Shultz–Størmer for the routes.

**Checks.**

- In `B(ℂ²)_sa` with `x∘y = (xy+yx)/2`, `U_p` for `p = diag(1,0)` is compression to the `(1,1)` entry: `U_p [[a,b],[b̄,d]] = diag(a,0)`, and the Peirce blocks of `x` are `diag(a,0)`, the off-diagonal part and `diag(0,d)`.
- `U_a(A₊) ⊆ A₊` on `M₂(ℂ)_sa`: `U_a b = aba` for the special Jordan product, and `aba = (a)(b)(a)` is positive for positive `b`; for `a = [[0,1],[1,0]]` and `b = diag(1,0)`, `aba = diag(0,1) ≥ 0`.
- In `M₂(ℂ)_sa` with `x = σ_x`, `y = σ_z`: `(x+y)² = 2·1 = (x−y)²`, so `x∘ₛy = 0`, and `x² = y² = 1` gives `x∘ₚy = ½(2·1 − 1 − 1) = 0`; the associative product `xy = −iσ_y` is not symmetric, so the Jordan product is the symmetrization `(xy+yx)/2`, which vanishes here, and not `xy`.

### 1.7 Segal-to-Mackey embeddings and Pulmannová's conditions

The Mackey carrier is an orthomodular σ-orthocomplemented poset `L` with a selected nonempty convex order-full family `N` of probabilities and a full family `O` of observables (`L`-valued Borel measures closed under real Borel functional calculus and with every proposition some `x(E)`). State expectations are integrals `∫t dm(x(t))` with an explicit absolute-integrability hypothesis. A Segal-to-Mackey embedding is an affine bijection `α : M ≃ N` and an injective `τ : A → O` with (i) every `α(m)(τx)` absolutely integrable and equal to `m(x)`, (ii) `τ(xⁿ) = (τx)ⁿ` by Borel pushforward, (iii) if `y ∈ O` is absolutely integrable in every `α(m)` with expectations `m(x)`, then `y = τx` (Pulmannová 1978, §2, Definition). Prove observable-sum uniqueness: any `y ∈ O` with expectations `m(x)+m(z)` in every selected state equals `τ(x+z)`.

For an embedding prove the necessary conditions of Pulmannová's Theorems 1 and 2: with `P⁰ = {m ↦ m(p) : p ∈ P(A)}` and `L₁ = {m ↦ α(m)(c) : c ∈ L}`, `P⁰ ⊆ L₁`, `L₁` is closed under `0`, complement and countable pointwise sums of pairwise summable members; and (CA): if pairwise orthogonal idempotents `a_i` have `Σ_i m(a_i) = m(a)` for every `m ∈ M` and some `a ∈ A`, then `a ∈ P(A)` and `a` is their supremum in the idempotent order. Prove (CA) with only point-fullness of `M`: τ identifies idempotents with question observables; order-fullness of `N` makes the propositions of `τ(a_i)` orthogonal; their join has the same expectations as `τ(a)`, and clause (iii) with the power law gives `a² = a`; for an idempotent upper bound `p`, the question for `(c ∨ d′)′` has profile `m(p−a)`, so `(p−a)² = p−a` and `p−a ≥_Σ 0`.

Prove the internal equivalence (CA) ⇔ (β) and (γ) when `M` is order-determining and no embedding is assumed, where (β): `a ⊥ b` implies `a+b` is the idempotent join, and (γ): if an increasing sequence `p_n ∈ P(A)` has `m(p_n) → m(s)` for every `m ∈ M` and some `s ∈ A`, then `s ∈ P(A)` (Pulmannová, Theorem 3). For (CA) ⇒ (γ) derive (β) first, show `q−p` is idempotent for idempotents `p ≤_Σ q`, and apply (CA) to the orthogonal differences `d_0 = p_0`, `d_n = p_n − p_(n−1)`, which telescope. Prove Theorem 4: with the product `∘ₚ`, (β) is equivalent to (δ): pairwise orthogonal `a,b,c` have `(a+b)∘c = a∘c + b∘c = 0`. In the distributive subclass prove Theorem 5: `a∘b` is the idempotent greatest lower bound of `a,b` exactly when they are compatible, and then `a ∨ b = a+b−a∘b`. No embedding sufficiency theorem is asserted.

- Embeddings and their observable-sum uniqueness.
- The necessary conditions, (CA) with point-fullness only.
- (CA) ⇔ (β) ∧ (γ) under order determination; (β) ⇔ (δ); compatibility and `a∘b` in the distributive subclass.

*Needs:* §1.5, §1.6; Pulmannová 1978.

**Checks.**

- In `ℝ²` with all states, the idempotents are `(0,0),(1,0),(0,1),(1,1)`; (CA) holds: the only orthogonal pairs are `(1,0),(0,1)` and their sum `(1,1)` is idempotent and the join.
- (γ) is not norm convergence: in `B(ℓ²)_sa` with all normal states, `p_n = Σ_(k≤n) e_k e_k*` increases, `Tr(ρp_n) → Tr(ρ) = 1 = Tr(ρ·1)` for every density ρ, and `s = 1` is idempotent, while `‖p_n − 1‖ = 1` for all `n`.
- (δ) fails without orthogonality: in `M₂(ℂ)_sa`, `a = diag(1,0)`, `c = (1/2)[[1,1],[1,1]]` have `a∘c = (1/2)[[1,1/2],[1/2,0]] ≠ 0`; (δ) only constrains pairwise orthogonal triples, where `a∘c = 0` follows from `ac = 0`.

### 1.8 The bounded Hilbert comparison and the state adapter

For a nonzero complex Hilbert space `H` take `A = B(H)_sa` and all normal states `m_ρ(T) = Tr(ρT)`. Prove they are convex, point-full, order-determining and norming, by vector states and the self-adjoint numerical-radius formula `‖T‖ = sup_(‖ψ‖=1)|⟨ψ,Tψ⟩|`. Identify `P(A)` with orthogonal projections ordered by range inclusion and prove countable additivity and order fullness of the normal states on projections. Consume SelfAdjointSpectralTheory SA-B31, SA-B35, SA-E44 and SA-E45 for the bounded spectral PVM, the identity `T = ∫x dP`, uniqueness and bounded compatibility; own the adapter identifying the supplied bounded spectral map with bounded-support PVMs, expectation preservation, power pushforward and uniqueness among bounded-support PVMs. This bounded comparison is not closed under all Borel functions; §4.5 supplies the all-PVM carrier.

Identify the Segal states of `B(H)_sa` with VonNeumannAlgebras V0's positive normalized complex-linear states of `B(H)`: restrict a V0 state to the self-adjoint part; extend a real Segal state by `φ_ℂ(a) = φ((a+a*)/2) + iφ((a−a*)/(2i))`; prove complex linearity, positivity, normalization, boundedness and that restriction and extension are inverse affine maps, and match the normal subfamilies through V4.Core's trace pairing. Use this adapter whenever a Segal state enters a C*-algebra model.

- Normal states of `B(H)_sa` are point-full, order-determining and norming.
- The bounded Segal/Mackey adapter and its uniqueness among bounded-support PVMs.
- The affine bijection between real Segal states of `B(H)_sa` and V0 states of `B(H)`.

*Needs:* §1.5, §1.7; SelfAdjointSpectralTheory SA-B31, SA-B35, SA-E44, SA-E45; VonNeumannAlgebras V0, V4.Core.

**Checks.**

- For `T = diag(1,−1)` on `ℂ²`, `sup_ρ |Tr(ρT)| = 1 = ‖T‖`, attained at `ρ = diag(1,0)`; for `T = [[0,1],[1,0]]` the supremum `1` is attained at `ρ = (1/2)[[1,1],[1,1]]`.
- The extension formula on `a = [[0,1],[0,0]]` (not self-adjoint) with `φ = Tr(ρ·)`, `ρ = diag(1,0)`: `(a+a*)/2 = (1/2)σ_x`, `(a−a*)/(2i) = (1/2)σ_y`, so `φ_ℂ(a) = 0 + i·0 = 0 = Tr(ρa)`; the formula with `(a−a*)/2` instead would not be complex linear.
- A bounded-support PVM `P` on `ℝ` with `P({2}) = 1` corresponds to `T = 2·1`; the PVM `P′` with `P′({2}) = P′({3}) = 1/2·1` is not projection-valued and is not the spectral map of any `T`.

### 1.9 The Gudder–Boyce realization

For a Segal system `A` with its entire state set `Σ(A)` (countably convex, by §1.5), use the weak Mackey axioms of Gudder–Boyce 1970, §2: (1) each `p(x,m,·)` is a Borel probability; (2) outcome laws separate observables and states; (3) every real Borel `f` gives `f(x)` with the pushforward law; (4) countable convex mixtures of states exist and mix outcome laws; (5) if `E₁,E₂` are disjoint and `p(y,m,F)` bounds `p(x,m,E₁)` and `p(x,m,E₂)` for every `m`, it bounds `p(x,m,E₁∪E₂)`; (6) if `p(x,m,E) > 0` for some `m`, some `m₁` has `p(x,m₁,E) = 1`. Axiom (5) is weaker than the countable orthogonal-join axiom and is the one used. Define `m(x) = ∫t dp(x,m,t)` under absolute integrability, bounded-support observables, and the selected supremum norm; a sum `z` of `x,y` is an observable with `m(z) = m(x)+m(y)` for every state, without existence or uniqueness claims. Prove Theorem 6.1 (Gudder–Boyce, §6): there is a weak model and an injective `τ : A → O` with `τ(q[a]) = q(τa)`, `m(τa) = m(a)`, `τ(a+b)` a sum of `τa, τb`, and `sup_m |m(τa)| = ‖a‖`. Build the representation it uses: closed unital power-closed subsystems with bilinear associative polarized product are real `C(X)` algebras; restrict a state to such a subsystem and represent it by a probability measure; prove state extension back to `A`; verify all six axioms including (6). Prove Corollaries 6.2–6.3: τ preserves and reflects the idempotent order and complements, and commuting Segal observables (those generating an associative subsystem) have compatible ranges. Define embeddings of weak models with the same states (injective, preserving Borel calculus and all probabilities) and prove Theorem 6.4: the Borel closure of the images `τ(a)` is a minimal realization embedding into every realization, with comparison map `[f(a)] ↦ f(τ₁a)` independent of the description; do not transfer Corollary 6.3 to the minimal realization, where the paper notes it can fail. This full-state theorem does not prove the normal-state adapter of §1.8, whose states are a proper subfamily.

- Theorem 6.1: the Segal-to-weak-Mackey realization with the four properties of τ.
- Corollaries 6.2–6.3 and the embedding/minimal-realization Theorem 6.4.
- The direction is Segal → weak Mackey; Pulmannová's embedding clause (iii) is not supplied by the sum relation.

*Needs:* §1.5–§1.7; Gudder–Boyce 1970.

**Checks.**

- For `A = ℝ` (powers `xⁿ`, unit `1`), `Σ(A) = {id}`, the realization has `O ≅ ℝ` with `τ(a)` the Dirac measure at `a`, and axiom (6) holds trivially since `p(x,id,E) ∈ {0,1}`.
- For `A = ℝ²` the subsystems generated by one element are at most two-dimensional and associative; `τ(1,0)` and `τ(0,1)` have orthogonal ranges `{1}`-events, and `τ((1,0)+(0,1)) = τ(1,1)` is the constant observable `1`, a sum in the weak sense.
- Axioms (5) and (6) in the Hilbert model `B(H)_sa` with all normal states: if `⟨ψ,P_y(F)ψ⟩ ≥ ⟨ψ,P_x(Eᵢ)ψ⟩` for `i = 1,2` and all unit ψ, then `P_y(F) ≥ P_x(E₁), P_x(E₂)` as operators, and since these two projections are orthogonal their sum is their join, so `P_y(F) ≥ P_x(E₁∪E₂)`; if some state gives `P_x(E)` positive probability then `P_x(E) ≠ 0` and a unit vector in its range gives probability `1`.

### Examples

`B(H)_sa` with all normal states is a distributive Segal system whose JB product is `(xy+yx)/2`, whose idempotent lattice is `P(H)`, and for which (CA), (β), (γ) hold by countable additivity of normal states and the strong convergence of increasing projection sequences; the bounded comparison of §1.8 realizes it in the Mackey model of bounded-support PVMs. The commutative Segal system `C(X)` with all probability measures as states is the Boolean model of §1.2 with `L` the Borel algebra modulo nothing (every Borel set is a question).

### Dependencies

§1.1 → §1.2 → §1.3 → §1.4; §1.5 → §1.6 → §1.7 → §1.8 → §1.9; §1.8 consumes §1.2 for the Hilbert model and Layer 0 nothing. Layer 1 consumes VonNeumannAlgebras V0–V3, V4.Core, SelfAdjointSpectralTheory SA-B31/B35/E44/E45, CStarAlgebras C2 (pure states, used in §1.8's extension of states) and Mathlib.

## Layer 2: measurements, instruments and dilation

### 2.1 Effects, POVMs and outcome laws

A quantum model consists of a unital C*-algebra `A`, a unital `*`-representation `π : A → B(H)`, a selected set of V0 states on `A` vanishing on `ker π`, selected effects in `B(H)`, measurable outcome spaces with POVMs, and chosen dynamics and symmetries. For a selected state φ construct the factored state `φ_π` on `π(A)` with `φ = φ_π∘π`, prove its uniqueness and the equivalence of factorization with annihilation of `ker π`; for effects outside `π(A)` the model includes a chosen state extension `φ̃` of `φ_π`, required to be normal whenever outcome laws use a weak-operator countably additive POVM. Define `μ_(φ,E)(S) = φ̃(E(S))`; prove positivity and normalization for every state, countable additivity for normal states and weak-operator countably additive POVMs, and for norm-countably additive measurements and arbitrary bounded states; finite-outcome POVMs need no normality. In a Hilbert representation prove `μ_(ψ,E)(S) = ⟪ψ,E(S)ψ⟫`, and for a sharp observable with spectral PVM `P_A` (SelfAdjointSpectralTheory SA-E01) that this is `‖P_A(S)ψ‖²`; for a density operator prove `Tr(ρE(S))` with basis independence, positivity and total mass one. Prove contractivity from positivity and normalization: `1 − E_i = Σ_(j≠i) E_j ≥ 0` for finite families and `1 − E(S) = E(Sᶜ) ≥ 0` in general; a presentation recording contractivity as data presents the same measurements, with inverse forgetful/construction maps. Transport POVMs, effects, outcome laws, coarse-grainings and instruments along an outcome equivalence and prove invariance of probabilities; a finite model may use a different finite outcome type for each measurement, and the common-cardinal presentation `Fin (o(m))` is a specialization whose choice of equivalences does not matter. Prove finite coarse-graining by measurable pushforward, disjoint additivity, complement probability and finite-valued functional calculus. Define operational equivalence of states as equality on the selected effects and prove it is equality exactly when the effect family separates states. Define `FinitePOVM n outcomes` (in `Suggested.lean`) as a family of positive semidefinite `n×n` matrices summing to `1`; this is the finite-dimensional specialization.

- Outcome laws are probability measures under the stated normality or norm-additivity hypotheses; vector and trace formulas.
- Contractivity is a theorem; label transport is an action with identity and composition laws.
- `FinitePOVM`: finite-outcome POVMs on `ℂⁿ`, the carrier of §2.2's finite dilation theorem.

*Needs:* VonNeumannAlgebras V0 (states), V4.Core (trace pairing); CStarAlgebras C2 (pure states); SelfAdjointSpectralTheory SA-B01, SA-E01; Mathlib `Matrix.PosSemidef`.

**Checks.**

- Qubit: `ρ = (1/2)(1 + r·σ)` with `|r| ≤ 1` is a density matrix; the `σ_z` measurement has `E_± = (1±σ_z)/2` and `Tr(ρE_±) = (1±r₃)/2`; for the maximally mixed state `r = 0` both are `1/2`; the nonprojective effect `E = (1/2)(1 + (1/2)σ_x)` together with `1−E` is a POVM that is not a PVM, since `E² ≠ E`.
- On a classical two-point sample space, the commutative algebra `ℂ²` with states `(w,1−w)` and the effects `(1,0),(0,1)` gives outcome probabilities `w` and `1−w`; every finite-outcome POVM on `ℂ²` is a mixture of PVMs (each point's column of effect values is a probability vector, and the vertices of the product of these simplices are the deterministic assignments), whereas the three-outcome POVM `E_k = (2/3)|v_k⟩⟨v_k|` on the quantum `ℂ²` (the trine of §2.2, with `|⟨v_j,v_k⟩| = 1/2` for `j ≠ k`) is not a mixture of PVMs: a PVM term `Q_k` with positive weight lies below the rank-one `E_k`, so `Q_k ∈ {0, |v_k⟩⟨v_k|}`, and two of these summing with the third to `1` would be orthogonal. A single effect, in `M₂(ℂ)` as in `ℂ²`, is always a mixture of projections (`λ₁·1 + (λ₂−λ₁)P₂ + (1−λ₂)·0` for an effect of `M₂(ℂ)` with eigenvalues `λ₁ ≤ λ₂` and spectral projection `P₂`), so the quantum/classical contrast lies in POVMs, not in single effects.
- Weak-operator countable additivity is not norm additivity: on `ℓ²` the PVM `E(S) = Σ_(n∈S) e_n e_n*` has `E(ℕ) = 1` as a strong limit, while `‖E({n})‖ = 1` for every `n`, so the norm series diverges; a `tsum` formulation of countable additivity would make this PVM fail to be one.

### 2.2 Naimark dilation

For a normalized weak-operator countably additive POVM `E` on `(Ω,Σ)` with values in `B(H)` prove Naimark's dilation theorem: there are a Hilbert space `K`, an isometry `V : H → K` and a normalized PVM `Q : Σ → B(K)` with `E(S) = V*Q(S)V`; impose minimality `K = closure span{Q(S)Vξ}` and prove uniqueness up to a unitary fixing `VH` (Paulsen, *Completely Bounded Maps and Operator Algebras*, Theorem 4.6; the measurable-space version is constructed here). Construct `K` from simple `H`-valued functions on `Ω` with the positive form `⟪1_S⊗ξ, 1_T⊗η⟫ = ⟪ξ, E(S∩T)η⟫`, quotient by the null space and complete; prove form positivity, the PVM multiplication law, countable additivity and the compression identity. Alternatively derive the dilation from CStarAlgebras C4's Stinespring theorem applied to the integration map `I_E : BoundedBorelFunction Ω → B(H)` (SelfAdjointSpectralTheory SA-B37, SA-B39): define `I_E` on simple symbols over finite measurable partitions, prove partition independence, prove complete positivity on pointwise positive matrices of simple symbols, identify `M_n(BoundedBorelFunction Ω)` with bounded measurable `M_n(ℂ)`-valued functions and prove that abstract positivity equals pointwise positive semidefiniteness in both directions (evaluation is a `*`-homomorphism; conversely the pointwise square root is measurable and bounded by `sup_ω ‖A(ω)‖^(1/2)`), extend in the supremum norm by finite-range approximation, and prove that the minimal dilation's PVM is strongly countably additive by density of `span{Q(S)Vξ}` and the uniform projection bound. No topology on Ω is needed; for `H = 0` give the zero dilation. Prove the finite-outcome form `naimark_dilation_finite` (in `Suggested.lean`): every `FinitePOVM n outcomes` is `E_i = V*Q_iV` for an isometry `V : ℂⁿ → ℂᵐ` and a finite PVM `(Q_i)`, with `m ≤ n·outcomes`, the minimal dilation having `m = Σ_i rank E_i`.

- Naimark dilation with minimality and uniqueness, on an arbitrary measurable outcome space.
- The Stinespring route through the bounded-measurable-function C*-algebra, with matrix positivity identified pointwise.
- `naimark_dilation_finite`: finite POVMs on `ℂⁿ` dilate to PVMs on `ℂᵐ` with `m ≤ n·outcomes`.

*Needs:* §2.1; CStarAlgebras C4; SelfAdjointSpectralTheory SA-B37, SA-B39; Mathlib `Matrix.conjTranspose`, `IsStarProjection`.

**Checks.**

- The trine POVM on `ℂ²`, `E_k = (2/3)|v_k⟩⟨v_k|` for three unit vectors at mutual angle `2π/3` in the real plane, sums to `1`; its minimal dilation space has dimension `Σ rank E_k = 3`, and `V : ℂ² → ℂ³` is `Vξ = (√(2/3)⟨v_k,ξ⟩)_k` with `Q_k` the coordinate projections; `V*V = (2/3)Σ_k |v_k⟩⟨v_k| = 1`.
- A PVM is its own minimal dilation: `K = H`, `V = 1`, and uniqueness returns the identity unitary; a dilation of a PVM with `K ≠ VH` is not minimal.
- The form `⟪1_S⊗ξ,1_T⊗η⟫ = ⟪ξ,E(S∩T)η⟫` is positive but degenerate: for `E({ω₀}) = 0` the vector `1_({ω₀})⊗ξ` has zero norm and is quotiented out, so `dim K` can be smaller than `|Ω|·dim H`.

### 2.3 Instruments, Lüders operations and repeatability

A normal instrument on `B(H)` with outcome space `(Ω,Σ)` is a map `S ↦ I_S` from events to completely positive maps on the trace class `S₁(H)` (OperatorIdeals Part B) whose Banach duals are normal on `B(H)`, countably additive in trace norm on positive inputs, with `I_Ω` trace preserving (Davies–Lewis 1970; Davies 1976, Chapter 4). Prove each `I_S` is trace nonincreasing, its dual `I_S*` is CP and subunital, and `E(S) = I_S*(1)` is a POVM; prove instrument composition for standard Borel or countable outcome spaces by the product-outcome instrument; prove the outcome law `Tr(I_S(ρ)) = Tr(ρE(S))` and the conditional update `ρ ↦ I_S(ρ)/Tr(I_S(ρ))` when the denominator is positive; the nonselective channel `I_Ω` has unital dual. For a countable sharp observable with atoms `(P_i)`, pairwise orthogonal with strong sum `1`, define the Lüders instrument `I_S(ρ) = Σ_(i∈S) P_iρP_i`; prove trace-norm convergence on positive inputs, countable additivity, the selective update and the pinching map, and the repeatability law `I_S*(P(T)) = P(S∩T)` with `P(T) = Σ_(j∈T) P_j`; derive certainty of the same outcome under repetition when the first outcome has positive probability. A single yes/no Lüders operation for a fixed event `A` is the two-outcome instrument `ρ ↦ P(A)ρP(A)`, `ρ ↦ P(Aᶜ)ρP(Aᶜ)`; the set-indexed family `S ↦ P(S)ρP(S)` is not an instrument.

Prove that for a standard Borel outcome space and a nonzero separable `H`, a sharp PVM admits a normal repeatable instrument (`I_S*(P(T)) = P(S∩T)` for all `S,T`) exactly when it is concentrated on a countable set of atoms (Ozawa 1984, Theorem 6.6); for necessity own the trace-class-valued Radon–Nikodym disintegration of the output measure of a faithful normal input state and show, using a countable generating algebra, that the conditional output density at `x` is supported in `P({x})H`, so the nonzero singleton projections are a countable orthogonal family and faithfulness removes the continuous part. Deduce that the position PVM on `L²(ℝ)` has no normal repeatable instrument. For a discrete sharp PVM distinguish weak repeatability (`I_i(ρ) = P_iI_i(ρ)P_i` with `I_i*(1) = P_i`, equivalently `I_i*(P_j) = δ_(ij)P_i`) from strong repeatability (`I_i∘I_j = 0` for `i≠j`, `I_i∘I_i = I_i`); prove strong repeatability implies `I_i*(E_j) = δ_(ij)E_i` for the associated POVM, that neither implies the effects are projections, and that strong repeatability together with `E_i = P_i` implies weak repeatability (Łuczak–Podsędkowska 2015, Theorem V.7). Characterize weakly repeatable instruments and exhibit `I_i(ρ) = Tr(P_iρ)σ_i` with `σ_i` a density supported in `P_iH`, which is non-Lüders when some `P_i` has rank at least two.

- Instruments, their POVMs, composition, outcome laws and conditional updates.
- Lüders instruments and their repeatability law; the single-event Lüders operation.
- Repeatable normal instruments exist exactly for discrete sharp observables; weak versus strong repeatability.

*Needs:* §2.1, §2.2; OperatorIdeals Part B (trace class), VonNeumannAlgebras V4.Core (normal duality), CStarAlgebras C4 (CP maps); Mathlib standard Borel spaces.

**Checks.**

- On `ℂ³` with `E₁ = diag(1,1/2,0)`, `E₂ = diag(0,1/2,1)`, `I₁(ρ) = Tr(E₁ρ)|e₁⟩⟨e₁|`, `I₂(ρ) = Tr(E₂ρ)|e₃⟩⟨e₃|`: the instrument is normalized and strongly repeatable (`I₁∘I₁ = I₁` since `Tr(E₁|e₁⟩⟨e₁|) = 1`, `I₂∘I₁ = 0` since `Tr(E₂|e₁⟩⟨e₁|) = 0`), yet `(E₁,E₂)` is not a PVM; sharpness does not follow from strong repeatability.
- For two atoms `P₁ = |e₁⟩⟨e₁|`, `P₂ = |e₂⟩⟨e₂|` on `ℂ²` and `ρ = |ψ⟩⟨ψ|` with `ψ = (e₁+e₂)/√2`, the set-indexed family gives `P({1,2})ρP({1,2}) = ρ`, while `P₁ρP₁ + P₂ρP₂ = (1/2)·1 ≠ ρ`; it is not additive.
- The Lüders repeatability law on `ℂ²`: `I_({1})*(P({2})) = P₁P₂P₁ = 0 = P({1}∩{2})` and `I_({1})*(P({1})) = P₁`; the instrument `I_i(ρ) = Tr(P_iρ)σ_i` with `σ₁ = P₁` on `ℂ²` coincides with Lüders because `P₁` has rank one.

### Examples

A finite worked model: the qubit with the `σ_z` measurement, the Bloch coordinates and the trine POVM of §2.2, whose dilation is a three-outcome PVM on `ℂ³`. The position observable on `L²(ℝ)` has the sharp PVM `P(S) = 1_S·` with nonatomic outcome measure, no repeatable normal instrument, and the normal nonrepeatable instrument `I_S(ρ) = ∫_S Φ_x(ρ)dx` for any measurable family of normal unital CP maps with `Σ`-integrable outcome densities.

### Dependencies

§2.1 → §2.2 → §2.3; Layer 2 consumes Layer 1 (§1.2 for the Hilbert model and §1.8 for the state adapter), VonNeumannAlgebras V0, V4.Core, CStarAlgebras C2, C4, SelfAdjointSpectralTheory Part B/E and OperatorIdeals Part B.

## Layer 3: projection logic, Gleason's theorem and density states

### 3.1 The projection logic of a Hilbert space

Consume VonNeumannAlgebras V2's projection lattice of `B(H)`: closed subspaces with meet, join (closed linear span), complement and orthogonality. Prove the orthomodular law `p ≤ q → q = p ∨ (q ∧ p′)` and the operational meanings: `p ∧ q` is the largest question implied by both, `p ∨ q` the smallest implying both, and for commuting projections `p ∧ q = pq`, `p ∨ q = p+q−pq`; prove the Boolean algebra laws on a commuting family and only there. Record the modularity comparison: the closed-subspace lattice of an infinite-dimensional Hilbert space is not modular (V2.NonmodularProjectionLattice), while V5.LatticeFinite gives modularity exactly for finite algebras; neither is an input to the probability theory below. A probability on projections is a function `m : P(H) → [0,1]` with `m(0) = 0`, `m(1) = 1`, additive on orthogonal pairs; it is countably additive when `m(⨆ₙVₙ) = Σₙ m(Vₙ)` for orthogonal sequences, the right side a scalar `tsum` and the join a closed span, and completely additive when `m(⨆ᵢVᵢ) = sup_F Σ_(i∈F) m(Vᵢ)` over finite subfamilies of an arbitrary orthogonal family. For a unit vector ψ prove `m_ψ(V) = ‖P_Vψ‖² = ⟪ψ,P_Vψ⟫` is completely additive, from strong convergence of orthogonal sums of projections.

- Orthomodularity and the operational meanings of the lattice operations; Boolean laws on commuting families only.
- Finitely, countably and completely additive probabilities on `P(H)`; vector-state measures are completely additive.
- Modularity holds exactly in finite dimension (through V2 and V5).

*Needs:* VonNeumannAlgebras V2 (projection lattice, V2.NonmodularProjectionLattice), V5.LatticeFinite; Mathlib `Submodule.starProjection`, `tsum`.

**Checks.**

- In `ℂ²` with `p = diag(1,0)` and `q = (1/2)[[1,1],[1,1]]`: `p ∧ q = 0`, `p ∨ q = 1`, so the distributive law fails: `p ∧ (q ∨ q′) = p ≠ (p∧q) ∨ (p∧q′) = 0`; the orthomodular law holds for the comparable pair `0 ≤ p`.
- Countable additivity is a scalar `tsum`: for `m_ψ` with `ψ = Σ 2^(−n/2)e_n` on `ℓ²`, `m_ψ(ℂe_n) = 2^(−n)` sums to `1 = m_ψ(1)`, while the projections `Σ_(n≤N) e_ne_n*` converge to `1` only strongly.
- The vector-state measure on `ℂ²` with `ψ = e₁`: `m_ψ(ℂ(e₁+e₂)) = 1/2`, `m_ψ(ℂe₂) = 0`, `m_ψ(ℂe₁) = 1`; a candidate `m(V) = (dim V)/2` is additive but assigns `1/2` to every line, and is not a vector-state measure.

### 3.2 Logic probabilities and normal states

Consume VonNeumannAlgebras V12.J.Frame for the finite-dimensional Gleason theorem (every bounded nonnegative frame function on `ℂⁿ`, `n ≥ 3`, is `v ↦ ⟪v,Tv⟫` for a unique positive `T` with `Tr T` the weight) and its dimension-two counterexample, and V12.J.Scalar for the general case: `B(H)` has no type I₂ central summand exactly when `dim H ≠ 2`, it is σ-finite exactly when `H` is separable, so every countably additive probability on `P(H)` for separable `H` of dimension at least three, and every completely additive probability on `P(H)` for arbitrary `H` of dimension at least three, extends uniquely to a normal state. Own the operational consequences. Prove, for the Hilbert model of §1.2 on such `H`, that every member of the full family `J` of Principle III is a normal state, so that every state of the operational system is a density operator `ρ` with `m(V) = Tr(ρP_V)`, and that `J` is exactly the normal-state family when `J` is the set of all countably additive probabilities on `P(H)`; fullness alone does not force this, since a proper full countably convex subfamily exists (Checks), so taking all normal states as the state family is a hypothesis of the Hilbert model, not a consequence of Principle III; prove the extreme points of the countably additive probabilities are the vector-state measures `m_ψ`, and that `m_ψ = m_φ` exactly when ψ and φ span the same ray (for pure normal states of `B(H)`, equality of the vector functionals forces equality of rays). Prove that in dimension two the countably additive probabilities on `P(ℂ²)` strictly contain the normal states, by the sgn frame function of V12.J.Frame, and that in dimension one every probability is the unique state. Nothing here re-proves the extension theorem; the roadmap owns the identification of its hypotheses with the operational axioms and the dictionary between logic probabilities, normal states, density operators and rays.

- For separable `H` with `dim H ≥ 3`, every state of Principle III's family is a normal state, hence a density operator; the family is all normal states exactly when it is all countably additive probabilities on `P(H)`.
- Extreme logic probabilities are vector-state measures, and a vector-state measure determines its ray.
- Dimensions one and two are exceptional in the stated ways.

*Needs:* §1.2, §3.1; VonNeumannAlgebras V12.J.Frame, V12.J.Scalar, V4.Normality (normal states are density operators); CStarAlgebras C2 (pure normal states of `B(H)` are vector states).

**Checks.**

- On `ℂ³` the measure `m(V) = Tr(ρP_V)` with `ρ = diag(1/2,1/3,1/6)` has values `1/2, 1/3, 1/6` on the coordinate lines and `1/2 + 1/3 = 5/6` on their span; V12.J.Frame returns exactly `T = ρ` with weight `1`.
- On `ℂ²` the frame function `f(n) = 1/2 + (1/4)sgn(n₃)` of V12.J.Frame is a countably additive probability on `P(ℂ²)` (two orthogonal rays `n,−n` sum to `1`) that is not `Tr(ρP)` for any ρ; the separable-dimension-two case is excluded from the normal-state identification.
- Two unit vectors with `m_ψ = m_φ` on `ℂ²`: `m_ψ(ℂψ) = 1` forces `‖P_ψφ‖ = 1`, so `φ ∈ ℂψ`; the vectors `e₁` and `ie₁` give the same measure and the same ray, as they must.
- On `ℂ³` the faithful normal states (densities with trivial kernel) form a nonempty countably convex family: a countable mixture `Σt_iρ_i` with some `t_i > 0` dominates `t_iρ_i` and has trivial kernel. It is full: for projections `a ≰ b` choose a unit `ψ ∈ ran a` with `‖bψ‖ < 1`; then `ρ_ε = (1−ε)|ψ⟩⟨ψ| + (ε/3)·1` is faithful and `Tr(ρ_ε(a−b)) = (1−ε)(1−‖bψ‖²) + ε(Tr a − Tr b)/3 > 0` for small `ε`. It contains no vector state, so a full countably convex state family of the Hilbert model on `ℂ³` can be a proper subfamily of the normal states; in dimension two the states with Bloch vector of length at most `1/2` are the analogous proper full family.

### 3.3 Positive trace-class eigen-expansion

On an arbitrary complete complex Hilbert space `H`, including nonseparable `H`, let ρ be a positive trace-class operator (OperatorIdeals Part B). Consume OI-B29–OI-B30 (a finite trace-class gauge makes the approximation numbers summable, hence null) and OI-A29 (compactness); positivity gives symmetry; apply `TauCeti.ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` (compact symmetric on a complete inner-product space, no separability) and `ContinuousLinearMap.finite_dimensional_eigenspace` for nonzero eigenvalues, and `hasSum_smul_repr_of_apply_eq_smul` for the pointwise expansion. Prove that the eigenvalues are nonnegative, that their sum with multiplicity is `Tr ρ` (V4.Core's basis-independent positive trace), hence that the positive-eigenvalue eigenvectors form a finite or countable orthonormal family `(ψ_i)` with eigenvalues `λ_i > 0`, and the exact tail identity `‖ρ − Σ_(i∈F)λ_iP_i‖₁ = Σ_(i∉F)λ_i` for finite `F`, from the isometric trace pairing and V0's positive-functional norm formula; so the finite-subset net converges in trace norm to ρ, including `ρ = 0`, finite families and `H = 0`. For `Tr ρ = 1` deduce `Σλ_i = 1` and `Tr(ρA) = Σ_iλ_i⟪ψ_i,Aψ_i⟫` for every bounded `A`, absolutely convergent with bound `‖A‖`, and compare with V4.Normality's vector-functional decomposition. This is the normal-state eigen-expansion; it is distinct from Gleason's theorem and from any decomposition claim for nonnormal states.

- Positive trace-class operators have a countable positive eigenbasis with summable eigenvalues and a trace-norm convergent expansion.
- `Tr(ρA) = Σλ_i⟪ψ_i,Aψ_i⟫` for density operators, with absolute convergence.
- The zero eigenspace may be nonseparable; no injectivity or separability is assumed.

*Needs:* OperatorIdeals OI-A29, OI-B29, OI-B30; VonNeumannAlgebras V0, V4.Core, V4.Normality; Tau Ceti `TauCeti.ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`, `hasSum_smul_repr_of_apply_eq_smul`; Mathlib `ContinuousLinearMap.finite_dimensional_eigenspace`.

**Checks.**

- `ρ = diag(1/2,1/2,0,0,…)` on `ℓ²`: two positive eigenvalues, tail identity `‖ρ − (1/2)P₁‖₁ = 1/2`, and `Tr(ρA) = (A₁₁ + A₂₂)/2`.
- `ρ = Σ 2^(−n)e_ne_n*` on `ℓ²`: `Tr ρ = 1`, the expansion is infinite, `‖ρ − Σ_(n≤N)2^(−n)P_n‖₁ = 2^(−N)`, and the eigenvalue zero does not occur, so the family `(ψ_i)` is a basis here but need not be in general.
- On the nonseparable `ℓ²(ℝ)` the operator `ρ = e_0e_0*` has eigenvalue `1` on `ℂe_0` and the nonseparable kernel `e_0^⊥`; the expansion has one term and `Tr(ρA) = ⟨e_0,Ae_0⟩`.

### Examples

For `H = ℓ²` and `ρ = Σ 2^(−n)e_ne_n*`, the logic probability `m(V) = Tr(ρP_V)` on the line spanned by `ψ = Σ 2^(−n/2)e_n` is `Σ_n 2^(−n)·2^(−n) = 1/3`; V12.J.Scalar recovers ρ from `m`, and §3.3 expands ρ in its own eigenbasis.

### Dependencies

§3.1 → §3.2; §3.3 depends on OperatorIdeals and VonNeumannAlgebras V4 only. Layer 3 consumes Layer 1 (§1.2) and VonNeumannAlgebras V2, V4, V5.LatticeFinite, V12.J.Frame, V12.J.Scalar.

## Layer 4: observables, expectation, uncertainty and dynamics

### 4.1 Outcome laws and moments of unbounded observables

For a self-adjoint `A` with spectral PVM `P_A` (SelfAdjointSpectralTheory SA-E01–SA-E13) and a unit vector ψ, the outcome law is `μ_ψ(B) = ‖P_A(B)ψ‖²`; for a density operator it is `Tr(ρP_A(B))`. Prove that for bounded Borel `f` the expectation of `f(A)` in a vector or normal state is the integral of `f` against the outcome law and agrees with the bounded Borel calculus (UO-A08); prove measurable pushforward `μ_ψ^(f(A)) = f_*μ_ψ^A` for every real Borel `f` (UO-A04). Prove `ψ ∈ D(A)` exactly when `∫λ²dμ_ψ < ∞` (UO-A01), that the form domain `D(|A|^(1/2))` is exactly `∫|λ|dμ_ψ < ∞`, and define the expectation `⟨A⟩_ψ = ∫λ dμ_ψ` only under this absolute first moment; it need not imply `ψ ∈ D(A)`. Prove expectation linearity for bounded observables in a fixed state and the identity `‖(A−a)ψ‖² = ∫(λ−a)²dμ_ψ` for `ψ ∈ D(A)`, which needs no second-domain hypothesis, while the vector `(A−a)²ψ` needs `ψ ∈ D(A²)`.

- Outcome laws, bounded functional calculus and pushforward.
- Domain membership by the second moment, form domain by the first; expectations under absolute integrability.
- The variance identity on `D(A)`.

*Needs:* SelfAdjointSpectralTheory SA-E01–SA-E13; UnboundedOperators UO-A01, UO-A04, UO-A08; Mathlib Bochner integration.

**Checks.**

- On `L²(ℝ)` with `A = Q`, `ψ(x) = (1+|x|)^(−2)/c`: `∫|x|·|ψ|² < ∞` and `∫x²|ψ|² < ∞`, so `ψ ∈ D(Q)`, but `∫x⁴|ψ|² = ∞`, so `ψ ∉ D(Q²)`; the variance identity applies and `(Q−a)²ψ ∉ L²`.
- `ψ(x) = (1+|x|)^(−1)/c`: `∫|x|·|ψ|² = ∞`, so the expectation of `Q` is undefined, while `μ_ψ` is a probability measure; a totalized integral would silently return `0`.
- For `A = σ_z` on `ℂ²` and `ψ = (e₁+e₂)/√2`, `μ_ψ = (δ_1+δ_(−1))/2`, expectation `0`, variance `1`, and `f(A) = A²` has law `δ_1`.

### 4.2 Variance and uncertainty relations

For normalized `ψ ∈ D(A) ∩ D(B)`, `a = ⟨A⟩_ψ`, `b = ⟨B⟩_ψ`, `Δ_ψA = ‖(A−a)ψ‖`, prove the form inequality `Δ_ψA·Δ_ψB ≥ |Im⟪(A−a)ψ,(B−b)ψ⟫|` by Cauchy–Schwarz; prove the commutator form `Δ_ψA·Δ_ψB ≥ ½|⟪ψ,[A,B]ψ⟫|` for `ψ ∈ D(AB) ∩ D(BA)` (Teschl, Theorem 8.2); prove that equality in the form inequality forces `(A−a)ψ = iμ(B−b)ψ` with real μ when both variances are nonzero, treating zero variance separately, and that real proportionality is not sufficient (Teschl's proof of Theorem 8.2). Give the Gaussian minimizers for position and momentum with `Δ_ψQ·Δ_ψP = 1/2` in the convention of this roadmap (`[Q,P] = i` on the Schwartz core by NoncompactQuantumSymmetry P.5 with ℏ=1). Consume UO-E01 for `[A,B] = iC*C` on a common domain and the implication `Cψ = 0` for common eigenvectors; prove that for an abstract pair with `[P,Q]ψ = iψ` on the common product domain, a nonzero vector that is an eigenvector of `P` or of `Q` is excluded, and that the homogeneous lower bound is `½‖ψ‖²`, which reduces to `½` for unit vectors.

- The form and commutator uncertainty inequalities with their exact domains.
- The equality criterion with imaginary proportionality; Gaussian minimizers.
- The eigenvector exclusion for canonical pairs.

*Needs:* §4.1; UnboundedOperators UO-E01; NoncompactQuantumSymmetry P.5 (the canonical pair and its Schwartz core); Mathlib Cauchy–Schwarz.

**Checks.**

- The centered Gaussian `ψ(x) = (2πσ²)^(−1/4)exp(−x²/(4σ²))` has `Δ_ψQ = σ`, `Δ_ψP = 1/(2σ)` and product `1/2`; equality holds with imaginary proportionality `Pψ = (i/(2σ²))Qψ`, since `−iψ′ = (ix/(2σ²))ψ`.
- A scaled Gaussian with `‖ψ‖ = 1/2` has `|⟨ψ,[Q,P]ψ⟩| = ‖ψ‖² = 1/4`, so the homogeneous bound is `1/8`, not `1/4`; the unnormalized formula `½‖ψ‖` would give `1/4` and be false.
- On `ℂ²` with `A = σ_x`, `B = σ_y`, `ψ = e₁`: `a = b = 0`, `[A,B] = 2iσ_z`, `½|⟨ψ,[A,B]ψ⟩| = 1`, and `Δ_ψA = Δ_ψB = 1`; equality holds with `Bψ = ie₂ = i·Aψ`, imaginary proportionality with `μ = 1`.

### 4.3 Dynamics: unitary groups, the Heisenberg picture and semigroups

Model time evolution either by a strongly continuous unitary group `U_t = exp(−itH)` (Stone's theorem, SA-E26, SA-E28–SA-E30; Teschl, Theorems 5.1–5.2) or by a family `(Φ_t)_(t≥0)` of normal unital completely positive maps on `B(H)` with `Φ_0 = id`, `Φ_(s+t) = Φ_s∘Φ_t` and pointwise ultraweak continuity, or its trace-preserving predual; these are distinct models. For a closed densely defined `A` define `A_t = U_t*AU_t` on `U_t*D(A)`. State the differentiated law on a dense common invariant core `D ⊆ D(H) ∩ D(A)` with `H(D), A(D) ⊆ D`, `U_tD = D` and `t ↦ U_tψ` differentiable in the graph norm of `A`: prove `(d/dt)A_tψ = i(HA_t − A_tH)ψ`. For a bounded unitary `T` with `TD(H) ⊆ D(H)` and `HT = TH` on `D(H)` prove `TU_t = U_tT`; conversely `TU_t = U_tT` for all `t` gives `TD(H) = D(H)` and `HT = TH` (equality on a core suffices only after closedness extends it); for a bounded antiunitary `T` prove the time-reversal law `TU_t = U_(−t)T`. For an unbounded self-adjoint constant of motion consume UO-B03's strong commutation (Teschl, Theorem 8.1): commutation on a common invariant core does not suffice. Prove that every continuous monoid homomorphism `f : ([0,∞),+) → G` into a topological group extends uniquely to a continuous group homomorphism of ℝ by `F(a−b) = f(a)f(b)⁻¹`, with independence of the decomposition and local continuity from `F(t) = f(t+b)f(b)⁻¹`. Prove the unitary lift of continuous ray dynamics: a continuous homomorphism `ℝ → PU(H)` (NoncompactQuantumSymmetry P.2's quotient topology) lifts to a strongly continuous unitary group, because `H²_lc(ℝ,𝕋) = 0` (P.4: the alternating forms on ℝ vanish) and the extension theorem of P.3 trivializes the pulled-back circle extension over the contractible base; hence Stone's theorem gives a self-adjoint generator; a chosen multiplier need not be identically one before rephasing.

- The Heisenberg differentiated law on an invariant core; bounded and antiunitary commutation laws.
- Half-line monoid homomorphisms extend uniquely to ℝ.
- Continuous ray representations of ℝ are unitary groups up to rephasing, with Stone generators.

*Needs:* §4.1; SelfAdjointSpectralTheory SA-E26, SA-E28–SA-E30; UnboundedOperators UO-B03; NoncompactQuantumSymmetry P.2, P.3, P.4; VonNeumannAlgebras V4.Normality (normal CP maps).

**Checks.**

- On `ℂ²` with `H = σ_z` and `A = σ_x`: `A_t = e^(itσ_z)σ_xe^(−itσ_z) = cos(2t)σ_x − sin(2t)σ_y`, and `i(HA − AH) = i[σ_z,σ_x] = i·2iσ_y = −2σ_y`, matching `(d/dt)A_t|_0`; the opposite sign convention `U_t = exp(itH)` would give `+2σ_y`.
- Time reversal: on `L²(ℝ)` complex conjugation `T` commutes with `H = −∂²` on `H²`, and `TU_tT = U_(−t)`; the law `TU_t = U_tT` would force `U_t = U_(−t)`, false for `t ≠ 0`.
- The half-line extension: `f(a) = exp(ia)` on `[0,∞)` extends to `F(t) = exp(it)`, and `F(a−b) = exp(ia)exp(−ib)` is independent of the choice of `a,b ≥ 0`; `f(a) = 1` for all `a` extends to the trivial homomorphism, and no nonconstant extension exists.

### 4.4 Superselection sectors

For a von Neumann algebra model define sector projections as central projections `z_i` with strong sum `1` and prove the sector decomposition splits block-diagonal observables and normal states. On the bounded product `M = ∏_i B(H_i)` with nonzero `H_i` prove that the pure normal states are exactly the unit-vector states supported in one sector, with no dimension restriction. Prove, through V12.J.Scalar (no type I₂ summand exactly when no `dim H_i = 2`; σ-finite exactly when the index set is countable and every `H_i` separable), that each countably additive probability on `P(M)` with countably many separable sectors of dimension `1` or `≥ 3` comes from a unique normal state, with extreme points the unit-vector measures in one sector; and the completely additive version for arbitrary index sets and nonseparable sectors. Dimension-two sectors are excluded from this identification only. Prove that a bounded self-adjoint operator on `⊕_iM_i` belongs to the block algebra `∏_iB(M_i)` exactly when it preserves every `M_i`, that for a proper subalgebra with the same centre sector preservation is not membership, and that in a multiplicity model `⊕_i(H_i⊗K_i)` with the algebra `B(H_i)⊗1` a vector in one sector induces a pure state exactly when its reduced state on `H_i` has rank one.

- Central sector decompositions of observables and normal states.
- Pure normal states of `∏B(H_i)` are vector states in one sector; the Gleason-type identification through V12.J.Scalar.
- Sector preservation versus membership; purity in multiplicity models.

*Needs:* §3.2; VonNeumannAlgebras V12.J.Scalar, V4.Normality, V2 (centre); CStarAlgebras C2.

**Checks.**

- `M = B(ℂ)⊕B(ℂ²)`: the vector `(1,0)⊕(0,0)` gives a pure state; `(1/√2)·(1⊕e₁)` gives the mixed state `(1/2)δ ⊕ (1/2)|e₁⟩⟨e₁|`, which is a vector state of `B(ℂ³)` but not pure on `M`.
- `M = B(ℂ)⊕B(ℂ²)` has a type I₂ summand, so a countably additive probability on `P(M)` need not be a normal state: take `m = 0` on the first sector and V12.J.Frame's sgn frame function on the second.
- In `ℂ²⊗ℂ²` with the algebra `B(ℂ²)⊗1`, the Bell vector `(e₁⊗e₁ + e₂⊗e₂)/√2` lies in the single sector but has reduced state `(1/2)·1` of rank two, so its state on `B(ℂ²)⊗1` is not pure.

### 4.5 The full PVM carrier and all-state uniqueness

Let the Mackey observable family consist of all projection-valued Borel measures on ℝ, including unbounded support (SelfAdjointSpectralTheory SA-E01, SA-E44, SA-E45; UnboundedOperators UO-A01–UO-A07 for integrals and moment domains). Prove Borel-calculus closure and proposition fullness; extend §1.8's bounded spectral map into this carrier and prove all three embedding clauses of §1.7 for the family of all normal states. Own the all-state first-moment lemma: if a PVM `E` has unbounded support, choose disjoint bounded Borel bands `B_n ⊆ {|t| ≥ 2^(2n)}` with nonzero projections (countable additivity and continuity from below), orthogonal unit vectors `ξ_n ∈ ran E(B_n)`, and the density `ρ = Σ2^(−n)|ξ_n⟩⟨ξ_n|` of trace one; then `∫|t| dTr(ρE(t)) ≥ Σ_n 2^(−n)·2^(2n) = ∞`. Hence absolute first-moment integrability in every normal state forces bounded support; integrating a bounded-support PVM gives a bounded self-adjoint `T`, and equality of first moments with `T` in all vector states, polarization and spectral uniqueness give `E = E_T`. Every expectation premise is an explicit absolute-integrability hypothesis.

- The all-PVM Mackey carrier with Borel closure and fullness.
- Integrability of the first moment in every normal state characterizes bounded support.
- Uniqueness of the bounded-support PVM with prescribed first moments.

*Needs:* §1.7, §1.8; SelfAdjointSpectralTheory SA-E01, SA-E44, SA-E45; UnboundedOperators UO-A01–UO-A07.

**Checks.**

- For the position PVM on `L²(ℝ)` and `ρ = Σ2^(−n)|ξ_n⟩⟨ξ_n|` with `ξ_n` unit vectors supported in `[2^(2n), 2^(2n)+1]`, the first moment is at least `Σ 2^(−n)2^(2n) = Σ 2^n = ∞`; the bands `B_n = [2^(2n),2^(2n)+1]` are disjoint and bounded.
- For `E = E_T` with `T = diag(1,2)` on `ℂ²`, every normal state has finite first moment `Tr(ρT) ≤ 2`, and `E` is recovered from the moments `Tr(ρT)` by polarization: `⟨e₁,Te₂⟩ = 0`, `⟨e₁,Te₁⟩ = 1`, `⟨e₂,Te₂⟩ = 2`.
- A PVM with unbounded support can have finite first moment in a single state: the position PVM in a Gaussian state has first moment `0`; the lemma is a statement about all normal states.

### Examples

The free particle on `L²(ℝ)` with `H = P²` (Layer 8) has `U_t = exp(−itP²)`, translations commute with `H` on `H²`, and momentum is a constant of motion by UO-B03; the Heisenberg law on the Schwartz core gives `(d/dt)Q_t = 2P_t`.

### Dependencies

§4.1 → §4.2; §4.1 → §4.3; §3.2 → §4.4; §1.8 → §4.5. Layer 4 consumes Layers 1 and 3, SelfAdjointSpectralTheory Parts A and E, UnboundedOperators Layers 1, 2 and 5, NoncompactQuantumSymmetry P.2–P.5 and VonNeumannAlgebras V4, V12.J.Scalar.

## Layer 5: von Neumann operational models and their symmetries

### 5.1 The operational model of a W*-algebra

For a nonzero complex W*-algebra `M` (VonNeumannAlgebras V0, V1, V2, V4.Core's faithful ultraweakly continuous concrete representation inducing the predual) take questions `P(M) = {p ∈ M : IsStarProjection p}`, states all normal positive normalized functionals (V0's carrier with V4.Core's normality predicate and V4.Normality's comparison theorems), observables all real Borel PVMs with values in `P(M)`, and `p(E,ω,B) = ω(E(B))`. Prove the axioms of §1.1, countable orthogonal additivity, order fullness and countable mixing; vector functionals in a faithful normal representation prove order determination. Prove that the bounded observables are exactly `M_sa` through the bounded Borel calculus (V2.BorelCalculus) and identify the full real-PVM carrier with the self-adjoint operators affiliated to `M` through V10.Affiliation, with their actual domains. Weak density of a unital `*`-subalgebra does not make it a W*-algebra (`K(H)+ℂ1` for infinite `H`, by V1); the model condition is ultraweak closure. Type II, type III and nonfactor algebras are included; no trace-class or pure-normal-state parametrization is imposed. A presentation of an abstract operational system on `M` is a logic orthoisomorphism onto `P(M)`, an affine bijection onto the full normal state space and a bijection onto the PVMs, preserving every evaluation and Borel pushforward; build identity, composition and evaluation transport for presentations. A selected proper state or observable family keeps its explicit image and stabilizer conditions.

- The W*-model satisfies the operational axioms, with order determination from vector functionals.
- Bounded observables are `M_sa`; all real PVMs are the affiliated self-adjoint operators.
- Presentations and their transport laws.

*Needs:* §1.1, §1.2; VonNeumannAlgebras V0, V1, V2.BorelCalculus, V4.Core, V4.Normality, V10.Affiliation.

**Checks.**

- `M = ℓ^∞(ℕ)` acting on `ℓ²`: the questions are indicator sequences, the normal states are probability vectors, the observables are measurable real functions on ℕ; the state `lim` along a free ultrafilter is a state on `M` that is not normal, so it is not a state of the model.
- `M = M₂(ℂ)⊕ℂ`: `P(M) = P(ℂ²) × {0,1}`, with atoms the rank-one `(p,0)` and `(0,1)`; the normal state space is the convex hull of the Bloch ball and one further extreme point.
- For `M = B(H)` with `H` separable infinite-dimensional, the compact operators plus scalars contain every finite-rank projection but not the projection onto the span of `e_(2n)`, so `K(H)+ℂ1 ≠ B(H)` although it is weakly dense.

### 5.2 Types read through the projection logic

Consume VonNeumannAlgebras V3, V5 (V5.LatticeFinite) and V6 (V6.LatticeTypes) with no separability restriction. The logic centre is `P(Z(M))`, characterized by the splitting `q = (q∧z) ∨ (q∧z′)` for every `q`; `M` is a factor exactly when the logic centre is `{0,1}`. For a nonzero factor, type I is equivalent to the existence of an atom, type II to no atoms and a nonzero finite projection, II₁ to finite identity, II∞ to infinite identity with a nonzero finite projection, III to no nonzero finite projection, with Murray–von Neumann finiteness; internally, finite means `[0,p]` modular and abelian means `[0,p]` Boolean, so II₁ is atomless and modular, II∞ atomless, nonmodular with a nonzero modular interval, III without nonzero modular intervals; atomlessness alone does not separate II from III. For general `M`, type I means every nonzero `q` dominates a nonzero `e` with `[0,e]` Boolean; the one-atom criterion fails for every nonfactor (`ℂ ⊕ R_(II₁)` has an atom and is not type I). Consume V6's intrinsic `z_I`, `z_sf`, `z_fin` and their refinements, and V6's factor-fibre theorem under V4.0.Decomposition's separably acting hypotheses. Give operational models for `B(H)`, the II₁ group factors of V8, their II∞ amplifications, the Powers factors of V10–V11, finite direct sums and diffuse-centre examples; V13's classification applies only under its injectivity and separable-predual hypotheses. Consume V12.J.Scalar for the projection-state theorem: if `M` has no type I₂ central summand, completely orthogonally additive probabilities on `P(M)` are exactly its normal states, with countable additivity sufficient for σ-finite `M`.

- Factor and type criteria stated on the projection logic, through V6.LatticeTypes.
- Named examples of every type as operational models.
- Projection probabilities are normal states away from type I₂ (V12.J.Scalar).

*Needs:* §5.1; VonNeumannAlgebras V3, V4.0.Decomposition, V5.LatticeFinite, V6.LatticeTypes, V8, V10, V11, V12.J.Scalar, V13.

**Checks.**

- `M = M₂(ℂ)`: an atom exists, the identity is finite, `[0,1]` is modular and not Boolean; type I₂. `M = ℂ²`: every interval is Boolean; abelian type I.
- `M = ℂ ⊕ R`: the atom `(1,0)` exists and the centre is atomic, yet the summand `R` has no atom; applying the one-atom criterion to every minimal central summand gives the correct verdict "not type I".
- `M = M₂(ℂ) ⊕ ℂ`: a type I₂ summand is present, so V12.J.Scalar does not apply; the probability that is `0` on `ℂ` and V12.J.Frame's sgn frame function on `M₂(ℂ)` is completely additive and not a normal state.

### 5.3 The dynamical-correspondence criterion

For a separated abstract system `(L,S,O,p)` with `S ≠ ∅` form the real ordered span of its state functions with the generated positive cone and base seminorm, quotient and complete to `V`, with `V⁺` the closure of the image cone; require the completion norm to be the base norm of this closed cone; let `u` be the mass functional and `A = V*`. The criterion requires that `S` injects onto the norm-complete positive mass-one base of `V`; that the evaluation `e_q(s) = s(q)` extends to `A` and gives an order and complement isomorphism of `L` onto the extreme points of `[0,u]`; and that `O → {real Borel, countably orthogonally additive extreme-effect-valued measures}`, `E ↦ (B ↦ e_(E(B)))`, is bijective and preserves pushforward, with `E(∅) = 0`, `E(ℝ) = u`, orthogonality of extreme effects meaning `e+f ≤ u`, and countable additivity in `σ(A,V)`. The remaining condition is the existence on `A` of a continuous unital commutative Jordan product `∘` with unit `u`, native `IsCommJordan`, `‖a∘b‖ ≤ ‖a‖‖b‖`, `‖a²‖ = ‖a‖²`, `‖a²‖ ≤ ‖a²+b²‖`, positive cone exactly the squares and separately `σ(A,V)`-continuous multiplication, together with a bounded real-linear `ψ : A → (A →L[ℝ] A)` whose values are weak-star continuous skew order derivations (`ψ_a(u) = 0`, `exp(tψ_a)` preserves the cone in both directions for all real `t`) satisfying `[ψ_a,ψ_b] = −[L_a,L_b]` and `ψ_a(a) = 0`, with `L_a(b) = a∘b`. Prove: the system has a full nonzero complex W*-presentation exactly when such `∘` and `ψ` exist (Alfsen–Shultz 1998, Theorem 1 and Corollary 2). Necessity: identify `V` with the self-adjoint normal predual (V4.PositivePredual), `A` with `M_sa`, `ψ_a(b) = (i/2)(ab−ba)`; derive `[L_a,L_b]c = ¼[[a,b],c]` and `[ψ_a,ψ_b]c = −¼[[a,b],c]`, which fixes the sign, and note that `exp(tψ_a)` is conjugation by `exp(ita/2)`. Sufficiency: polarize `ψ_a(a) = 0` to `ψ_a(b) = −ψ_b(a)`, prove the order derivations are Jordan derivations, define on `A+iA` the product `a·b = a∘b − iψ_a(b)` and involution `(a+ib)* = a−ib`, prove associativity from the bracket identity, compute `x*x = a²+b²+2ψ_a(b)` for `x = a+ib`, prove it lies in the cone and that `‖x‖ = ‖x*x‖^(1/2)` is a complete C*-norm extending the JB norm, prove the unit ball is closed for the pairing with `V` and the complexified predual norm is its polar, deduce the W*-property with predual `V` and normal state base `S`, and recover the projection, PVM and evaluation presentation from V12.J.Enriched's elementary effect lemma. A given `ψ` fixes the associative product; existence of some `ψ` does not choose an orientation; uniqueness of presentations is §5.7. The Alfsen–Shultz product `a∘b − iψ^AS_b(a)` corresponds to ours through `ψ^AS_a = −ψ_a`.

- The intrinsic criterion for a full W*-presentation, with explicit Jordan product and dynamical correspondence.
- Necessity by `ψ_a = (i/2)ad(a)` with the computed sign; sufficiency by the C*-norm construction and duality.
- The sign dictionary to the Alfsen–Shultz convention.

*Needs:* §1.2, §5.1; VonNeumannAlgebras V4.PositivePredual, V12.J.Enriched; Mathlib `IsCommJordan`; Alfsen–Shultz 1998.

**Checks.**

- `M = M₂(ℂ)`, `a = σ_z`, `b = σ_x`: `ψ_a(b) = (i/2)(σ_zσ_x − σ_xσ_z) = (i/2)(2iσ_y) = −σ_y`; then `a·b = a∘b − iψ_a(b) = 0 + iσ_y = σ_zσ_x`, the associative product, as required.
- With `c = σ_y`: `[L_a,L_b]c = ¼[[σ_z,σ_x],σ_y] = ¼[2iσ_y,σ_y] = 0` and `[ψ_a,ψ_b]c = −¼[[a,b],c] = 0`; with `c = σ_z`: `¼[2iσ_y,σ_z] = ¼·2i·2iσ_x = −σ_x` and `[ψ_a,ψ_b]σ_z = +σ_x`, opposite signs as the identity states.
- `exp(tψ_a)` for `a = σ_z` is conjugation by `exp(itσ_z/2)`, a rotation of the Bloch ball about the `z`-axis by angle `t`, which preserves the cone in both directions; the map `exp(t·(−ψ_a))` is the opposite rotation, so the sign of `ψ` is not determined by cone preservation alone, only by the bracket identity.

### 5.4 Spectral duality, ellipticity and the global 3-ball

On a real base-norm space `V` with closed pointed generating cone `V⁺`, continuous mass functional `u` strictly positive on `V⁺∖{0}`, nonempty base `K` and `‖v‖ = inf{u(x)+u(y) : v = x−y, x,y ∈ V⁺}`, use the dual order-unit space `A = V*` with `σ(A,V)` and identify `A` with the bounded affine functions on `K`; no compactness of `K` is assumed. A P-projection is a weak-star continuous positive contractive projection `P` on `A` with a unique quasi-complementary projection `P′` (`ker⁺P = im⁺P′`, `im⁺P = ker⁺P′`) whose preadjoints are quasi-complementary on `V⁺`, including `P = 0` and `P = I`; projective faces are `F_P = K ∩ im(P_*)` with quasi-complements `F_P# = F_(P′)`; norm-exposed faces are `{k : a(k) = 0}` for `a ∈ A⁺`; positive `a,b` are orthogonal when `a` vanishes on a projective face `F` and `b` on `F#`. Spectral duality: every norm-exposed face is projective and every `a ∈ A` has a unique decomposition `a = a⁺−a⁻` into orthogonal positive parts; construct the projective-face/projection correspondence, its complete orthomodular lattice and the spectral resolution and functional calculus (Alfsen–Shultz 1978, §2). Ellipticity: `exp(t(P−P′))` is positive for every P-projection and real `t`; prove its equivalence with the full-ellipse containment definition and with the two formulas `|((I−P−P′)a)(k)| ≤ 2√((Pa)(k))√((P′a)(k))` for `a ≥ 0`, `k ∈ K`, and `P(Q−Q′)P′ = 0` for P-projections `P,Q` (Iochum–Shultz 1983, Definition 1.2 and Proposition 1.8). Prove Theorem 1.5 of Iochum–Shultz: spectral duality and ellipticity hold exactly when `A` carries a JBW product with this cone, dual norm and normal-state base `K`; identify P-projections with quadratic representations `U_p`. Using norm-closed faces with the empty face adjoined, define projective reflections `R_F = (2(U_p+U_(p′))−I)_*|_K` for `F = F_(U_p)`, prove they are affine involutions fixing `co(F∪F#)`, define orthogonality of projective faces by `p∘q = 0` and equivalence by transport through finite products of reflections. A nonempty normal-state base `C` is a global 3-ball when there is a surjective affine `φ : C → B³` whose inverse image is a face-lattice embedding and for which `R_F ↦ R_(φ⁻¹F)` extends to an injective homomorphism `Aut_aff(B³) = O(3) → Aut_aff(C)`; the reflections generate only `SO(3)`, so the extension on orientation-reversing elements is extra data. The global 3-ball property requires `F ∨ G` to be a global 3-ball for every pair of nonempty orthogonal equivalent faces. Prove Theorems 2.9–2.10 of Iochum–Shultz: within JBW normal-state bases the global 3-ball property characterizes the self-adjoint parts of complex von Neumann algebras, so spectral, elliptic and global 3-ball conditions characterize affine isomorphism with the normal state space of some nonzero `M`, and the affine maps extend to positive mass-preserving isometries. In the necessity proof an orthogonal equivalent pair of projections gives a corner `M₂(B)`; prove the full `O(3)` extension by `O(3) = SO(3)×{±1}` via `g ↦ ((det g)g, det g)`: for noncommutative `B` choose a noncentral projection `q` and use `Ad(1⊗(2q−1))`, a nontrivial involution commuting with the `SO(3)` conjugation action and meeting its image trivially; for commutative `B` use the spin flip `J(a) = Tr₂(a)I₂ − a`, which is `Ad(σ_y)∘transpose` on `M₂(ℂ)`, a normal Jordan automorphism restricting to Bloch inversion and commuting with the `SU(2)` action. Prove the equivalence of this criterion with §5.3's, retaining §5.3's separate projection, observable and evaluation bijections.

- Spectral duality and ellipticity characterize JBW normal-state bases (Iochum–Shultz Theorem 1.5).
- The global 3-ball property characterizes von Neumann normal state spaces (Theorems 2.9–2.10), with an explicit `O(3)` extension.
- Equivalence with the dynamical-correspondence criterion.

*Needs:* §5.3; VonNeumannAlgebras V4.PositivePredual, V2 (corners); Alfsen–Shultz 1978, Iochum–Shultz 1983.

**Checks.**

- For `M = M₂(ℂ)` the normal state space is the Bloch ball `B³`; `U_p` for `p = (1+σ_z)/2` has `(U_p)_*` the projection of the ball onto the north pole segment, `F_P` is the north pole, `F_P#` the south pole, and `R_F` is the half-turn about the `z`-axis, which fixes the segment `co(F∪F#)`.
- The spin flip `J(a) = Tr(a)I − a` on `M₂(ℂ)` sends `σ_x,σ_y,σ_z` to their negatives and `1` to `1`, preserves squares of self-adjoint elements (`J(σ_x)² = 1 = J(σ_x²)`), and is not multiplicative: `J(σ_x)J(σ_y) = σ_xσ_y = iσ_z` while `J(σ_xσ_y) = J(iσ_z) = −iσ_z`.
- The spin factor `V₄ = ℝ⊕ℝ⁴` (a JBW-algebra of dimension five) has normal-state base the ball `B⁴`, whose proper nonempty faces are its extreme points; orthogonal equivalent nonempty faces are antipodal points, whose join is all of `B⁴`, which is not affinely isomorphic to `B³`; the global 3-ball property fails, as it must, since `V₄` is not the self-adjoint part of a complex von Neumann algebra (only `V₃ ≅ M₂(ℂ)_sa` is).

### 5.5 Oriented self-dual cones

Consume §5.3, VonNeumannAlgebras V4.PositivePredual, V10.ModularTheory and V11 (standard forms, Kadison–Sakai innerness). For a cone `C` in a complex Hilbert space use V10's complex self-duality `C = {η : ∀ξ∈C, ⟨ξ,η⟩ ∈ [0,∞)}`; prove the real-form bridge: `E = closure(C−C)` is a real Hilbert space with the restricted real inner product, `C` is self-dual in `E`, `H = E ⊕ iE`, and `J(ζ+iη) = ζ−iη` is the standard-form conjugation when `C` is a natural cone. For a closed self-dual cone `C` in a real Hilbert space `E` with complexification `H` and conjugation `J`, let `F⊥` be the orthogonal face of a closed face `F` and `P_F` the projection onto its closed span; facial homogeneity means `exp(t(P_F−P_(F⊥)))C = C` for every `F` and real `t`. Put `D(C) = {δ ∈ B(H) : exp(tδ)C = C for all real t}`; prove it is a real involutive Lie algebra whose centre is star-stable, so that star descends to `D̄ = D(C)/Z(D(C))`. An orientation is a real-linear `I` on `D̄` with `I² = −Id`, `[Ix,y] = [x,Iy] = I[x,y]` and `I(x*) = −(Ix)*`. Prove Connes' Theorem 5.2: `M_I = {δ−iε : δ,ε ∈ D(C), [ε] = I[δ]}` is a von Neumann algebra with commutant `{δ+iε : [ε] = I[δ]} = JM_IJ`, and `xJxJC ⊆ C` for `x ∈ M_I`; if `ξ ∈ C` is strictly positive (`η ∈ C`, `⟨η,ξ⟩ = 0 ⇒ η = 0`) then ξ is cyclic and separating for `M_I`, `J = J_(ξ,M_I)` and `C` is its natural cone; in the scalar case `D̄ = 0` and `M_I = ℂ`. Conversely for any `M` with V11 standard form `(M,H,J,P)`, without countable decomposability, prove the closed faces of `P` are `F_e = eJeJP` for projections `e ∈ M`, with `P_(F_e) = eJeJ` and `P_(F_e) − P_(F_e⊥) = (e−½) + J(e−½)J`, facial homogeneity, that `Φ : M → D(P)`, `Φ(x) = x+JxJ`, is onto with kernel `iZ(M)_sa` and `Z(D(P)) = Z(M)_sa`, that `I_M[Φ(x)] = [Φ(ix)] = [i(x−JxJ)]` is a well-defined orientation, and `M_(I_M) = M`, `M_(−I_M) = M′ = JMJ` (`Φ(x) − iΦ(ix) = 2x`). For every full presentation of §5.3 apply this to the reconstructed algebra and prove recovery of the algebra and the transport `q ↦ F_(e(q))`, `ω ↦ ξ_ω ∈ P`, `E ↦ (B ↦ F_(e(E(B))))`; the opposite product negates `ψ` and gives `−I_M` and `M′`. Also own Theorem 5.8: an ordered complex vector space `W` with salient generating cone and order unit `u` underlies a countably decomposable von Neumann algebra (through a complex-linear order isomorphism sending `u` to `1`, after the normalization `x ↦ h^(−1/2)xh^(−1/2)` when `u` goes to a positive invertible `h`) exactly when it admits an autopolar Hermitian positive nondegenerate form `s`, linear in the first and conjugate-linear in the second variable with `⟨η_s(x),η_s(y)⟩ = s(y,x)` on the completion, whose completed cone is complex self-dual, facially homogeneous and orientable; define countable genus by countability of every orthogonal family of nonzero cone vectors, prove it equivalent to the existence of a strictly positive vector and that `η_s(u)` is one, and identify it with V4.PositivePredual's faithful-normal-functional criterion. For a faithful normal positive φ with GNS vector `ξ_φ` and modular operator `Δ_φ` put `s_φ(x,y) = ⟨Δ_φ^(1/4)yξ_φ, Δ_φ^(1/4)xξ_φ⟩`, prove the domain memberships, that the completed cone is V11's natural cone, and uniqueness of the autopolar form with `s_φ(x,1) = φ(x)` (Theorem 1.3).

- Theorem 5.2: an oriented facially homogeneous self-dual cone determines a von Neumann algebra and its commutant.
- The standard-form converse with the explicit orientation `I_M`; recovery of full presentations.
- Theorem 5.8 and the autopolar form `s_φ`, with countable genus identified with faithful normal functionals.

*Needs:* §5.3; VonNeumannAlgebras V4.PositivePredual, V10.ModularTheory, V11; Connes 1974.

**Checks.**

- `M = ℂ`: `H = ℂ`, `P = [0,∞)`, `J` is conjugation, `D(P) = ℝ` (real multiplications), `Z(D(P)) = D(P)`, `D̄ = 0`, and `M_I = ℂ` for the empty orientation datum.
- `M = M₂(ℂ)` in standard form on `M₂(ℂ)` with the Hilbert–Schmidt inner product, `J(x) = x*`, `P = {positive matrices}`: `Φ(x)(y) = xy + yx*`; for `x = i·1`, `Φ(x)(y) = iy − iy = 0`, so `i·1 ∈ ker Φ = iZ(M)_sa`; for `x = σ_z`, `exp(tΦ(σ_z))(y) = exp(tσ_z)y exp(tσ_z)` preserves positivity.
- The sign of the orientation: `I_M[Φ(σ_z)] = [Φ(iσ_z)]` and `Φ(iσ_z)(y) = iσ_zy − iyσ_z = i[σ_z,y]`; `M_(I_M)` contains `Φ(σ_z) − iΦ(iσ_z) = 2σ_z` acting by left multiplication, while `M_(−I_M)` contains `Φ(σ_z)+iΦ(iσ_z) = 2Jσ_zJ`, right multiplication by `σ_z`, which is the commutant.

### 5.6 Uniqueness of presentations and full-model actions

For one separated abstract system with two full presentations `(α_i,β_i,E_i)` on nonzero `M_i` prove there is a unique normal unital Jordan `*`-isomorphism `Φ : M₁ → M₂` with `α₂ = Φ∘α₁`, `β₂(s) = β₁(s)∘Φ⁻¹` and `E₂(A)(B) = Φ(E₁(A)(B))`, by V12.J.Enriched applied to `β₂∘β₁⁻¹` and `α₂∘α₁⁻¹`, including every type I₂ summand; conversely transport presentations along normal Jordan `*`-isomorphisms; prove identity, inverse and composition. An associative `*`-comparison additionally preserves an orientation; equal type does not imply Jordan isomorphism. For every nonzero `M` identify the operational automorphism group of §5.1's model with the normal Jordan `*`-automorphism group: §1.3 forces the affine state pullback, V12.J.Enriched reconstructs every automorphism even on I₂, and every abstract group action lifts uniquely to this Jordan group with `g·ω = ω∘Φ_(g⁻¹)` and `E ↦ Φ_g∘E`. For bare logic automorphisms without state preservation, V12.J.Dye identifies them with the Jordan group when `M` has no type I₂ central summand; when a nonzero I₂ part `M₂(Z)` is present the inclusion is proper: apply V12.J.Bloch's orthoautomorphism (the `(x,y,2z)` map of the Bloch sphere) pointwise to the rank-one projection fields, fix the central rank-0 and rank-2 parts, extend by the identity elsewhere, and prove order and complement preservation together with nonextendibility. A Jordan automorphism of a nonabelian factor is multiplicative or antimultiplicative; prove the orientation homomorphism to `C₂` for group actions, choose the multiplicative convention on abelian factors, and for nonfactors keep the central splitting of V12.J.CentralSplitting, which is not unique on the abelian part. Work `(x,y) ↦ (x,yᵀ)` on `M₃⊕M₃` (Jordan, globally neither multiplicative nor antimultiplicative) and the scalar swap on `ℂ⊕ℂ` represented on `ℂ⊕ℂ²` (central projections of ranks `1` and `2`, so no unitary or antiunitary implements it).

- Uniqueness of the Jordan comparison of two full presentations, including type I₂.
- Operational automorphisms are normal Jordan `*`-automorphisms; group actions lift uniquely.
- Bare logic automorphisms versus Jordan automorphisms: Dye's theorem and the I₂ obstruction.

*Needs:* §1.3, §5.1; VonNeumannAlgebras V12.J.Enriched, V12.J.Dye, V12.J.Bloch, V12.J.CentralSplitting.

**Checks.**

- On `M₂(ℂ)` the transpose is a Jordan automorphism that is not multiplicative; as an operational automorphism it acts on the Bloch ball by `(x,y,z) ↦ (x,−y,z)`, a reflection, and `ω∘Φ⁻¹` is the pulled-back state.
- The orthoautomorphism of V12.J.Bloch (induced by `(x,y,z) ↦ (x,y,2z)/√(x²+y²+4z²)` on the Bloch sphere, which commutes with the antipodal map) is a bare logic automorphism of `P(M₂(ℂ))` whose pullback of the Born state is a frame function that is not a normal state, so it is not an operational automorphism; on `M₃(ℂ)` no such map exists, by V12.J.Dye.
- On `M₃⊕M₃`, `(x,y) ↦ (x,yᵀ)` sends `(e₁₂,e₁₂)(e₂₃,e₂₃) = (e₁₃,e₁₃)` to `(e₁₃,e₃₁)`, while the images multiply to `(e₁₃, e₂₁e₃₂) = (e₁₃,0)` and antimultiply to `(e₂₃e₁₂, e₃₂e₂₁) = (0,e₃₁)`; neither matches, so the map is neither multiplicative nor antimultiplicative globally.

### 5.7 Standard-form implementation and continuity

Consume V12.J.CentralSplitting and V11's standard form `(L²(M),M,J,P)` with its normal `*`-isomorphism implementers. Prove `(L²(M),M′,J,P)` is a standard form for `M′`; for a normal `*`-anti-isomorphism `θ : M → N` define the `*`-isomorphism `M′ → N`, `x′ ↦ θ(Jx′*J)`, whose cone-preserving unitary `W` gives the antiunitary `A = WJ` with `θ(x) = Ax*A⁻¹`; verify complex linearity, antimultiplicativity, the commutant dictionary and cone preservation. Hence nonabelian factors have unique cone-preserving unitary or antiunitary implementers with the indicated grade, a genuine graded group law and no circle multiplier; implementation on a previously chosen representation needs its own equivalence hypothesis. On general `M` choose the multiplicative convention on the maximal abelian central part, let `e_g` be the central anti-part elsewhere, prove `e_(gh) = e_h △ Φ_h⁻¹(e_g)`, define `V_g = W_g((1−e_g) + e_gJ)` with `W_g` the complex-linear cone-preserving unitary commuting with `J`, prove `V_g` is an orthogonal real-linear isometry, linear and conjugate-linear on the central pieces, with `V_(gh) = V_gV_h`; it is not one global unitary or antiunitary. For a topological group with `g ↦ ω∘Φ_(g⁻¹)` norm continuous for every normal ω, derive pointwise ultraweak and bounded strong-star continuity, strong continuity of `W_g` from the natural-cone bounds, local constancy of the orientation on factors (an anti-net tending to the identity would force `ab = ba`), and on nonfactors `e_g → 0` strongly at the identity on the nonabelian part, through `q_g = Φ_g(e_g)`, `q_g[a,b] → 0`, the full central support of the commutator ideal, and `|ω(q_g) − ω(e_g)| ≤ ‖ω∘Φ_g − ω‖`. For `M = B(H)` compare with Layer 7: a unitary `U` gives `x ↦ UxU⁻¹`, an antiunitary `A` the complex-linear Jordan map `Φ(x) = Ax*A⁻¹`, and the conjugate-linear multiplicative convention `α(x) = AxA⁻¹ = Φ(x*)` has `ω∘Φ⁻¹ = conj∘ω∘α⁻¹` on all of `B(H)`.

- Standard-form implementation of Jordan automorphisms, graded on factors, real-linear on nonfactors.
- Continuity: norm continuity on the predual gives strong continuity of the implementers and local constancy of the grade on factors.
- The `B(H)` dictionary between Jordan maps and Wigner's unitary/antiunitary operators.

*Needs:* §5.6; VonNeumannAlgebras V11, V12.J.CentralSplitting; NoncompactQuantumSymmetry P.1 for the `B(H)` comparison.

**Checks.**

- `M = M₂(ℂ)` in standard form on the Hilbert–Schmidt space with `J(y) = y*` and `θ = transpose`: `M′` consists of the right multiplications `R_z`, `JR_z*J = L_z`, the `*`-isomorphism `M′ → M` is `R_z ↦ L_(zᵀ)`, its cone-preserving unitary is `W(y) = yᵀ`, and `A = WJ` is entrywise conjugation `y ↦ ȳ`, an antiunitary with `Ax*A⁻¹ = L_(xᵀ)`, as `conj(x*ȳ) = xᵀy` shows.
- `M = ℂ⊕ℂ` with the swap: `e_g` is `0` on this abelian algebra, `W_g` is the swap unitary on `ℂ⊕ℂ`, and `V_g = W_g`; no anti-part arises.
- `M = M₂⊕M₂` with `g` acting as identity on the first and transpose on the second summand: `e_g = (0,1)`, `V_g = (1, WJ)` is linear on the first and conjugate-linear on the second component; `V_g²` is the identity, matching `Φ_g² = id`.

### Examples

For `M = B(H)` the criterion of §5.3 returns the usual quantum model; the dynamical correspondence `ψ_a` is `(i/2)ad(a)`, the Jordan product `(ab+ba)/2`, and the orientation of §5.5 distinguishes `B(H)` from its commutant realization on `L²(B(H))`, which §5.7 identifies with the opposite algebra, implemented by the antiunitary `y ↦ y*`.

### Dependencies

§5.1 → §5.2; §5.1 → §5.3 → §5.4; §5.3 → §5.5; §5.1, §1.3 → §5.6 → §5.7. Layer 5 consumes Layers 1 and 3, VonNeumannAlgebras V0–V6, V8, V10–V13, CStarAlgebras C2, and NoncompactQuantumSymmetry P.1 for one comparison.

## Layer 6: composite systems, Fock models and CCR representations

### 6.1 Tensor products, partial trace and entanglement

Consume VonNeumannAlgebras V2's completed Hilbert tensor product `H ⊗̂ K` (elementary tensors, inner-product and norm formulas, dense span, bounded tensor maps) and CStarAlgebras C5's spatial C*-tensor product; these are distinct from HilbertModules H3's interior tensor products and are never identified silently. Construct tensor products of model unitary group actions and identify `A⊗1`, `1⊗B` as commuting bounded observables. Construct the partial trace of a positive trace-class density operator on `H ⊗̂ K` and prove its defining pairing against bounded observables `Tr(Tr_K(ρ)A) = Tr(ρ(A⊗1))`, positivity, trace preservation and compatibility with product states. Define product, separable (trace-norm closure of the convex hull of product densities) and entangled states; prove the Bell vector is not a product vector by its reduced densities and compute its correlated outcomes. Prove the finite-dimensional Schmidt decomposition `ψ = Σ√λ_i e_i⊗f_i` with uniqueness of the `λ_i` and of the pairs up to the unitary freedom within repeated and zero singular values. Prove, for a closed subspace `K` of `H₁⊗̂H₂` with projection `p`, the projection-logic identification of the corner `pB(H₁⊗̂H₂)p ≅ B(K)`, with no claim for unspecified subspaces.

- Partial trace with its defining pairing; product, separable and entangled states.
- The Schmidt decomposition with its exact uniqueness statement.
- Corners of tensor products as `B(K)`.

*Needs:* VonNeumannAlgebras V2, V4.Core; CStarAlgebras C5; OperatorIdeals Part B; Mathlib `TensorProduct`, singular value decomposition in finite dimension.

**Checks.**

- The Bell vector `(e₁⊗e₁ + e₂⊗e₂)/√2` has reduced densities `(1/2)·1` on both factors, Schmidt coefficients `(1/2,1/2)` and correlated `σ_z⊗σ_z` outcome `+1` with probability one; the product vector `e₁⊗e₁` has reduced densities of rank one.
- The state `ρ = (1/2)(|e₁e₁⟩⟨e₁e₁| + |e₂e₂⟩⟨e₂e₂|)` is separable and classically correlated; its partial trace is `(1/2)·1`, the same as the Bell state's, so reduced densities do not detect entanglement of mixed states.
- The Schmidt decomposition of `ψ = (e₁⊗f₁ + e₁⊗f₂)/√2` has one nonzero coefficient `1`, with `e₁⊗(f₁+f₂)/√2`; the pair is unique up to a phase, and a zero singular value leaves the complementary vectors free.

### 6.2 Permutation sectors and statistics

Consume NoncompactQuantumSymmetry P.6 for the permutation unitaries on `H^(⊗̂n)` and the projectors `P₊`, `P₋` onto `Symⁿ(H)` and `Λⁿ(H)`. Prove orthogonality of the two sector projections for `n ≥ 2`, that they coincide with the identity for `n = 0,1`, that their sum is not the identity for `n ≥ 3` and `dim H ≥ 2`, and the outcome and state identities on each sector. Define a bosonic or fermionic `n`-particle model as the restriction of the composite model to the corresponding sector and prove that permutation-symmetric observables preserve the sectors. This roadmap states no spin–statistics theorem; that is RelativisticQuantumFieldTheory's, under its field hypotheses.

- The two sectors are orthogonal for `n ≥ 2` and exhaust the tensor power only for `n ≤ 2`.
- Permutation-symmetric observables and states restrict to each sector.

*Needs:* NoncompactQuantumSymmetry P.6; VonNeumannAlgebras V2.

**Checks.**

- For `dim H = 2` and `n = 3`, `dim Sym³ = 4`, `dim Λ³ = 0` and `dim H^(⊗3) = 8`, so the mixed-symmetry complement has dimension `4`.
- For `n = 2`, `P₊ + P₋ = (1+Σ)/2 + (1−Σ)/2 = 1`, with `Σ` the flip.
- For `n = 1`, `P₊ = P₋ = 1`; a definition `P₋ = 1 − P₊` would give `Λ¹ = 0`.

### 6.3 Second quantization and its domains

On OperatorAlgebraDynamics D8's Fock carriers, and on the auxiliary unsymmetrized space `F(h) = ⊕_(n≥0) h^(⊗̂n)` built from V2's completed tensor products with `h^(⊗̂0) = ℂ`, vacuum `Ω = (1,0,…)` and `‖ψ‖² = Σ‖ψ_n‖²`, define `Γ(U)` for a one-particle unitary `U` by `Γ(U)|_n = U^(⊗n)`, `Γ(U)|_0 = 1`, and prove its unitarity, commutation with the number operator and sector projections, and preservation of both D8 sectors. For self-adjoint `A` on `h` with graph core `D_e`, let `A_n` be the self-adjoint closure of the `n`-factor tensor sum (UO-F02, UO-F03) with `A_0 = 0`, and `K_n = span{v₁⊗⋯⊗v_n : v_j ∈ D_e}`, `K_0 = ℂ`; prove `K_n` is a graph core for `A_n` without requiring `D_e` analytic or invariant. Define `dΓ(A)` on `D(dΓ(A)) = {ψ : ∀n, ψ_n ∈ D(A_n), Σ‖A_nψ_n‖² < ∞}` by `(dΓ(A)ψ)_n = A_nψ_n`, prove self-adjointness, that the finitely supported vectors with `ψ_n ∈ K_n` form a graph core (truncate, then approximate each retained component), that the symmetric and antisymmetric projections preserve domain and core, and that the restrictions are self-adjoint on the projected maximal domains and essentially self-adjoint on the projected finite core. For `A = 1` recover `N` with `D(N) = {Σn²‖ψ_n‖² < ∞}` and `D(N^(1/2)) = {Σn‖ψ_n‖² < ∞}`. Prove `Γ(exp(itA)) = exp(it dΓ(A))` by the sector group identities. For `h = L²(ℝ)` identify the `n`-sector with `L²(ℝⁿ)` and prove the sum-of-integrals norm formula.

- `Γ(U)` and `dΓ(A)` with exact maximal domains and finite tensor cores, on the unsymmetrized and on both symmetrized carriers.
- `N = dΓ(1)` with its domain and the square-root domain.
- `Γ(exp(itA)) = exp(it dΓ(A))`.

*Needs:* §6.1; OperatorAlgebraDynamics D8; VonNeumannAlgebras V2; UnboundedOperators UO-F02, UO-F03; SelfAdjointSpectralTheory Part E.

**Checks.**

- For `h = 0`: `F(h) = ℂ`, `N = 0`, `Γ(U) = 1`; a permutation unitary on a zero positive-particle sector has norm `0`, while `Γ(U)` has norm `1` because it fixes the vacuum.
- For `h = ℂ` (one mode) the symmetric Fock space is `ℓ²(ℕ)`, `N` is multiplication by `n`, `D(N^(1/2)) = {Σn|c_n|² < ∞}` and `D(N) = {Σn²|c_n|² < ∞}`; the vector `c_n = 1/(n+1)` lies in neither, `c_n = 1/(n+1)^(3/2)` lies in `D(N^(1/2))` but not in `D(N)`.
- For `A = 1` and `D_e = h`, `K_n = h^(⊗n)` algebraic, and the core property reduces to density of finite-particle vectors in `D(N)` with its graph norm, which the truncation argument gives.

### 6.4 Creation and annihilation, CCR and CAR, Weyl continuity

For `n ≥ 1` define the first-factor contraction `b̄_n(f) = ⟨f,·⟩⊗1` on `h^(⊗̂n)`, zero on the vacuum, prove the completed-tensor bound, `‖b̄(f)‖ = ‖f‖`, the insertion adjoint `b̄(f)*η = f⊗η`, antilinearity in `f` and `Γ(U)b̄(f)Γ(U)* = b̄(Uf)`. Compare with D8's operators: on the `n`-sector `a(f) = √n·b̄_n(f)`, `a†(f)η = √(n+1)P_(n+1)(f⊗η)` with `P` the appropriate projection; prove `a(f)` on a projected elementary tensor equals `n^(−1/2)Σ_k⟨f,f_k⟩P_(n−1)(f₁⊗⋯⊗f̂_k⊗⋯⊗f_n)` with the sign `(−1)^(k−1)` in the antisymmetric case, and `a†(f₁)⋯a†(f_n)Ω = √(n!)P_n(f₁⊗⋯⊗f_n)` including `n = 0`. Prove the domain bound `‖a^#(f)ψ‖ ≤ ‖f‖‖(N+1)^(1/2)ψ‖` on `D(N^(1/2))`, that each of `a(f)`, `a†(f)` maps `D(N)` into `D(N^(1/2))`, the CCR `[a(f),a†(g)] = ⟨f,g⟩` on `D(N)` and on the finite-particle core, and that `D(N^(1/2))` is a graph core; for a nonzero `f` with `u = f/‖f‖` and `N_u = dΓ(P_u)` prove that the closures of the finite-core annihilation and creation operators are mutual adjoints with maximal domains `D(N_u^(1/2)) = D((N_u+1)^(1/2))`, that `D(N^(1/2))` can be strictly smaller than this fixed-mode domain (a vector with zero `f`-mode occupation and infinite total number expectation), and that for `f = 0` both maximal operators vanish. Fermionic CAR operators are bounded. For an orthonormal basis `(e_j)_(j∈J)` with a chosen order prove the CAR occupation basis indexed by finite strictly increasing words is a Hilbert basis of the antisymmetric Fock space (repeated indices give zero, reordering gives the sign), for arbitrary `J` including finite and empty. Prove Fock irreducibility (bosonic and fermionic) by commutation with both creators and annihilators, the joint annihilator kernel `ℂΩ` and density of creation words; commutation with creators alone does not suffice (`T = a† = E₂₁` in one fermionic mode is not scalar). Prove bosonic vacuum cyclicity and, on the real one-particle space, that `Φ_F(h) = (a(h)+a†(h))/√2` is essentially self-adjoint on the finite-particle core with closure the Stone generator `Φ_D8(h)` of `t ↦ π(W(th))`; transfer D8's commutator `[Φ(f),Φ(g)] = i Im⟨f,g⟩` and vacuum characteristic function through this equality. Prove strong continuity of `h ↦ W(h)` from the Weyl relations and the characteristic function on the coherent-vector span; prove `‖W(h)−1‖ = 2` for `h ≠ 0` through D8's universal identity and faithfulness of the Fock representation (simplicity), hence failure of norm continuity via `h/n → 0`; prove `σ(Φ(h)) = ℝ` for `h ≠ 0` from unitary translation conjugations (`W(ith)Φ(h)W(ith)* = Φ(h) + t‖h‖²` in the second-linear convention, since `Im⟨ith,h⟩ = −t‖h‖²`) and nonemptiness of the spectrum; prove the field bound `‖(Φ(f)−Φ(g))ψ‖ ≤ √2‖f−g‖‖(N+1)^(1/2)ψ‖` on `D(N^(1/2))`; and prove the bounded-calculus identity `2∫(1−cos λ)dμ_ψ(λ) = ‖(W(h)−1)ψ‖² = 4‖ψ‖² − ‖(W(h)+1)ψ‖²` for the spectral measure of `Φ(h)`. For the GNS construction of a positive functional φ record `‖Ω_φ‖² = ‖φ‖`, including `φ = 0`, and use C2's intertwining relation `Uπ₁(a) = π₂(a)U`.

- Normalized sector formulas for `a`, `a†`, their domains, adjoints and the CCR on `D(N)`.
- Occupation bases, Fock irreducibility and vacuum cyclicity.
- The Segal-field adapter, strong continuity of the Weyl group, `‖W(h)−1‖ = 2`, `σ(Φ(h)) = ℝ` and the field bound.

*Needs:* §6.3; OperatorAlgebraDynamics D8; CStarAlgebras C2; UnboundedOperators UO-E01 (invariant-core theorem); SelfAdjointSpectralTheory Part A.

**Checks.**

- One bosonic mode, `f = g = e` with `‖e‖ = 1`: `a†Ω = e`, `a†a†Ω = √2·e⊗e`, `‖a†(e)ⁿΩ‖² = n!`, and the CCR on `Ω` reads `a a†Ω − a†aΩ = Ω`.
- The field bound is sharp in the stated form: with `f − g = e` normalized and `ψ = e` the one-particle vector, `(Φ(f)−Φ(g))ψ = Φ(e)e = (a(e)e + a†(e)e)/√2 = (Ω + √2 e⊗e)/√2`, of norm `√(3/2)`, while a bound with coefficient `1/√2` in front of `‖(N+1)^(1/2)ψ‖ = √2` alone would give `1 < √(3/2)`.
- Two fermionic modes `e₁ < e₂`: the occupation basis is `Ω, a†(e₁)Ω, a†(e₂)Ω, a†(e₁)a†(e₂)Ω`, `a†(e₂)a†(e₁)Ω = −a†(e₁)a†(e₂)Ω` and `a†(e₁)a†(e₁)Ω = 0`; `CAR(ℂ²) ≅ M₄(ℂ)` has dimension `16 = 4²`.

### 6.5 The Gaussian realization of bosonic Fock space

Choose a complete separable real Hilbert space `H_ℝ`, an orthonormal basis `(e_i)_(i∈ι)` indexed by a finite or countable type, and `q_i > 0` with `Σq_i < ∞`. On the iid standard-Gaussian product space define `X(ω) = Σ√q_i ω_ie_i` (zero on the null set of divergence), prove almost-sure convergence from `E Σq_iω_i² = Σq_i`, define `γ = Measure.map X ν`, prove `γ` is a centred Gaussian measure in `ProbabilityTheory.IsGaussian` with covariance `Qh = Σq_i⟨e_i,h⟩e_i`, positive, self-adjoint, trace class with `Tr Q = Σq_i = ∫‖x‖²dγ` (Hairer 2009, Proposition 4.17), characteristic function `∫e^(i⟨h,x⟩)dγ = exp(−Σq_i⟨h,e_i⟩²/2)` by finite sums and `L²` limits, uniqueness by `Measure.ext_of_charFun`, and full support. Define the coordinates `ξ_i(x) = ⟨e_i,x⟩/√q_i`, prove they are iid standard Gaussians under γ, that the coordinate map and the series map are inverse on the weighted square-summable set, and derive the pullback isometries on `L²` through `Lp.compMeasurePreserving`. Prove the countable-coordinate bridge: finite-coordinate `L²` subspaces are dense (cylinders generate, indicators lie in the union, and the class of sets whose indicators lie in the closed span is a Dynkin system). Consume OrthogonalL2Bases A3′, B3 and Part D and Tau Ceti's `gaussianHermiteHilbertBasis`, `gaussianHermitePiBasis` on finite restrictions, and build the Hilbert basis `h_α(x) = ∏_(i∈supp α) He_(α_i)(ξ_i(x))/√(α_i!)` for `α : ι →₀ ℕ`, with `He` the probabilists' `Polynomial.hermite`; prove Parseval, uniqueness and the conditional-expectation comparison for finite-coordinate subspaces (Janson, *Gaussian Hilbert Spaces*, Chapter 2). Let `K` be the complexification of `H_ℝ`. On D8's symmetric Fock space prove the occupation basis `v_α = (∏α_i!)^(−1/2)∏(a†(e_i))^(α_i)Ω` is a Hilbert basis, compare it with `√(|α|!/∏α_i!)P_s(⊗e_i^(⊗α_i))`, and prove the unitary `S : F_s(K) → L²(H_ℝ,γ;ℂ)` with `S v_α = h_α`, `SΩ = 1`, number grading equal to Hermite degree, transported number domain `{Σ|α|²|⟨h_α,f⟩|² < ∞}`, and on the Hermite-cylinder core `SΦ(e_i)S⁻¹ = M_(ξ_i/√2)`, `Sa(e_i)S⁻¹ = ∂_(ξ_i)`, `Sa†(e_i)S⁻¹ = ξ_i − ∂_(ξ_i)`, `SΦ(ie_i)S⁻¹ = i(ξ_i − 2∂_(ξ_i))/√2`, with maximal closures identified through §6.4 and the multiplication calculus (Janson, Chapter 4). In the empty-index case `γ = δ₀` and both spaces are the vacuum line. For `H_ℝ = L²(ℝ^d;ℝ)` with the real Hermite-function basis reindexed by ℕ and `q_n = 4^(−n)`, obtain `ξ_n(x) = 2ⁿ⟨e_n,x⟩`; prove that covariance `1` defines no `H_ℝ`-valued centred Gaussian in infinite dimension (independent Borel–Cantelli makes `Σξ_n² = ∞` almost surely).

- A trace-class covariance Gaussian measure on a separable real Hilbert space, with coordinates and characteristic function.
- The Hermite Hilbert basis indexed by finitely supported multi-indices.
- The unitary `S` and the transported field, ladder and number operators on the polynomial core.

*Needs:* §6.3, §6.4; Mathlib `ProbabilityTheory.IsGaussian`, `Measure.ext_of_charFun`, `Lp.compMeasurePreserving`, `Polynomial.hermite`; Tau Ceti `gaussianHermiteHilbertBasis`, `gaussianHermitePiBasis`; OrthogonalL2Bases A3′, B3, Part D; OperatorIdeals Part B.

**Checks.**

- `ι = {0}`, `q_0 = 1`: `γ` is the standard Gaussian on ℝ, `h_n = He_n/√n!`, `S` sends the `n`-particle vector to `He_n(ξ)/√n!`, and `Sa†S⁻¹He_n = (ξ − ∂)He_n = He_(n+1)`, the three-term recurrence `He_(n+1) = ξHe_n − nHe_(n−1)` combined with `He_n′ = nHe_(n−1)`.
- `ι = {0,1}`, `q = (1,1)`: `h_((1,1)) = ξ_0ξ_1`, of `L²` norm `1`, and `v_((1,1)) = a†(e_0)a†(e_1)Ω = √2·P_s(e_0⊗e_1)`, also of norm `1`.
- Covariance `1` on infinite-dimensional `H_ℝ`: the coordinates would be iid `N(0,1)` and `Σξ_n² = ∞` almost surely, so no Hilbert-space-valued random variable has this law; with `q_n = 4^(−n)` the sum `Σq_nξ_n²` converges almost surely.

### 6.6 CCR representations: sign adapter, a nonregular representation and Stone–von Neumann

For a real nondegenerate symplectic space `(S,B)` the source-convention Weyl algebra `W₊(f)W₊(g) = exp(iB(f,g)/2)W₊(f+g)` is D8's universal algebra at the form `−B`; D8 owns simplicity and functoriality. For a complex Hilbert `h` with `B = Im⟨·,·⟩` and a conjugation `C`, own the sign adapter `W₊(f) ↦ W₋(Cf)` to D8's convention, using `Im⟨Cf,Cg⟩ = −Im⟨f,g⟩`; the transported Fock vacuum has characteristic function `exp(−‖f‖²/4)` and is cyclic, and V0's GNS uniqueness gives the intertwiner. Construct the nonregular representation on `ℓ²(ℝ)` with basis `(e_x)`: `W₊(q,p)e_x = exp(ip(x+q/2))e_(x+q)`; prove `W₊(q,p)W₊(q′,p′) = exp(i(pq′−qp′)/2)W₊(q+q′,p+p′)`, define `W₋(q,p) = W₊(q,−p)` for D8's sign, prove irreducibility (commuting with all modulations forces diagonal coefficients, commuting with all translations makes the diagonal constant), that `q ↦ W(q,0)` is not strongly continuous (`⟨e₀,W(q,0)e₀⟩` is `1` at `q = 0` and `0` elsewhere), while `p ↦ W(0,p)` is strongly continuous; hence inequivalence to every regular representation. Pin the regular Schrödinger convention `W(q,p)ψ(x) = exp(ip·(x+q/2))ψ(x+q)` on `L²(ℝⁿ)`; with `B((q,p),(q′,p′)) = p·q′ − q·p′` prove `W(q,p)W(q′,p′) = exp(−iB((q,p),(q′,p′))/2)W(q+q′,p+p′)`, which is D8's sign (the basis shift `e_x ↦ e_(x+q)` of the nonregular representation gives the opposite sign, as its Check shows), and prove the dictionary between Weyl pairs (strongly continuous unitary groups `U,V` of `ℝⁿ` with `U(a)V(b) = exp(ia·b)V(b)U(a)`) and strongly continuous unitary representations of the real Heisenberg group with the nontrivial central character; consume MetaplecticAutomorphicForms §1.2 for the Stone–von Neumann theorem (every irreducible one is equivalent to the Schrödinger model, and every one is a Hilbert multiple of it). Prove the Fock comparison: with `(q,p) ↦ z = p+iq ∈ ℂⁿ` and the second-linear inner product, `Im⟨z,z′⟩ = p·q′ − q·p′ = B`, and construct the unitary Schrödinger/Fock intertwiner with the same multiplier.

- The sign adapter between the two Weyl conventions and the transported Fock vacuum.
- An explicit irreducible nonregular representation on `ℓ²(ℝ)`.
- The Weyl-pair/Heisenberg dictionary, the Schrödinger convention and the Fock intertwiner, with uniqueness from MetaplecticAutomorphicForms §1.2.

*Needs:* §6.4; OperatorAlgebraDynamics D8; VonNeumannAlgebras V0 (GNS uniqueness); MetaplecticAutomorphicForms §1.2 and its Layer 0 Schrödinger model; NoncompactQuantumSymmetry P.5 (position and momentum).

**Checks.**

- On `ℓ²(ℝ)`: `W₊(q,p)W₊(q′,p′)e_x = exp(ip′(x+q′/2))exp(ip(x+q′+q/2))e_(x+q+q′)` and `W₊(q+q′,p+p′)e_x = exp(i(p+p′)(x+(q+q′)/2))e_(x+q+q′)`; the ratio of phases is `exp(i(pq′ − p′q)/2)`, the stated multiplier.
- The Schrödinger convention on `L²(ℝ)`: `W(q,0)ψ(x) = ψ(x+q)`, `W(0,p)ψ(x) = exp(ipx)ψ(x)`, and directly `W(q,0)W(0,p)ψ(x) = exp(ip(x+q))ψ(x+q) = exp(ipq)·W(0,p)W(q,0)ψ(x)`; through the multiplier, `B((q,0),(0,p)) = −qp` and `B((0,p),(q,0)) = pq` give `exp(iqp/2)W(q,p)` and `exp(−ipq/2)W(q,p)`, whose ratio is the same `exp(ipq)`; the sign `exp(+iB/2)` would give `exp(−ipq)` and contradict the direct computation.
- The Fock identification: `z = p+iq`, `z′ = p′+iq′`, `⟨z,z′⟩ = Σ(p_j−iq_j)(p′_j+iq′_j)`, whose imaginary part is `p·q′ − q·p′`; the identification `z = q+ip` would give the opposite sign.

### 6.7 The cutoff oscillator and the bounded-commutator boundary

Instantiate the one-mode oscillator on the infinite-dimensional symmetric Fock space with its finite-particle core, closures, number spectrum ℕ and spectral probability laws. For the cutoff states `|0⟩,…,|N⟩` prove `[a_N,a_N†] = 1 − (N+1)|N⟩⟨N|`, so no finite-dimensional space carries the CCR; for bounded self-adjoint `Q` and bounded `P` with `[P,Q] = c·1`, `c ≠ 0`, prove `n|c| ≤ 2‖P‖‖Q‖` from `‖Qⁿ‖ = ‖Q‖ⁿ` and the induction `[P,Qⁿ] = ncQ^(n−1)`, a contradiction as `n` grows; consume UO-E01 for the general bounded `Q` (Wintner–Wielandt) and use it only to separate the infinite oscillator from its cutoffs.

- The cutoff commutator correction.
- The bounded-self-adjoint obstruction with the explicit bound.

*Needs:* §6.4; UnboundedOperators UO-E01.

**Checks.**

- `N = 1`: `a₁ = |0⟩⟨1|`, `a₁† = |1⟩⟨0|`, `[a₁,a₁†] = |0⟩⟨0| − |1⟩⟨1| = 1 − 2|1⟩⟨1|`.
- `N = 0`: `a₀ = 0` and `[a₀,a₀†] = 0 = 1 − 1·|0⟩⟨0|`.
- For `Q = σ_z`, `P = σ_x`: `[P,Q] = −2iσ_y` is not scalar; the bound `n|c| ≤ 2‖P‖‖Q‖ = 2` would be violated at `n = 3` for any scalar `c` with `|c| = 1`.

### Examples

The one-mode Gaussian realization of §6.5 with `q_0 = 1` is the Schrödinger representation of §6.6 after the unitary `L²(ℝ,γ) → L²(ℝ,dx)`, `f ↦ f·(2π)^(−1/4)exp(−x²/4)`, under which `ξ/√2 ↦ x/√2`-rescaled position and `(ξ − 2∂)` become the oscillator ladder expressions of §9.2.

### Dependencies

§6.1 → §6.2; §6.1 → §6.3 → §6.4 → §6.5; §6.4 → §6.6; §6.4 → §6.7. Layer 6 consumes Layer 4 (§4.1 for outcome laws), OperatorAlgebraDynamics D8, VonNeumannAlgebras V0, V2, V4.Core, CStarAlgebras C2, C5, UnboundedOperators UO-E01, UO-F02, UO-F03, NoncompactQuantumSymmetry P.5, P.6, MetaplecticAutomorphicForms §1.2, OrthogonalL2Bases and the Tau Ceti Hermite modules.

## Layer 7: ray symmetries and projective representations

### 7.1 Uhlhorn's theorem and the projection-lattice adapter

Rays are `Projectivization ℂ H` (NoncompactQuantumSymmetry P.1 owns transition probabilities, the unitary–antiunitary group `UA(H)`, `PUA(H)` and Wigner's theorem). Define `Projectivization.IsOrthogonal x y` by `⟪x.rep, y.rep⟫ = 0`, which is independent of representatives. Prove `uhlhorn`: for a complete complex Hilbert space `H` with `3 ≤ Module.rank ℂ H`, every bijection `f : ℙ ℂ H ≃ ℙ ℂ H` preserving orthogonality in both directions is `Projectivization.map` of a unitary `U : H ≃ₗᵢ[ℂ] H` or of an antiunitary `A : H ≃ₗᵢ⋆[ℂ] H` (Uhlhorn 1963; in dimension two the conclusion fails, as the first Check shows, and Gehér 2016, §1, notes this failure and proves instead, Theorem 3, that a bijection of `P(ℂ²)` preserving a fixed angle `α ∈ (0,π/2)` in both directions is a Wigner symmetry when `α ≠ π/4`). Route: let `R : H → H*`, `R(y) = ⟨y,·⟩`, be the conjugate-linear Riesz isometry and define the point map `κ_f(ℂx) = (f(ℂx)⊥)⁰`; prove it is a line-preserving bijection (the ray set of a closed span is its double orthogonal, so two-sided orthogonality preservation carries projective lines to projective lines); apply §0.1 to get a σ-semilinear bijection `S : H → H*` inducing `κ_f`, so `T = R⁻¹∘S` induces `f` and is τ-semilinear for `τ = conj∘σ`. For an orthonormal pair `e_i,e_j` with images `v_i,v_j`, orthogonality of `e_i±e_j` forces `‖v_i‖ = ‖v_j‖`, and applying `T` to `e_i + ze_j` and `−z̄e_i + e_j` gives `τ(z̄) = conj(τz)`, so τ preserves ℝ, is order-preserving by positivity of squares, fixes ℝ by density of ℚ, and is the identity or conjugation; with a unit vector `e` and any unit `x`, a unit `z` orthogonal to both (dimension at least three) gives `‖Te‖ = ‖Tz‖ = ‖Tx‖`, so `‖Tx‖ = c‖x‖` with `c > 0` and `c⁻¹T` is unitary or antiunitary by polarization; this proves boundedness directly, also in infinite dimension. Prove uniqueness up to a unit scalar and that `S` carries each closed hyperplane `u^⊥` onto the annihilator of `f(ℂu)`. Prove the adapter: an orthoautomorphism of `P(H)` sends atoms to atoms and induces a ray bijection preserving orthogonality in both directions, so in dimension at least three it is implemented by a unitary or antiunitary; in dimension two consume V12.J.Bloch's nonextendible example and state transition-probability preservation as the additional Wigner hypothesis.

- `uhlhorn`: two-sided orthogonality-preserving ray bijections in dimension at least three are unitary or antiunitary.
- Uniqueness up to a unit scalar; the hyperplane formula for `S`.
- Orthoautomorphisms of `P(H)` are implemented in dimension at least three, and not always in dimension two.

*Needs:* §0.1; NoncompactQuantumSymmetry P.1; VonNeumannAlgebras V12.J.Bloch; Mathlib `Projectivization.map`, `LinearIsometryEquiv`, the Riesz representation `InnerProductSpace.toDual`.

**Checks.**

- On `ℂ²` orthogonality of rays is antipodality on the Bloch sphere, so the bijection that swaps the antipodal pair `{ℂe₁,ℂe₂}` with the antipodal pair `{ℂ(e₁+e₂),ℂ(e₁−e₂)}` and fixes every other ray preserves orthogonality in both directions; it changes the transition probability between `ℂe₁` and `ℂ(e₁+2e₂)` from `1/5` to `|⟨e₁+e₂,e₁+2e₂⟩|²/(2·5) = 9/10`, so it is not induced by any unitary or antiunitary. V12.J.Bloch's map `(x,y,z) ↦ (x,y,2z)/‖·‖` is a continuous example of the same kind.
- On `ℂ³` coordinatewise conjugation is a two-sided orthogonality-preserving bijection induced by an antiunitary; `τ = conj` is detected by `T(e₁+ie₂) = e₁−ie₂`, and the pair argument `τ(z̄) = conj(τz)` holds for both `τ = id` and `τ = conj`.
- Uniqueness up to a unit scalar: if `U` and `U′` both induce `f`, then `V = U′⁻¹U` fixes every ray; on an orthonormal pair `Ve₁ = ce₁`, `Ve₂ = c′e₂`, and `V(e₁+e₂) ∈ ℂ(e₁+e₂)` forces `c = c′`, so `V` is the scalar `c` with `|c| = 1`; the same argument with `V` antiunitary shows a unitary and an antiunitary never induce the same ray map when `dim H ≥ 2`, since `V` would then be a conjugate-linear scalar map, which fixes the ray of `e₁+ie₂` only if it sends it to `ℂ(e₁−ie₂) ≠ ℂ(e₁+ie₂)`.

### 7.2 Lifts, multipliers and global sections

Consume NoncompactQuantumSymmetry P.1–P.4 for `UA(H)`, the grade, the twisted cocycle law `ω(g,h)ω(gh,k) = (g·ω(h,k))ω(g,hk)`, coboundaries, `H²_lc`, the topological extension theorem, the Borel patching of local sections, `H²_lc(ℝⁿ,𝕋)` as alternating forms, `H²_lc(SO(3),𝕋) ≅ ℤ/2` with the realization `U(2) → SO(3)`, and the Whitehead lemmas. Own the following. For a topological group `G` and a continuous homomorphism into `PUA(H)` prove the lifts of its grade over local sections (even component by P.2's section, odd component by right multiplication by a fixed conjugation `C`), and that a connected `G` lands in `PU(H)`. Define a global continuous projective unitary lift as a map `g ↦ U_g` into the unitaries, strongly continuous, with a normalized continuous multiplier `U_gU_h = ω(g,h)U_(gh)`; prove `U_1 = 1`, the cocycle law, and that rephasing by a continuous `b : G → 𝕋` with `b(1) = 1` gives the multiplier `b(g)b(h)b(gh)⁻¹ω(g,h)`. Prove that the natural map from globally continuous cohomology to `H²_lc(G,𝕋)` is injective on classes with a global continuous section, and own only the cohomological restatement of its image: a class lies in the image exactly when its extension `E_ω → G` admits a global continuous section, which NoncompactQuantumSymmetry M1's section/trivialization comparison identifies with triviality of the principal circle bundle `E_ω → G`; by P.4's computation the spin class of SO(3) is not in the image, so the spin-half ray action has local continuous lifts and a Borel multiplier but no globally continuous unitary lift. For `G = ℝ` deduce from §4.3 that every continuous ray action lifts to a strongly continuous unitary group, and for `G = ℝⁿ` identify the continuous multiplier classes with alternating bilinear forms (P.4), the Weyl example `ω_θ` being nontrivial for `θ ≠ 0`. Prove the multiplier dictionary `c(g,h) = ω(g,h)⁻¹` for the convention `U_(gh) = c(g,h)U_gU_h`, and for antiunitary lifts the phase-change law `ω′(g,h) = b(g)b(h)^((−1)^ε(g))b(gh)⁻¹ω(g,h)`, which is P.3's coboundary formula.

- Local lifts of continuous `PUA(H)`-actions of either grade; connected groups act unitarily.
- Global continuous lifts, their continuous multipliers and rephasing law; the comparison map to `H²_lc` and its image.
- The ℝ and ℝⁿ cases through P.4; the inverse-multiplier dictionary.

*Needs:* §4.3; NoncompactQuantumSymmetry P.1, P.2, P.3, P.4, M1 (the section/trivialization comparison); Mathlib `unitary`, `Circle`.

**Checks.**

- The spin-half representation of SO(3) on `ℂ²`: a continuous ray action with local lifts `s_ξ` of P.2; a global continuous lift would give a continuous section of `U(2) → SO(3)`, which does not exist by P.2's fundamental-group Check; the Borel lift of P.3 exists and its multiplier is `±1`-valued.
- `G = ℝ` with the ray action of `t ↦ exp(itA)`: the multiplier of any continuous lift is a continuous coboundary (`H²_lc(ℝ,𝕋) = 0`), so rephasing gives `exp(itA′)` with `A′ = A + c`; the inverse-multiplier dictionary gives `c(s,t) = ω(s,t)⁻¹ = 1` after rephasing.
- `G = ℝ²` with `ω_θ` and lifts `U_a = W(a)`: `U_aU_bU_a⁻¹U_b⁻¹ = exp(iθ(a₁b₂−a₂b₁))`, unchanged by any rephasing, so the class is nontrivial for `θ ≠ 0` although `ℝ²` is simply connected.

### 7.3 Internal symmetry: SU(3) conventions and symmetry breaking

In `Fin 3` indices adopt the trace-zero skew-Hermitian matrices `Q = i·diag(1/3,−2/3,1/3)`, `I₁ = (i/2)(E₁₂+E₂₁)`, `I₂ = (1/2)(E₁₂−E₂₁)`, `I₃ = (i/2)diag(1,−1,0)`, prove they lie in `Lie(SU(3))` as identified by LieGroups Layer 2 with the trace-zero skew-Hermitian matrices (real dimension `8`, with the basis `i(E₁₁−E₂₂)`, `i(E₂₂−E₃₃)` and `E_jk−E_kj`, `i(E_jk+E_kj)` for `j<k`), and prove the cyclic commutators `[I₁,I₂] = −I₃`, `[I₂,I₃] = −I₁`, `[I₃,I₁] = −I₂`, `[Q,I₃] = 0`. For a finite-dimensional continuous unitary representation π of SU(3), consume LieGroups Layers 2–3 for automatic smoothness and the Lie functor, and CompactGroups and LieHighestWeight for the torus decomposition: choose an orthonormal weight basis `v_j` with integers `k_j,l_j` such that `dπ(H(s,t))v_j = i(k_js+l_jt)v_j` for `H(s,t) = i·diag(s,t,−s−t)`; define the Hermitian observable `A_X = (1/i)dπ(X)`, so `π(exp(tX)) = exp(itA_X)`, and prove `A_Qv_j = ((k_j−2l_j)/3)v_j`, `A_(I₃)v_j = ((k_j−l_j)/2)v_j`; for the defining representation the torus weights `(1,0),(0,1),(−1,−1)` give charges `1/3,−2/3,1/3` and third isospins `1/2,−1/2,0`. For `ℏ > 0` put `J_a = ℏA_(I_a)` and prove `[J_a,J_b] = iℏε_abcJ_c`. Develop symmetry-breaking models: for a unitary SU(6) action, a self-adjoint invariant `H₀` and a self-adjoint `V` commuting with the embedded SU(3), put `H_λ = H₀+λV` and prove exact residual SU(3) covariance, the Duhamel bound `‖exp(−itH_λ)−exp(−itH₀)‖ ≤ |tλ|‖V‖` and `‖[H_λ,U(g)]‖ ≤ 2|λ|‖V‖`; work `ℂ⁶ = ℂ³⊗ℂ²`, `g ↦ g⊗1`, `H₀ = E₀·1`, `V = 1⊗diag(1,−1)`, compute the two triplet energies `E₀±λ` and identify the full stabilizer of `H_λ` in `U(6)` for `λ ≠ 0` as `U(3)×U(3)`, the unitaries of the two eigenspaces `ℂ³⊗e₁` and `ℂ³⊗e₂`, which is larger than the embedded SU(3).

- The adopted su(3) matrices, their brackets and the real basis of `Lie(SU(3))`.
- Charge and third-isospin eigenvalues from torus weights, with the Hermitian normalization.
- Symmetry-breaking bounds and the six-dimensional worked model.

*Needs:* LieGroups Layers 2, 3; CompactGroups Layers 1–5; LieHighestWeight Layers 2, 4; Mathlib `Matrix.specialUnitaryGroup`.

**Checks.**

- `[I₁,I₂]`: `I₁I₂ = (i/4)(E₁₂+E₂₁)(E₁₂−E₂₁) = (i/4)(−E₁₁+E₂₂)`, `I₂I₁ = (i/4)(E₁₂−E₂₁)(E₁₂+E₂₁) = (i/4)(E₁₁−E₂₂)`, so `[I₁,I₂] = (i/4)(−2E₁₁+2E₂₂) = −(i/2)(E₁₁−E₂₂) = −I₃`.
- Defining representation: `A_Q = diag(1/3,−2/3,1/3)` has eigenvalues `1/3,−2/3,1/3`, and `(k−2l)/3` at the weights `(1,0),(0,1),(−1,−1)` gives `1/3, −2/3, (−1+2)/3 = 1/3`; `(k−l)/2` gives `1/2,−1/2,0`.
- `[J_a,J_b] = iℏε_abcJ_c` with `J_a = ℏ(1/i)dπ(I_a)`: `[J₁,J₂] = ℏ²(1/i)²dπ([I₁,I₂]) = −ℏ²dπ(−I₃) = ℏ²dπ(I₃) = iℏ·ℏ(1/i)dπ(I₃) = iℏJ₃`.

### Examples

The spin-half ray action of SO(3) and the Weyl family on `ℝ²` are the two standard obstructions: the first has a Borel multiplier with no continuous representative, the second a continuous multiplier with no trivialization. Both are read off from NoncompactQuantumSymmetry P.3–P.4; this layer adds only the comparison between global and local continuity and the application to dynamics.

### Dependencies

§7.1 depends on §0.1 and NoncompactQuantumSymmetry P.1; §7.2 on §4.3, P.1–P.4 and M1; §7.3 on the representation-theory suppliers only. Layer 7 consumes no later layer.

## Layer 8: free particles and Euclidean-invariant Hamiltonians

### 8.1 Coordinate changes and flow pullbacks

Consume NoncompactQuantumSymmetry P.5 for position `Q_j` (its `X_j`), momentum `P_j` and the Schwartz core on `L²(ℝ³)`, which agree with this roadmap's operators at ℏ=1, and own the transform adapter: P.5's `F_ℏψ(p) = (2πℏ)^(−n/2)∫e^(−ip·x/ℏ)ψ(x)dx` is `D_ℏ∘F` for Mathlib's `F` and the unitary dilation `(D_ℏg)(p) = (2πℏ)^(−n/2)g(p/(2πℏ))`, so P.5's multiplier `p_j` for `P_j` becomes this roadmap's `FP_jF⁻¹ = M_(2πξ_j)` and every P.5 statement transports along `D_1`; state the same formulas on `L²(ℝⁿ)` for every `n ≥ 1` by the same proof. For invertible real linear `T` define `(U_Tf)(y) = |det T|^(−1/2)f(T⁻¹y)` and prove how momentum, kinetic energy and potentials transform, with transported self-adjoint domains and common cores; for a smooth diffeomorphism `T : Ω → Ω′` of open sets prove the unitary `(U_Tf)(y) = |det D(T⁻¹)(y)|^(1/2)f(T⁻¹y)`, transport differential expressions on compactly supported smooth cores, prove Schwartz invariance for linear `T` and give sufficient polynomial growth bounds for Schwartz preservation by general `T`. For an open `Ω ⊆ ℝⁿ` and a jointly smooth action `T : ℝ×Ω → Ω` with `T_0 = id`, `T_(s+t) = T_s∘T_t`, construct `V_tu(x) = |det D_xT_t|^(1/2)u(T_tx)` and prove it is a strongly continuous unitary group (control supports by the compact image of a compact set over a bounded time interval, prove continuity and difference quotients on `C_c^∞(Ω)`, extend by density and the unitary bound). With `X(x) = ∂_tT_t(x)|_0` and `div X = Σ∂_jX_j` prove `(d/dt)V_tu|_0 = B_Xu = X·∇u + (div X)u/2` on `C_c^∞`, and for `V_t = exp(itA_X)` that `A_X|_(C_c^∞) = −iB_X`, symmetric by integration by parts; consume UO-E01's invariant-core theorem for essential self-adjointness and identify `D(A_X) = {u ∈ L²(Ω) : B_Xu ∈ L²(Ω)}` distributionally (PDE Lane A), with `U_(T_t) = V_(−t)`.

- The transform adapter `F_ℏ = D_ℏ∘F` to NoncompactQuantumSymmetry P.5.
- Linear and diffeomorphism coordinate-change unitaries with transported domains.
- Smooth flows give strongly continuous unitary groups with generator `−i(X·∇ + (div X)/2)` on its maximal distributional domain.

*Needs:* NoncompactQuantumSymmetry P.5; UnboundedOperators UO-E01; PDE Lane A; Mathlib `SchwartzMap`, change of variables.

**Checks.**

- Rotations about the `x`-axis: `T_t(x,y,z) = (x, y cos t − z sin t, y sin t + z cos t)`, `X = (0,−z,y)`, `div X = 0`, `A_X = −i(y∂_z − z∂_y)` on `C_c^∞(ℝ³)`, the `x`-component of orbital angular momentum `(Q×P)_x` with `P = −i∇`.
- Dilations `T_t(x) = e^tx` on ℝ: `X = x`, `div X = 1`, `B_Xu = xu′ + u/2`, and `V_tu(x) = e^(t/2)u(e^tx)` is unitary: `∫|e^(t/2)u(e^tx)|²dx = ∫|u(y)|²dy`.
- For the incomplete vector field `X = x²` on ℝ (flow `x/(1−tx)`, escaping in finite time) the statement does not apply: `−i(x²∂_x + x)` on `C_c^∞(ℝ)` is symmetric, and the equations `A*u = ±iu` have the `L²` solutions `e^(1/x)/|x|` supported on `(−∞,0)` and `e^(−1/x)/x` supported on `(0,∞)`, so the deficiency indices are `(1,1)` and the operator is not essentially self-adjoint.
- The transform adapter on Gaussians in dimension `n`: Mathlib's `F` fixes `e^(−π|x|²)` and sends `e^(−|x|²/2)` to `(2π)^(n/2)e^(−2π²|ξ|²)`, while P.5's `F_1 = D_1∘F` fixes `e^(−|x|²/2)`, since `(D_1Fe^(−|·|²/2))(p) = (2π)^(−n/2)·(2π)^(n/2)e^(−2π²|p|²/(4π²)) = e^(−|p|²/2)`; an adapter without the dilation would give both transforms the same fixed Gaussian, which is false.

### 8.2 The free Hamiltonian

On `L²(ℝⁿ)` with `m > 0` and ℏ=1, define `H₀ = −Δ/(2m)` on the Fourier multiplier domain `{f : |ξ|²f̂ ∈ L²} = H²(ℝⁿ)` and prove self-adjointness, the Schwartz core, `C_c^∞` core, the Fourier intertwining `FH₀F⁻¹ = M_(4π²|ξ|²/(2m))` and the outcome law of `H₀` in a Schwartz state (Teschl, Theorem 7.8 and Lemma 7.9, for `m = 1/2`). Prove `σ(H₀) = σ_ac(H₀) = [0,∞)`, `σ_pp = σ_sc = ∅` through the spectral measure of `−Δ` in the state ψ, which in this roadmap's transform is `dμ_ψ(λ) = ½(2π)^(−n)λ^(n/2−1)(∫_(S^(n−1))|ψ̂(√λω/(2π))|²dω)dλ` on `[0,∞)` (the substitution `ξ = √λω/(2π)` in `∫|ψ̂(ξ)|²dξ`; Teschl's proof of Theorem 7.8 displays it without the factor `(2π)^(−n)` and without the dilation of the argument because his transform is the `F_1` of §8.1), and for general `m` through the pushforward under `λ ↦ λ/(2m)`, and in dimension one `σ_p(H₀) = σ_r(H₀) = ∅` with the bounded resolvent `(4π²ξ² − z)⁻¹` for `z ∉ [0,∞)`. Prove the propagator kernel for `t ≠ 0` and Schwartz ψ, with `m = 1/2`, `(e^(−itH₀)ψ)(x) = (4π|t|)^(−1/2)e^(−iπ sgn(t)/4)∫exp(i(x−y)²/(4t))ψ(y)dy`, by Gaussian damping of the Fourier multiplier and removal of the damping in `L²`, extended to `L²` by unitarity without absolute kernel convergence, and the general-mass kernel by `t ↦ t/(2m)`. For `ψ₀ ∈ D(H₀)` identify the orbit `t ↦ e^(−itH₀)ψ₀` with `TauCeti.Semigroups.IsClassicalSolution` for the real operator underlying `−iH₀` and prove uniqueness among `C¹` curves in `D(H₀)` solving `ψ′ = −iH₀ψ` (`isClassicalSolution_realOperator`, `IsClassicalSolution.eq_realOperator`, `.unique`); for arbitrary `ψ₀ ∈ L²` use `IsMildSolution` and `isMildSolution_realOperator`. Relative to the momentum PVM `D(H₀)` is a fourth-moment condition and relative to the energy PVM a second-moment one, with `P_(H₀)(B) = P_P({p : p² ∈ B})`. Prove the restricted symbol theorem: for `n ≥ 2` a translation-invariant constant-coefficient scalar differential operator of order at most two with real O(n)-invariant symbol has symbol `a|ξ|²+b`; in dimension one `O(1)`-invariance is needed and `SO(1)` allows a linear term.

- `H₀` self-adjoint on `H²` with absolutely continuous spectrum `[0,∞)`.
- The free propagator kernel on Schwartz data and its unitary extension.
- Classical and mild solutions of the free Schrödinger equation through the Tau Ceti Cauchy-problem API.

*Needs:* §8.1; NoncompactQuantumSymmetry P.5; SelfAdjointSpectralTheory Part A; UnboundedOperators UO-A07, UO-C03; Tau Ceti `IsClassicalSolution`, `IsMildSolution`; Mathlib `Lp.fourierTransformₗᵢ`, Gaussian integrals.

**Checks.**

- `n = 1`, `m = 1/2`, `H₀ = P² = −∂²`: the indicator `1_([−1,1])` satisfies `x²ψ ∈ L²` but `ξ²ψ̂ ∉ L²` (its Fourier transform decays like `1/ξ`), so it is not in `D(H₀)`; a position-moment condition does not describe `D(H₀)`.
- The kernel at `t = 1` applied to the Gaussian `ψ(y) = e^(−y²)`: the Fourier multiplier gives `e^(−it·4π²ξ²)ψ̂(ξ)` with `ψ̂(ξ) = √π e^(−π²ξ²)`, and the inverse transform is `(1+4i)^(−1/2)exp(−x²/(1+4i))`, which the Gaussian-damping evaluation of the kernel integral reproduces; the phase `e^(−iπ/4)` matches `(4πi)^(−1/2)`.
- The evolution `e^(−itH₀)` with derivative `−iH₀` on `D(H₀)`: for `H₀ = 1` (constant) the solution is `e^(−it)ψ₀`, norm preserving; the equation `ψ′ = −H₀ψ` (no `i`) gives `e^(−t)ψ₀`, norm decaying, and is not unitary dynamics.

### 8.3 Euclidean-invariant scalar Hamiltonians

For `n ≥ 2` on `H = L²(ℝⁿ)` with translations `T_af(x) = f(x−a)` and rotations `U_Rf(x) = f(R⁻¹x)`, `R ∈ SO(n)`, let `A` be densely defined self-adjoint with each `T_a` and `U_R` mapping `D(A)` onto itself and intertwining `A` (equivalently, all spectral projections of `A` commute with these unitaries, UO-B03). Put `L = −Δ` with its maximal realization and `λ(ξ) = 4π²|ξ|²`. Prove that such `A` are exactly `g(L)` for real Borel `g` on `[0,∞)`, with `D(A) = {f : g(λ(ξ))f̂ ∈ L²}` and `(Af)^∧ = g∘λ·f̂`; with `ν = λ_*dξ`, prove `ν` has no atom at `0`, is equivalent to Lebesgue measure on `(0,∞)`, and two `g` give the same operator exactly when equal `ν`-almost everywhere. In dimension one the classification uses `O(1)` (even symbols), while `SO(1)` alone leaves arbitrary real Fourier symbols, momentum being the non-even example. Route: Fourier transform turns the translations `T_a` into the character multipliers `M_(χ_a)`, `χ_a(ξ) = e^(−2πia·ξ)`. Prove that a bounded operator `B` on `L²(ℝⁿ)` commuting with every `M_(χ_a)` commutes with every multiplier `M_φ`, `φ ∈ L^∞`: for `f,g ∈ L²` the function `h = conj(B*f)·g − conj(f)·Bg` lies in `L¹`, its Fourier transform `ĥ(a) = ⟪f,[B,M_(χ_a)]g⟫` vanishes identically, so `h = 0` by `L¹` Fourier uniqueness (derive complex `L¹` uniqueness from `Measure.ext_of_charFun` by splitting real and imaginary densities into positive and negative parts, with the `2π` scaling), and then `⟪f,[B,M_φ]g⟫ = ∫φh = 0` for every bounded `φ`; this uses only the pairing of `L^∞` with `L¹`, not an identification of `(L¹)*`. Consume V2's multiplication/MASA theorem to identify the commutant of all multipliers with the multiplication algebra, apply this to `(A−i)⁻¹`, reconstruct the real measurable multiplier and its maximal domain from the resolvent identities, injectivity and dense range; for rotations construct a jointly measurable representative of the bounded resolvent symbol, average over normalized Haar measure on `SO(n)`, and descend by Fubini and polar coordinates to the squared radius (a common conull set for all rotations is not an input). Prove the converse, choice independence and the domain and conjugacy comparisons; prove that spectral truncations with `|ξ| ≤ k`, `|g(λ(ξ))| ≤ k` are a graph core, that boundedness and semiboundedness are the `ν`-essential bounds of `g`, and `P_A(B) = F⁻¹M_(1_{g∘λ∈B})F`. The affine conclusion `g(λ) = aλ+b` needs §8.2's constant-coefficient second-order premise; `(−Δ)²` is the counterexample without it.

- Euclidean-invariant self-adjoint operators on `L²(ℝⁿ)`, `n ≥ 2`, are exactly the Borel functions of `−Δ`, with uniqueness modulo `ν`.
- The commutant of the character multipliers is the commutant of all `L^∞` multipliers; the measurable descent of the resolvent symbol.
- Cores, bounds and spectral projections of `g(−Δ)`.

*Needs:* §8.2; UnboundedOperators UO-A07, UO-B03; VonNeumannAlgebras V2 (multiplication MASA); Mathlib `Measure.ext_of_charFun`, Haar measure on `SO(n)`, polar coordinates.

**Checks.**

- `g(λ) = λ²` gives `(−Δ)²`, which commutes with all translations and rotations and is not affine in `−Δ`; its domain is `H⁴`.
- In dimension one the momentum `P = −i∂` has symbol `2πξ`, odd, commutes with translations, and is not a function of `−Δ` since `g(4π²ξ²)` is even; under `O(1)` it fails to commute with the reflection `f(x) ↦ f(−x)`.
- `g = 1_({0})` gives the zero operator since `ν({0}) = 0`; the symbols `g` and `g + 1_({0})` define the same operator, which is the uniqueness-modulo-`ν` clause.

### 8.4 Continuous representatives and local averages

For `N ≥ 1` on `L²(ℝ^N, volume)` prove that a continuous representative of an `L²` class is unique, and more generally that two representatives agreeing almost everywhere near `x₀`, both continuous at `x₀`, agree at `x₀`, because every neighbourhood of `x₀` has positive measure. A point value is defined only on classes admitting such a representative. For `R > 0` prove `(vol B_R)⁻¹∫_(B(x₀,R))f → f(x₀)` as `R ↓ 0` for a representative continuous at `x₀`, bounding the difference by the supremum of `‖f(x)−f(x₀)‖` on the ball; separately prove `∫_(B(x₀,R))u → 0` for every `L²` representative by Cauchy–Schwarz and `vol B_R → 0`, which does not encode `u(x₀) = 0`.

- Uniqueness of continuous representatives and of point values at points of continuity.
- Normalized ball averages converge to the continuous value; unnormalized integrals converge to zero for every `L²` function.

*Needs:* Mathlib `AEEqFun`, `Lp`, ball volumes.

**Checks.**

- `f = 1` on `ℝ`: the normalized average is `1` for every `R`, the unnormalized integral is `2R → 0`.
- A continuous compactly supported `f` with `f = 1` near `x₀`: normalized averages converge to `1`, so the unnormalized limit `0` cannot mean `f(x₀) = 0`.
- Two representatives of the class of `1_([0,1])` continuous at `x₀ = 1/2` must both equal `1` there; at `x₀ = 1` no continuous representative exists, and no point value is assigned.

### Examples

The free particle in dimension three with the rotation flow of §8.1: `A_X` is the angular momentum component, `H₀` commutes with it by §8.3 since `H₀ = g(−Δ)` with `g(λ) = λ/(2m)`, and the dilation group gives Teschl's virial identity (Theorem 10.3) used in §9.5.

### Dependencies

§8.1 → §8.2 → §8.3; §8.4 depends on Mathlib only. Layer 8 consumes NoncompactQuantumSymmetry P.5, UnboundedOperators Layers 1–3 and 5, SelfAdjointSpectralTheory Part A, VonNeumannAlgebras V2, PDE Lane A and the Tau Ceti Cauchy-problem modules.

## Layer 9: particle models

### 9.1 Euclidean-invariant spin Hamiltonians

Fix an irreducible spin-`j` space `V_j`, `2j ∈ ℕ`, ℏ=1 (LieHighestWeight Layers 2 and 4 for the SU(2) weights), on `H_j = L²(ℝ³;V_j)` with translations and `(U_sf)(x) = D_j(s)f(R_s⁻¹x)`, `R_s` the rotation covered by `s ∈ SU(2)`, normalized by `D_j(s_z(θ)) = exp(−iθS_z)` and its cyclic companions, so the physical rotation generator is `L_z+S_z` and the positive Stone generator of `U` is its negative. Identify `S_z` and its `2j+1` eigenvalues `m = −j,…,j`. For each unit `n ∈ S²` construct the spectral projections `P_m(n)` of `n·S` by `P_m(n) = ∏_(m′≠m)(n·S − m′)/(m−m′)`, prove rank one, orthogonality, sum one, continuity on `S²` and `P_m(R_sn) = D_j(s)P_m(n)D_j(s)*`, with no global continuous eigenvector choice assumed. Classify the densely defined self-adjoint `A` commuting with translations and all `U_s` on their full invariant domains: in the Fourier picture they are exactly the maximal matrix multipliers `a(ξ) = Σ_m g_m(λ(ξ))P_m(ξ/|ξ|)`, `λ(ξ) = 4π²|ξ|²`, `ξ ≠ 0`, with Borel `g_m : [0,∞) → ℝ`, maximal domain `{f : ∫Σ_m|g_m(λ(ξ))|²‖P_m(ξ/|ξ|)f̂(ξ)‖²dξ < ∞}`, each `g_m` unique modulo `ν₃` of §8.3, spectral projections with symbol `Σ_m1_B(g_m(λ(ξ)))P_m(ξ/|ξ|)`, bounds as common essential bounds, and the cutoff graph core `|ξ| ≤ k`, `max_m|g_m| ≤ k`. Supply the finite-multiplicity resolvent adapter (translations give a measurable matrix resolvent field; injectivity and dense range recover an almost-everywhere finite Hermitian symbol; rotation covariance and the multiplicity-one little-circle weights of NoncompactQuantumSymmetry M3's localized model diagonalize it in the displayed projections after Haar averaging), and compare with M3's direct integral, its radial measure and covered-circle convention; M3 owns that decomposition. For `j = 0` recover §8.3 in dimension three; for `j = 1/2` with the Pauli matrices prove `a(ξ) = a₀(λ)·1 + b₀(λ)n·σ`, `n = ξ/|ξ|`, projectors `(1±n·σ)/2` and channel values `a₀±b₀`; the fixed-energy model has all `g_m ≡ E`, and the spin-independent free model `g_m(λ) = λ/(2m_mass)`.

- The rank-one projection fields `P_m(n)` and their covariance.
- Euclidean-invariant spin-`j` Hamiltonians are channelwise Borel functions of `−Δ`.
- The spin-half formula and the recovery of the scalar case.

*Needs:* §8.3; NoncompactQuantumSymmetry M3; LieHighestWeight Layers 2, 4; CompactGroups Layer 2; UnboundedOperators UO-A07, UO-B03.

**Checks.**

- `j = 1/2`, `n = (0,0,1)`: `n·σ = σ_z`, `P_(+1/2) = diag(1,0)`, `P_(−1/2) = diag(0,1)`; for `n = (1,0,0)`, `P_± = (1±σ_x)/2`, both rank one with `P_+ + P_- = 1` and `P_+P_- = 0`.
- Covariance: `s = s_z(θ)`, `D_(1/2)(s) = exp(−iθσ_z/2)` rotates `n·σ` by the angle θ about `z`: `exp(−iθσ_z/2)σ_x exp(iθσ_z/2) = cos θ σ_x + sin θ σ_y`, matching `P_m(R_sn)`.
- Spin-dependent channels are Euclidean invariant: `a(ξ) = λ(ξ)·1 + n·σ` has channel values `λ±1`; the symbol `σ_z` alone (no `n`) is translation-invariant but not rotation-covariant, since `D(s)σ_zD(s)* ≠ σ_z` for `s = s_x(π/2)`.

### 9.2 The harmonic oscillator and the Hermite ladder

With `Q = x`, `P = −i∂`, define `a = (Q+iP)/√2`, `a† = (Q−iP)/√2` on the Schwartz core; with the physicists' polynomials `H_n = (−1)ⁿe^(x²)(d/dx)ⁿe^(−x²)` put `e_n = H_ne^(−x²/2)` and `h_n = (√π·2ⁿn!)^(−1/2)e_n`; prove `‖e_n‖² = √π·2ⁿn!`, `h_0 = π^(−1/4)e^(−x²/2)`, `h_n = (a†)ⁿh_0/√n!`, `ah_n = √n h_(n−1)`, `a†h_n = √(n+1)h_(n+1)`, identify `h_n` with `TauCeti.hermiteFunction n` (probabilists' polynomial at `√2x`) and use `TauCeti.hermiteHilbertBasis` and `hasSum_hermiteFunctionLp_expansion` for completeness and the coordinate unitary `ψ ↦ (⟪h_n,ψ⟫)_n`; the oppositely oriented coefficient map `ψ ↦ (⟪ψ,e_n⟫)_n` is antilinear and, for `ψ = Σh_n/‖e_n‖`, every coefficient `⟪ψ,e_n⟫` equals `1`, not an `ℓ²` sequence. For `c_n = ⟪h_n,ψ⟫` prove the closures of the Schwartz ladder expressions are mutual adjoints with `D(a) = {Σn|c_n|² < ∞}`, `D(a†) = {Σ(n+1)|c_n|² < ∞}`, that `H = closure((P²+Q²)|_Schwartz) = 2N+1`, `Hh_n = (2n+1)h_n`, `D(H) = {Σ(2n+1)²|c_n|² < ∞}`, `σ(H) = σ_p(H) = {2n+1}`, `σ_c = σ_r = ∅` with one-dimensional eigenspaces (Teschl, Theorem 8.5, for the three-dimensional `ω(2N+3)` form), the resolvent `a_n = b_n/(z−2n−1)` for `z` off the spectrum, `D(h(H)) = {Σ|h(2n+1)|²|c_n|² < ∞}` with strongly convergent spectral sums, and eigenstate evolution `e^(−itλ)`. Consume UO-E05 for the finite Hermite-span and Schwartz cores and UO-E03 (Nelson) after verifying the ladder factorial estimates: every word of `k` ladder factors on `h_n` has norm at most `√((n+k)!/n!)`, so the majorant `(2|t|)^k√((n+k)!)/k!` has ratio `2|t|√(n+k+1)/(k+1) → 0`, and finite Hermite vectors are entire analytic for `Q` and `P`. Identify the one-mode ladder with the square-root weighted shift of UnboundedOperators' worked examples.

- The normalized Hermite ladder with its exact domains and adjoints.
- `H = 2N+1` with pure point spectrum, resolvent and functional calculus.
- Entire analyticity of finite Hermite vectors and Nelson's theorem for `Q`, `P`.

*Needs:* §6.7; Tau Ceti `hermiteFunction`, `hermiteFunction_oscillator`, `hermiteHilbertBasis`, `hasSum_hermiteFunctionLp_expansion`; UnboundedOperators UO-E03, UO-E05; NoncompactQuantumSymmetry P.5.

**Checks.**

- `‖e_0‖² = ∫e^(−x²)dx = √π`, `‖e_1‖² = ∫4x²e^(−x²)dx = 2√π = √π·2¹·1!`; `h_0 = π^(−1/4)e^(−x²/2)` has norm one.
- `a†h_0 = (x − ∂)h_0/√2 = √2·xh_0 = h_1`, since `h_1 = (√π·2)^(−1/2)·2x e^(−x²/2) = √2·π^(−1/4)xe^(−x²/2)`; and `ah_0 = (x+∂)h_0/√2 = 0`.
- The resolvent coefficient at `z = 0`: `a_n = −b_n/(2n+1)` is in `D(H)` for every `b ∈ ℓ²`, while the fixed sequence `a_n = 1/(λ−2n−1)` has `(2n+1)a_n → −1`, which is bounded but not square summable, so it does not lie in `D(H)`.

### 9.3 Angular momentum and spherical harmonics

On `L²(ℝ³)` define `L = Q×P` on the Schwartz core, prove `[L_j,L_k] = iε_(jkl)L_l`, identify `L_j` with the rotation generators of §8.1 (the `x`-component is `−i(y∂_z − z∂_y)`), and separate radial and angular variables through `L²(ℝ³) ≅ L²((0,∞),r²dr) ⊗̂ L²(S²)`. On `L²(S²)` define the angular generators from the rotation action on the smooth core, prove they agree with the angular factors of the `ℝ³` operators, and consume RiemannianGeometry R8.1–R8.2 for the harmonic-polynomial eigenfunctions and the spectral completeness of the sphere Laplacian: prove `σ(L₃) = ℤ`, `σ(L²) = {ℓ(ℓ+1) : ℓ ∈ ℕ}` with multiplicity `2ℓ+1` on `L²(S²)` (Teschl, Theorems 8.4 and 10.7), the spherical-harmonic decomposition, and that on `L²(ℝ³)` each `L²`-eigenvalue is infinitely degenerate through the radial factor. Prove that finite sums `Σ g_j(r)Y_(ℓ_j,m_j)` with `g_j ∈ C_c^∞(0,∞)` form a common graph core for `L²` and `L_z` on `L²(ℝ³)`, by angular truncation and radial density in each finite set of channels; a single radial factor per angular mode is never dense. Verify the table `Y_00 = 1/√(4π)`, `Y_10 = √(3/(4π))cos θ`, `Y_(1,±1) = √(3/(8π))sin θ e^(±iφ)`, `Y_20 = √(5/(16π))(3cos²θ−1)`, `Y_(2,±1) = √(15/(8π))sin θ cos θ e^(±iφ)`, `Y_(2,±2) = √(15/(32π))sin²θ e^(±2iφ)` with `dΩ = sin θ dθdφ`, orthonormality and the eigenvalues `m` and `ℓ(ℓ+1)`; the lowering operator is `L_x − iL_y` and `L_z = −i∂_φ`; a factor `(x+iy)^ℓf(r)` is a state only with its weighted radial integrability. Common eigenvectors of all three components have zero angular eigenvalues, which is distinct from common eigenvectors of `L²` and `L_z`.

- The commutation relations and the agreement of intrinsic and ambient angular generators.
- Spectra and multiplicities of `L₃` and `L²`, with the radial degeneracy on `ℝ³`.
- A common graph core of finite angular sums with compactly supported radial factors.

*Needs:* §8.1; RiemannianGeometry R8.1, R8.2; NoncompactQuantumSymmetry P.5; UnboundedOperators UO-B03, UO-F02.

**Checks.**

- `∫|Y_10|²dΩ = (3/(4π))·2π·∫_0^π cos²θ sin θ dθ = (3/(4π))·2π·(2/3) = 1`; `∫|Y_(2,±2)|²dΩ = (15/(32π))·2π·∫sin⁵θ dθ = (15/16)·(16/15) = 1`.
- `L_z Y_(1,1) = −i∂_φ(e^(iφ)·…) = Y_(1,1)`, eigenvalue `m = 1`; `L²Y_(1,1) = 2Y_(1,1)`, eigenvalue `ℓ(ℓ+1) = 2`.
- The sign of the bracket: with `L = Q×P` and `[Q_j,P_k] = iδ_jk`, `[L_x,L_y] = [yP_z − zP_y, zP_x − xP_z] = y[P_z,z]P_x + x[z,P_z]P_y = −iyP_x + ixP_y = iL_z`; reversing all three components keeps `[L_x,L_y] = iL_z` only after also reversing the right side, so a table with opposite-signed components cannot be combined with the `+i` relation unchanged.

### 9.4 Kummer and Tricomi functions

Use `ℳ(a,b,z) = Complex.regularizedHGFun {a} {b} z`, entire in `z` for all `a,b`, and Kummer's `M(a,b,z) = Γ(b)·ℳ(a,b,z)`, which is `₁F₁(a;b;z)` when `b` is not a nonpositive integer and vanishes identically when it is, by `Complex.Gamma_neg_nat_eq_zero`. Prove `regularizedHGFun_kummer_equation` (in `Suggested.lean`): `zℳ″ + (b−z)ℳ′ − aℳ = 0` for all `a,b,z`, and deduce the same equation for `M` by multiplying with the constant `Γ(b)` (DLMF 13.2.1; the regularized coefficient recurrence `(k+1)(b+k)c_(k+1) = (a+k)c_k` with `c_k = (a)_k/(k!Γ(b+k))` is `regularizedHGFunCoeff_add_one`); for `b = −N` the regularized coefficients `c_k = (a)_k/(k!Γ(k−N))` vanish for `k ≤ N`, so the holomorphic-solution data of `ℳ(a,−N,·)` are `c₀ = 0` and `c_(N+1) = (a)_(N+1)/(N+1)!` (DLMF 13.2.5): at `k = N` the recurrence reads `0 = (a+N)c_N`, which forces `c₀ = 0` for every holomorphic solution when `a ∉ {0,−1,…,−N}` and leaves `c_(N+1)` free. Construct Tricomi's `U(a,b,z)` on the slit plane from `U(a,b,z) = Γ(a)⁻¹∫_0^∞e^(−zt)t^(a−1)(1+t)^(b−a−1)dt` for `Re a > 0`, `Re z > 0`, prove compact-parameter domination and holomorphy, continue in `z` along the Kummer equation on paths avoiding `0` with holomorphic parameter dependence on the principal slit plane and then on the logarithmic cover, derive the recurrence `U(a−1,b,z) = (z+2a−b)U(a,b,z) − a(a−b+1)U(a+1,b,z)` (DLMF 13.3.7) by integration by parts and use it, without division, to extend one left half-strip in `a` at a time to entire dependence on `a,b`; prove the Wronskian `W(ℳ,U) = −e^zz^(−b)/Γ(a)` for all `a,b` (DLMF 13.2.34), the connection formula `ℳ(a,b,z) = e^(∓πia)U(a,b,z)/Γ(b−a) + e^(±πi(b−a))e^zU(b−a,b,e^(±πi)z)/Γ(a)` (DLMF 13.2.41; upper signs for `−π < arg z < 0`, lower for `0 < arg z < π`), the integer-`b` limits with logarithmic terms (DLMF 13.2.9–13.2.11), the sectorial asymptotic `U(a,b,z) ~ z^(−a)` for `|arg z| ≤ 3π/2 − δ` with differentiated forms and locally uniform parameter estimates (DLMF 13.7), and the terminating identity `M(−n,b,z) = Σ_(k≤n)(−n)_kz^k/((b)_kk!)` of exact degree `n` for `b` outside the nonpositive integers, with the Laguerre comparison `L_n^(α)(x) = ((α+1)_n/n!)M(−n,α+1,x)` (DLMF 13.6.19; LaguerreJacobi A1–A3). At a nonpositive integer `a` the Wronskian vanishes and `U` is not asserted to be an independent solution; fundamental pairs are the normalized initial-data solutions at a regular point.

- `regularizedHGFun_kummer_equation`: `ℳ`, hence `M`, satisfies Kummer's equation for all parameters; the singular-parameter solution data.
- `U` on the logarithmic cover with Laplace representation, recurrence, Wronskian, connection formula and asymptotics.
- The terminating identity and the Laguerre comparison.

*Needs:* Mathlib `Complex.regularizedHGFun`, `regularizedHGFunCoeff_add_one`, `radius_regularizedHGFunSeries_eq_top`, `Complex.Gamma`, `Complex.slitPlane`; LaguerreJacobi A1–A3; DLMF Chapter 13.

**Checks.**

- `a = 0`: `ℳ(0,b,z) = 1/Γ(b)`, constant, which satisfies `zM″ + (b−z)M′ − 0·M = 0`; `U(0,b,z) = 1` by the Laplace integral's limit, and `W(ℳ,U) = 0 = −e^zz^(−b)/Γ(0)` since `1/Γ(0) = 0`.
- `a = b`: `M(a,a,z) = e^z`, and the equation reads `ze^z + (a−z)e^z − ae^z = 0`.
- `b = −1`, `a = 1`: `M(1,−1,z) = Γ(−1)·ℳ(1,−1,z) = 0` identically, since Mathlib's `Γ(−1) = 0`, which satisfies the equation trivially; `ℳ(1,−1,z)` has `c₀ = c₁ = 0` and `c₂ = (1)_2/2! = 1`, so `ℳ(1,−1,z) = z²·M(3,3,z) = z²e^z`, with leading coefficient `1` as the prescribed `c_(N+1)` says; a definition that kept `c₀ = 1` at `b = −1` would contradict the recurrence at `k = 1`, which reads `0 = 2c₁ = −2c₀`.

### 9.5 Coulomb wave functions and the hydrogen atom

On `L²(ℝ³×ℝ³)` with masses `m₁,m₂ > 0`, ℏ=1 and signed coupling α, put `H = −Δ_(x₁)/(2m₁) − Δ_(x₂)/(2m₂) + α/|x₁−x₂|`; with `R = (m₁x₁+m₂x₂)/M`, `r = x₁−x₂`, `M = m₁+m₂`, `μ = m₁m₂/M` construct the centre-of-mass unitary, prove `∇_(x₁) = (m₁/M)∇_R + ∇_r`, `∇_(x₂) = (m₂/M)∇_R − ∇_r`, and `H = −Δ_R/(2M) + H_rel`, `H_rel = −Δ_r/(2μ) + α/|r|`, on a core and on the self-adjoint domains (UO-F02, UO-F03). Prove `1/|r|` is infinitesimally `−Δ`-bounded and relatively compact by UO-E06's `L²+L^∞` decomposition (tail norm `≤ |α|/R` at radius `R`), so `H_rel` is self-adjoint on `H²(ℝ³)` with `σ_ess(H_rel) = [0,∞)` (Teschl, Theorem 10.2 and equation (10.6), in the normalization `−Δ − γ/|x|`, `γ = −2μα`), and that the essential spectrum of the free operator is included, which is not a general inclusion theorem. Prove no eigenvalue `E ≥ 0` for every signed α and every ℓ (virial theorem, Teschl, Theorem 10.3, and the nonnegative Friedrichs form for `α ≥ 0`). In the partial-wave decomposition, the reduced radial operator times `2μ` is `−u″ + ℓ(ℓ+1)u/r² + 2μαu/r` on `L²((0,∞),dr)`; consume UO-D07 with `ν = ℓ+1/2`, `b = −2μα` and UO-D06's Friedrichs realization: `0` is limit circle with condition `u(0) = 0` for `ℓ = 0` and limit point for `ℓ ≥ 1`, `∞` is limit point (Teschl, Theorem 10.8); prove the partial-wave unitary and agreement of the Friedrichs realization with the hydrogen domain. Consume LaguerreJacobi A1–A3, B1–B4 for the Laguerre bases and own the radial normalization `∫_0^∞x^(α+1)e^(−x)(L_k^(α)(x))²dx = (2k+α+1)Γ(k+α+1)/k!` and the dilation adapter to each channel; prove the bound spectrum for `α < 0`: energies `−μα²/(2n²)`, `0 ≤ ℓ < n`, total multiplicity `Σ_(ℓ<n)(2ℓ+1) = n²` (Teschl, Theorem 10.9), and no point spectrum for `α ≥ 0`. For `k > 0` define `F_ℓ(η,ρ) = C_ℓ(η)ρ^(ℓ+1)e^(iρ)M(ℓ+1+iη, 2ℓ+2, −2iρ)`, `C_ℓ(η) = 2^ℓe^(−πη/2)|Γ(ℓ+1+iη)|/(2ℓ+1)!`, `θ_ℓ = ρ − η log(2ρ) − ℓπ/2 + σ_ℓ(η)`, `H_ℓ^± = e^(±iθ_ℓ)(∓2iρ)^(ℓ+1±iη)U(ℓ+1±iη, 2ℓ+2, ∓2iρ)` with principal logarithms, `G = (H^+ + H^−)/2`, and prove real-valuedness, the regular-origin normalization, the Coulomb equation `F″ + (1 − 2η/ρ − ℓ(ℓ+1)/ρ²)F = 0`, `H^± = G ± iF`, `W(G,F) = W(H^±,F) = 1`, where `σ_ℓ` is the continuous phase of `Γ(ℓ+1+iη)` with `σ_ℓ(0) = 0` (DLMF 33.2.8–33.2.12), the unit-amplitude asymptotics with phase `θ_ℓ` and their derivatives, locally uniformly in `k` (DLMF 33.10–33.11). Define `(𝒞_ℓu)(k) = √(2/π)∫_0^∞F_ℓ(μα/k,kr)u(r)dr` and prove it is unitary from the absolutely continuous radial subspace onto `L²((0,∞),dk)`, intertwining the Friedrichs operator with multiplication by `k²/(2μ)`, by the following Weyl–Kodaira argument: for nonreal `z` put `β = √(−2μz)` with `Re β > 0`, `a_z = ℓ+1+μα/β`, `b = 2ℓ+2`, `φ_z(r) = e^(−βr)(2βr)^(ℓ+1)M(a_z,b,2βr)`, `ψ_z(r) = e^(−βr)(2βr)^(ℓ+1)U(a_z,b,2βr)`; prove the origin condition for `φ_z`, square integrability of `ψ_z` at infinity, analytic dependence, `W_r(φ_z,ψ_z) = −2βΓ(2ℓ+2)/Γ(a_z) ≠ 0`, the boundary limits `β → −ik` and `ψ_(E+i0) = i^ℓe^(−πη/2−iσ_ℓ(η))H_ℓ^+(η,kr)` for `E = k²/(2μ) > 0` (lower boundary conjugate), with convergence locally uniform in `r` and `E` and bounds uniform in `0 < |Im z| ≤ ε₀`; the resolvent kernel `−2μφ_z(r_<)ψ_z(r_>)/W(φ_z,ψ_z)` on compactly supported data and as the bounded resolvent; the positive-energy boundary jump `(2μ/(πk))F_ℓ(μα/k,kr)F_ℓ(μα/k,ks)` of the imaginary kernel divided by π; Stieltjes inversion from RandomMatrices §3.1 applied to the scalar spectral measures of SA-E01/SA-E05 with the sign adapter between `(A−z)⁻¹` and UO's `R_A(z) = (z−A)⁻¹`; analytic continuation of `β, φ_z, ψ_z, 1/W` through compact negative intervals avoiding the bound energies, so inversion with `g = 0` excludes measure there and only the bound poles remain, with no atom at `0`; Parseval on compact tests with the bound-state coefficients; invariance of the closed range under every `L^∞(dk)` multiplier and the scalar multiplier-commutant lemma identifying the range projection with `1_S`, `S` conull by the nonvanishing of the regular solution at almost every `k`. Conclude purely absolutely continuous spectrum `[0,∞)` of multiplicity one in each channel (Teschl, Theorem 10.8), and in the full relative space absolutely continuous spectrum `[0,∞)` of countably infinite multiplicity, bound states as stated, `σ(H) = σ_ess(H) = [−μα²/2,∞)` for `α < 0` and `[0,∞)` for `α ≥ 0` by the centre-of-mass tensor sum. Prove that the normalized bound states `ψ_(n,ℓ,m)` are a joint orthonormal eigenbasis of `H_rel`, `L²` and `L₃` on the bound-state subspace, using strong commutation (UO-B03) of the rotation group with `H_rel` on its domain; include expectation and transition-probability computations for the named states under absolute integrability.

- Self-adjointness, essential spectrum and absence of nonnegative eigenvalues of the hydrogen Hamiltonian.
- The bound spectrum `−μα²/(2n²)` with multiplicity `n²` for `α < 0`, from the Laguerre bases.
- The Coulomb transform `𝒞_ℓ`, unitary onto `L²(dk)`, diagonalizing each radial channel; the full spectral representation.

*Needs:* §8.2, §9.3, §9.4; UnboundedOperators UO-B03, UO-D06, UO-D07, UO-E06, UO-F02, UO-F03; SelfAdjointSpectralTheory SA-E01, SA-E05; RandomMatrices §3.1; LaguerreJacobi A1–A3, B1–B4; DLMF Chapter 33.

**Checks.**

- Hydrogen with `m₁ = m₂ = 1`, `α = −1`: `M = 2`, `μ = 1/2`, bound energies `−μα²/(2n²) = −1/(4n²)`, ground state `−1/4` with multiplicity `1`, first excited `−1/16` with multiplicity `4 = 1+3`.
- The coordinate dictionary: for `m₁ = m₂`, `∇_(x₁) = ∇_R/2 + ∇_r` and `∇_(x₂) = ∇_R/2 − ∇_r`, so `∇_(x₁)+∇_(x₂) = ∇_R` (total momentum `−i∇_R`) and `(∇_(x₁)−∇_(x₂))/2 = ∇_r` (relative momentum `−i∇_r` with `μ = 1/2`); the formula `P_j = +im_j∇_(x_j)` would give total momentum `i∇_R` with the wrong sign and would not be self-adjoint-consistent with the Fourier convention.
- The Coulomb functions at `η = 0`: `F_ℓ(0,ρ) = ρ j_ℓ(ρ)` (Riccati–Bessel), `C_0(0) = 1`, `F_0(0,ρ) = sin ρ`, `G_0(0,ρ) = cos ρ`, `W(G_0,F_0) = cos²ρ + sin²ρ = 1`, and the asymptotic phase `θ_0 = ρ` since `σ_0(0) = 0`.

### 9.6 Countable tensor products and composite outcome laws

Define finite composite outcomes on V2's completed tensor product. For countably many factors fix unit reference vectors `ξ_n` and consume VonNeumannAlgebras V2's incomplete tensor product (completion of finite-prefix tensors under `v ↦ v⊗ξ_(n+1)`), its raw-prefix Cauchy criterion (prefix vectors in the η-component are Cauchy exactly when, after discarding a finite initial prefix, the tail products `∏⟨η_n,ζ_n⟩` tend uniformly to `1`), and its second reference-change result, the phase-adjusted component equivalence (a unitary intertwiner of the local-product representations exists exactly when `Σ(1−|⟨ζ_n,η_n⟩|) < ∞`); `Σ|1−⟨ζ_n,η_n⟩| < ∞` is sufficient but not necessary for raw convergence, and alternating signs refute `Σ(1−|⟨ζ_n,η_n⟩|)` as a raw criterion. Define states as normal exactly when given by a trace-class density on the resulting space; define countable composite outcome laws on finite-cylinder events and prove their extension to the product σ-algebra under standard-Borel hypotheses; construct finite iterated identifications and prove coherence and unitary associativity; define separability of mixed states in infinite dimension as trace-norm closure of the convex hull of product densities.

- Composite outcome laws on finite cylinders and their extension.
- The raw-prefix criterion and its sufficient summability condition.
- Coherence of iterated identifications.

*Needs:* §6.1; VonNeumannAlgebras V2 (incomplete tensor product); Mathlib product σ-algebras, Kolmogorov extension on standard Borel spaces.

**Checks.**

- `ζ_n = η_n` for all `n`: the tail products are `1`, raw prefixes are Cauchy, and `Σ|1−⟨ζ_n,η_n⟩| = 0`.
- `⟨η_n,ζ_n⟩ = (−1)ⁿ`: the tail products alternate and do not converge, although `Σ(1−|⟨η_n,ζ_n⟩|) = 0`; the modulus criterion is false.
- `⟨η_n,ζ_n⟩ = 1 − 1/n²`: `Σ|1−⟨η_n,ζ_n⟩| < ∞`, so the raw prefixes converge; `⟨η_n,ζ_n⟩ = 1 − 1/n` gives tail products `∏(1−1/n) → 0`, not `1`, so they do not.

### 9.7 Dirac operators and the metric example

For a path-connected open `O ⊆ ℝⁿ` and a nonzero finite-dimensional Hermitian Clifford representation with self-adjoint generators `γ_j`, `γ_iγ_j+γ_jγ_i = 2δ_ij`, put `c(dx_j) = −iγ_j` and `D = −iΣγ_j∂_j` on `C_c^∞(O,H)`; prove the sign and carrier dictionary and symmetry by integration by parts; consume RiemannianGeometry R7.8's commutator-norm and intrinsic-distance theorem in the trivial-bundle case, with bounded real smooth functions of bounded gradient acting by bounded multiplication and the seminorm domain taken modulo constants; on a nonconvex `O` the intrinsic path distance is not the restricted Euclidean distance; a general `O` needs an essential-self-adjointness hypothesis or a chosen extension before an observable is assigned. For `O = ℝⁿ` prove that the closure is the self-adjoint Fourier multiplier `2πΣξ_jγ_j` on `{u : |ξ|u ∈ L²}`, that bounded-gradient multipliers preserve `H¹`, and that the core and closed-operator commutators agree. For a coefficient basis `(e_i)` with `b(e_i,e_i) > 0` consume SpinGeometry G1.3's scalar trace to obtain `τ(a*a) = Σ_I|α_I|²∏_(i∈I)b(e_i,e_i)` on ordered monomials, and use this coefficient state with a vector or density state to interpret the outcome law of the Dirac realization. The compactness criteria for state metrics belong to CompactQuantumMetricSpaces 1.4, 3.3 and 3.6; a path-connected open `O` is not thereby a compact quantum metric space.

- The Dirac expression on `C_c^∞(O,H)`, its symmetry and the commutator with multiplication operators.
- The `ℝⁿ` closure as a Fourier multiplier.
- The coefficient trace and its use as a state on the Clifford factor.

*Needs:* §8.2; RiemannianGeometry R7.8; SpinGeometry G1.3; SpinRepresentations Layer 7; CompactQuantumMetricSpaces 1.4, 3.3, 3.6 (deferral only).

**Checks.**

- `n = 1`, `H = ℂ`, `γ₁ = 1`: `D = −i∂` is momentum, `[D,M_f] = −if′`, `‖[D,M_f]‖ = ‖f′‖_∞`, and the intrinsic distance on an interval is the Euclidean one.
- `n = 2` with `γ₁ = σ_x`, `γ₂ = σ_y`: `D² = −Δ·1` and the Fourier multiplier `2π(ξ₁σ_x+ξ₂σ_y)` has eigenvalues `±2π|ξ|`, so `σ(D) = ℝ`.
- On `O = ℝ²∖{(x,0) : x ≤ 0}` with the two points `(−1,±ε)`, the Euclidean distance is `2ε` while the intrinsic distance is at least `2`, so `sup{|f(p)−f(q)| : ‖[D,M_f]‖ ≤ 1}` computes the latter.

### 9.8 Symmetry-group applications

Consume NoncompactQuantumSymmetry M0–M6 at the named targets with their hypotheses: M0's Gårding vectors and Casimir closures; M1's imprimitivity, Borel multipliers and selectors; M2's regular Mackey classification; M3's Euclidean and Galilei models; M4's Poincaré orbit types and `M4.SpatialLocalization`; M5's de Sitter classification, `M5.AffineG5` and contractions; M6's tensor decompositions. For each admitted model construct the compatible observable representation and state family, transport the covariant PVM to outcome probabilities, identify translation, rotation and boost generators on the supplied common domains, and prove that the supplied intertwiners preserve outcome laws; for the localization PVM of a positive-energy Poincaré model prove `Pr_α(E) = φ_α(P(E))` for states normal on the abelian algebra generated by the PVM and transport every real Borel function of the localization outcome to a §1.1 observable; keep this distinct from M4's full-spacetime obstruction, and from any field-locality statement. For the Galilei comparison with the affine group of `M5.AffineG5` under `η = diag(1,1,1,−1)`, use the real cochain `f(a,b) = η(a,b)/2` to pass from the symmetric central cocycle to `c_f(g₂,g₁) = −η(Λ₂a₁,b₂) − σ₁η(b₂,b₂)/2`, which on the spatial Galilei subgroup is `−v₂·R₂a₁ − σ₁|v₂|²/2`; compare the phase `exp(iκc_f)` with M3's mass dictionary; and with `(a,b) = (q,p)` prove that M5's alternating form `q₂p₁ − q₁p₂` is `−B` for §6.6's `B((q,p),(q′,p′)) = pq′ − qp′`, so the phase parameter changes sign under that identification. For a product group `G₁×ℝ` the ℝ factor contributes the trivial class `H²_lc(ℝ,𝕋) = 0`; for `G×SU(3)` with compact SU(3) consume NoncompactQuantumSymmetry M2's Borel-cochain product adapter and state the multiplier-factorization condition.

- Outcome laws and generators of the NQS particle models as quantum models.
- The localization event law and its transport to §1.1 observables.
- The cocycle and symplectic-sign dictionaries between M3, M5.AffineG5 and §6.6.

*Needs:* §1.1, §6.6, §7.2; NoncompactQuantumSymmetry M0–M6, P.3, P.4; VonNeumannAlgebras V4.

**Checks.**

- The sign dictionary: `ω((q₂,p₂),(q₁,p₁)) = q₂p₁ − q₁p₂` and `B((q₂,p₂),(q₁,p₁)) = p₂q₁ − q₂p₁`, so `ω = −B` on these arguments; a Weyl family satisfying `W(x)W(y) = exp(−iB(x,y)/2)W(x+y)` satisfies `exp(+iω(x,y)/2)` in M5's form.
- With `Λ₂ = R₂`, `a₁` a translation and `b₂ = v₂` a boost, `η(R₂a₁,v₂) = v₂·R₂a₁` under `diag(1,1,1,−1)` restricted to spatial vectors, and `η(v₂,v₂) = |v₂|²`, giving `c_f(g₂,g₁) = −v₂·R₂a₁ − σ₁|v₂|²/2`, which is `−τ(g₂,g₁)` for the Galilei mass cocycle `τ(g₁,g₂) = v₁·R₁a₂ + (t₂/2)|v₁|²` of NoncompactQuantumSymmetry M3 (P.4's Check) with `σ₁ = t₁`: the two agree up to the order of the group elements and a global sign, and P.4's Check identifies the opposite sign of the extension law as the mass `−m` sector.
- Normality on the abelian PVM algebra: for a vector state the law `E ↦ ‖P(E)ψ‖²` is countably additive by strong additivity of the PVM; a state that is a weak-star limit of vector states along an ultrafilter is not normal and its event law can fail countable additivity.

### 9.9 A family of regular CCR representations

Let `S` be a separable infinite-dimensional complex Hilbert space with `σ(f,g) = Im⟨f,g⟩` and a conjugation `C`. Define `S_tx = cosh(t)x + sinh(t)Cx`, `t ∈ ℝ`; prove each `S_t` is bounded, real-linear, symplectic, with complex-linear part `cosh(t)·1` and antilinear part `sinh(t)C`, that `t ↦ S_t` is a one-parameter group, and that for `t ≠ s` the relative map `S_(t−s)` has antilinear part `sinh(t−s)C`, which is not Hilbert–Schmidt (its column energy `Σ‖sinh(t−s)Ce_i‖²` on a Hilbert basis is infinite). Precompose the regular irreducible Fock representation with the Weyl automorphisms `α_(S_t)` of D8 and prove that regularity and irreducibility persist. The pairwise inequivalence of these representations is RelativisticQuantumFieldTheory's Shale theorem applied to this family; it is not stated here.

- `S_t` is a one-parameter group of bounded symplectic maps with non-Hilbert–Schmidt antilinear part for `t ≠ 0`.
- The precomposed representations are regular and irreducible.

*Needs:* §6.4, §6.6; OperatorAlgebraDynamics D8; Mathlib `LinearIsometryEquiv` (conjugations), Hilbert bases.

**Checks.**

- Symplecticity: `Im⟨S_tx,S_ty⟩ = Im(cosh²⟨x,y⟩ + sinh²⟨Cx,Cy⟩ + cosh sinh(⟨x,Cy⟩+⟨Cx,y⟩)) = (cosh²−sinh²)Im⟨x,y⟩ = Im⟨x,y⟩`, using `Im⟨Cx,Cy⟩ = −Im⟨x,y⟩` and the reality of `⟨x,Cy⟩+⟨Cx,y⟩`.
- Group law: `S_tS_s = (cosh t cosh s + sinh t sinh s) + (cosh t sinh s + sinh t cosh s)C = cosh(t+s) + sinh(t+s)C`, using `C² = 1`.
- In finite dimension `d` the antilinear part has column energy `d·sinh²(t)`, finite, so the family is implementable there; the obstruction is infinite-dimensional.

### Examples

The hydrogen atom of §9.5 with `α < 0` has its bound states labelled by `(n,ℓ,m)`, `0 ≤ ℓ < n`, `|m| ≤ ℓ`; its continuum states are the Coulomb waves `F_ℓ(μα/k,kr)Y_(ℓm)`; the rotation flow of §8.1 commutes with `H_rel`, and the dilation group gives the virial identity excluding nonnegative eigenvalues.

### Dependencies

§8.3 → §9.1; §6.7 → §9.2; §8.1 → §9.3; §9.4 → §9.5; §9.3 → §9.5; §6.1 → §9.6; §8.2 → §9.7; §6.6, §7.2 → §9.8; §6.6 → §9.9. Layer 9 consumes Layers 6–8, NoncompactQuantumSymmetry M0–M6, RiemannianGeometry R7.8 and R8, SpinGeometry G1.3, LaguerreJacobi, RandomMatrices §3.1, UnboundedOperators Layers 2, 4–6 and the Tau Ceti Hermite modules.

## Downstream consumers

- RelativisticQuantumFieldTheory consumes §8.2 (RQFT0's position-space comparison), §6.3–§6.4 (the second-quantization and domain interface on D8's carriers, at RQFT2, RQFT3 and RQFT10), §9.4 (the Kummer and Tricomi interface and the terminating identity, at RQFT9), §9.5 (the nonrelativistic Coulomb comparison, at RQFT9) and §9.9 (the family whose inequivalence RQFT10 proves). Its field constructions, axioms, spin–statistics and photon models are its own; nothing of this roadmap depends on them.
- Any roadmap modelling a concrete quantum system consumes Layers 1–4 for outcome laws, instruments and dynamics, Layer 5 for W*-models, and Layers 6–9 for the standard carriers.

## References

- E. M. Alfsen and F. W. Shultz, "On orientation and dynamics in operator algebras. Part I", *Communications in Mathematical Physics* 194 (1998), 87–108; and "Orientation in operator algebras", *Proceedings of the National Academy of Sciences* 95 (1998), 6596–6601, Theorem 1 and Corollary 2.
- E. M. Alfsen and F. W. Shultz, "State spaces of Jordan algebras", *Acta Mathematica* 140 (1978), 155–190, §2, pp. 158–159.
- E. M. Alfsen, F. W. Shultz and E. Størmer, "A Gelfand–Neumark theorem for Jordan algebras", *Advances in Mathematics* 28 (1978), 11–56, Propositions 2.1–2.7 and Corollary 2.10.
- E. Artin, *Geometric Algebra*, Interscience (1957), Chapter II, Theorem 2.26.
- A. Connes, "Caractérisation des espaces vectoriels ordonnés sous-jacents aux algèbres de von Neumann", *Annales de l'Institut Fourier* 24 (1974), 121–155, Théorèmes 1.3, 5.2, 5.8.
- E. B. Davies and J. T. Lewis, "An operational approach to quantum probability", *Communications in Mathematical Physics* 17 (1970), 239–260; E. B. Davies, *Quantum Theory of Open Systems*, Academic Press (1976), Chapter 4.
- NIST Digital Library of Mathematical Functions, Chapter 13 (§§13.2, 13.3, 13.6, 13.7) and Chapter 33 (§§33.2, 33.10, 33.11), cited by equation number.
- G. P. Gehér, "Symmetries of projective spaces and spheres", *International Mathematics Research Notices* (2020), arXiv:1606.03584, §1 and Theorem 3.
- S. P. Gudder and S. Boyce, "A comparison of the Mackey and Segal models for quantum mechanics", *International Journal of Theoretical Physics* 3 (1970), 7–21, §2, §6, Theorems 6.1, 6.4, Corollaries 6.2–6.3.
- M. Hairer, *An Introduction to Stochastic PDEs*, arXiv:0907.4178, Proposition 4.17.
- B. Iochum and G. Loupias, "Banach-power-associative algebras and J-B algebras", *Annales de l'I.H.P. Physique théorique* 43 (1985), 211–225, Propositions I.4–I.5, Theorem V.1, Corollary V.3.
- B. Iochum and F. W. Shultz, "Normal state spaces of Jordan and von Neumann algebras", *Journal of Functional Analysis* 50 (1983), 317–328, Definition 1.2, Theorem 1.5, Proposition 1.8, Theorems 2.9–2.10.
- S. Janson, *Gaussian Hilbert Spaces*, Cambridge University Press (1997), Chapters 2 and 4.
- S. Kakutani and G. W. Mackey, "Two characterizations of real Hilbert space", *Annals of Mathematics* 45 (1944), 50–58, Theorems 1–2.
- A. Łuczak and H. Podsędkowska, "Lüders instruments, generalised Lüders theorem, and some aspects of sufficiency", *International Journal of Theoretical Physics* 54 (2015), Theorem V.7.
- G. W. Mackey, *The Mathematical Foundations of Quantum Mechanics*, Benjamin (1963).
- M. Ozawa, "Quantum measuring processes of continuous observables", *Journal of Mathematical Physics* 25 (1984), 79–87, Theorem 6.6.
- M. Pankov, *Wigner-Type Theorems for Hilbert Grassmannians*, London Mathematical Society Lecture Note Series 460, Cambridge University Press (2020), §3.3, Theorem 3.16.
- V. Paulsen, *Completely Bounded Maps and Operator Algebras*, Cambridge University Press (2002), Theorem 4.6.
- S. Pulmannová, "A remark on the comparison of Mackey and Segal models", *Mathematica Slovaca* 28 (1978), 297–304, §2, Definition and Theorems 1–5.
- I. E. Segal, "Postulates for general quantum mechanics", *Annals of Mathematics* 48 (1947), 930–948, Postulates I–IV.
- G. Teschl, *Mathematical Methods in Quantum Mechanics, with Applications to Schrödinger Operators*, Graduate Studies in Mathematics 99, American Mathematical Society (2009), author's online version; the theorem numbers cited (5.1, 5.2, 7.8, 8.1, 8.2, 8.4, 8.5, 10.2, 10.3, 10.7, 10.8, 10.9, Lemma 7.9, equation (10.6)) are those of this first edition.
- U. Uhlhorn, "Representation of symmetry transformations in quantum mechanics", *Arkiv för Fysik* 23 (1963), 307–340.
- M. Reed and B. Simon, *Methods of Modern Mathematical Physics I–II*, Academic Press (1980, 1975), Chapter VIII and §X.7, for Fock-space background.
