# Roadmap: automorphy lifting beyond the Taylor–Wiles method

**Summary.** Build the conditional integral automorphy-lifting argument for GLₙ over an arbitrary number field, using the cohomology of Res PGLₙ in a range of defect ℓ₀, the local character deformation at trivial residual places, and two simultaneous Taylor–Wiles patching data. The arithmetic conclusions are the near faithfulness of the lowest-degree cohomology dual over the minimal deformation ring, and integral R = T with freeness when the local conditions are smooth. The construction gives the strengthened hypotheses and the support-to-eigenclass deduction used in conditional automorphy lifting. Conjecture B remains an explicit hypothesis. The roadmap is this README. None of its headline theorems is statable on the pinned Mathlib and Tau Ceti carriers, so `Suggested.lean` states none of them and its docstring names the carrier each one lacks.

## Scope and ownership

PotentialAutomorphyInfrastructure Layers 3–5 carry out the unconditional automorphy lifting argument for GLₙ over CM fields; the present construction retains arbitrary number fields and an explicit Hecke–Galois hypothesis. It owns the simultaneous character and unipotent arithmetic data, their local-ring comparison, the numerical coincidence, the rank-two level comparison at arbitrary number-field components, the finite data attached to these quotients, and the application of patching to their support.

Generic arithmetic quotients, local systems, Betti and boundary complexes, Hecke correspondences and duality are stated by ArithmeticLocallySymmetricSpaces ALS.0–ALS.6. Only their Res PGLₙ instantiations occur here. IntegralHeckeAndGaloisDeterminants §§2.1–2.3 and 3a.1–3b.2 owns image Hecke algebras, factorial localization and the Galois-type predicate; the variant here takes one simultaneous image on every intermediate cover and every finite coefficient quotient. LocalGaloisDeformationRings §§1.6, 1.13, 2.8, 2.15–2.16 and 2.21 owns the local deformation conditions and component calculations. GlobalGaloisDeformations §§3.3–3.7 and 7.2–7.4 owns representability, framing and global presentations. Their representing objects are specialized here.

DeformationAndDerivedPatchingAlgebra §§6.1–6.8, 7.3, 8.6 and 9.1–9.2 owns near faithfulness, minimal representatives, generic patching, codimension concentration and support descent; Layer 5 applies them to the particular finite data of Layer 4. ReductiveGroupsPartII RG2.2.4 owns the local tree and amalgam, and FreeGroupsAndLimitGroups §§4.5 and 4.8 own the structure theorem presenting a group acting on a tree as the fundamental group of its quotient graph of groups. ModularCurvesPartII §15.4 states the Lyndon sequence only for its principal-level amalgam over ℚ; the sequence of §3.4 is a kept variant for the number-field amalgam of §3.2, and the global component and operator comparison below differs by allowing all number fields and the actual character coefficients. SmoothRepresentationsOfLocalGroups SR.5.3 owns the distinct-root local block and its derived comparison. KTheoryLowDegrees §11.6 owns factorization of arithmetic-lattice characters through congruence quotients; the Hecke-localized cohomology consequence uses the supplier contract below.

ModularityAndLanglandsExtensions §2.7 states a GLₙ form of Conjecture B and its §2.8 the conditional weight-zero lifting endpoint. Layer 2 states the Res PGLₙ package of CG18 §9 independently, as a kept variant that adds all intermediate covers and the inertia–diamond clause; §5.8 is a kept variant of that §2.8 under this package, with balanced oddness and the split ramification set. Its §2.8 names the CG18 §9.5 patching verification and Theorem 9.19 in the proof route of that endpoint and keeps those arithmetic verifications for its own §2.7 hypothesis, without stating separate targets for them; they remain there. The finite patching data, their verification and the near-faithfulness theorem stated here (§§4.1–4.4 and 5.1–5.4) are for the Res PGLₙ package of Layer 2, whose Hecke algebras are the simultaneous images over all intermediate covers and finite coefficients of §0.3 and whose clause (6) that proof route does not assume; they are owned here. Apart from the variant §5.8, nothing of §2.8 is restated. The minimal-level residual condition is used in the precise cohomological sense of §0.6. The CM-only cuspidal-range theorem of ArithmeticLocallySymmetricSpaces ALS.5b.8 does not cover the arbitrary-number-field, big-image recognition in §5.6. AutomorphicSpectralTheory §§4.14a and 5.12–5.14 supplies the spectral objects used there.

ClassFieldTheory Layers 7 and 11 supplies reciprocity, including the rank-one example; Chebotarev Layer 10 supplies Frobenius density. The rank-one example is an application of those results, not another class field theory target. GL2ModularityLifting Layers 4–5 own unconditional modularity lifting for GL₂ over totally real fields, including the Fontaine–Laffaille-range theorem with Ihara avoidance that §5.10 recovers conditionally. The defect-one GL₂ part of CG18 (balanced modules, weight-one forms and their complements, and the Conjecture A treatment of imaginary quadratic fields, §§2–5) is outside this roadmap: Hecke operators on torsion coherent cohomology of modular curves in its fine-curve setting are AlgebraicModularFormsAndSerreWeights §2.12, the CG18 Theorem 4.8 finiteness application is PotentialModularityAndCompatibleSystems §8.8, and the integral coherent-cohomology complexes of CG18 §7.2 are AutomorphicBundlesPartII §1.4 and Layer 2. §5.9 recovers the imaginary-quadratic GL₂ statement only as a specialization of Layers 4–5 under Conjecture B.

## Conventions

Fix a number field F of signature (r₁,r₂), n ≥ 2, a rational prime p > n unramified in F, and the ring of integers O of a finite extension E/ℚₚ, with maximal ideal (ϖ), finite residue field k and enough unramified coefficients to contain the embeddings of F. All rings in the deformation category are complete Noetherian local O-algebras with a specified residue identification with k; all maps are continuous local O-maps. Enlarge O finitely to split the required character values and geometric components. Algebraic closures and coefficient embeddings are chosen in one universe; the constructions are invariant under their isomorphisms. Write K for an adelic level, reserving E for the coefficient field.

Let G = `Res_{F/Q}PGL_n` and Y(K) = G(ℚ)∖G(𝔸)/(K∞⁰K). Use the connected maximal compact at infinity: components and their arithmetic groups are those of the connected variant of ArithmeticLocallySymmetricSpaces ALS.0.4 in the decomposition ALS.0.7, so a component group consists of elements of G(ℚ) preserving a fixed connected component of G(ℝ)/K∞⁰ (for n = 2, determinant positive at every real place of F). Cohomology at non-neat level means arithmetic-groupoid cohomology, never cohomology of the underlying coarse quotient. In particular p > n does not by itself make stabilizers invertible. Perfectness and duality at these levels are the localized supplier requirements below; the construction retains p = 3 when n = 2. Put ℓ₀ = r₁⌊(n−1)/2⌋ + r₂(n−1), d = r₁(n(n+1)/2−1)+r₂(n²−1), and 2q₀+ℓ₀=d. These are the PGL invariants; GL₁ uses its own unit-rank defect. All generator counts are integers first; their nonnegativity is proved before they index power-series variables.

Frobenius is arithmetic and ε(Frob_v)=N(v); the native Hodge–Tate convention gives ε weight +1. Fix `xi=epsilon^{n(n-1)/2}`. The standard normalized Satake roots sᵢ have Galois roots `N(v)^{(n-1)/2}s_i`. Thus det(1−r(Frob_v)T)=∏ᵢ(`1-N(v)^{(n-1)/2}s_i T`), and the partial L-functions satisfy L^S(r,s)=L^S(π,s−(n−1)/2). This equality concerns only the stated unramified Euler factors. The normalized and unnormalized operators are distinguished in §3.3.

Let R = R_triv ⊔ R_reg be disjoint from Sₚ. At R_triv the entire residual local representation is trivial and N(v)≡1 modulo p; at R_reg its tame inertia has one unipotent Jordan block, with no norm congruence imposed. Set S=T=Sₚ∪R; T denotes the nonempty framing set. Q is disjoint from S. On homology use O(χ⁻¹), the adjoint Hecke ideal m*, and the adjoint of the selected-root projector. A projector acting on the dual of cohomology is always transported by that adjoint, not reinterpreted using the same eigenvalue without conversion. The quotient by K∞⁰ retains the orientation cover, so its components are orientable; a presentation using the full K∞ must instead carry the supplied orientation character.

**Checks.**

- For F=ℚ, n=2, (d,q₀,ℓ₀)=(2,1,0); for an imaginary quadratic F they are (3,1,1). For a real quadratic F they are (4,2,0), rather than (4,1,0).
- In rank two at a prime of norm 7 with Hecke trace 3 the polynomial is X²−3X+7. Geometric Frobenius would have trace 3/7 and determinant 1/7. Normalized Satake product 1 gives arithmetic determinant 7 and the shift s−1/2.
- For diag(−1,1), positive and negative eigenspace dimensions are (1,1). For the identity in characteristic 3 they are (2,0), although its trace 2 equals −1: balanced oddness excludes it.
- A two-term homological complex in degrees 1 and 2 becomes cohomological in degrees 1 and 0 respectively. Reflection makes its top term the dual of H¹, not H².
- With χ(g)=ζₚ the dual coefficient action is ζₚ⁻¹, and their product in the evaluation pairing is 1. Using χ on both sides gives ζₚ², which is not 1 for odd p.

## Exact supplier contracts

### From Mathlib

Use `Field.absoluteGaloisGroup` in `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` for automorphisms of the algebraic closure, with its profinite topology. Use `Representation` in `Mathlib/RepresentationTheory/Basic.lean` for linear representations; its algebraic definition does not impose continuity. Continuity, the topology and the local conditions must be carried separately. Use native matrix characteristic polynomials, group algebras, ideals, modules, homological complexes and derived categories. For abstract double cosets use `IsHeckeTriple`, `HeckeCoset` and `HeckeRing` in `Mathlib/NumberTheory/HeckeRing/Defs.lean`; the latter is a finitely supported double-coset coefficient carrier, whose algebra structure requires the separate convolution instances. `Module.support_eq_zeroLocus` in `Mathlib/RingTheory/Support.lean` is used with finite-generation hypotheses for support and annihilators, rather than defining another support object. Use `Monoid.PushoutI` in `Mathlib/GroupTheory/PushoutI.lean` for amalgamated products of groups, and Shapiro's isomorphism `groupCohomology.coindIso` in `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean`, which identifies Hⁿ(G, Coind_S^G A) with Hⁿ(S, A) for a subgroup S ≤ G and an S-representation A over a commutative ring; it carries no finiteness or index hypothesis.

### From Tau Ceti

Use `TauCeti.MonoidAlgebra.augmentation` in `TauCeti/Algebra/MonoidAlgebra/Exactness.lean` for O[Δ]→O, sending each group element to 1. Generic group rings and Hecke double cosets retain their native carriers. Arithmetic automorphic quotients, Fontaine–Laffaille deformation conditions and the required universal arithmetic rings are roadmap suppliers, not assumed library declarations.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

Consume ALS.0.7–ALS.0.10 for components and standard levels, with ALS.0.7 taken for the connected variant of ALS.0.4 (its component groups G(F)⁺ ∩ gKg⁻¹, G(F)⁺ the stabilizer of a component of G(F_∞)/K∞⁰, rather than the full-maximal-compact groups G(F) ∩ gKg⁻¹); ALS.1.1–ALS.1.8 for local systems, arithmetic-group cohomology, finite models, coefficient change and pullback; ALS.2.2–ALS.2.4 for Borel–Serre compactification and finiteness; ALS.3.3–ALS.3.9 for derived correspondences and trace, and ALS.3.14 for the two degeneracy maps and their Gram matrix. Consume ALS.4.1 and ALS.4.9–ALS.4.12 for the boundary triangle and localization, ALS.5a.2–ALS.5a.6 for duality with its orientation and stabilizer hypotheses, ALS.5b.4–ALS.5b.6 for characteristic-zero and cuspidal comparison, and ALS.6.1–ALS.6.3 for finite-cover descent. At p-torsion stabilizers the unlocalized finite free model of ALS.1.6 is not applicable.

What ArithmeticLocallySymmetricSpaces must provide (gap:localized-orbifold-range-duality): For Res PGLₙ arithmetic groupoid quotients Y(K), including levels with p-torsion stabilizers, and a non-Eisenstein maximal ideal m of Galois type with big residual image, prove H^i(Y(K), O/ϖᵃ)_m = 0 for i outside 0 ≤ i ≤ dim Y and every a ≥ 1, and finite-level Poincaré duality localized at m with the adjoint Hecke action, without assuming vanishing outside [q₀, q₀+ℓ₀].

What ArithmeticLocallySymmetricSpaces must provide (gap:localized-orbifold-perfect-models): For a Galois cover of Res PGLₙ arithmetic groupoid quotients with finite abelian p-group Δ, including levels with p-torsion stabilizers, given vanishing of the m-localized cohomology with every O/ϖᵃ coefficient outside [q₀, q₀+ℓ₀] and of the m-localized boundary cohomology on every intermediate cover, prove that the m-localized Betti complex of the top cover is a perfect O[Δ]-complex whose base change along O[Δ] → O[Δ′]/ϖᵃ computes the localized cohomology and homology of the intermediate cover with group Δ′, compatibly with coefficient change and Hecke action.

What ArithmeticLocallySymmetricSpaces must provide (gap:congruence-character-localized-h1): Using the character-factorization theorem of KTheoryLowDegrees §11.6, prove H⁰(Y(K),k)_m=H¹(Y(K),k)_m=0 for PGL₃/ℚ and PGL₂ over CM quartic fields at every level, for p>n unramified in F and a non-Eisenstein ideal of Galois type, retaining compatibility with the dual ideal and Hecke action.

### From TauCetiRoadmap.DerivedModuleAlgebra

Consume §1.E.0 for perfect module complexes and their closure under retracts, shifts and derived scalar change; §4.1 uses it for the summand cut out by a factorial idempotent.

### From TauCetiRoadmap.CompletedCohomologyPartII

Consume §§0.1–0.3 and 1.1 for coherent level systems and the fixed-exponent smooth colimit, and §6.2 for continuous fixed-exponent descent in its p-level setting. The tame-place version required in §§3.6–3.7 is the following contract; ALS.6.2 remains its finite-cover input. Its §3.8 forms colimits at varying tame level only at neat levels and identifies level invariants only for compact opens of pro-order invertible in O; at a place x with N(x) ≡ 1 mod p the order of PGLₙ(k_x) is divisible by N(x)² − 1, hence by p, so a hyperspecial subgroup at x has pro-order divisible by p and derived continuous invariants replace invariants.

What CompletedCohomologyPartII must provide (gap:tame-place-fixed-exponent-descent): Extend fixed-exponent descent of §6.2 to x∤p for GLₙ and PGLₙ arithmetic groupoid level systems with fixed level and local system away from x: for each b≥1 construct the discrete smooth pullback colimit Mʲ_b=colim_t Hʲ(Z(xᵗ),O(ψ)⊗O/ϖᵇ), using principal x-levels cofinal inside each hyperspecial or line-parahoric U, and convergent first-quadrant spectral sequences Hⁱ_cts(U,Mʲ_b)⇒Hⁱ⁺ʲ(Z(U),O(ψ)⊗O/ϖᵇ), natural for the hyperspecial-to-parahoric comparison, coefficient maps, away-from-x Hecke operators and localization; prove the required regular-cover or groupoid descent comparisons retaining all arithmetic stabilizers rather than assuming faithful deck quotients.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

Consume §§2.1–2.3 for finite Hecke action images, operator localization by factorial powers (§2.3; its telescope comparison needs actual nilpotence on the complement and is not applied to topologically nilpotent operators on integral complexes), and (§2.2, finite local factors and specified idempotent summands) the decomposition of a finite commutative algebra over a complete Noetherian local ring into its complete local factors, with the corresponding summands of every module it acts on; §3a.1 for the unnormalized polynomial `sum_i (-1)^iN(v)^{i(i-1)/2}T_{v,i}X^{n-i}`; §§3b.1–3b.2 for Galois-type and dual residual ideals; §§1.2–1.3 for semisimple reconstruction and absolutely irreducible lifting. A relation valid on the full cover alone is not assumed to hold on intermediate covers; the simultaneous image of §0.3 includes them in its definition.

What IntegralHeckeAndGaloisDeterminants must provide (gap:simultaneous-orbifold-hecke-finiteness): Prove finite O-generation of the commutative image of the specified unnormalized operators on every degree and every O/ϖᵃ coefficient of the finite family of intermediate arithmetic groupoid levels, including stabilizer cohomology, and prove that this image acts compatibly on cohomology with every finite O-module coefficient.

### From TauCetiRoadmap.LocalGaloisDeformationRings

Consume §§F.1–F.3 for strict deformation and local-problem carriers, §§1.6 and 1.13 for the Fontaine–Laffaille condition and its smooth dimension, applied to the dual lift (§1.6 realizes a labelled jump i with Hodge–Tate weight −i, so the positive-weight problem of §1.2 is the image of the §1.6 problem under r ↦ r^∨), §1.10 for fixed determinant, §§2.8 and 2.21 for minimal regular-unipotent ramification, §2.15 for literal character-polynomial quotients and their components, and §2.16 for the fixed-determinant two-scalar Taylor–Wiles condition and tangent contribution 1 when residual Frobenius is semisimple; §2.23 instead requires an unramified complementary block and is not this condition. In §2.15 the generic component statements concern characteristic-zero minimal primes; they do not imply coefficient flatness of the literal quotient. Determinant fixing uses p∤n and the unramified n-th-root twist.

What LocalGaloisDeformationRings must provide (gap:nonsemisimple-two-scalar-taylor-wiles): For ℓ≠p, p>n≥2, residue norm q≡1 modulo p, an arbitrary unramified rank-n residual representation with a specified simple generalized Frobenius eigenline and its complementary generalized eigenspaces, and an unramified determinant ξ lifting the residual determinant, extend the two-scalar condition of §2.16 without semisimplicity: construct its framed representing quotient and coefficient-natural block projectors, scalar inertia characters θ on the line and η on the complement with θηⁿ⁻¹=1 and θ^(q−1)=η^(q−1)=1, prove dim L−h⁰(ad⁰r̄)=1, and identify augmentation of its inertia group-algebra map with the fixed-determinant unramified local problem.

### From TauCetiRoadmap.GlobalGaloisDeformations

Consume §§3.3–3.7 for global data, representability, the local-to-global map and relative tangent presentation; §§4.3–4.4 for enlarging ramification and twisting; §5.5 for inertia and augmentation; §5.6 for Chebotarev selection with a padding class; §§7.2–7.4 for framing and fixed-versus-variable determinant. Fixed-determinant local rings and the trace reconstruction come from LocalGaloisDeformationRings §§F.2.7–F.2.9.

What GlobalGaloisDeformations must provide (gap:big-image-rank-n-taylor-wiles): For the standing rank-n datum with big cyclotomic residual image and ζₚ outside the adjoint fixed field, every q at least the relative dual-Selmer dimension and every N≥1 admit exactly q auxiliary places outside any fixed finite avoidance set with norms 1 modulo pᴺ, a chosen simple Frobenius line, and zero new relative dual Selmer group.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Consume §§7.2 and 7.4 for adjoints, trace pairing and balanced real involutions, and §§7.7–7.12 for image conditions without identifying big, adequate and enormous. The big-image predicate used here is the simple-eigenvalue detector condition, not the rank-two SL₂ containment condition.

What ArithmeticGaloisRepresentations must provide (gap:cht-big-image): Define the big-subgroup condition for finite H⊂GLₙ(k) by absence of p-power quotients, vanishing H⁰(H,ad⁰)=H¹(H,ad⁰)=0 and the nonzero simple-eigenprojector trace detector on every irreducible submodule of End(kⁿ), and prove coefficient-extension invariance and existence of a simple eigenvalue.

### From TauCetiRoadmap.ArithmeticGaloisDuality

Consume R02.5.1 for Greenberg–Wiles with exact annihilator local conditions, R02.5.2 for the rank-one difference −(r₁+r₂−1), and R02.6.1–R02.6.2 for archimedean and auxiliary-prime counts. At T the tangent condition is zero and the dual is unrestricted; at Q use the specified block tangent condition and its exact annihilator. All dimensions are over k.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

Consume §1.12 for the complete-local tensor coproduct, §4.6 and §§6.7–6.8 for components, §3.10 for finite abelian group-ring quotients, §7.3 for minimal finite free representatives, and §7.6 for signed coefficient duality. Consume §§6.1–6.5 for near faithfulness, support, quotient and augmentation descent; §§3.1–3.4 for depth and regular-source freeness. The finite data use the cohomology-action theorem of §8.6, with every finite framing-quotient action and reduction diagram, and §§9.1–9.2 for codimension concentration. Cohomology actions alone are not promoted to strict derived actions.

What DeformationAndDerivedPatchingAlgebra must provide (gap:character-ring-completed-products): For the literal local character-polynomial quotients of LocalGaloisDeformationRings §2.15 and the smooth factors used here, prove the completed-product equidimensionality and characteristic-zero-minimal-prime dimension formula and preservation of a unique generic component under each special component after geometric splitting of components.

What DeformationAndDerivedPatchingAlgebra must provide (gap:paired-cohomology-action-patching): Extend §8.6 to two finite-cutoff cohomology-action data with identified residual rings and top cohomology at every coefficient and framing quotient, all action and augmentation diagrams commuting, to obtain simultaneously patched top modules whose reductions modulo ϖ are linear over the common residual deformation and scalar actions and agree after augmentation.

### From TauCetiRoadmap.ReductiveGroupsPartII

Consume RG2.2.4, “Ihara's theorem: SL₂ as an amalgam”, on adjacent lattice vertices and its PSL₂ quotient; the second vertex is represented by diag(1,ϖ). The diagonal element diag(ϖ,ϖ⁻¹) translates distance two and is used for the squared operator, not for the edge gluing.

### From TauCetiRoadmap.FreeGroupsAndLimitGroups

Consume §4.8, the structure theorem: a group acting on a tree without inversion is the fundamental group of the quotient graph of groups formed by vertex and edge stabilizers; and §4.5, which identifies the fundamental group of a one-edge (segment) graph of groups with Mathlib's `Monoid.PushoutI` of its two vertex groups over the edge group. With the one-edge quotient of §3.2 these present the S-arithmetic group as an amalgam.

### From TauCetiRoadmap.ModularCurvesPartII

Consume §15.4, the correctly graded Lyndon sequence for the principal-level amalgam `Gamma_N(Z[1/p])` (N ≥ 3) of its §15.2 over ℚ, only for that case of §3.4 (F = ℚ and Γ¹ the principal congruence subgroup of level N ≥ 3); the number-field amalgam of §3.2 lies outside its statement, and §3.4 derives that sequence from the tree and Shapiro's isomorphism. The rank-two modular-curve root theorem of §15.8 is a specialization, not the arbitrary-number-field theorem here.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume SR.5.3, “The distinct-eigenvalue local block” and “Derived hyperspecial–parahoric comparison”: over O/ϖᵃ, residue norm 1 modulo p and distinct residual unramified characters, every simple subquotient lies in the specified principal-series block, and projected parahoric derived invariants agree with hyperspecial derived invariants. The invariants are those of GLₙ; their PGLₙ comparison is the target of §3.7.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Consume Layers 4–6 for automorphic forms and unnormalized Hecke conventions, the split-centre convention, the PGLₙ degree invariants, purity and the tempered cohomological range. In characteristic zero the infinity type and the nonzero finite-level invariants are retained when passing from an automorphic representation to its degree-q₀ eigenclass.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Consume §4.14a for number-field residual blocks Speh(σ,b), with ordered exponents (b−1)/2−j, and §§5.12–5.14 for the cuspidal-support decomposition, isobaric realization and its weights. The residual classification includes all number fields; it is not restricted to unramified function-field forms.

What AutomorphicSpectralTheory must provide (gap:proper-support-boundary-or-residual): For Res PGLₙ over a number field with algebraic complex coefficients, prove that an ordinary-cohomology Hecke eigensystem in proper cuspidal support either occurs on Borel–Serre boundary cohomology or is the eigensystem of a residual discrete automorphic representation, with the same central and unramified Hecke conventions.

### From TauCetiRoadmap.KTheoryLowDegrees

Consume §11.6 for prime-to-p finite congruence-kernel factorization of additive k-valued characters, including one common congruence neighborhood for a finite-dimensional character space; do not assume the stronger strict congruence subgroup property. The geometric H¹ vanishing is the ArithmeticLocallySymmetricSpaces contract above.

### From TauCetiRoadmap.PadicHodgeTheory

Consume §6.1 for the rational Fontaine–Laffaille sign dictionary and the integral comparison it imports. For an unramified local field and p>n, the contravariant convention with jumps 0,…,n−1 produces crystalline lattices with the native positive weights; it is not applied beyond [0,p−2]. The contravariant realization is the dual of the covariant realization of LocalGaloisDeformationRings §1.6, which is how §1.2 transports that supplier's problem to positive weights.

### From TauCetiRoadmap.AdelicAlgebraicGroups

Consume §4.2 for strong approximation for SL₂ with a noncompact local factor, and §5.1 for the GL₁ components and unit-rank dimension. These identify the actual arithmetic component stabilizers and the one-edge quotient in §3.2.

### From TauCetiRoadmap.ClassFieldTheory and TauCetiRoadmap.Chebotarev

ClassFieldTheory Layer 7 fixes Art_v from F_vˣ to the abelianized local Galois group, sending a uniformizer to arithmetic Frobenius; Layer 11 supplies global Artin reciprocity and the unramified class-group quotient. Chebotarev Layer 10 realizes finite-quotient conjugacy classes outside finite avoidance sets. In the cyclotomic-kernel argument primes have norm 1 modulo p; equality of semisimple characteristic polynomials is tested on those finite quotients and then on all unramified Frobenius classes as appropriate.

## How to read the build

Layer 0 specializes the supplied local systems, correspondences and image algebras and fixes the selected-root summand. Layer 1 fixes the two arithmetic local/global problems and obtains the presentation count. Layer 2 states the Res PGLₙ Conjecture B package of CG18 §9, strengthened precisely where patching needs compatibility. Layer 3 proves the rank-two comparison and the distinct-root global comparison, keeping the PGLₙ descent as a separate target. Layer 4 constructs the actual bounded data, including all finite coefficient and framing quotients. Layer 5 applies supplied patching and support algebra, recognizes characteristic-zero eigenclasses, and identifies the resulting automorphy application. Each Needs line lists the statement and proof inputs; a different proof can replace that route without changing the stated theorem.

## Layer 0: Hecke data at Taylor–Wiles level

### 0.1 The local systems O(ψ) of Iwahori characters

Let F be a number field, G = `Res_{F/Q}PGL_n` with n ≥ 2, p > n a prime, O the ring of integers of a finite extension E/ℚ_p with uniformizer ϖ and residue field k, and R a finite set of finite places of F prime to p. For v ∈ R let Iw(v) ⊂ PGL_n(O_v) be the Iwahori subgroup (upper triangular mod ϖ_v) and Iw_1(v) its pro-residue-characteristic Iwahori subgroup, so Iw(v)/Iw_1(v) ≅ (k_v^×)^n/k_v^× (diagonal entries modulo scalars). An Iwahori character datum is ψ = `(psi_v)_{v in R}`, ψ_v = `psi_{v,1}` × ⋯ × `psi_{v,n}` : (k_v^×)^n → 1 + 𝔪_O with ∏_i `psi_{v,i}` = 1, so that ψ_v factors through Iw(v)/Iw_1(v). For a level K whose component at v ∈ R is Iw(v), O(ψ) is the rank-one local system on Y(K) = G(ℚ)\G(𝔸)/K^0_∞K whose sections over U are the locally constant f on the preimage of U in Y(K ∩ `prod_{v in R}Iw_1(v)`) with f(γu) = ψ(γ)f(u) for γ ∈ `prod_{v in R}Iw(v)/Iw_1(v)`. Write H^i_ψ(Y(K), A) := H^i(Y(K), O(ψ) ⊗_O A) and `H_{i,psi}` for homology.

n ≥ 2; v ∈ R are finite places prime to p. `psi_{v,i}` take values in 1 + 𝔪_O, so they have p-power order and are trivial unless p | N(v) − 1. The product condition ∏_i `psi_{v,i}` = 1 is what makes ψ_v a character of the PGL_n Iwahori quotient.

A proof uses the following inputs and comparisons. The quotient Iw(v)/Iw_1(v) is the torus of PGL_n over k_v; a character of (k_v^×)^n trivial on the diagonal k_v^× descends to it. O(ψ) is the arithmetic local system attached to the smooth O[K]-module O on which K acts through K → `prod_{v in R}Iw(v)/Iw_1(v)` and ψ (ArithmeticLocallySymmetricSpaces ALS.1.1). Cohomology and homology with coefficients in O(ψ) ⊗ A are computed by the Betti complexes of ArithmeticLocallySymmetricSpaces ALS.1.2, with coefficient change along O → A.

The specialized interface records the following facts.

- The local system O(ψ) on Y(K) for an Iwahori character datum ψ at R.

- O(1) ≅ O, compatibly with Hecke operators away from R.

- O(ψ) ⊗_O k ≅ k for every datum ψ with values in 1 + 𝔪_O.

- Hom_O(O(ψ), O) ≅ O(`psi^{-1}`), and Poincaré duality pairs H^*_ψ with `H_{*,psi^{-1}}`.

- Pullback along a change of level away from R preserves O(ψ).

**Checks.**

- For ψ = 1, O(ψ) is the constant local system O, so H^i_ψ(Y(K), A) = H^i(Y(K), A) for every A.

- If N(v) ≢ 1 mod p then every character (k_v^×)^n → 1 + 𝔪_O is trivial, so O(ψ) = O at v.

- A tuple (`psi_{v,1}`, …, `psi_{v,n}`) with nontrivial product does not descend to Iw(v)/Iw_1(v) ⊂ PGL_n and defines no local system on Y(K).

- Since every `chi_{v,i}` ≡ 1 mod ϖ, O(χ)/ϖ is the constant local system k, so H^i_χ(Y(K), k) = H^i(Y(K), k) for every χ with values in 1 + 𝔪_O.

- The dual local system is O(`psi^{-1}`).

- For n=2 and a character θ of order 3, the tuple (θ,θ⁻¹) evaluates to 1 on a diagonal scalar, whereas (θ,1) evaluates to θ and does not descend.

(CG18, §9.1, published pp. 411–412; CG18 line 4588; CG18, §9.5, published p. 426; CG18 line 5161.)

*Needs:* TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.1.1; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.0.10; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.1.2.

### 0.2 Hecke operators `T_{alpha,k}`, V_x and diamond operators at Taylor–Wiles level

Keep the notation of §0.1, and let Q be a finite set of finite places disjoint from S_p ∪ R with K_Q ⊃ L_Q the Taylor–Wiles levels of ALS.0.10 (hyperspecial at every place outside R ∪ Q, including those above p; Iwahori at R; at x ∈ Q the line-stabilizer K_0(x) and its normal subgroup K_1(x) with K_0(x)/K_1(x) ≅ k_x^×). For K one of K_Q, L_Q or an intermediate level L_Q ⊆ K′ ⊆ K_Q, and g ∈ G(𝔸^∞) trivial at every place of R, put K_g=K∩gKg⁻¹ and L_g=g⁻¹Kg∩K. Right translation r_g:[z,h]↦[z,hg] maps Y(K_g) to Y(L_g). Use the supplied maps p₁:Y(K_g)→Y(K) and p₂=`pi_{L_g,K}`∘r_g:Y(K_g)→Y(K), with coefficient isomorphism `c_g : p_2^*O(psi) -> p_1^*O(psi)`. Define the cohomological operator T(g)=`p_{1*} c_g p_2^*`: pull back first to Y(L_g), apply r_g^* to reach Y(K_g), identify coefficients by c_g, and trace along p₁. Here subscript * is cohomological trace and superscript * is pullback (ArithmeticLocallySymmetricSpaces ALS.3.5–ALS.3.6). For α ∈ `A_F^{infty,*}` with α_v=1 at v∈R and 1 ≤ k ≤ n, `T_{alpha,k}` := T(diag(α, …, α, 1, …, 1)) with k entries α. For a prime λ ∉ S_Q, `T_{lambda,k}` := `T_{alpha,k}` with α a uniformizer at λ and 1 elsewhere: this is the unnormalized operator, the characteristic function of K diag(`varpi_lambda^{(k)}`, `1^{(n-k)}`) K. For x ∈ Q, V_x := `T_{x,1}`, well defined up to diamond operators.

On homology with O(ψ⁻¹), the operator T_H(g) labelled by the same double coset transfers first to Y(L_g), applies (r_g⁻¹)_* with the dual coefficient transport, and pushes forward along p₁. Its relation to cohomology is `T(g)^vee = T_H(g^{-1})`: the adjoint instead transfers to Y(K_g), applies (r_g)_* and pushes forward from Y(L_g). Thus the inverse-double-coset involution ι sends m to m* and sends the selected cohomological projector to its homological adjoint (§0.5; ArithmeticLocallySymmetricSpaces ALS.5a.4).

For δ ∈ Δ̃_Q := K_Q/L_Q ≅ `prod_{x in Q}` k_x^×, write r_δ for right translation on Y_1(Q) and define the cohomological diamond ⟨δ⟩=r_δ^*. Since r_δ∘r_ε=`r_{epsilon*delta}`, pullback gives a left Δ̃_Q-action. The standard left homology action is (r_δ⁻¹)_*, while its operator adjoint to ⟨δ⟩ is (r_δ)_*. For α ∈ `prod_{x in Q}O_x^*`, `T_{alpha,1}` acts through the class of diag(α,1,…,1) in Δ̃_Q. At every intermediate level these statements use the quotient deck group K_Q/K′.

g trivial at R so that the correspondence preserves O(ψ). No normalization by powers of N(λ). Δ̃_Q is identified with ∏ k_x^× by g ≡ (a ∗; 0 B) ↦ `det(B)*a^{1-n}` (the determinant quotient of the line stabilizer, independent of the scalar representative).

A proof uses the following inputs and comparisons. The correspondences and their composition law are ArithmeticLocallySymmetricSpaces ALS.3.5 and ALS.3.8; they lift to the derived category (ALS.3.3). At λ ∉ S_Q the `T_{lambda,k}` commute and generate the spherical Hecke algebra; IntegralHeckeAndGaloisDeterminants §3a.1 fixes the polynomial convention. For α ∈ ∏ O_x^× the element diag(α,1,…,1) normalizes every intermediate level, so `T_{alpha,1}` is pullback by its right deck translation; with the identification above that class is `alpha^{1-n}`, and since p > n the `T_{alpha,1}` run over the p-part of Δ̃_Q.

The specialized interface records the following facts.

- T(g) on H^*_ψ(Y(K), A) and on the Betti complex, for g trivial at R; T_H(g) on dual-coefficient homology, with T(g)^∨=T_H(g⁻¹).

- The `T_{lambda,k}` for λ ∉ S_Q commute with each other, with V_x and with diamond operators.

- The action of Δ̃_Q on H^*_ψ(Y_1(Q), A) by deck transformations, making it an O[Δ̃_Q]-module.

- For α ∈ `prod_{x in Q}O_x^*` (1 elsewhere), `T_{alpha,1}` = ⟨`alpha^{1-n}`⟩; more generally `T_{alpha,k}` = ⟨`alpha^{k-n}`⟩, since diag(`alpha^{(k)}`, `1^{(n-k)}`) normalizes every level of 𝒦_Q and has deck class `alpha^{k-1}·alpha^{1-n}`. In particular `T_{alpha,n-1}` = ⟨α⁻¹⟩, so these operators give every diamond operator.

- `T_{lambda,n}` = 1 on PGL_n.

- Pullback along Y(K′) → Y(K″) commutes with `T_{lambda,k}` for λ ∉ S_Q.

**Checks.**

- For n = 2 at level K_∅, the eigenvalue of `T_{lambda,1}` on the class of a weight-two eigenform f is a_λ(f), not `N(lambda)^{-1}a_lambda(f)`.

- `T_{alpha,k}` with α = 1 is the identity on H^*_ψ(Y(K), A).

- For Q = ∅, Δ̃_Q is trivial and K_Q = L_Q.

- With operators rescaled by N(λ)⁻ⁱ `T_{lambda,i}` = `N(lambda)^{-i}T_{alpha,i}`, the Conjecture B polynomial would have determinant `N(lambda)^{n(n-1)/2 - n}`, contradicting det r̄_m = `epsilonbar^{n(n-1)/2}`.

- On H^*(Y(K_∅)) with n = 2, `T_{lambda,1}` is the classical T_λ and `T_{lambda,2}` the diamond-type operator ⟨λ⟩ (trivial on PGL_2).

- `T_{lambda,n}` = 1 on PGL_n since diag(ϖ,…,ϖ) is central.

- For n=3, scaling a block matrix by c multiplies `det(B)a^{1-n}` by c²c⁻²=1. The block diag(u,1,1) maps to u⁻², while omitting `a^{1-n}` gives 1 and loses its diamond action. The blocks diag(u,u,1) and diag(u,u,u) map to u·u⁻² = u⁻¹ and u²·u⁻² = 1, so `T_{u,2}` = ⟨u⁻¹⟩ and `T_{u,3}` = 1. Reading the class as det(B) alone would give 1, u and u² for k = 1, 2, 3, and reading it as the full determinant det(g) = u^k would give u, u² and u³. For u of order 5 the correct reading (u³, u⁴, 1) differs from both (1, u, u²) and (u, u², u³); for u of order 3 it coincides with the det(g) reading (u, u², u³) = (u, u², 1), so order 3 does not discriminate that one.

- On C₃={0,1,2}, let r_g(i)=i+1 and f=δ₀. The degree-one correspondence gives r_g^*f=(0,0,1); using forward pushforward instead gives (r_g)_*f=(0,1,0). The formula `p_{1*} c_g p_2^*` gives the first vector. For g=1 both vectors are (1,0,0), so the identity alone does not distinguish the directions.

- For PGL₃, p=5, q=N(λ)=2 and normalized Satake roots (2,3,1/6), the positive double cosets have T₁=2(2+3+1/6)=31/3 and T₂=2(6+1/3+1/2)=41/3. The arithmetic roots (4,6,1/3) give X³−(31/3)X²+(82/3)X−8. Inverse double cosets exchange T₁,T₂ and give X³−(41/3)X²+(62/3)X−8. In ℤ₅[X] these differ: their coefficient tuples modulo 25 are (1,23,19,17) and (1,3,4,17), although both reduce modulo 5 to (1,3,4,2). All denominators are 5-adic units. In spherical PGL₂ the double coset is self-inverse, so that test cannot detect the direction.

(CG18, §9.2, published pp. 412–413; CG18 line 4628; CG18, §9.3, Conjecture B(5), published pp. 414–415; CG18 line 4710; CG18, §9.5, published p. 425; CG18 line 5111; CGH20, §3.1, arXiv pp. 4–5 (published appendix §A.3.1); CGH20 line 178.)

*Needs:* TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.3.5–ALS.3.6; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.3.8; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.3.3; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.0.10; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.5a.4; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §3a.1; §0.1.

### 0.3 The Hecke algebras `T^an_{Q,psi}` and `T_{Q,psi}` (Definition 9.1)

With Q and ψ as above, let 𝒦_Q be the set of levels K′ with L_Q ⊆ K′ ⊆ K_Q. `T^an_{Q,psi}` is the O-subalgebra of End_O(`directSum_{K' in Kcal_Q}` `directSum_{k,a}` H^k_ψ(Y(K′), O/ϖᵃ)) generated by the `T_{alpha,k}` (1 ≤ k ≤ n) with α a unit at every place of S_Q = S_p ∪ R ∪ Q and α_v=1 at R. Allowing arbitrary units at R gives the same O-algebra after using the specified coefficient-character intertwiner, since those local operators act by O-valued scalars. `T_{Q,psi}` is the O-algebra generated by `T^an_{Q,psi}` and the V_x = `T_{x,1}`, x ∈ Q, together with the diamond operators. Write T_ψ := `T_{empty,psi}` = `T^an_{empty,psi}` and T := T_1. Let `TT^{S_Q}` be the polynomial O-algebra on symbols `T_{lambda,i}` (λ ∉ S_Q, 1 ≤ i ≤ n). It acts through the operators of §0.2 on the cohomology, with every coefficient, of the level K_∅(R) and of every K′ ∈ 𝒦_Q. Its image in `T^an_{Q,psi}` is the O-subalgebra generated by the `T_{lambda,i}`; since a unit α at the places of Q gives `T_{alpha,k}` = ⟨`alpha^{k-n}`⟩ (§0.2), `T^an_{Q,psi}` is generated over that image by the diamond operators ⟨δ⟩, δ ∈ Δ̃_Q, and the map `TT^{S_Q}` → `T^an_{Q,psi}` is surjective for Q = ∅ but not in general. A maximal ideal m of T determines m^abs, its inverse image in `TT^{S_Q}`; this is maximal, since its residue field is a subring of the finite field T/m. Localizing at m a module M on which `TT^{S_Q}` acts means forming `M_m := M ⊗ (TT^{S_Q})_{m^abs}`; for a finite `T^an_{Q,psi}`-module (resp. `T_{Q,psi}`-module) this is the direct sum of its localizations at the finitely many maximal ideals 𝔫 of `T^an_{Q,psi}` (resp. of `T_{Q,psi}`) contracting to m^abs, and it is zero when there is none. Accordingly `T^an_{Q,psi,m^abs}` := `T^an_{Q,psi}` ⊗ `(TT^{S_Q})_{m^abs}` is the product of the local factors `T^an_{Q,psi,n}` over those 𝔫, a finite semilocal O-algebra. The ideal of `T^an_{Q,psi}` generated by the image of m^abs is in general neither maximal nor the unit ideal. The ideal m^Q generated by the image of m^abs and by ⟨δ⟩ − 1 for every δ ∈ Δ̃_Q is maximal or the unit ideal, because `T^an_{Q,psi}`/m^Q is generated by the image of the field `TT^{S_Q}`/m^abs. Every maximal ideal 𝔫 above m^abs contains ⟨δ⟩ − 1 for δ of p-power order, since `(<delta> - 1)^{p^N}` = `<delta>^{p^N}` − 1 = 0 in the characteristic-p field `T^an_{Q,psi}`/𝔫 when `delta^{p^N}` = 1; 𝔫 equals m^Q exactly when the prime-to-p diamond operators are also congruent to 1 modulo 𝔫. The conjectural clauses of Layer 2 are stated at a maximal ideal of `T^an_{Q,psi}` and are imposed at m^Q (§2.5); for Q = ∅ this is the image of m^abs, maximal or the unit ideal. On the cohomology of Y_0(Q) and of every cover Y_Δ(Q) with Δ a p-group quotient of Δ̃_Q, the prime-to-p diamond operators act trivially, so each 𝔫 ≠ m^Q above m^abs has zero localization there (some ⟨δ⟩ − 1 is a unit of `T^an_{Q,psi,n}` acting by zero), and localizing at m^abs is localizing at m^Q; Layer 4 uses only these levels. For a maximal ideal 𝔫 of `T^an_{Q,psi}`, `T_{Q,psi,n}` is the product of the localizations of `T_{Q,psi}` at the maximal ideals above 𝔫. For Q = ∅ and ψ = χ, `TT^{S}` surjects onto T_χ and the extension of m^abs is the transport of §0.5(2). Prove that both are finite O-algebras, hence semilocal and the products of their completions at maximal ideals; for a maximal ideal 𝔫, `T^an_{Q,psi,n}` is finite (not necessarily flat) over O.

Hecke operators as in §0.2. The direct sum runs over every intermediate level between L_Q and K_Q; this is the form needed in CG18 §9.5. Coefficients O/ϖᵃ for all a ≥ 1, so the algebra acts on every finite coefficient cohomology group (CG18 Remark 9.2).

A proof uses the following inputs and comparisons. The finite simultaneous-image supplier contract gives a finite commutative O-algebra (IntegralHeckeAndGaloisDeterminants §2.1 and gap:simultaneous-orbifold-hecke-finiteness, with all arithmetic stabilizer contributions retained). Finite algebras over the complete local ring O decompose as the product of their localizations at maximal ideals (IntegralHeckeAndGaloisDeterminants §2.2). The restriction of the action to a single level K′ gives the image algebra of that level as a quotient of `T^an_{Q,psi}`; pullback and trace between levels are Hecke equivariant for operators prime to S_Q.

The specialized interface records the following facts.

- `T^an_{Q,psi}` as a commutative O-subalgebra of the endomorphisms of the stated direct sum.

- `T_{Q,psi}` = `T^an_{Q,psi}[V_x, <delta>]`.

- `T^an_{Q,psi}` and `T_{Q,psi}` are finite O-algebras; Module.Finite O.

- `T^an_{Q,psi}` ≅ ∏_m `T^an_{Q,psi,m}`.

- For each K′ ∈ 𝒦_Q, the surjection onto the image algebra acting on `directSum_{k,a}H^k_psi(Y(K'), O/varpi^a)`.

- The map `TT^{S_Q}` → `T^an_{Q,psi}`, surjective for Q = ∅; for a maximal ideal m of T, the maximal ideal m^abs of `TT^{S_Q}`, the ideal m^Q of `T^an_{Q,psi}` (maximal or the unit ideal), the localization `M_m` = M ⊗ `(TT^{S_Q})_{m^abs}` of a `TT^{S_Q}`-module, and the semilocal algebra `T^an_{Q,psi,m^abs}`.

- Every maximal ideal of `T_{Q,psi}` contracts to a maximal ideal of `T^an_{Q,psi}`, since `T_{Q,psi}` is finite over `T^an_{Q,psi}` (integral extension of finite O-algebras).

- For Q = ∅, `T_{empty,psi}` = `T^an_{empty,psi}`.

**Checks.**

- For F = ℚ, n = 2, R = Q = ∅ and p > 3, H^*(Y, O/ϖᵃ) is O/ϖᵃ in degree 0 (H^1(PSL_2(ℤ), O/ϖᵃ) = 0 since PSL_2(ℤ) ≅ ℤ/2 ∗ ℤ/3), `T_{lambda,1}` acts by 1 + λ, so `T^an_{empty,1}` = O and its unique maximal ideal is Eisenstein.

- For `T^an_{Q,psi}` = O[C₅] with p = 5, where `TT^{S_Q}` acts through O and a generator d of C₅ is a diamond operator, the ideal generated by the image of m^abs = (ϖ) is ϖO[C₅], whose quotient k[C₅] = k[u]/(u⁵) with u = d − 1 is not a field; m^Q = (ϖ, d − 1) is the unique maximal ideal, and the localization at m^abs retains all of O[C₅]. For `T^an_{Q,psi}` = O × O with `TT^{S_Q}` acting diagonally through O and the diamond operator d = (1, −1) of order 2, both maximal ideals (ϖ) × O and O × (ϖ) contract to (ϖ): the localization at m^abs keeps both factors, while m^Q = (ϖ) × O keeps only the factor on which d ≡ 1 (as −2 is a unit).

- `T^an_{Q,psi,m}` need not be O-flat: if H^*_ψ(Y, O)_m is ϖ-torsion, `T^an_{Q,psi,m}` is killed by a power of ϖ.

- The image algebra of Y_1(Q) alone need not act on H^*(Y_Δ(Q), O/ϖᵃ): an operator killing all H^*(Y_1(Q), O/ϖᵃ) acts on H^*(Y_Δ(Q), O/ϖᵃ) only nilpotently, through the Hochschild–Serre filtration.

- For Q = ∅ the set 𝒦_Q is {K_∅} and `T^an_{empty,psi}` is the anemic algebra of CG18 Definition 9.1.

- For the complex O --ϖ→ O, the integral degree-one cohomology is k, but coefficient O/ϖᵃ also creates degree-zero cohomology of size |k| for every a≥1; an algebra defined only on integral cohomology omits that action unless separately justified.

(CG18, §9.2, Definition 9.1 and Remark 9.2, published pp. 413–414; CG18 line 4650; CG18, §7.1, published p. 394; CG18 line 3926; CG18, §9.5, proof of Theorem 9.19, published p. 427; CG18 line 5211.)

*Needs:* §0.2; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.1.2; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §2.1 and gap:simultaneous-orbifold-hecke-finiteness; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §2.2; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.4.9.

### 0.4 The Taylor–Wiles maximal ideal m_Q and projector e_Q

Let m be a maximal ideal of `T^an_{Q,psi}` with residue field k; in the application it is the ideal m^Q of §0.3 attached to a maximal ideal of T at level K_∅(R) with residual representation r̄; for Q = ∅ and ψ = 1 it is that ideal itself, and for Q = ∅ and ψ = χ its transport of §0.5(2). For each x ∈ Q fix a factorization P_x(X) = (X − α_x)Q_x(X) in k[X] of a monic polynomial of degree n with Q_x(α_x) ≠ 0. In the application P_x is the characteristic polynomial of r̄(Frob_x) for the residual representation r̄ of a standing datum (§1.1), r̄|G_x ≅ s̄_x ⊕ ψ̄_x with ψ̄_x the full generalized eigenspace of a simple Frobenius eigenvalue, and α_x := ψ̄_x(Frob_x). The ideal m_Q of `T_{Q,psi}` generated by m and the V_x−α̃_x is maximal or the unit ideal, since `T_{Q,psi}`/m_Q is generated over the field `T^an_{Q,psi}`/m by the images of the V_x, each congruent to the scalar α_x; it is the selected maximal ideal when that factor is in the support, and otherwise its localization is zero. In the comparison theorem properness is a consequence of the nonzero base eigensystem, not of an arbitrary polynomial factorization. The Taylor–Wiles projector is e_Q := `lim_{k->infty}` `prod_{x in Q}` `QTilde_x(V_x)^{k!}`, with Q̃_x any lift of Q_x to O[X]. On every finite `T_{Q,psi}`-module M supported above m it is the idempotent projecting onto ⊕_𝔫 M_𝔫, the sum over the maximal ideals 𝔫 of `T_{Q,psi}` above m at which no V_x is congruent to a root of Q_x; when the residual eigenvalues of every V_x on M are roots of P_x, this is the localization `M_{m_Q}`.

α_x a simple root of P_x, as for the one-dimensional generalized eigenspace ψ̄_x at a Taylor–Wiles prime (§1.6). Limits are in the profinite topology of the finite O-algebra `T_{Q,psi,m}`.

A proof uses the following inputs and comparisons. By IntegralHeckeAndGaloisDeterminants §2.3, for t ∈ `T_{Q,psi,m}` the powers `t^{k!}` converge to the idempotent which is 1 on the local factors where t is a unit and 0 where t lies in the maximal ideal. Q̃_x(V_x) is a unit exactly on the local factors 𝔫 where V_x mod 𝔫 is not a root of Q_x. These include the factors where V_x ≡ α_x, since Q_x(α_x) ≠ 0, and they are exactly those factors when the residual eigenvalues of V_x are roots of P_x. For n = 2 at a Taylor–Wiles prime the m-part may a priori contain a factor with V_x ≡ ±1, which e_Q keeps; this is why Lemma 9.6 localizes at m̃ = (m, V_x − α̃_x). The product over x ∈ Q of these commuting idempotents is the idempotent of the factors described in the statement (the m_Q-factor under the eigenvalue condition); it commutes with diamond operators and with the `T^an_{Q,psi}`-action.

The specialized interface records the following facts.

- m_Q ⊂ `T_{Q,psi}` from m and the choices α_x.

- e_Q as an idempotent of `T_{Q,psi,m}`.

- e_Q² = e_Q.

- e_Q M = ⊕_𝔫 M_𝔫 over the maximal ideals 𝔫 of `T_{Q,psi}` above m at which no V_x is congruent to a root of Q_x, for every finite `T_{Q,psi}`-module M supported above m; this is `M_{m_Q}` when every residual eigenvalue of every V_x on M is a root of P_x.

- e_Q does not depend on the lifts of α_x and Q_x.

- e_Q commutes with diamond operators and with `T^an_{Q,psi}`.

**Checks.**

- For Q = ∅, e_Q = 1 and m_Q = m.

- For n = 2 and Q = {x} with eigenvalues α_x ≠ β_x, e_Q = `lim(V_x - betaTilde_x)^{k!}` with β_x the other eigenvalue (CG18 §7.1, p. 395), and it kills the generalized β_x-eigenspace of V_x.

- On O² with V = diag(α̃, β̃), α̃ ≢ β̃ mod ϖ, the projector `lim(V - betaTilde)^{k!}` equals diag(1, 0).

- If α_x is a double root of P_x then Q_x(α_x) = 0 and lim `QTilde_x(V_x)^{k!}` kills the α_x-part instead of isolating it.

- For n = 2 and Q = {x} with residual eigenvalues α_x, β_x ∉ {±1}, on O with V_x acting by 1 (a Steinberg-type eigenvalue), lim `(V_x - betaTilde_x)^{k!}` = 1, so e_Q keeps this line although it is not in the m_Q-part; e_Q cuts out `M_{m_Q}` only under the eigenvalue condition.

(CG18, §9.3, Conjecture B(5), published pp. 414–415; CG18 line 4710; CG18, §7.1, published pp. 394–395; CG18 lines 3926–3962; CGH20, §3.1, Theorem 3.2, arXiv p. 5; CGH20 line 210.)

*Needs:* §0.3; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §2.3; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §2.2.

### 0.5 Residual independence of the Iwahori character and the dual local system

Let χ = `(chi_v)_{v in R}` be an Iwahori character datum. (1) For every level K with Iwahori components at R, O(χ) ⊗ k ≅ k, giving H^*_χ(Y(K), k) ≅ H^*(Y(K), k) and `H_{*,chi}(Y(K), k)` ≅ H_*(Y(K), k), equivariantly for every Hecke operator T(g) with g trivial at R and for diamond operators. (2) Consequently each maximal ideal m of T_1 determines a maximal ideal of T_χ (also written m) with the same residual Hecke eigenvalues, and r̄_m (when Conjecture B gives it) is the same for both. (3) For every a ≥ 1 and every degree i, H^i_χ(Y(K), O/ϖᵃ)^∨_m ≅ `H_{i,chi^{-1}}(Y(K), O/varpi^a)_{m^*}`, where ∨ is Pontryagin duality over O/ϖᵃ, m^* is the dual maximal ideal (CG18 Remark 9.5; written 𝔪^∨ in ArithmeticLocallySymmetricSpaces ALS.5a.4), the homology uses the dual local system O(`chi^{-1}`), and the transpose of T(g) is T_H(g⁻¹) under the inverse-double-coset involution ι of §0.2.

`chi_{v,i}` take values in 1 + 𝔪_O. (3) needs no boundary hypothesis: O/ϖᵃ is injective as a module over itself, so its duality is exact.

A proof uses the following inputs and comparisons. (1) O(χ) ⊗_O k is the constant sheaf since χ ≡ 1 mod ϖ (§0.1), and the Hecke correspondences on both sides are the same `p_{1*} c_g p_2^*` of §0.2. (2) The isomorphism of (1) intertwines the generators `T_{alpha,k}`, so the residual systems of eigenvalues agree; Chebotarev and Brauer–Nesbitt identify the residual representations. (3) Betti cohomology and homology of Y(K) are the group cohomology and homology of the arithmetic groups of its components, with arbitrary finite stabilizers allowed (ArithmeticLocallySymmetricSpaces ALS.1.5). For such a group Γ, a projective resolution P of ℤ over ℤ[Γ] and M = O(`chi^{-1}`)/ϖᵃ, whose O/ϖᵃ-dual is O(χ)/ϖᵃ, adjunction gives Hom_Γ(P, Hom(M, O/ϖᵃ)) ≅ Hom(P ⊗_Γ M, O/ϖᵃ); since O/ϖᵃ is self-injective, cohomology commutes with this duality (universal coefficients), and the groups are finite because arithmetic groups are of type FP_∞. The duality exchanges pullback with pushforward and trace with transfer: the transpose is pushforward along p₂ after dual coefficient transport and transfer along p₁, namely T_H(g⁻¹). Thus m*=ι(m). A cohomological diamond eigencharacter λ becomes λ⁻¹ for the standard homology action; the scalar action transported directly to the dual is instead T_H(δ⁻¹), with eigenvalue λ(δ) (ArithmeticLocallySymmetricSpaces ALS.5a.4).

**Checks.**

- Over O = ℤ₃[ζ₃] with ϖ = ζ₃ − 1, the character of C₃ sending a generator to ζ₃ has values in 1 + 𝔪_O and reduces to the trivial character, so (1) applies to it. By contrast the character of C₂ sending its generator to −1 ∈ ℤ₃ does not take values in 1 + 𝔪_O: over 𝔽₃ it gives H⁰(C₂, 𝔽₃(−1)) = {x : −x = x} = 0, while the constant coefficient gives H⁰(C₂, 𝔽₃) = 𝔽₃. The congruence of χ to 1 modulo ϖ is what (1) uses, not merely finiteness of the order.

- For χ = 1, (3) is the homological identification of CG18 Remark 9.5; the source's intermediate term, compactly supported cohomology, is where boundary vanishing enters, and (3) bypasses it.

- At level one over ℚ (n = 2, p > 3) and the Eisenstein ideal m, boundary cohomology is nonzero at m, yet H⁰(Y, k)_m = k and `H_0(Y, k)_{m^*}` = k, both with `T_{lambda,1}` acting by 1 + λ: (3) holds without boundary vanishing, while H²_c(Y, k)_m = k differs from H²(Y, k)_m = 0.

- In the C₃ model of §0.2, pairing f=δ₀ with the point class e₂ gives ⟨r_g^*f,e₂⟩=1=⟨f,(r_g)_*e₂⟩ since r_g(2)=0. The standard homological action of g sends e₂ to e₁ and gives pairing 0 instead. Thus the adjoint is T_H(g⁻¹). For a character with λ(g)=ζ₃, standard homology has eigenvalue ζ₃⁻¹, while the transported scalar g acts by ζ₃.

(CG18, §9.5, published p. 426; CG18 line 5161; CG18, §9.3, Remark 9.5, published p. 416; CG18 line 4764; CG18, §9.5, published pp. 425–426; CG18 line 5161.)

*Needs:* §0.1; §0.2; §0.3; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.1.5; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.5a.4.

### 0.6 Serre modular of minimal level

Let r̄ : G_F → GL_n(k) be continuous and absolutely irreducible, and let R(r̄) be the set of finite places v ∤ p at which r̄ is ramified. r̄ is Serre modular of minimal level if there is a maximal ideal m of T = `T_{empty,1}` at the level K_∅(R(r̄)) (hyperspecial outside R(r̄), Iwahori at R(r̄)) such that m is of Galois type for the Hecke polynomial of §0.2 (IntegralHeckeAndGaloisDeterminants §3b.1; this is the residual part of B^gal, §2.1) with residual representation r̄_m ≅ r̄ ⊗_k k(m). Equivalently, H^*(Y(K_∅(R(r̄))), k)_m ≠ 0 for a maximal ideal m whose Hecke polynomials at λ ∉ S are the characteristic polynomials of r̄(Frob_λ).

r̄ has at worst unipotent ramification away from p (the setting of CG18 §8.5), so the predicate uses hyperspecial level off its ramification support and Iwahori level on it; the minimal conductor interpretation in the lifting theorem additionally uses the single-block condition at ramified places. The level at R(r̄) is Iwahori, which realizes the Serre conductor exponent n − 1 when r̄(σ_v) is a single unipotent Jordan block (the case §5.8 uses). This is a statement about a mod p class only; no characteristic-zero lift is asserted.

A proof uses the following inputs and comparisons. The Hecke polynomial convention is IntegralHeckeAndGaloisDeterminants §3a.1; Galois type is IntegralHeckeAndGaloisDeterminants §3b.1. The equivalence of the two formulations is Chebotarev density together with Brauer–Nesbitt (uniqueness of semisimple representations with given characteristic polynomials). Nonvanishing of H^*(Y, k)_m is equivalent to m lying in the support of the finite T-module H^*(Y, k).

The specialized interface records the following facts.

- The predicate on r̄ described above.

- The maximal ideal m of T at level K_∅(R(r̄)) with r̄_m ≅ r̄.

- Equivalence with nonvanishing of H^*(Y(K_∅(R(r̄))), k)_m for the m cut out by the characteristic polynomials of r̄.

- Invariance under finite extension of k.

**Checks.**

- For F = ℚ, n = 2 and r̄ with determinant ε̄, squarefree Serre conductor N and Fontaine–Laffaille weights 0,1, Serre modularity of minimal level is equivalent to r̄ arising from a mod p weight-2 eigenform on Γ_0(N) (Iwahori level at the primes of N). At ℓ | N, conductor exponent 1 gives r̄|I_ℓ semisimplification 1 ⊕ θ with θ tame, and det r̄ = ε̄ unramified at ℓ forces θ = 1, so the ramification is unipotent; without the determinant condition 1 ⊕ θ with θ ≠ 1 has the same exponent and needs a nebentypus at ℓ instead of Iwahori level.

- A reducible r̄ = 1 ⊕ ε̄ is excluded by absolute irreducibility, although it is the residual representation of Eisenstein classes.

- If r̄ is unramified outside p then the level is K_∅(∅), hyperspecial everywhere.

- A class in H^*(Y, k)_m that does not lift to characteristic zero still witnesses Serre modularity.

- An m-eigenspace of H^*(Y, k) of dimension one over k = 𝔽₅ becomes an eigenspace of dimension one over 𝔽₂₅ after extending scalars, and of dimension two when that space is viewed over 𝔽₅ again: coefficient extension preserves nonvanishing of the localized cohomology, which is what the predicate uses, not the dimension over the original field.

- Unlike branch (8a) of CG18 Theorem 5.16, which survives a solvable base change unramified at p, the predicate carries no stability under cyclic base change: the source notes that such stability is not evident (CG18, remark after Theorem 5.16).

(CG18, Theorem 5.16(8)(b) and the remark after it, published pp. 383–384; CG18 line 3497; CG18, §9.5, published p. 425; CG18 line 5111.)

*Needs:* §0.3; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §3b.1; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §3a.1; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.0.10.

### Examples

For n=2, Q={x}, p=7 and residual roots 2 and 4, Q_x(V)=V−4 acts by −2 on the chosen line and by 0 on the other line. Its factorial powers therefore give diag(1,0). On a third line with V=1 they give 1 as well, so projection to the chosen maximal ideal remains part of the comparison.

### Dependencies

Earlier layers none; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.0.7–ALS.0.10, ALS.1.1–ALS.1.8, ALS.2.2–ALS.2.4, ALS.3.3–ALS.3.9 and ALS.3.14, ALS.4.1 and ALS.4.9–ALS.4.12, ALS.5a.2–ALS.5a.6, ALS.5b.4–ALS.5b.6, ALS.6.1–ALS.6.3; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §§1.2–1.3, 2.1–2.3, 3a.1 and 3b.1–3b.2.

## Layer 1: The arithmetic deformation datum

### 1.1 Standing residual data with an Ihara-avoidance set

A standing datum consists of: a number field F of signature (r_1, r_2); an integer n ≥ 2; a prime p > n unramified in F; the ring of integers O of a finite extension E/ℚ_p with residue field k such that W(k)[1/p] contains the images of all embeddings F ↪ Q̄_p; a continuous absolutely irreducible r̄ : G_F → GL_n(k); the character ξ = `epsilon^{n(n-1)/2}` : G_F → O^× (ε the p-adic cyclotomic character, ε(Frob_λ) = N(λ) for arithmetic Frobenius); and a finite set R of finite places of F, disjoint from S_p, written R = R_triv ⊔ R_reg, together with characters χ = `(chi_v)_{v in R_triv}`, χ_v = (`chi_{v,1}`, …, `chi_{v,n}`), `chi_{v,i}` : k_v^× → 1 + 𝔪_O (equivalently, characters of `O_{F_v}^*` trivial on 1 + 𝔭_v) pairwise distinct with ∏_i `chi_{v,i}` = 1, evaluated on I_v through `Art_v^{-1}`. It is required that: (a) for every v | p, the dual r̄^∨|G_v lies in the essential image of the covariant Fontaine–Laffaille realization of LocalGaloisDeformationRings §1.6 with labelled jumps {0, 1, …, n − 1}, each once for each embedding τ; equivalently r̄|G_v is the contravariant realization of a Fontaine–Laffaille module with those jumps, the positive-weight convention of PadicHodgeTheory §6.1; (b) N(v) ≡ 1 mod p for every v ∈ R_triv (no congruence is imposed on R_reg); (c) r̄|G_v is trivial for v ∈ R_triv; (d) for v ∈ R_reg, r̄|I_v is unipotent and r̄(σ_v) is a single Jordan block, σ_v a generator of tame inertia; (e) r̄ is unramified outside S_p ∪ R; (f) r̄ is odd (balanced) at every real place v: the ±1-eigenspaces of r̄(c_v) have dimensions differing by at most one (ArithmeticGaloisRepresentations §7.4); in characteristic p > n this is the trace condition Tr r̄(c_v) ∈ {−1, 0, 1} except when n is even and p = n + 1; (g) det r̄ = `epsilonbar^{n(n-1)/2}`. Put S = S_p ⊔ R and T = S_p ∪ R (the framed places); the Iwahori character datum of §0.1 is ψ = 1 or ψ = χ, with χ extended by 1 on R_reg, viewed as a character of Iw(v)/Iw_1(v) ≅ (k_v^×)^n/k_v^×.

The splitting R = R_triv ⊔ R_reg replaces the single set R of CG18 §8.5: Lemma 8.2 is false without (c) at the Ihara-avoidance places, and (d) is the minimal-ramification case used by CGH20 §4(2)(a); the congruence (b) is needed only where the characters χ_v live, so R_reg carries none, as in CGH20 Theorem 1.2 (A.2). `chi_{v,i}` are characters of the finite group k_v^× with values in the pro-p group 1 + 𝔪_O, so they have p-power order and are nontrivial only because N(v) ≡ 1 mod p. Oddness at a real place is the balanced-eigenspace condition of ArithmeticGaloisDuality R02.6.1.

A proof uses the following inputs and comparisons. Each condition is local except (e) and (g); (a) is meaningful because p > n and F_v/ℚ_p is unramified, so the weights lie in the Fontaine–Laffaille range [0, p − 2]. Since R contains every ramified place of r̄ away from p, (c) and (d) say that at a ramified place r̄ is a single unipotent block, and at an unramified place of R it is trivial. χ_v extended by 1 on R_reg is a tuple of characters of (k_v^×)^n with trivial product, which is the Iwahori character datum of §0.1; on inertia it acts through `Art_v^{-1}` and `O_{F_v}^*` ↠ k_v^×.

The specialized interface records the following facts.

- The bundled datum (F, n, p, O, r̄, ξ, R_triv, R_reg, χ) with the conditions (a)–(g).

- S = S_p ⊔ R.

- T = S_p ∪ R, with |T| = |S_p| + |R|.

- The Iwahori character data ψ = 1 and ψ = χ (χ extended by 1 on R_reg).

- r̄ is unramified outside S.

- Enlarging O preserves every condition.

**Checks.**

- R = ∅ is allowed: then S = S_p, T = S_p, the χ-datum is the trivial datum and r̄ is unramified outside p.

- For n = 2 and r̄ = E[p] with E having multiplicative reduction at v and p ∤ v(Δ_E), the place v belongs to R_reg (r̄(σ_v) conjugate to (1 1; 0 1)), with no condition on N(v) mod p.

- If r̄|G_v is unramified with r̄(Frob_v) nonscalar, v can be neither in R_triv (not trivial) nor in R_reg (not ramified).

- For v ∈ R_triv the `chi_{v,i}` are pairwise distinct; with `chi_{v,1}` = `chi_{v,2}` the ring R^χ_v is not irreducible in general and the datum is rejected.

- For n = 2 and p = 3, r̄(c_v) = 1 at a real place has trace 2 = −1 in 𝔽_3 but ±1-eigenspaces of dimensions 2 and 0, so it violates (f); a definition of oddness by the trace alone would accept it.

- A place v with r̄(σ_v) a single unipotent Jordan block may be put in R_reg for every N(v) prime to p, whereas a place of R_triv needs N(v) ≡ 1 mod p: otherwise every character k_v^× → 1 + 𝔪_O is trivial and the `chi_{v,i}` cannot be pairwise distinct.

(CG18, §8.5, published pp. 406–407; CG18 line 4395; CG18, §8.5.1, Lemma 8.2, published pp. 407–408; CG18 line 4440; CGH20, §4, item (2)(a), arXiv p. 7 (published appendix §A.4); CGH20 line 287.)

*Needs:* TauCetiRoadmap.LocalGaloisDeformationRings §1.6; TauCetiRoadmap.PadicHodgeTheory §6.1; TauCetiRoadmap.ArithmeticGaloisRepresentations §7.4; TauCetiRoadmap.ArithmeticGaloisDuality R02.6.1; §0.1.

### 1.2 The local deformation rings R^1_loc and R^χ_loc

For a standing datum, let C_O be the category of complete Noetherian local O-algebras with residue field k. (i) For v | p, let D_v be the positive-weight Fontaine–Laffaille problem: a framed lift r_A of r̄|G_v over A ∈ C_O lies in D_v(A) when det r_A = ξ|G_v and the dual lift r_A^∨ = (r_A^T)⁻¹, with the dual frame, lies in the Fontaine–Laffaille problem of LocalGaloisDeformationRings §1.6 for r̄^∨|G_v with labelled jumps {0, …, n − 1}, each once for each embedding τ (so det r_A^∨ = ξ⁻¹|G_v). R_v is its representing ring; it is formally smooth over O of relative dimension n² − 1 + [F_v : ℚ_p]n(n − 1)/2. (ii) For v ∈ R_triv, R^1_v (resp. `R^{chi_v}_v`) is the quotient of the framed determinant-ξ lifting ring of r̄|G_v by the condition that every σ ∈ I_v has characteristic polynomial (X − 1)^n (resp. ∏_i(X − `chi_{v,i}(Art_v^{-1}(sigma))`)). (iii) For v ∈ R_reg, R^1_v is the same unipotent quotient, which equals the minimally ramified ring and is formally smooth of relative dimension n² − 1. Put R^1_loc := (`completedTensor_{v|p}` R_v) ⊗̂ (`completedTensor_{v in R}` R^1_v) and R^χ_loc := (`completedTensor_{v|p}` R_v) ⊗̂ (`completedTensor_{v in R_triv}` `R^{chi_v}_v`) ⊗̂ (`completedTensor_{v in R_reg}` R^1_v), completed tensor products over O. Write D^1_v, D^χ_v for the local deformation problems of (ii) and (iii); D_v is the problem of (i).

Standing datum of §1.1. Fixed determinant ξ in every local problem. The rings R^1_v, R^χ_v are the literal quotients of the lifting ring; their O-flat quotients would break the mod ϖ identification.

A proof uses the following inputs and comparisons. (i) The map r_A ↦ r_A^∨ = (r_A^T)⁻¹ on framed lifts is an involutive natural isomorphism from the framed lifting functor of r̄|G_v to that of r̄^∨|G_v; it is compatible with coefficient change, with strict conjugation (through g ↦ (g^T)⁻¹) and with inversion of determinants, so it carries D_v onto the §1.6 problem for r̄^∨|G_v with determinant ξ⁻¹ and identifies the representing rings. Transport LocalGaloisDeformationRings §§1.6 and 1.13 (the fixed-weight Fontaine–Laffaille smoothness theorem) through it, with the determinant fixed by LocalGaloisDeformationRings §F.2.9; representability, formal smoothness and the dimension are preserved. Since §1.6 gives a jump i the Hodge–Tate weight −i, its contravariant dual gives weight +i (PadicHodgeTheory §6.1): the characteristic-zero points of D_v are the lifts with native weights {0, …, n − 1}. (ii) are the Ihara-avoidance quotients of LocalGaloisDeformationRings §2.15, taken with fixed determinant: since p ∤ n and `prod chi_{v,i}` = 1, twisting by n-th roots of unramified characters identifies the variable-determinant quotient with the fixed-determinant one times a formally smooth factor in one variable. (iii) LocalGaloisDeformationRings §2.21 identifies the unipotent condition with the minimally ramified one when r̄(σ_v) is a single Jordan block, and LocalGaloisDeformationRings §2.8 gives formal smoothness. The completed tensor products exist in C_O (DeformationAndDerivedPatchingAlgebra §1.12).

The specialized interface records the following facts.

- R_v at v | p with determinant ξ.

- R^1_v for v ∈ R.

- `R^{chi_v}_v` for v ∈ R_triv.

- R^1_loc and R^χ_loc as completed tensor products, with their maps from each factor.

- R^1_loc/ϖ ≅ R^χ_loc/ϖ, compatibly with the factor maps.

- For v ∈ R_reg, R^1_v ≅ O⟦y_1, …, `y_{n^2-1}`⟧.

- An O′-point of R^1_loc is a tuple of framed lifts of r̄|G_v, v ∈ T, with determinant ξ, Fontaine–Laffaille at p and unipotent inertia at R.

**Checks.**

- For R = ∅, R^1_loc = R^χ_loc = `completedTensor_{v|p}R_v` ≅ O⟦y_1, …, y_d⟧ is formally smooth of relative dimension d = |S_p|(n² − 1) + [F:ℚ]n(n − 1)/2.

- For n = 2 and v ∈ R_reg, the regular-unipotent minimal condition of LocalGaloisDeformationRings §§2.8 and 2.21, with determinant fixed, gives R^1_v ≅ O⟦y₁,y₂,y₃⟧; the trivial-residual Steinberg closure of §2.26 is a different ring.

- For n = 2 and v ∈ R_triv with q = N(v), write Φ = ρ(φ_v) and S = ρ(σ_v) − 1 for the universal lift over R^1_v; then (q − 1)·tr(ΦS) = 0 but tr(ΦS) ≠ 0, as the point Φ = diag(1 + X, δ/(1 + X)), Σ = diag(1 + α, 1 − α) with values in O⟦X⟧[α]/(α², (q − 1)α) shows (δ = ξ(φ_v)); so R^1_v and R^1_loc have nonzero p-torsion.

- For n = 2 and v ∈ R_triv, both R^1_v/ϖ and `R^{chi_v}_v/varpi` are the quotient of the lifting ring mod ϖ by tr(ρ(σ)) = 2, det ρ(σ) = 1 on inertia; they coincide because `chi_{v,i}` ≡ 1 mod ϖ.

- If R_triv = ∅ then R^1_loc = R^χ_loc is formally smooth over O.

- For n=2, F_v=ℚ₅ and p=5: O⊕O(ε) has native weights {0,1} and determinant ε=ξ, and its dual O⊕O(ε⁻¹) has jumps {0,1} in LocalGaloisDeformationRings §1.6, so O⊕O(ε) is a point of D_v. Applying §1.6 to the lift itself would instead admit O⊕O(ε⁻¹), with determinant ε⁻¹≠ξ and residual inertia characters 1, ω³ rather than 1, ω (ω the mod-5 cyclotomic character).

- For n=2, q=7 and O=ℤ₃, put A=O⟦X⟧[a]/(a²,6a), Φ=diag(1+X,7/(1+X)), Σ=diag(1+a,1−a). Then det Φ=7, det Σ=1, tr Σ=2, ΦΣΦ⁻¹=Σ⁷ and 6 tr(Φ(Σ−1))=0. Its reduction has tr(Φ(Σ−1))=a((1+X)−1/(1+X))≠0 in 𝔽₃⟦X⟧a, detecting the forbidden flat quotient.

(CG18, §8.5.1, published p. 407; CG18 line 4422; CGH20, §4, item (2)(a), arXiv p. 7; CGH20 line 287.)

*Needs:* §1.1; TauCetiRoadmap.LocalGaloisDeformationRings §1.6; TauCetiRoadmap.LocalGaloisDeformationRings §1.13; TauCetiRoadmap.PadicHodgeTheory §6.1; TauCetiRoadmap.LocalGaloisDeformationRings §2.15; TauCetiRoadmap.LocalGaloisDeformationRings §2.21; TauCetiRoadmap.LocalGaloisDeformationRings §2.8; TauCetiRoadmap.LocalGaloisDeformationRings §F.2.9; TauCetiRoadmap.GlobalGaloisDeformations §7.4; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §1.12; TauCetiRoadmap.LocalGaloisDeformationRings §F.3.1.

### 1.3 Lemma 8.2 in corrected form: the local rings for Ihara avoidance

For a standing datum: (1) R^1_loc and R^χ_loc are equidimensional of Krull dimension 1 + |S_p ∪ R|(n² − 1) + [F:ℚ]n(n − 1)/2, and every minimal prime of each has characteristic 0; (2) there is a natural isomorphism R^1_loc/ϖ ≅ R^χ_loc/ϖ; (3) Spec R^χ_loc is irreducible, after enlarging O if necessary; (4) every irreducible component of Spec R^1_loc/ϖ is contained in a unique irreducible component of Spec R^1_loc. The literal local quotient can have p-torsion, as the square-zero example in §1.2 demonstrates; the component statements are retained without a flatness assertion.

Standing datum with R = R_triv ⊔ R_reg (§1.1); O large enough that the irreducible components of each factor are geometrically irreducible. The ring hypotheses concern minimal primes and components; they do not assert coefficient flatness of the literal quotient.

A proof uses the following inputs and comparisons. Factors at v | p and v ∈ R_reg are formally smooth over O, hence O-flat domains with irreducible generic fibre and the stated relative dimensions (§1.2). At v ∈ R_triv, Taylor's computation (LocalGaloisDeformationRings §2.15, in fixed determinant): Spec `R^{chi_v}_v` is irreducible with generic point of characteristic 0, R^1_v/ϖ = `R^{chi_v}_v/varpi`, every component of Spec R^1_v has the same dimension and characteristic-0 generic point, and each prime minimal over ϖ contains a unique minimal prime. Completed tensor products over O of rings that are equidimensional with characteristic-0 minimal primes and geometrically irreducible components are again such, with dimensions adding (relative dimensions add), components being products of components, and the 'unique component above each special component' property preserved: this is requested from DeformationAndDerivedPatchingAlgebra §§4.6 and 6.7–6.8 as gap:character-ring-completed-products. (1), (3), (4) follow factor by factor from the previous steps; (2) is the tensor product of the factorwise identifications mod ϖ.

**Checks.**

- The dimension count: `sum_{v|p}(n^2 - 1 + [F_v : Q_p]n(n - 1)/2)` + |R|(n² − 1) + 1 = 1 + |S_p ∪ R|(n² − 1) + [F:ℚ]n(n − 1)/2.

- If R_triv = ∅ then R^1_loc = R^χ_loc is formally smooth, and (1)–(4) are immediate.

- As a negative control, with v ∈ R, r̄|G_v unramified of distinct Frobenius eigenvalues and `chi_{v,2}` = `chi_{v,1}^{-1}` ≠ `chi_{v,1}`, Spec `R^{chi_v}_v[1/p]` is disconnected; the datum excludes this v.

(CG18, §8.5.1, Lemma 8.2 and its proof, published pp. 407–408; CG18 line 4440; CG18, §9.5, proof of Theorem 9.19, published pp. 426, 428; CG18 line 5228.)

*Needs:* §1.2; TauCetiRoadmap.LocalGaloisDeformationRings §2.15; TauCetiRoadmap.LocalGaloisDeformationRings §2.8; TauCetiRoadmap.LocalGaloisDeformationRings §1.13; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §§4.6 and 6.7–6.8 and gap:character-ring-completed-products; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §1.12.

### 1.4 The global deformation data S_Q and S^χ_Q

For a standing datum and a finite set Q of places disjoint from S at which r̄|G_x ≅ s̄_x ⊕ ψ̄_x with ψ̄_x the full generalized eigenspace of a simple Frobenius eigenvalue and N(x) ≡ 1 mod p, let D_x be the two-scalar Taylor–Wiles local problem, supplied by LocalGaloisDeformationRings §2.16 for semisimple residual Frobenius and by gap:nonsemisimple-two-scalar-taylor-wiles in general: lifts of determinant ξ of the form s_x ⊕ ψ_x lifting s̄_x ⊕ ψ̄_x with I_x acting by scalars on s_x and on ψ_x. S_Q := (r̄, O, S ⊔ Q, ξ, `(D_v)_{v in S_p union Q}`, `(D^1_v)_{v in R}`) and S^χ_Q := (r̄, O, S ⊔ Q, ξ, `(D_v)_{v in S_p union Q}`, `(D^chi_v)_{v in R_triv}`, `(D^1_v)_{v in R_reg}`) are global deformation data in the sense of GlobalGaloisDeformations §3.3. A deformation is of type S_Q if it is unramified outside S ⊔ Q, has determinant ξ, and lies in the given local problem at each v ∈ S_p ∪ Q ∪ R. `R_{S_Q}` and `R^{square_T}_{S_Q}` (T-framed) are the representing objects; S := S_∅. Let θ_x(u)=ψ_x(Art_x(u)) on Δ_x, the maximal p-power quotient of k_xˣ. In the deck coordinate `delta=det(B)a^{1-n}`, let b_x be the inverse of 1−n on Δ_x and send [δ] to θ_x(`delta^{b_x}`); this defines the O[Δ_Q]-algebra structure on `R_{S_Q}`. It satisfies `R_{S_Q} tensor_{O[Delta_Q]} O ~= R_S`. Here [δ] labels the cohomological pullback r_δ^* of §0.2. This coordinate change is necessary because diag(u,1,…,1) has deck class `u^{1-n}`.

r̄ absolutely irreducible, so the unframed functor is representable. p ∤ n so ad r̄ = k ⊕ ad⁰ r̄. The Taylor–Wiles places carry the one-dimensional eigenspace condition of CG18 §8.5.1.

A proof uses the following inputs and comparisons. Representability of the T-framed and unframed functors: GlobalGaloisDeformations §3.4, using that each local problem is a local deformation problem (LocalGaloisDeformationRings §F.3.1). The local maps R^1_loc → `R^{square_T}_{S_Q}` and R^χ_loc → `R^{square_T}_{S^chi_Q}` are GlobalGaloisDeformations §3.5. At x ∈ Q a lift of type D_x is s_x ⊕ ψ_x. Write θ_x=ψ_x|I_x and η_x for scalar inertia on s_x, so θ_xη_xⁿ⁻¹=1. Frobenius conjugation fixes each scalar, hence the tame relation gives θ_x^(N(x)−1)=η_x^(N(x)−1)=1. Residual inertia is trivial, so these characters factor through the p-part of k_xˣ. Since p∤n−1, η_x is uniquely determined by θ_x; this gives the inertia map and, with the displayed deck-coordinate correction, O[Δ_Q] → `R_{S_Q}`. Killing the augmentation ideal forces ψ_x and s_x unramified, which with determinant ξ unramified at x gives deformations of type S (GlobalGaloisDeformations §4.3).

The specialized interface records the following facts.

- S_Q and S^χ_Q as global deformation data.

- `R_{S_Q}`, with its universal deformation.

- `R^{square_T}_{S_Q}` with the maps from R^1_loc and `R_{S_Q}`.

- The O[Δ_Q]-algebra structure from inertia at Q.

- `R_{S_Q}` `tensor_{O[Delta_Q]}` O ≅ R_S.

- `R_{S_Q}/varpi` ≅ `R_{S^chi_Q}/varpi` compatibly with the Δ_Q-structures.

- `R_{S_Q}` is topologically generated over O by the traces of Frobenius at λ ∉ S ⊔ Q (LocalGaloisDeformationRings §F.2.7).

**Checks.**

- For Q = ∅, S_∅ = S, S^χ_∅ = S^χ, `R_{S_empty}` = R_S and Δ_∅ is trivial.

- For n = 2 and x ∈ Q with distinct residual eigenvalues, the local problem D_x is a fixed-determinant ring with three formally smooth coordinates and one cyclic inertia coordinate u satisfying `(1+u)^{p^a}=1`, where p^a is the p-part of N(x)−1 (LocalGaloisDeformationRings §§2.10 and 2.16).

- A deformation of type S_Q unramified at every x ∈ Q is killed by the augmentation ideal of O[Δ_Q].

- With the unrestricted local problem at x ∈ Q instead of D_x the tangent space grows by h⁰(G_x, ad⁰ r̄) − 1 extra dimensions and the numerical coincidence of §1.6 fails for n ≥ 3.

- For n = 2, b_x = −1 and the deck class of diag(u, 1) is u⁻¹, so the structure sends that diamond operator to θ_x((u⁻¹)⁻¹) = θ_x(u). Identifying Δ_Q with the p-part of k_x^× by u ↦ ⟨diag(u, 1)⟩, it is therefore the rank-two Δ_Q-structure of GlobalGaloisDeformations §5.5, which sends u to the selected inertia character at Art_x(u); naming deck classes directly by u would instead give θ_x(u)⁻¹, the character of the other line.

(CG18, §8.5.1–8.5.2, published pp. 407–409; CG18 line 4422; CG18, §9.5, published p. 427; CG18 line 5200.)

*Needs:* §1.1; §1.2; TauCetiRoadmap.LocalGaloisDeformationRings §2.16; TauCetiRoadmap.LocalGaloisDeformationRings gap:nonsemisimple-two-scalar-taylor-wiles; TauCetiRoadmap.GlobalGaloisDeformations §3.3; TauCetiRoadmap.GlobalGaloisDeformations §3.4; TauCetiRoadmap.GlobalGaloisDeformations §3.5; TauCetiRoadmap.GlobalGaloisDeformations §4.3.

**Checks on the local condition.**

- Over 𝔽₇, Φ=diag(4,J₂(3)) has determinant 4·3²=1, a simple 4-line and a nonscalar complementary Jordan block. It is admitted by the gap contract; imposing semisimplicity would discard it. Its unramified fixed-determinant tangent dimension is 2 and the scalar ramification adds 1, giving dim L=3 and h⁰(ad⁰r̄)=2.
- In rank two, p=5 and N(x)=11, inertia diag(1+ε,1−ε) over k[ε]/ε² has determinant 1 and one ramified parameter. Requiring the complementary character unramified instead gives ε=0.
- For rank one a fixed determinant gives zero ramified parameters; the two-scalar contract requires n≥2. In every allowed rank, θ=1 forces η=1, because n−1 is prime to p, so augmentation is exactly unramifiedness.

**Coordinate check.** For n=3, p=5 and Δ=C₅ with generator d, 1−n=−2≡3 and its inverse is 2; the Galois character sends deck d to θ(d)², and the deck class d³ of diag(d,1,1) consequently acts by θ(d)⁶=θ(d). Sending deck d directly to θ(d) instead gives θ(d)³, which fails the compatibility. Killing the augmentation kills θ because this power map is invertible.

For an eigenfunction with r_d^*f=ζ₅²f, pullback by `r_{d^3}` has eigenvalue ζ₅⁶=ζ₅; pushforward by that same translation would give ζ₅⁻¹. Thus the deck coordinate above uses the positive cohomological convention of §0.2. On standard homology the corresponding character is inverse, and transporting the scalar action to the dual restores ζ₅.

### 1.5 Framing and presentation over the local rings (Lemma 8.3, Proposition 8.4)

For a standing datum and Q as in §1.4: (1) `R_{S_Q}` → `R^{square_T}_{S_Q}` is formally smooth of relative dimension n²|T| − 1 (and likewise for S^χ_Q), for T nonempty. (2) `R^{square_T}_{S_Q}` (resp. `R^{square_T}_{S^chi_Q}`) is a quotient of a power series ring over R^1_loc (resp. R^χ_loc) in `h^1_{L(Q),T}(G_F, ad^0 rbar)` + `sum_{v in T}` h⁰(G_v, ad r̄) − h⁰(G_F, ad r̄) variables, where `H^1_{L(Q),T}(G_F, ad^0 rbar)` is the kernel of H¹(`G_{F,S_Q}`, ad⁰r̄) → `directSum_{x in T}` H¹(G_x, ad⁰r̄) ⊕ `directSum_{x in Q}` H¹(G_x, ad⁰r̄)/L_x. (3) `h^1_{L(Q),T}(ad^0 rbar)` = `h^1_{L(Q)^perp,T}(ad^0 rbar(1))` + h⁰(G_F, ad⁰r̄) − h⁰(G_F, ad⁰r̄(1)) + `sum_{x in Q}(dim L_x - h^0(G_x, ad^0 rbar))` − `sum_{v in T union {v|infty}}` h⁰(G_v, ad⁰r̄).

T = S_p ∪ R nonempty (it contains the places above p). r̄ absolutely irreducible and p ∤ n.

A proof uses the following inputs and comparisons. (1) The T-framed functor is a torsor over the formal group (`prod_{v in T}` Γ̂_n)/Ĝ_m of framings: LocalGaloisDeformationRings §F.2.6 and GlobalGaloisDeformations §7.2 in its T-framed form (§7.2 gives the n²|T| − 1 count for nonempty T). (2) GlobalGaloisDeformations §3.7: the relative tangent space of `R^{square_T}_{S_Q}` over the local ring is the Selmer group relative to T, corrected by the framing variables `sum_{v in T}h^0(G_v, ad rbar)` − h⁰(G_F, ad r̄) (GlobalGaloisDeformations §3.6). (3) Poitou–Tate duality and the Greenberg–Wiles formula (ArithmeticGaloisDuality R02.5.1) for M = ad⁰r̄ with conditions 0 at T, L_x at Q and unramified elsewhere.

**Checks.**

- With Q = ∅ and R = ∅, (3) reads `h^1_{empty,S_p}(ad^0)` = `h^1_{perp}(ad^0(1))` − `sum_{v|p}h^0(G_v, ad^0)` − `sum_{v|infty}h^0(G_v, ad^0)` when h⁰(ad⁰) = h⁰(ad⁰(1)) = 0.

- For n = 1, ad⁰ r̄ = 0 and (3) reads 0 = 0; the rank-one count of §1.8 uses ad r̄ = k instead (ArithmeticGaloisDuality R02.5.2).

- For n=2 and |T|=1 the framing dimension is 4−1=3; for |T|=2 it is 8−1=7. An empty T would give −1 and is excluded.

(CG18, §8.5.2, Lemma 8.3 and Proposition 8.4, published pp. 409–410; CG18 line 4494 and line 4521.)

*Needs:* §1.4; TauCetiRoadmap.LocalGaloisDeformationRings §F.2.6; TauCetiRoadmap.GlobalGaloisDeformations §7.2; TauCetiRoadmap.GlobalGaloisDeformations §3.7; TauCetiRoadmap.GlobalGaloisDeformations §3.6; TauCetiRoadmap.ArithmeticGaloisDuality R02.5.1.

### 1.6 The numerical coincidence (Proposition 8.5)

For a standing datum with r̄(`G_{F(zeta_p)}`) big (the big-subgroup condition of gap:cht-big-image) and F(ad⁰r̄) ∌ ζ_p, and an integer q ≥ `h^1_{L^perp,T}(G_F, ad^0 rbar(1))`, for every N ≥ 1 there is a tuple (Q, `(psibar_x)_{x in Q}`) with: (1) |Q| = q and Q ∩ S = ∅; (2) r̄|G_x ≅ s̄_x ⊕ ψ̄_x with ψ̄_x the full generalized eigenspace of a simple Frobenius eigenvalue; (3) N(x) ≡ 1 mod p^N; (4) `R^{square_T}_{S_Q}` (resp. `R^{square_T}_{S^chi_Q}`) is a quotient of R^1_loc⟦x_1, …, x_g⟧ (resp. R^χ_loc⟦x_1, …, x_g⟧) with g = q + |T| − 1 − [F:ℚ]n(n − 1)/2 − l_0, l_0 = r_1⌊(n − 1)/2⌋ + r_2(n − 1). Consequently, with j = n²|T| − 1, dim R^1_loc⟦x_1, …, x_g⟧ = 1 + q + j − l_0.

r̄(`G_{F(zeta_p)}`) big in the sense of the big-subgroup condition requested from ArithmeticGaloisRepresentations §§7.7–7.12 as gap:cht-big-image, and F(ad⁰r̄) ∌ ζ_p. r̄ odd at the real places, so that the archimedean count of ArithmeticGaloisDuality R02.6.1 applies. N(x) ≡ 1 mod p for x ∈ Q is what gives dim_k L_x − h⁰(G_x, ad⁰r̄) = 1 (LocalGaloisDeformationRings §2.16 in the semisimple case and gap:nonsemisimple-two-scalar-taylor-wiles in general).

A proof uses the following inputs and comparisons. (1)–(3) and the vanishing `H^1_{L(Q)^perp,T}(G_F, ad^0 rbar(1))` = 0: choose x by Chebotarev so that each class of the dual Selmer group is detected by tr(e_x φ(Frob_x)); this rank-n big-image selection is requested from GlobalGaloisDeformations §§5.6–5.8 as gap:big-image-rank-n-taylor-wiles. Then §1.5 (2)–(3) with `h^1_{L(Q)^perp,T}` = 0, h⁰(G_F, ad⁰) = h⁰(G_F, ad⁰(1)) = 0 (absolute irreducibility and ζ_p ∉ F(ad⁰r̄)), dim L_x − h⁰ = 1 at x ∈ Q, h⁰(G_v, ad) = h⁰(G_v, ad⁰) + 1 (p ∤ n), and `sum_{v|infty}h^0(G_v, ad^0)` = [F:ℚ]n(n − 1)/2 + l_0 (ArithmeticGaloisDuality R02.6.1, using oddness) give g = q + |T| − 1 − [F:ℚ]n(n − 1)/2 − l_0. Adding dim R^1_loc = 1 + |T|(n² − 1) + [F:ℚ]n(n − 1)/2 (§1.3) to g gives 1 + q + (n²|T| − 1) − l_0.

**Checks.**

- For F imaginary quadratic and n = 2, l_0 = 1, [F:ℚ]n(n − 1)/2 = 2 and g = q + |T| − 4.

- For F totally real and n = 2, l_0 = 0, recovering the Taylor–Wiles–Kisin count g = q + |T| − 1 − [F:ℚ].

- For n = 1 the formula gives l_0 = r_1 + r_2 − 1 only with the GL_1 conventions of §1.8, not the PGL_n formula, which gives 0.

- With F imaginary quadratic, n=2, |T|=1 and q=3, g=0, j=3 and dim R_∞=6=1+3+3−1; q=0 would give g=−3 and cannot index variables, so the auxiliary existence and tangent theorem must establish the nonnegative range.

(CG18, §8.6, Proposition 8.5 and its proof, published pp. 410–411; CG18 line 4543; CG18, §8.4, equation (1), published pp. 405–406; CG18 line 4339; CG18, §9.5, published p. 426; CG18 line 5168.)

*Needs:* §1.5; §1.2; §1.3; TauCetiRoadmap.LocalGaloisDeformationRings §2.16 and gap:nonsemisimple-two-scalar-taylor-wiles; TauCetiRoadmap.ArithmeticGaloisDuality R02.6.1; TauCetiRoadmap.AutomorphicFormsOnReductiveGroups §5.3; TauCetiRoadmap.GlobalGaloisDeformations §§5.6–5.8 and gap:big-image-rank-n-taylor-wiles; TauCetiRoadmap.ArithmeticGaloisRepresentations §§7.2 and 7.4 and gap:cht-big-image.

### 1.7 Lifts satisfying the hypotheses of Theorem 5.16 have type S

Let (F, n, p, O, r̄, R) be a standing datum and r : G_F → GL_n(O′) (O′ ⊇ O finite) a continuous lift of r̄ such that: r is unramified outside S; for v | p, r|G_v is crystalline with each labelled native Hodge–Tate weight 0,…,n−1 occurring once, with weights read through the contravariant Fontaine–Laffaille comparison; for v ∈ R, r|I_v is unipotent; det r = `epsilon^{n(n-1)/2}`. Then r is a deformation of r̄ of type S, hence defines an O-algebra map x_r : R_S → O′ whose kernel is a prime ideal and whose quotient is the image order x_r(R_S) ⊆ O′.

p > n unramified in F, so the Hodge–Tate weights lie in the Fontaine–Laffaille range [0, p − 2]. Standing datum (§1.1); the determinant convention ε(Frob_λ) = N(λ).

A proof uses the following inputs and comparisons. At v | p: a crystalline representation of an unramified p-adic field with Hodge–Tate weights in [0, p − 2] has Fontaine–Laffaille lattices. The dual r^∨|G_v has native weights {0, −1, …, −(n − 1)}, so it is the covariant realization of LocalGaloisDeformationRings §1.6 of a lattice with labelled jumps {0, …, n − 1}, each once per embedding; hence r|G_v is an O′-point of R_v as defined in §1.2(i) (PadicHodgeTheory §6.1). At v ∈ R: unipotent inertia means every σ ∈ I_v has characteristic polynomial (X − 1)^n, the defining condition of R^1_v; on R_reg this is the minimally ramified ring (LocalGaloisDeformationRings §2.21). det r = ξ and unramifiedness outside S are the remaining conditions of type S; the deformation class of r gives x_r by representability (§1.4).

**Checks.**

- For n = 2 at a place v ∈ R of norm 7, the matrices Φ = diag(7, 1) and Σ = (1 1; 0 1) satisfy ΦΣΦ⁻¹ = (1 7; 0 1) = Σ⁷ and det Φ = 7 = ξ(φ_v), and Σ has characteristic polynomial (X − 1)² with Σ ≠ 1: a local lift with these values of Frobenius and the tame generator is of type S (unipotent inertia) although it is ramified, so the unramified condition is not part of type S at R.

- A characteristic-zero point with nontrivial unipotent inertia at v∈R_triv does not factor through the unramified local quotient; special-fibre intersections do not change that distinction.

- A lift with r|I_v of non-unipotent inertia is not of type S.

- For the map O⟦X⟧→O′, X↦0, the quotient by its kernel is O, not O′ when O′ properly extends O. The maximal ideal of O′ has inverse image a different, maximal prime.

(CG18, Theorem 5.16 hypotheses (1), (2), (6), (7), published p. 383; CG18 line 3497; CG18, §9.5, published p. 424; CG18 line 5105.)

*Needs:* §1.4; §1.2; TauCetiRoadmap.PadicHodgeTheory §§6.1–6.2; TauCetiRoadmap.LocalGaloisDeformationRings §1.6; TauCetiRoadmap.LocalGaloisDeformationRings §2.21.

### 1.8 The case GL_1: defect l_0 = r_1 + r_2 − 1 and class field theory

Let F be a number field with ζ_p ∉ F and r̄ : G_F → k^× the trivial character. Minimal deformations are the everywhere unramified characters, with universal ring R^unr. For a finite set Q of finite places with N(v) ≡ 1 mod p^N for v ∈ Q, let U_Q ⊂ `A_F^{infty,*}` be the level that is O_v^× at v ∉ Q and the index-p^N subgroup of O_v^× at v ∈ Q, let K∞⁰ = `prod_{v complex}` S¹ be the connected maximal compact subgroup of F_∞^× = (F ⊗ ℝ)^× (the GL_1 case of the K∞⁰ of the Conventions), and let A^0_∞ = ℝ⁺ (the positive reals, ℝ⁺ = (0, ∞)) embedded diagonally at the archimedean places. The arithmetic quotients X_Q = F^×\𝔸_F^×/(K∞⁰ U_Q A^0_∞) of GL_1 have components which are compact tori of dimension l_0 = r_1 + r_2 − 1, and the dimension of the dual Selmer group to be killed exceeds that of the Selmer group by the same l_0. The factor K∞⁰ is part of the quotient: F_∞^×/(K∞⁰ A^0_∞) has dimension r_1 + r_2 − 1, and the units O_F^× ∩ U_Q, of rank r_1 + r_2 − 1 by Dirichlet, act on its identity component as a cocompact lattice; without K∞⁰ the components would have dimension r_1 + 2r_2 − 1. Patching complexes of length l_0 gives R^unr ≅ O[Cl(O_F)(p)], i.e. the p-part of the Hilbert class field corresponds to the p-part of the class group. The argument is circular: the Greenberg–Wiles formula it uses rests on class field theory.

ζ_p ∉ F (otherwise the choice of auxiliary primes fails). The PGL_n formula for l_0 does not specialize to this case; GL_1 has its own l_0 = r_1 + r_2 − 1.

A proof uses the following inputs and comparisons. dim H¹_L(F, F_p) − dim `H^1_{L*}(F, mu_p)` = −(r_1 + r_2 − 1): ArithmeticGaloisDuality R02.5.2. Each component of X_Q has dimension r_1 + r_2 − 1 (AdelicAlgebraicGroups §5.1, whose level U_Q = K_∞ × `prod_v U_{Q,v}` includes the archimedean factor K_∞, a product of r_2 circles, written separately here as K∞⁰, so that the complex circle factors are divided out; the signs at the real places change the component count, not the dimension), so its cohomology lives in degrees [0, l_0]. Taylor–Wiles primes are primes with N(v) ≡ 1 mod p^N at which the Kummer classes of a basis of the dual Selmer group are nontrivial; they exist by Chebotarev because ζ_p ∉ F. The Hecke action on H^0 is through the ray class group by class field theory and propagates to higher degrees by Künneth; patching then identifies R^unr with the group algebra of the p-part of the class group.

**Checks.**

- For F = ℚ(i), Q = ∅ and U = Ô_F^×, the identity component of X_∅ is ℂ^×/(S¹ · ℝ⁺ · μ₄), a point, of dimension 0 = l_0; omitting K∞⁰ = S¹ would give ℂ^×/(ℝ⁺ · μ₄) ≅ S¹, of dimension 1 = r_1 + 2r_2 − 1. For F real quadratic, K∞⁰ is trivial, the identity component of (ℝ^×)²/ℝ⁺ is the line {(x, x⁻¹) : x > 0} with coordinate log x, and the totally positive units act on it as a rank-one lattice: for a fundamental unit ε > 0 of norm −1 the generator is ε², shifting log x by 2 log ε (for norm +1 it is ε itself); the quotient is a circle of dimension 1 = l_0.

- For F = ℚ, l_0 = 0 and the statement is R^unr = O (no unramified p-extension of ℚ).

- For F imaginary quadratic, l_0 = 0 as well; for F real quadratic, l_0 = 1.

- If the class-group p-part is C₃ and O=ℤ₃, the supplied reciprocity identification gives O[C₃] of O-rank 3; its residual augmentation parameter satisfies (t−1)³=0. The number of components is not a free deformation variable.

(CG18, §8.2 and Remark 8.1, published pp. 401–405; CG18 line 4197 and line 4326.)

*Needs:* TauCetiRoadmap.ArithmeticGaloisDuality R02.5.2; TauCetiRoadmap.AdelicAlgebraicGroups §5.1; TauCetiRoadmap.ClassFieldTheory Layers 7 and 11; TauCetiRoadmap.Chebotarev Layer 10.

### Examples

For F imaginary quadratic, n=2, |T|=1 and q=3, the count is g=3+1−1−2−1=0, j=3, dim R_loc=6 and dim R_∞=1+3+3−1=6. For F real quadratic and n=2 it is ℓ₀=0, q₀=2 and g=q+|T|−3.

### Dependencies

Earlier layers 0; TauCetiRoadmap.LocalGaloisDeformationRings §§F.1–F.3, 1.6, 1.10, 1.13, 2.8, 2.10, 2.15–2.16, 2.21 and gap:nonsemisimple-two-scalar-taylor-wiles; TauCetiRoadmap.ArithmeticGaloisRepresentations §§7.2, 7.4 and 7.7–7.12; TauCetiRoadmap.ArithmeticGaloisDuality R02.5.1–R02.5.2 and R02.6.1–R02.6.2; TauCetiRoadmap.GlobalGaloisDeformations §§3.3–3.7, 4.3–4.4, 5.1, 5.5–5.8 and 7.2–7.4; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §§1.12, 3.1–3.4, 3.10, 4.6, 6.1–6.8, 7.3, 7.6, 8.6 and 9.1–9.2; TauCetiRoadmap.AutomorphicFormsOnReductiveGroups Layers 4–6; TauCetiRoadmap.PadicHodgeTheory §6.1; TauCetiRoadmap.AdelicAlgebraicGroups §§4.2 and 5.1; ClassFieldTheory Layers 7 and 11 and Chebotarev Layer 10.

## Layer 2: Strengthened Hecke–Galois hypotheses

### 2.1 Conjecture B, residual and integral Galois representations

For Q, ψ as in §§0.1–0.2 and a maximal ideal m of `T^an_{Q,psi}`, write B^gal(Q, ψ, m) for the residual and completed realization clauses of CG18's Conjecture B, specialized to the simultaneous image, namely: (i) there is a continuous semisimple r̄_m : G_F → GL_n(`T^an_{Q,psi}/m`), unramified outside S_Q, such that for every prime λ ∉ S_Q the characteristic polynomial of r̄_m(Frob_λ) (arithmetic Frobenius) is X^n − `T_{lambda,1}X^{n-1}` + ⋯ + (−1)^i `N(lambda)^{i(i-1)/2}T_{lambda,i}X^{n-i}` + ⋯ + (−1)^n `N(lambda)^{n(n-1)/2}T_{lambda,n}` in (`T^an_{Q,psi}/m`)[X], with the unnormalized `T_{lambda,i}`; that is, m is of Galois type in the sense of IntegralHeckeAndGaloisDeterminants (§3b.1) for this Hecke polynomial; (ii) if r̄_m is absolutely irreducible (m non-Eisenstein), there is a continuous lift r_m : G_F → GL_n(`T^an_{Q,psi,m}`) of r̄_m, unramified outside S_Q, whose characteristic polynomials at Frob_λ, λ ∉ S_Q, are given by the same formula in `T^an_{Q,psi,m}[X]`. It is a hypothesis: a named proposition assumed by the theorems of Layer 5, never asserted.

The unnormalized `T_{lambda,i}` of §0.2 (with operators rescaled by N(λ)⁻ⁱ the exponent would have to be i(i+1)/2). Arithmetic Frobenius; IntegralHeckeAndGaloisDeterminants §3a.1 converts to geometric Frobenius.

A proof uses the following inputs and comparisons. (i) determines r̄_m up to isomorphism by Chebotarev density and Brauer–Nesbitt (IntegralHeckeAndGaloisDeterminants §3b.1, uniqueness). When r̄_m is absolutely irreducible, a lift as in (ii) is unique up to conjugation by the absolutely irreducible trace theorem (LocalGaloisDeformationRings §F.2.7), and is equivalent to a continuous determinant G_F → `T^an_{Q,psi,m}` with the given characteristic polynomials (IntegralHeckeAndGaloisDeterminants §§1.2–1.3).

The specialized interface records the following facts.

- The proposition B^gal(Q, ψ, m), given by: existence of r̄_m (and of r_m when r̄_m is absolutely irreducible) with the stated characteristic polynomials.

- The residual representation r̄_m, unique up to isomorphism. Two maximal ideals of `T^an_{Q,psi}` with the same contraction to `TT^{S_Q}` at which (i) holds have residual representations that become isomorphic over a common extension of their residue fields, since their characteristic polynomials at every λ ∉ S_Q are the images of the same `T_{lambda,i}` modulo m^abs. A maximal ideal of `T_{Q,psi}` is assigned the residual representation of its contraction to `T^an_{Q,psi}`.

- The lift r_m over `T^an_{Q,psi,m}` when m is non-Eisenstein.

- m is non-Eisenstein iff r̄_m is absolutely irreducible; this agrees with the absolute-irreducibility (non-Eisenstein) predicate of IntegralHeckeAndGaloisDeterminants §3b.1.

- det r_m = `epsilon^{n(n-1)/2}` on Frobenius elements, since `T_{lambda,n}` = 1 on PGL_n.

**Checks.**

- With `T_{lambda,i}` replaced by `N(lambda)^{-i}T_{lambda,i}` and the exponent i(i−1)/2 kept, the determinant of r̄_m(Frob_λ) would be `N(lambda)^{n(n-3)/2}` (as `T_{lambda,n}` = 1 on PGL_n), not `epsilonbar^{n(n-1)/2}(Frob_lambda)` = `N(lambda)^{n(n-1)/2}`; for norm 2 in characteristic 7 and n=2 this gives determinant 4 instead of 2; at a norm 1 modulo p the error is invisible, so such a prime alone is not a discriminating test.

- Two representations satisfying (i) for the same m become isomorphic after extension to an algebraic closure of T^an/m.

- For F = ℚ and n = 2, (i) and (ii) hold at every non-Eisenstein m by Eichler–Shimura, Deligne and Carayol.

- For a CM application, a residual realization and a completed realization only modulo a nilpotent ideal satisfy (i) and a quotient version of (ii); the latter does not imply the honest Hecke-ring-valued lift required here.

- At an Eisenstein m with r̄_m = 1 ⊕ ε̄ (n = 2), (i) holds and (ii) is not asked.

(CG18, §9.3, Conjecture B (first paragraph), published p. 414; CG18 line 4684; CGH20, §1, arXiv p. 3 (published appendix p. 882); CGH20 lines 84–93.)

*Needs:* §0.3; §0.2; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §3b.1; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §3a.1; TauCetiRoadmap.LocalGaloisDeformationRings §F.2.7.

### 2.2 Local compatibility and the diamond coordinate

Assume B^gal(Q, ψ, m) with m non-Eisenstein, r̄_m ≅ r̄ ⊗ T^an/m for the r̄ of a standing datum, and Q a set of Taylor–Wiles primes as in §1.6 (Q = ∅ allowed). The strengthened local compatibility requirement B^lgc(Q, ψ, m) consists of the local clauses of CG18's Conjecture B(1)–(3) together with the deck-coordinate clause: (1) for v | p, r_m|G_v is an object of the positive-weight Fontaine–Laffaille problem D_v of §1.2(i), so that its dual has labelled jumps {0, 1, …, n − 1} in LocalGaloisDeformationRings §1.6; (2) for v ∈ Q, r_m|G_v is a lifting of type D_v (r_m|G_v ≅ s_v ⊕ ψ_v with I_v acting by scalars on each summand); (3) for v ∈ R and σ ∈ I_v, the characteristic polynomial of r_m(σ) is ∏_i(X − `psi_{v,i}(Art_v^{-1}(sigma))`); (6) for v ∈ Q and α ∈ O_v^× (α = 1 at the other places), for every K′ ∈ 𝒦_Q, every degree i and every a≥1, the residual deck operator `T_{alpha,1}` acts on Hⁱ_ψ(Y(K′),O/ϖᵃ)_m as the image of the scalar ψ_v(Art_v(α)) in the simultaneous Hecke action at that level. Here the residual deck action is through K_Q/K′, so deck elements in K′ act as 1. Require these equalities naturally for every finite O-module coefficient A, compatible with all O-linear coefficient maps and all level pullback and trace maps.

Clause (6) is not in CG18's Conjecture B; it is the GL(n) analogue of Conjecture A(3), needed for condition (d) of the patching theorem and for the surjection onto T^an including diamond operators. Art_v normalized as in ClassFieldTheory Layer 7 (uniformizers to arithmetic Frobenius); for the standard homology action T_H on the m^*-part, the clause holds with the inverse character. Explicitly T_H(δ) acts by `theta_x(delta^{b_x})^{-1}`. Transporting the cohomological scalar action to its dual uses T_H(δ⁻¹), which acts by `theta_x(delta^{b_x})`; this is the scalar action used in §4.1.

A proof uses the following inputs and comparisons. (1)–(3) are the local compatibility clauses of CG18's Conjecture B; (3) with ψ = 1 says inertia at R acts unipotently. Under the identification K_Q/L_Q ≅ ∏k_x^× of §0.2, `T_{alpha,1}` has class `alpha^{1-n}`, so the all-level equalities in (6) are equalities in the simultaneous image algebra of §0.3 and fix its O[Δ_Q]-action, and p > n makes the `T_{alpha,1}` exhaust the p-part of Δ̃_Q.

The specialized interface records the following facts.

- The proposition B^lgc(Q, ψ, m), equivalent to the conjunction of clauses (1), (2), (3) and (6); each clause is recovered from it and it is assembled from them.

- Clause (6): at every intermediate level and every finite O-coefficient module, the residual deck action of δ equals the image of θ_x(`delta^{b_x}`), with b_x=(1−n)⁻¹ on Δ_x as in §1.4. The equality for a general finite O-module A follows from the cyclic case: A is a finite direct sum of modules O/ϖᵇ, and naturality under all O-linear coefficient maps makes the result independent of the decomposition.

- For Q = ∅ the proposition is the conjunction of (1) and (3).

**Checks.**

- With ψ = 1, clause (3) says r_m(σ) − 1 is nilpotent for σ ∈ I_v, v ∈ R.

- For T=k[ε]/ε², let M_top=k and M_inter=T. Multiplication by ε is zero on M_top and nonzero on M_inter, although ε²=0. For a degree-p cover, cor∘res=p=0 over k supplies no injection. Equality only on the top cover therefore fails the all-level hypothesis; equality on both modules is an equality in their simultaneous image.

- Without clause (6), r_m may be unramified at x ∈ Q while a diamond operator acts nontrivially; then the augmentation ideal of O[Δ_Q] does not map into the image of ker(`R_{S_Q}` → R_S) and condition (d) fails.

- For F = ℚ, n = 2, all clauses hold at non-Eisenstein m by Carayol's local–global compatibility and Fontaine–Laffaille theory for p > 2 at weight two.

- A local compatibility statement only after a nilpotent quotient does not imply clause (1) over the honest completed Hecke ring; clauses (2), (3) and (6) retain the actual inertia and deck actions away from p.

- For n=3, p=5, Δ=C₅, the deck exponent is 3 and its inverse is 2; θ(d³)²=θ(d) while θ(d³)=θ(d)³ is the wrong coordinate.

(CG18, §9.3, Conjecture B(1)–(3), published p. 414; CG18 line 4684; CG18, §5.3, Conjecture A(3), published pp. 374–375; CG18 line 3156.)

*Needs:* §2.1; §1.1; §1.2; TauCetiRoadmap.LocalGaloisDeformationRings §2.16 and gap:nonsemisimple-two-scalar-taylor-wiles; §0.1; §0.2; TauCetiRoadmap.ClassFieldTheory Layers 7 and 11.

### 2.3 Conjecture B(4): vanishing outside [q_0, q_0 + l_0] and on the boundary

For Q, ψ and a maximal ideal m of `T^an_{Q,psi}`, write B^van(Q, ψ, m) for the range and boundary clauses of CG18's Conjecture B(4), extended to every intermediate cover, taking the conjunction, over every level K′ ∈ 𝒦_Q and every a ≥ 1, of: (a) H^i_ψ(Y(K′), O/ϖᵃ)_m = 0 unless q_0 ≤ i ≤ q_0 + l_0; (b) H^i_ψ(∂Y(K′), O/ϖᵃ)_m = 0 for all i, ∂Y(K′) the boundary of the Borel–Serre compactification. Here l_0, q_0 are the invariants of AutomorphicFormsOnReductiveGroups §5.3 for `Res_{F/Q}PGL_n`: l_0 = r_1⌊(n − 1)/2⌋ + r_2(n − 1) and 2q_0 + l_0 = dim Y.

Stated at every intermediate level, matching §0.3. Cohomology of the boundary is localized for the Hecke operators prime to S_Q acting on boundary cohomology (ArithmeticLocallySymmetricSpaces ALS.4).

A proof uses the following inputs and comparisons. (b) and the boundary triangle (ALS.4.1) give H^*_c ≅ H^* after localization. Independently of (b), the universal-coefficient duality of §0.5(3) gives H^i_ψ(Y, O/ϖᵃ)^∨_m ≅ `H_{i,psi^{-1}}(Y, O/varpi^a)_{m^*}`, so (a) is equivalent to the same vanishing for localized homology. By dévissage (§2.6) it suffices to check a = 1.

The specialized interface records the following facts.

- The proposition B^van(Q, ψ, m), equivalent to the conjunction over K′ ∈ 𝒦_Q and a ≥ 1 of the range clause (a) and the boundary clause (b); each clause at each level and coefficient is recovered from it.

- Under (b), `H^*_{c,psi}(Y(K'), O/varpi^a)_m` ≅ H^*_ψ(Y(K′), O/ϖᵃ)_m.

- Without any boundary hypothesis, H^i_ψ(Y, O/ϖᵃ)^∨_m ≅ `H_{i,psi^{-1}}(Y, O/varpi^a)_{m^*}` in every degree (§0.5(3)); hence (a) holds for cohomology at m if and only if it holds for homology at m^*.

**Checks.**

- For l_0 = 0 the range is the single degree q_0 = dim Y/2.

- For F imaginary quadratic and n = 2, dim Y = 3, l_0 = q_0 = 1 and the range is {1, 2}.

- At the Eisenstein ideal with r̄_m = 1 ⊕ ε̄, H^0(Y, k)_m ≠ 0, so (a) fails; (a) is only asked at non-Eisenstein m in the theorems.

- For n = 3, F = ℚ: l_0 = 1, 2q_0 + l_0 = 5, q_0 = 2.

- For F = ℚ and n = 2 (l_0 = 0, q_0 = 1), (a) asks vanishing in every degree other than 1. At p = 3 the unlocalized groupoid cohomology of PSL₂(ℤ) ≅ C₂ ∗ C₃ is 𝔽₃ in every degree ≥ 1, from the C₃ stabilizer (Hⁱ(C₂ ∗ C₃, 𝔽₃) = Hⁱ(C₃, 𝔽₃) for i ≥ 1), so degrees above dim Y = 2 are genuine conditions; once the localized range contract (gap:localized-orbifold-range-duality) gives vanishing above dim Y, the remaining conditions are H^0 = H^2 = 0 at non-Eisenstein m, which hold.

- For F imaginary quadratic and n = 2 (l_0 = 1, q_0 = 1), (a) asks vanishing in every degree outside {1, 2}, including degree 4: H⁴(C₃, 𝔽₃) = 𝔽₃ for a C₃ stabilizer at p = 3, whereas the coarse quotient has no degree-4 cohomology. After the localized range contract of ArithmeticLocallySymmetricSpaces (gap:localized-orbifold-range-duality) under its non-Eisenstein, Galois-type and big-image hypotheses, the remaining conditions are degrees 0 and 3.

- (a) is open in general; (b) follows from Galois representations for the Levi cohomology (ALS.4.12) when those are available.

(CG18, §9.3, Conjecture B(4)(a)–(b), published p. 414; CG18 line 4706; CG18, §8.4, published pp. 405–406; CG18 line 4339.)

*Needs:* §0.3; §0.1; §0.5; TauCetiRoadmap.AutomorphicFormsOnReductiveGroups §5.3; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.2.2; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.4.1; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.4.9.

### 2.4 Conjecture B(5): no new cohomology at Taylor–Wiles level

For Q a set of Taylor–Wiles primes, a maximal ideal m of T at level K_∅(R) with residual representation r̄, and the selected roots α_x of §0.4, write B^tw(Q, ψ, m) for the comparison of CG18's Conjecture B(5) with the selected-factor projection made explicit: for every a ≥ 1 the composite of pr^*, e_Q and the projection onto the m_Q-part, H^*_ψ(Y, O/ϖᵃ)_m → `H^*_psi(Y_0(Q), O/varpi^a)_{m_Q}`, is an isomorphism, where the source is the localization at m as a T-module, m_Q = (m^Q, V_x − α̃_x) is the selected maximal ideal of `T_{Q,psi}` attached to m^Q (§§0.3–0.4; the unit ideal only when the target is zero), pr : Y_0(Q) → Y is the natural projection and e_Q = `lim_{k->infty}` `prod_{x in Q}` `QTilde_x(V_x)^{k!}` is the Taylor–Wiles projector of §0.4, with Q̃_x a lift of Q_x to O[X].

Q a set of Taylor–Wiles primes (each ψ̄_x one-dimensional, N(x) ≡ 1 mod p). Projector with exponent k!, not n.

A proof uses the following inputs and comparisons. Both sides are finite O-modules with the common `TT^{S_Q}`-action of §0.3; the auxiliary side additionally carries the V_x and the diamond operators, which act trivially on Y_0(Q), and the base side carries the `T_{x,i}`, x ∈ Q, which do not act at level K_Q. The map e_Q ∘ pr^* is `TT^{S_Q}`-equivariant, because pr^* is (§0.2) and e_Q is a limit of polynomials in the V_x, which commute with the `T_{lambda,i}`. By dévissage (§2.6) it suffices to check a = 1.

The specialized interface records the following facts.

- The proposition B^tw(Q, ψ, m).

- The map e_Q ∘ pr^* followed by the projection onto the m_Q-part.

- For Q = ∅ the proposition holds.

- For an iterated family of single-prime comparisons at successive base levels, their composites give the comparison for Q; forgetting a prime without such identifications is not an assertion about arbitrary unrelated Hecke ideals.

**Checks.**

- For Q = ∅ the map is the identity, so the proposition holds for every m.

- pr^* alone is not an isomorphism onto H^*_ψ(Y_0(x), O/ϖᵃ)_m for n = 2: the m-part contains the two degeneracy images H^*(Y)²_m (ALS.3.14).

- For n = 2 the two old eigenvalues of V_x on H^*(Y)² are α_x and β_x, and e_Q selects the α_x-line.

- For n = 2 the hypothesis holds at every Taylor–Wiles prime (Lemma 9.6, §3.5).

- Under the local admissibility and principal-series block hypothesis on the smooth tower at x, the GLₙ analogue holds for distinct residual roots (§3.6). Its Res PGLₙ version (§3.7) requires the corresponding block hypothesis at every successive base level.

(CG18, §9.3, Conjecture B(5), published pp. 414–415; CG18 line 4710; CG18, §9.3, discussion after Remark 9.5, published p. 416; CG18 line 4764.)

*Needs:* §0.4; §0.3; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.1.8.

### 2.5 Conjecture B for a standing datum (the hypothesis bundle)

For a standing datum and a maximal ideal m of T at level K_∅(R) with r̄_m ≅ r̄, the strengthened package ConjB(Q, ψ, m) is B^gal ∧ B^lgc ∧ B^van at (Q, ψ, m^Q) together with B^tw(Q, ψ, m): the first three clauses are imposed at the maximal ideal m^Q of `T^an_{Q,psi}` attached to m in §0.3 (for Q = ∅ it is m itself when ψ = 1 and its transport of §0.5(2) when ψ = χ; when m^Q is the unit ideal every localized module of Layer 4 is zero and the clauses are empty), whose residual representation is r̄_m ⊗ k(m^Q) since both have the characteristic polynomials given by the `T_{lambda,i}` modulo m^abs at every λ ∉ S_Q; B^tw is stated at the base ideal m with the selected roots of §0.4. The hypothesis of §5.4 is ConjB(Q, ψ, m) for Q = ∅ and for each set Q_N of the chosen Taylor–Wiles system, with ψ = 1 and ψ = χ. 'Conjecture B for F' means ConjB for every standing datum over F, every Taylor–Wiles set and both character data. The conjunction omitting B^van is a strengthened version of the hypothesis used in CGH20 Theorem 1.2: it adds the all-level, all-finite-coefficient inertia–diamond equalities, which CGH20 does not explicitly assume.

Clause (6) of §2.2 is included. Intermediate levels are included in B^gal and B^van, and in every coefficient action of B^lgc(6).

A proof uses the following inputs and comparisons. The bundle is the conjunction of the four named predicates; each theorem of Layers 4–5 names exactly the clauses it uses.

The specialized interface records the following facts.

- The bundled proposition ConjB(Q, ψ, m), equivalent to B^gal ∧ B^lgc ∧ B^van at m^Q together with B^tw at m: each of the four clauses is recovered from it and it is assembled from them.

- Conjecture B for F, the conjunction of ConjB over every standing datum over F, every Taylor–Wiles set and ψ ∈ {1, χ}.

- The conjunction without B^van, strengthening the CGH20 hypothesis by clause (6) at every level and finite coefficient module.

- Restriction to a subset uses the chosen level and Hecke identifications and the corresponding conjectural clauses there; no implication between unrelated localized algebras is asserted.

**Checks.**

- For Q = ∅, ConjB(∅, ψ, m) ↔ B^gal ∧ (1) ∧ (3) ∧ B^van: the extra local clauses are (1) and (3), the vanishing clauses are those of (4), and the residual and completed Galois realization clauses remain.

- For F = ℚ, n = 2 and non-Eisenstein m, every clause of ConjB holds for every Taylor–Wiles set (classical theory and Lemma 9.6).

- ConjB(∅, 1, m) fails at the Eisenstein ideal of level one over ℚ (B^van(a) fails in degree 0).

- For T=k[ε]/ε² with M_top=k and M_inter=T, a scalar discrepancy ε acts by 0 on M_top and by ε on M_inter. Agreement on the top cover alone accepts ε, whereas the all-intermediate-level clause (6) of the bundle rejects it since ε·1=ε≠0 on M_inter; the all-level clause is what the bundle without B^van adds to the CGH20 hypothesis.

- CGH20 uses its Theorem 3.2 for the auxiliary-level range. The conditional comparison of §3.7 supplies that step only with its principal-series block hypothesis at every successive base level; distinct roots alone do not assert that hypothesis.

(CG18, §9.3, Conjecture B, published pp. 414–415; CG18 line 4684; CG18, §9.5, published pp. 424–425; CG18 line 5111; CGH20, §1 and §4, arXiv pp. 3, 7–8; CGH20 line 287.)

*Needs:* §2.1; §2.2; §2.3; §2.4.

### 2.6 Dévissage for Conjecture B(4) and (5)

For fixed (Q, ψ, m), clause (a) and clause (b) of B^van, and B^tw, hold for all coefficients O/ϖᵃ (a ≥ 1) if and only if they hold for a = 1, that is with coefficients k = O/ϖ.

Localization at m is exact on finite T-modules. The maps in B^tw are natural in the coefficient module.

A proof uses the following inputs and comparisons. Use the exact sequences 0 → `O/varpi^{a-1}` → O/ϖᵃ → k → 0 and the long exact cohomology sequences, which are Hecke equivariant and remain exact after localization (ALS.1.7, ALS.4.9). Vanishing for k and `O/varpi^{a-1}` gives vanishing for O/ϖᵃ; for B^tw apply the five lemma to the map of long exact sequences given by e_Q ∘ pr^*. The converse direction is the case a = 1.

**Checks.**

- For B^van the argument needs only exactness; for B^tw the naturality of e_Q ∘ pr^* in the coefficients.

- For the coefficient diagram k→O/ϖ²→k, an isomorphism in every cohomological degree gives an isomorphism on the middle long exact sequence. A single isolated degree does not suffice: in the complex O --ϖ→ O in degrees 0 and 1, integral H⁰ is 0 while residual H⁰ is k; the neighboring connecting map accounts for the new class.

- For C = [O --ϖ²→ O] in degrees 0, 1, H⁰(C ⊗ O/ϖᵃ) has length min(a, 2), at most a times the dimension 1 of H⁰(C ⊗ k), as the exact sequences force; the same bound makes vanishing for k imply vanishing for every a.

(CG18, §9.3, paragraph after Conjecture B, published p. 415; CG18 lines 4741–4743.)

*Needs:* §2.3; §2.4; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.1.7; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.4.9.

### 2.7 Conjecture B gives `R_{S_Q}` ↠ `T^an_{Q,psi,m}` as O[Δ_Q]-algebras

Let a standing datum be given, Q a Taylor–Wiles set, ψ ∈ {1, χ}, and m a maximal ideal of `T^an_{Q,psi}` with r̄_m ≅ r̄; in the application m is the ideal m^Q of §0.3 attached to the base maximal ideal of T, which for Q = ∅ is that ideal (ψ = 1) or its transport of §0.5(2) (ψ = χ). Assume B^gal and B^lgc at (Q, ψ, m), and ξ = `epsilon^{n(n-1)/2}`. Then r_m is a deformation of r̄ of type S_Q (ψ = 1) or S^χ_Q (ψ = χ), and the induced map `R_{S_Q}` → `T^an_{Q,1,m}` (resp. `R_{S^chi_Q}` → `T^an_{Q,chi,m}`) is a surjection of O[Δ_Q]-algebras: it sends tr ρ^univ(Frob_λ) to `T_{lambda,1}` and the inertial character at x ∈ Q to the diamond action. It is compatible with the maps between intermediate levels in 𝒦_Q and, for Q = ∅, gives R_S ↠ T_m and `R_{S^chi}` ↠ `T_{chi,m}`.

ξ = `epsilon^{n(n-1)/2}`. Clause (6) for the Δ_Q-linearity.

A proof uses the following inputs and comparisons. Clauses (1)–(3) of B^lgc and det r_m = `epsilon^{n(n-1)/2}` (from `T_{lambda,n}` = 1 and Chebotarev) show r_m is of type S_Q or S^χ_Q (§1.4). The image of `R_{S_Q}` is the closed O-subalgebra generated by the coefficients of the characteristic polynomials of r_m(Frob_λ), which are the `T_{lambda,i}`; these generate `T^an_{Q,psi,m}` together with the diamond operators. Clause (6) identifies these operators with the inertial scalars in every defining cohomology action, hence in the simultaneous image algebra itself; the image therefore contains the diamonds and the map is O[Δ_Q]-linear. Its natural finite-coefficient and level-map equalities give the same conclusion with every finite O-module coefficient; away-from-S_Q Hecke equivariance supplies the remaining level compatibility.

**Checks.**

- For Q = ∅ this is R_S ↠ T_m, used in Theorem 9.19.

- Without (6) only the subalgebra generated by the `T_{lambda,i}` is hit, and the surjection onto `T^an_{Q,psi,m}` can fail.

- With ψ = χ the map lands in `T^an_{Q,chi,m}` and its reduction mod ϖ agrees with the ψ = 1 map under §0.5.

(CG18, §9.3, sentence after Conjecture B(5), published p. 415; CG18 line 4710; CG18, §9.5, published p. 426; CG18 line 5164.)

*Needs:* §2.1; §2.2; §1.4; §0.3; §0.5.

### 2.8 Conjecture B(4)(a) in small rank (Remark 9.3)

Let m be a non-Eisenstein maximal ideal at which B^gal and B^van(b) hold, with localized cohomology zero outside 0≤i≤d=dim Y and finite-level adjoint duality. In the standing big-image applications the total-degree bound and duality are supplied independently of B^van(a) by ArithmeticLocallySymmetricSpaces gap:localized-orbifold-range-duality; they are not inferred from the narrow range being proved. (1) For F imaginary quadratic and n = 2 (dim Y = 3, l_0 = q_0 = 1), H^0(Y(K′), O/ϖᵃ)_m = H^3(Y(K′), O/ϖᵃ)_m = 0 for every level, so B^van(a) holds. (2) For n = 3, F = ℚ ((q_0, l_0) = (2, 1), d = dim Y = 5) and for n = 2 with F a CM field of degree 4 ((q_0, l_0) = (2, 2), d = 6), with p > n unramified in F as in the standing data, suppose also that B^gal holds at the dual maximal ideal m^* and that m^* is non-Eisenstein. Then H^i(Y(K′), O/ϖᵃ)_m = 0 for i ∈ {0, 1, d − 1, d} and every level K′, so B^van(a) holds.

Boundary vanishing at m (B^van(b)) for the step from H_c to H, or ArithmeticLocallySymmetricSpaces ALS.4.12 where Galois representations of the Levi factors are available. For (2): p > n unramified in F, so p ∤ #μ(F); the congruence-kernel character factorization in the rank-three and positive-unit-rank rank-two cases is KTheoryLowDegrees §11.6, and the localized H⁰/H¹ vanishing enters through ArithmeticLocallySymmetricSpaces gap:congruence-character-localized-h1. In both cases of (2), G(ℝ) = PGL_3(ℝ) or PGL_2(ℂ)² is connected, so Y(K′) is orientable and Poincaré duality needs no orientation twist.

A proof uses the following inputs and comparisons. (1) H^0 at a non-Eisenstein m vanishes because H^0(Y, k) is spanned by component classes on which `T_{lambda,1}` acts by a degree (Eisenstein eigenvalues); H^3 = H^3_c (boundary vanishing) is dual to H^0 at m^*. (2) ArithmeticLocallySymmetricSpaces gap:congruence-character-localized-h1, using KTheoryLowDegrees §11.6, gives H^0(Y(K′), k)_m = H^1(Y(K′), k)_m = 0 at every level for a non-Eisenstein m, and likewise at m^*: a finite central congruence kernel of order prime to p makes every mod-p character of the lattices congruence, and the finite-cover Hochschild–Serre sequence then places it in Eisenstein-supported H^0. Poincaré duality (ALS.5a.2 and ALS.5a.4, with adjoint Hecke action sending m to m^*) identifies `H_c^{d-i}(Y, k)_m` with the dual of `H^i(Y, k)_{m^*}`, which vanishes for i = 0, 1; boundary vanishing at m (ALS.4.1) identifies `H_c^{d-i}` and `H^{d-i}` after localization. The degrees outside [q_0, q_0 + l_0] are 0, 1, d − 1, d; dévissage (§2.6) passes from k to O/ϖᵃ.

**Checks.**

- For F imaginary quadratic the proof needs no congruence subgroup property (CG18 Lemma 5.9(1)); H^1 and H^2 lie in the range [1, 2] there.

- For n = 2 and F real quadratic, l_0 = 0 and q_0 = 2 (Hilbert modular surfaces), which is not covered.

- For PGL₃/ℚ, d=5 and [q₀,q₀+ℓ₀]=[2,3], so the excluded degrees are 0,1,4,5. For a CM quartic PGL₂ quotient, d=6 and the range is [2,4], so they are 0,1,5,6. The degree d−1 is not q₀−1.

(CG18, §9.3, Remark 9.3, published p. 415; CG18 line 4744; CG18, §5.3.1, Lemma 5.9(1), published p. 376; CG18 line 3235.)

*Needs:* TauCetiRoadmap.ArithmeticLocallySymmetricSpaces gap:localized-orbifold-range-duality; §2.3; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.5a.2–ALS.5a.6; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.4.1; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.4.12; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces gap:congruence-character-localized-h1, using TauCetiRoadmap.KTheoryLowDegrees §11.6; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.5a.4; §2.1; §2.6.

### Examples

For the two-term exact coefficient sequence 0→O/ϖ→O/ϖ²→k→0, the long exact cohomology sequence propagates vanishing outside an interval and an isomorphism in every degree. A claim in a single isolated degree lacks this implication because its neighboring connecting maps remain.

### Dependencies

Earlier layers 0–1; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §§1.2–1.3, 2.1–2.3, 3a.1 and 3b.1–3b.2; TauCetiRoadmap.GlobalGaloisDeformations §§3.3–3.7, 4.3–4.4, 5.1, 5.5–5.8 and 7.2–7.4; TauCetiRoadmap.LocalGaloisDeformationRings §§F.1–F.3, 1.6, 1.10, 1.13, 2.8, 2.10, 2.15–2.16, 2.21 and gap:nonsemisimple-two-scalar-taylor-wiles; ClassFieldTheory Layers 7 and 11 and Chebotarev Layer 10; TauCetiRoadmap.AutomorphicFormsOnReductiveGroups Layers 4–6; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.0.7–ALS.0.10, ALS.1.1–ALS.1.8, ALS.2.2–ALS.2.4, ALS.3.3–ALS.3.9 and ALS.3.14, ALS.4.1 and ALS.4.9–ALS.4.12, ALS.5a.2–ALS.5a.6, ALS.5b.4–ALS.5b.6, ALS.6.1–ALS.6.3; TauCetiRoadmap.KTheoryLowDegrees §11.6.

## Layer 3: Taylor–Wiles level comparison

### 3.1 Reduction from PGL₂ to determinant-square arithmetic groups

Let n=2 and p odd. Let PGL₂(F)⁺ be the subgroup of PGL₂(F) whose determinant, defined modulo squares, is positive at every real place, and ℋ⁺ the component of G(ℝ)/K∞⁰ that it preserves. Let Y=⊔_c Γ_c∖ℋ⁺ be the arithmetic-groupoid component decomposition, indexed by c ∈ PGL₂(F)⁺∖PGL₂(𝔸_F^∞)/K, with representatives a_c and Γ_c=PGL₂(F)⁺∩a_cKa_c⁻¹ (ALS.0.7 for the connected variant of ALS.0.4). Define Γ_c¹=Γ_c∩PSL₂(F), the kernel of det:Γ_c→`F_{>0}^x / (F^x)^2`, where `F_{>0}^x` is the group of totally positive elements. Then Φ_c=Γ_c/Γ_c¹ is a finite elementary abelian 2-group. For every a≥1 and coefficient module M_c obtained by restricting O(ψ)⊗O/ϖᵃ to this component, restriction gives H*(Γ_c,M_c)≅H*(Γ_c¹,M_c)^Φ_c. At Iwahori level use Γ_c,e¹=Γ_c,e∩PSL₂(F) and its own determinant quotient. These identifications are natural for level restrictions, coefficient transport, conjugation and Hecke correspondences; when a correspondence permutes components its source and target are retained.

The determinant kernel is taken in PGL₂(F)⁺; the positivity condition is retained in every conjugation, level and Hecke map, so the determinant quotient never contains a class negative at a real place. Its local integral description uses the actual lattices a_c,vO_v² at every place, rather than the standard O_F². Finiteness of Φ_c follows because determinant square classes of an arithmetic group have valuation parity supported on a fixed finite set: the corresponding S-unit square classes and class-group 2-torsion are finite. The quotient has exponent 2 by its embedding in Fˣ/Fˣ². Since its order is invertible in O/ϖᵃ, finite-group Hochschild–Serre degenerates to invariants. Apply the natural restriction, conjugation and transfer maps to the determinant kernels and their finite quotients before taking invariants. (CG18, proof of Lemma 9.6, p.417; CG18 line 4815; the integral intersection at CG18 line 4823 is replaced by the determinant kernel.)

The specialized interface records the following facts.

- Γ_c¹ is normal in Γ_c and Φ_c is its finite determinant-square-class image.
- Restriction identifies component cohomology with Φ_c-invariants, also with O(ψ) coefficients.
- The identification is natural for the actual source and target components of each level correspondence, with their transported coefficient modules.

**Checks.**

- For F=ℚ and K maximal, Γ=PGL₂(ℚ)⁺∩PGL₂(ℤ)=PSL₂(ℤ), so Γ¹=Γ and Φ=1, and the component cohomology H²(PSL₂(ℤ),𝔽₃)=H²(C₃,𝔽₃)=𝔽₃ is kept. The full group PGL₂(ℤ), the component group for the full maximal compact, would give the abstract quotient PGL₂(ℤ)/PSL₂(ℤ)=C₂, whose determinant −1 acts by −1 on H²(C₃,𝔽₃), with invariants 0.
- For F=ℚ(√3) and K maximal, the unit u=2+√3 is totally positive and u=(1+√3)²/2 with 2 not a square in F, so diag(u,1)∈Γ has a nonsquare totally positive determinant and Φ≠1; diag(−1,1) has determinant negative at both real places and is not in Γ.
- Put h=diag(2,1) and Γ=hPSL₂(ℤ)h⁻¹. For A=(1,2;0,1) and γ=(1,0;1/2,1), γAγ⁻¹=(0,2;−1/2,2). Thus Γ∩PSL₂(ℤ) is not normal; it has index 3. All elements of Γ have square determinant, so the defined Γ¹ is Γ, Φ=1, and restriction is the identity.
- For a C₂-quotient over 𝔽₃, averaging under the swap is (a,b)↦((a+b)/2,(a+b)/2). Over 𝔽₂, H¹(C₂,k)=k survives and the asserted degeneration fails; odd p is essential.

*Needs:* TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.0.4, ALS.0.7 and ALS.1.1; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.6.2; §0.1.

### 3.2 Component-indexed S-arithmetic amalgams at every auxiliary prime

Let n=2, x∉S a Taylor–Wiles prime, K_x=PGL₂(O_x), and q=N(x). Let ϖ_x be a local uniformizer and t_x the finite adelic element equal to diag(1,ϖ_x) at x and 1 away from x. No generator of the ideal x is chosen. For a component represented by a, let c₀=[a] and c₁=[at_x] at level K. Let H_a¹ be the subgroup of PSL₂(F) satisfying a_v⁻¹γ_va_v∈K_v at every finite v≠x, with the same real-component condition as Γ_c. On the local tree let v₀=a_x[O_x²] and v₁=a_xt_x[O_x²]. Set Γ_a,0¹=`Stab_{H_a^1}(v_0)`, Γ_a,1¹=`Stab_{H_a^1}(v_1)`, and Γ_a,e¹=Γ_a,0¹∩Γ_a,1¹. The component-indexed amalgam target is the canonical isomorphism `Gamma_{a,0}^1 *_{Gamma_{a,e}^1} Gamma_{a,1}^1 -> H_a^1`, with both maps from the edge group the actual inclusions.

The first vertex is the determinant kernel of the component c₀ at K, the second that of c₁ at K, and the edge that of the component represented by a at K₀(x). The two maps from this edge component have targets c₀ and c₁: adelically they are pr₀:[z,g]↦[z,g] and pr₁:[z,g]↦[z,gt_x]. Since t_x is 1 on R, pr₀*O(ψ) and pr₁*O(ψ) identify with O(ψ) on the edge. Fix those identifications: if at_x=γa_dκ with γ∈PGL₂(F)⁺ and κ∈K, transport the second stabilizer by h↦γ⁻¹hγ to component d=c₁ and transport its coefficient fibre by the prescribed κ_R-action of O(ψ). The coefficient characters agree because ψ(κ_R⁻¹uκ_R)=ψ(u); retain this intertwiner in both pullback and trace. Thus pullback has sources H*(Γ_a,0¹,M_a) and H*(Γ_a,1¹,M_a) and target H*(Γ_a,e¹,M_a), where M_a is the restriction to H_a¹ of the away-from-x character ψ through a⁻¹γa. This coefficient module extends across the entire amalgam. For all components, c↦c₁ is the ray-class translation induced by t_x; each vertex family is a reindexing of the full component family.

For invariant descent, define Ĥ_a to be the subgroup of PGL₂(F)⁺ (§3.1) with the same away-from-x level and even x-adic determinant valuation. Its determinant kernel is H_a¹, and Φ_a=Ĥ_a/H_a¹ is a finite elementary 2-group. Since H_a¹ is transitive on edges and on each vertex type, each stabilizer in Ĥ_a surjects onto Φ_a; its kernel is the corresponding stabilizer in H_a¹. Thus the two vertex and edge determinant quotients identify with the same Φ_a, acting on the full chain sequence. Their invariants are precisely the arithmetic component cohomologies in §3.1.

A proof uses strong approximation for SL₂ in the finite adeles with the fixed away-from-x compact open, and the local adjacent-vertex amalgam: H_a¹ acts without inversion, with a single edge as quotient and with exactly the displayed stabilizers. Apply the tree structure theorem and the segment pushout theorem. The statement is the all-component extension of the principal-ray-class argument of CG18, proof of Lemma 9.6 and Remark 9.7, pp.417–418; CG18 line 4827 and line 4875. The extension, including its coefficient intertwiners, is owned here.

The specialized interface records the following facts.

- The groups H_a¹, Γ_a,0¹, Γ_a,1¹ and Γ_a,e¹, the two inclusions, and their pushout isomorphism.
- The two edge-to-vertex component maps pr₀ and pr₁ and their O(ψ) pullbacks; all representative changes intertwine the maps.
- The common determinant quotient Φ_a acts on the amalgam sequence, with the two vertex and edge quotients identified as above. Both vertex-to-edge indices are q+1. The two vertex types are not identified within the type-preserving group H_a¹.

**Checks.**

- For F=ℚ, a=1 and K maximal, the vertices have stabilizers PSL₂(ℤ) and hPSL₂(ℤ)h⁻¹ for h=diag(1,ℓ), their edge stabilizer is Γ₀(ℓ)∩PSL₂(ℤ), and H_a¹=PSL₂(ℤ[1/ℓ]). The indices are ℓ+1.
- If x=(π_x) is trivial in the relevant ray class group, the representative changes identify the two vertex groups by h=diag(1,π_x), and the second inclusion in the two-copy presentation is γ↦h⁻¹γh. The element diag(π_x,π_x⁻¹), when compatible with the away level, moves distance 2; it is not the adjacent vertex map.
- In ℚ(√−5), x=(7,3+√−5) has norm 7. For b=0, a²=7 has no integral solution; for b=±1 it gives a²=2, and |b|≥2 gives a²+5b²≥20. Thus x is nonprincipal. With p=3, 7≡1 and the local roots i,−i in 𝔽₉ have product 1 and squares −1=2. The two component stabilizers and the local t_x exist, with index 8, without any global π_x.
- For F=ℚ and maximal away level, determinants in Ĥ_a lie in `±ℓ^{2ℤ}` modulo squares and positivity leaves only squares, so Φ_a=1 and Ĥ_a=H_a¹=PSL₂(ℤ[1/ℓ]); the vertex and edge invariants are the whole groups. Admitting determinant −1 would add a C₂ acting by −1 on H²(C₃,𝔽₃) and lose that class.
- For PGL₂(ℚ_ℓ), diag(1,ℓ) has odd determinant valuation and exchanges the two vertex types. The determinant-square group preserves them; using the full PGL₂ group would invalidate this segment quotient.

*Needs:* §3.1; §0.1; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.0.7 and ALS.3.3–ALS.3.9; TauCetiRoadmap.ReductiveGroupsPartII RG2.2.4; TauCetiRoadmap.AdelicAlgebraicGroups §4.2; TauCetiRoadmap.FreeGroupsAndLimitGroups §§4.5 and 4.8; Mathlib `Monoid.PushoutI`.

### 3.3 The squared operator on the sum of components

Use all component and coefficient data of §3.2. Let s_x be the adelic element diag(ϖ_x,1) at x and 1 away from x. On the direct sum of all K₀(x)-component cohomologies with O(ψ)⊗O/ϖᵃ coefficients, let V_x be its unnormalized cohomological Iwahori correspondence `p_{1*} c_{s_x} p_2^*` of §0.2 and U_x=q⁻¹V_x. ArithmeticLocallySymmetricSpaces ALS.3.14 writes U_x for the unnormalized V_x, with characteristic polynomial X²−T_xX+q on the old space; since q ≡ 1 mod p, the ideal (m, V_x − α̃_x) equals (m, U_x − α̃_x) for both normalizations. Define `U_{x^2}`=q⁻² times the correspondence of s_x², equivalently of diag(ϖ_x,ϖ_x⁻¹) locally. Positive Iwahori composition gives U_x²=`U_{x^2}`. These correspondences include their maps between components, rather than acting separately on every component.

The compatible squared-operator target on the sum of the amalgam sequences is the tree-chain extension of §3.4. Its unnormalized action on each H*(H_a¹,M_a) is 1, and its normalized action is q⁻². Indeed the determinant of s_x² is locally a square, so the resulting component translation is trivial; its action on the type-preserving tree is transported within the H_a¹ edge orbit by strong approximation. The coefficient intertwiner is the one of §3.2, not an unmarked identification. This construction requires neither a global uniformizer nor an element diag(π_x,π_x⁻¹) in the arithmetic group. In the principal-ray-class case with such an element g∈H_a¹, it agrees with the identity bare double coset H_a¹gH_a¹=H_a¹; the augmentation of the chain map is still what fixes the extension to the whole sequence.

The specialized interface records the following facts.

- V_x, U_x and `U_{x^2}` on the full component sum, with the source and target component transports and O(ψ) intertwiners.
- U_x²=`U_{x^2}`, and V_x²=q²`U_{x^2}`≡`U_{x^2}` modulo ϖ because q≡1 modulo p.
- On each amalgam cohomology term the compatible operator is q⁻², so `U_{x^2}`−1 is nilpotent modulo ϖᵃ. The denominator is a unit since x∤p.

**Checks.**

- On the old summand, roots a,b of X²−T_xX+q give V_x-eigenvalues a,b, U_x-eigenvalues a/q,b/q and `U_{x^2}`-eigenvalues a²/q²,b²/q². Modulo ϖ they are α²,β² for the squared operator.
- In the principal case, the unnormalized edge correspondence has degree q² on H⁰ of an edge stabilizer with trivial coefficients, while the augmentation action on H⁰(H_a¹) is 1. For q=7 over ℤ/9, q²=4 and q⁻²=7. The normalized edge degree is 1 and the normalized augmentation is 7, not 1.
- For the nonprincipal norm-7 ideal in §3.2, s_x and s_x² are adelic correspondences. V_x transports components, while its square has trivial component translation; on the amalgam term over 𝔽₃ its scalar is 7⁻²=1 and over ℤ/9 it is 7. The local roots i,−i have α²−1=β²−1=1 in 𝔽₉.
- At a selected root α with α²≠1, `U_{x^2}`−1 is a unit on the selected edge localization. At roots 1,1 it is not: its residual value is 0.

(CG18, proof of Lemma 9.6 and Remark 9.7, p.418; CG18 line 4843 and line 4875; the augmentation normalization is established by §3.4.)

*Needs:* §3.2; §0.2; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.3.5 and ALS.3.8.

### 3.4 The component-indexed Hecke-equivariant Lyndon comparison

For each amalgam of §3.2 and M_a=O(ψ)⊗O/ϖᵃ with its specified H_a¹-action, prove the natural long exact sequence ⋯→Hⁱ⁻¹(Γ_a,e¹,M_a)→Hⁱ(H_a¹,M_a)→Hⁱ(Γ_a,0¹,M_a)⊕Hⁱ(Γ_a,1¹,M_a)→Hⁱ(Γ_a,e¹,M_a)→Hⁱ⁺¹(H_a¹,M_a)→⋯. The vertex-to-edge map is res₀−res₁, using the actual inclusions and the coefficient intertwiners of §3.2. Taking the full component sums and the finite determinant-quotient invariants of §3.1 gives the two degeneracy copies of Hⁱ_ψ(Y,O/ϖᵃ) and Hⁱ_ψ(Y₀(x),O/ϖᵃ). The resulting sequence is equivariant for away-from-x Hecke correspondences and the squared operator of §3.3, with source and target component labels transported along every correspondence. Where `U_{x^2}`−1 is invertible, its adjacent amalgam terms vanish, giving the middle isomorphism. No principal-ideal hypothesis occurs.

The tree is connected and acyclic. Its augmented oriented chains give 0→ℤ[H_a¹/Γ_a,e¹]→ℤ[H_a¹/Γ_a,0¹]⊕ℤ[H_a¹/Γ_a,1¹]→ℤ→0. This sequence is ℤ-split; applying Hom_ℤ(−,M_a), then group cohomology and Shapiro's isomorphism, gives the displayed long exact sequence with the stated coefficient action. The component intertwiners give its naturality, and taking invariants under the finite 2-groups is exact for odd p.

The compatible squared operator is defined on this chain sequence. Orient e from the second vertex v₁ to the first v₀. Send e to the sum of the q² oriented terminal edges of length-three paths starting with e and never reversing direction; this is the direction of s_x²=diag(ϖ_x²,1). Write A₁(v), A₂(v) for sums of vertices at distances one and two. The vertex maps are F(v₁)=A₁(v₁)−qv₁ and F(v₀)=A₂(v₀)−qA₁(v₀)+v₀. The boundary of the edge sum is A₂(v₀)+v₀−A₁(v₁)−qA₁(v₀)+qv₁=F(v₀)−F(v₁). The vertex augmentations are q+1−q=1 and q(q+1)−q(q+1)+1=1. All maps are H_a¹-equivariant. Precomposition on Hom_ℤ(−,M_a), followed by group cohomology, induces the positive cohomological operator `p_{1*} c_{s_x^2} p_2^*` of §0.2: at a source edge it sums cochain values on the forward terminal edges. This uses the coefficient transport of §3.2; the augmentation map is the identity of M_a. Multiplying the chain map by q⁻² gives augmentation q⁻². Since q≡1 modulo p, q⁻²−1 is nilpotent modulo ϖᵃ, and localization at `U_{x^2}`−1 kills every amalgam term.

The specialized interface records the following facts.

- The coefficient Lyndon sequence for the two actual vertex groups and edge group at every component, with its restriction and connecting maps.
- Its equivariance after summing components and taking the common determinant-quotient invariants, using all specified coefficient intertwiners.
- The selected-root middle isomorphism when α²≠1, since `U_{x^2}`−1 then has residual value α²−1 on that localization.

**Checks.**

- For a principal ray-class prime, identify the second vertex with the first by h as in §3.2: res₁ becomes restriction after conjugation by h. For F=ℚ at principal level N≥3, this is the sequence of ModularCurvesPartII §15.4.
- With a_x=1, v₀=[O_x²] and v₁=[O_x⊕ϖ_xO_x], the local element s_x=diag(ϖ_x,1) sends v₁ to v₀. Its square sends the oriented edge v₁→v₀ to the terminal edge of the path v₁→v₀→s_xv₀→s_x²v₀, of length 3. Reversing the initial orientation instead selects the opposite squared correspondence. The boundary is terminal vertex minus initial vertex, so the cohomology difference is res₀−res₁.
- On that length-three path let e⁺ be its terminal oriented edge and let f be the edge cochain `delta_{e_plus}`. Precomposition by the positive chain map gives (F^*f)(e)=1. The inverse squared correspondence moves two steps backwards and gives 0 at e for this f. Thus the forward edge sum realizes the positive cohomological correspondence; using forward pushforward on cochains would select the inverse.
- For q=7 the vertex augmentations are 8−7=1 and 56−56+1=1; the edge sum has 49 terms. Modulo 9 the normalized vertex augmentations are 7 and the normalized edge degree is 49·7=1. These values do not depend on whether the norm-7 ideal is principal.
- With p=3 and the nonprincipal norm-7 ideal, roots i,−i have α²=2 and α²−1=1 in 𝔽₉. The amalgam scalar is 1, so its `U_{x^2}`−1 action is 0; localization at the edge’s unit therefore kills the adjacent amalgam groups. Both vertex groups remain present with their actual component labels.
- Localization at the anaemic ideal alone need not invert `U_{x^2}`−1: a summand with U_x=1 has residual squared-operator difference 0. The selected-root projection is essential.

(CG18, proof of Lemma 9.6, p.418; CG18 line 4843. This is the all-component, O(ψ)-coefficient extension of that argument.)

*Needs:* §3.2; the Iwahori correspondence and normalization of §3.3; §3.1; TauCetiRoadmap.ReductiveGroupsPartII RG2.2.4; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.3.3–ALS.3.9; Mathlib `groupCohomology.coindIso`; TauCetiRoadmap.ModularCurvesPartII §15.4 (only the principal-level case over ℚ).

### 3.5 Lemma 9.6: condition (5) of Conjecture B for n = 2

Let n = 2, p > 2, Q a set of Taylor–Wiles primes and m a maximal ideal of T at level K_∅(R) with B^gal(∅, ψ, m) and r̄_m ≅ r̄. For x ∈ Q let α_x, β_x be the two (distinct) eigenvalues of r̄(Frob_x), with α_x the eigenvalue on ψ̄_x. Then for every a ≥ 1 the map (`lim_{k->infty}prod_{x in Q}(V_x - betaTilde_x)^{k!}`) ∘ pr^* , followed by the projection onto the m_Q-part, is an isomorphism H^*_ψ(Y, O/ϖᵃ)_m → `H^*_psi(Y_0(Q), O/varpi^a)_{m_Q}`; that is, B^tw(Q, ψ, m) holds.

N(x) ≡ 1 mod p and α_x ≠ β_x (so α_x ≢ ±1, since α_xβ_x ≡ N(x) ≡ 1). The coefficient module extends to each away-from-x amalgam by §3.2, since ψ is supported on R and x∉R; the maps use its specified transports. H^*_ψ(Y, O/ϖᵃ)_m is the localization at m as a T-module; the auxiliary-level modules are localized at m^abs (§0.3) and then at m̃ = m_Q = (m^Q, V_x − α̃_x) (§0.4), not at m^Q. Since q ≡ 1 mod p, (m^Q, V_x − α̃_x) = (m^Q, U_x − α̃_x); ArithmeticLocallySymmetricSpaces ALS.3.14 writes U_x for the unnormalized V_x.

A proof uses the following inputs and comparisons. Induction on |Q| reduces to Q = {x}, using that the projectors for different primes commute. The degeneracy maps φ : H^*(Y)² → H^*(Y_0(x)) and φ^∨ satisfy φ^∨ ∘ φ = (N(x)+1, T_x; T_x, N(x)+1), with determinant (N(x)+1)² − T_x² ≡ −(α_x − β_x)² ∉ m, so φ is split injective on the direct summand H^*(Y)²_m of `H^*(Y)^2_{m^abs}` and `H^*(Y_0(x))_{m^abs}` ≅ H^*(Y)²_m ⊕ W, where W contains the images of the other maximal ideals m′ of T above m^abs. The m̃-part of the old module is `(H^*(Y)^2_m)_{alpha_x}`, the root selection being defined by the degeneracy operator of ArithmeticLocallySymmetricSpaces ALS.3.14: an m′ ≠ m above m^abs differs from m only in T_x modulo m′, so its old V_x-roots γ, γ⁻¹ satisfy γ + γ⁻¹ ≢ α_x + α_x⁻¹ and neither is α_x. Hence `H^*(Y_0(x))_{mTilde}` ≅ `(H^*(Y)^2_m)_{alpha_x}` ⊕ `W_{mTilde}`. Pass to the determinant-square kernels (§3.1), form the component-indexed amalgams and O(ψ) transports of §3.2, and apply the full-component localized Lyndon isomorphism at m̃ (§3.4), where `U_{x^2}` − 1 ≡ α_x² − 1 is a unit: `(H^i(Y)^2_m)_{alpha_x}` ≅ `H^i(Y_0(x))_{mTilde}`, so `W_{mTilde}` = 0. Applying the projectors `lim(V_x - betaTilde_x)^{k!}` and `lim(V_x - alphaTilde_x)^{k!}` identifies H^*(Y)_m with the α_x-part, which is the m_Q-part.

**Checks.**

- For F = ℚ this is the classical 'no new cohomology at Taylor–Wiles level' statement (ModularCurvesPartII §15.8).

- The statement concerns all degrees, not only the lowest one (contrast CG18 Remark 9.8).

- For n = 3 the method fails: PSL_3(F_x) is not an amalgam of two vertex stabilizers.

- For p=7, N(x)=29 and roots 2,4, the Gram determinant is 4−(2+4)²=3, and α²−1=3; both are units. Roots 1,1 give determinant 0 and α²−1=0, so the proof does not apply.

(CG18, §9.3, Lemma 9.6 and proof, published pp. 416–418; CG18 line 4843; CG18, §9.3, Remarks 9.7–9.8, published pp. 418–419; CG18 line 4843.)

*Needs:* TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.3.14; §3.1; §3.4; §3.3; §2.4; §0.4; §2.1.

### 3.6 No new cohomology at primes with distinct Frobenius eigenvalues (CG18 §9.4)

Let G = GL_n over F with arithmetic quotients X, X_0(x) (level the line-stabilizer at x), x a prime with N(x) ≡ 1 mod p at which r̄(Frob_x) is unramified with n distinct eigenvalues, α one of them, m_∅ the Hecke ideal away from x and m = (m_∅, V − α) with V the double coset of diag(1, …, 1, ϖ_x). Assume local–global compatibility at x for the localized smooth tower cohomology: every irreducible subquotient of the localized smooth G(F_x)-module M_j, M_j := `colim_{a->infty}` `H^j(X(x^a), O/varpi^b)_{m_empty}` (b ≥ 1), with transition pullbacks, is the unramified principal series attached to r̄|G_x. Then e_α := lim_k `QTilde(V)^{k!}` induces isomorphisms `H^*(X, O/varpi^b)_{m_empty}` ≅ H^*(X_0(x), O/ϖᵇ)_m for every b ≥ 1, where P(T) = (T − α)Q(T) is the characteristic polynomial of r̄(Frob_x) and Q̃ ∈ O[T] lifts Q. The PGLₙ comparison is the separate target of §3.7; this GLₙ theorem does not identify the two cohomologies.

The Frobenius eigenvalues are pairwise distinct and the localized tower is locally admissible with every simple subquotient in the specified unramified principal-series block. The comparison is conditional on that local compatibility. The map at X₀(x) uses the parahoric stabilizing the last coordinate; conjugating to the first-coordinate convention transports both the operator and its chosen root. The PGLₙ descent is §3.7.

A proof uses the following inputs and comparisons. Each M_j is filtered by its m_∅-torsion, and the compatibility hypothesis with Ext-vanishing between the unramified principal series and other irreducibles (SmoothRepresentationsOfLocalGroups SR.5.3, distinct-eigenvalue local block) puts M_j in the block category 𝒞. Hochschild–Serre for the towers X(x^m) → X and X(x^m) → X_0(x) gives spectral sequences H^i_cts(G(O_x), M_j) ⇒ `H^{i+j}(X)_{m_empty}` and e_αH^i_cts(U_0(x), M_j) ⇒ `H^{i+j}(X_0(x))_m` (CompletedCohomologyPartII §6.2 and gap:tame-place-fixed-exponent-descent, with ALS.6.2 as the finite-cover input). The map ι_* : H^k_cts(G(O_x), M) → e_αH^k_cts(U_0(x), M) is an isomorphism on the block (SR.5.3, derived hyperspecial–parahoric comparison, CG18 Theorem 9.16), so the morphism of spectral sequences is an isomorphism on E_2 and hence on the abutments. The comparison is equivariant for the Hecke operators away from x. The torus fibrations relate the two cohomologies through a Leray spectral sequence; §3.7 retains that comparison. KT17 Lemma 6.25(4) concerns GLₙ at Iwahori level and ordinary completed cohomology.

**Checks.**

- For GL_2 with distinct eigenvalues this is the analogue of Lemma 9.6, conditional on local–global compatibility at x; for PGL_2, Lemma 9.6 (§3.5) gives B^tw without it.

- Without distinct eigenvalues the category 𝒞 is not described by Corollary 9.13 and the argument does not apply.

- For trivial discrete k under U=ℤₚ, H⁰_cts(U,k)=k and H¹_cts(U,k)=Hom_cts(ℤₚ,k)=k, while H¹(1,k)=0. Derived continuous invariants retain this degree-one term; ordinary invariants do not.

- For the regular point tower Map(U/U_t,k), the colimit is C_cts(U,k), whose continuous cohomology is k in degree 0 and zero in positive degrees. The abutment is the point’s cohomology; replacing this tower module by trivial k would give the preceding degree-one term.

(CG18, §9.4.1–9.4.2, Lemmas 9.9–9.14, Theorem 9.16, published pp. 419–424; CG18 line 4897; CGH20, §3.1, proof of Theorem 3.2, arXiv pp. 5–6; CGH20 line 210.)

*Needs:* TauCetiRoadmap.CompletedCohomologyPartII §6.2 and gap:tame-place-fixed-exponent-descent; TauCetiRoadmap.SmoothRepresentationsOfLocalGroups SR.5.3, distinct-eigenvalue local block; TauCetiRoadmap.SmoothRepresentationsOfLocalGroups SR.5.3, derived hyperspecial–parahoric comparison; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.6.2; §0.4; §2.4; §2.1.

### 3.7 Descent of the distinct-root comparison to PGLₙ

Prove the analogue of §3.6 for Y and Y₀(Q) of Res PGLₙ, at auxiliary places x ∈ Q with N(x) ≡ 1 mod p at which r̄ is unramified with pairwise distinct residual Frobenius eigenvalues, assuming the following block condition: for every x ∈ Q, every subset Q′ ⊆ Q ∖ {x}, every j and every b ≥ 1, the smooth PGLₙ(F_x)-module `colim_{t->infty}` `H^j(Y_0(Q')(x^t), O/varpi^b)_{m_{Q'}}`, with transition pullbacks, is locally admissible and each of its irreducible subquotients is the unramified principal series of PGLₙ(F_x) (trivial central character) attached to r̄|G_x. Here Y₀(Q′)(x^t) has the level of Y₀(Q′) away from x and the principal congruence subgroup of level x^t at x, and `m_{Q'}` is the selected maximal ideal of §0.4 (m_∅ = m); the subsets Q′ give the successive base levels of the induction on |Q|. The map is pullback, the factorial root projector and the selected local-factor projection, with coefficients O/ϖᵃ for every a≥1; it is Hecke-equivariant away from Q. This is a separate comparison theorem, not an identification of GLₙ and PGLₙ cohomology. With this block hypothesis at every successive base level, it supplies the comparison step in the Betti vanishing argument of CGH20 Theorem 3.2; no derivation of the block hypothesis from that source’s assumptions is asserted. The conditional near-faithfulness theorem in §5.4 continues to assume B^tw and does not use this descent to prove its own hypothesis.

One route is to restrict the GLₙ block equivalence to representations with trivial central character and compare the derived invariant functors for the images of hyperspecial and line-parahoric subgroups. The centre has p-primary cohomology when p divides q−1, so simply identifying those functors with GLₙ invariants is invalid. A second route uses the central-torus fibrations with their full Leray spectral sequences and the compatibility of the root projector; taking only the base of such a fibration does not preserve its cohomology. Both routes retain the distinguished parahoric operator and its chosen root.

**Checks.**

- For n=2, the conclusion agrees with §3.5 without its extra distinct-block hypothesis.
- For a central Cₚ factor with k coefficients, H⁰(Cₚ,k)=k and H¹(Cₚ,k)=k; deleting that central factor cannot give an equality of all derived invariants.
- For Q={x,y}, the block hypothesis is required for (x,∅), (x,{y}), (y,∅) and (y,{x}): four conditions, rather than two conditions only at the minimal level.
- For n=3, p=7, residual roots 1,2,4 have determinant 1 and are distinct. Replacing them by 1,1,1 destroys the simple-root condition since Q(1)=0.

(CG18, §9.4, pp.419–424, especially the passage to GLₙ and the two spectral sequences; CG18 line 4897 and line 5097. CGH20, Theorem 3.2 and proof, pp.5–6; CGH20 line 210. KT17, §6.6, Lemma 6.25(4), statement p. 41 and proof pp. 41–42; KT17 lines 1904–1906 and 1931–1935.)

*Needs:* §3.6; TauCetiRoadmap.CompletedCohomologyPartII §6.2 and gap:tame-place-fixed-exponent-descent (the PGLₙ tower); §0.4; TauCetiRoadmap.SmoothRepresentationsOfLocalGroups SR.5.3; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.6.2; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §§2.3 and 3a.1.

### Examples

Take p=7 and a prime of norm 29, so q≡1 modulo 7. Residual roots 2 and 4 have product 1 and trace 6. The Gram determinant modulo 7 is 4−6²=3=−(2−4)², a unit. Equal roots 1 and 1 give 4−2²=0 and the splitting argument fails.

### Dependencies

Earlier layers 0–2; TauCetiRoadmap.CompletedCohomologyPartII §§0.1–0.3, 1.1 and 6.2 and gap:tame-place-fixed-exponent-descent; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.0.4, ALS.0.7–ALS.0.10, ALS.1.1–ALS.1.8, ALS.2.2–ALS.2.4, ALS.3.3–ALS.3.9 and ALS.3.14, ALS.4.1 and ALS.4.9–ALS.4.12, ALS.5a.2–ALS.5a.6, ALS.5b.4–ALS.5b.6, ALS.6.1–ALS.6.3; TauCetiRoadmap.ReductiveGroupsPartII RG2.2.4; TauCetiRoadmap.AdelicAlgebraicGroups §§4.2 and 5.1; TauCetiRoadmap.FreeGroupsAndLimitGroups §§4.5 and 4.8; Mathlib `Monoid.PushoutI` and `groupCohomology.coindIso`; TauCetiRoadmap.ModularCurvesPartII §15.4 (principal-level case over ℚ); TauCetiRoadmap.SmoothRepresentationsOfLocalGroups SR.5.3, “The distinct-eigenvalue local block” and “Derived hyperspecial–parahoric comparison”.

## Layer 4: The two finite patching data

### 4.1 The minimal complexes D̃_N and D̃^χ_N

Let E_Q on homology be the transpose of the selected local-factor projection composed with e_Q, so E_Q^H=(E_Q^coh)^∨ under ι, rather than a new choice of the same homological root. Transport the cohomological scalar action to homology: [δ]∈S_N acts by T_H(δ⁻¹)=(r_δ)_*, and an abstract Hecke element t acts there by T_H(ι(t)). These are the transposes of the cohomological actions, compatible with the deformation-ring maps of §2.7; the standard homological localization remains at m*. Localizing the homology of an auxiliary-level cover at m* means localizing at the contraction of m* to the polynomial algebra (§0.3 under ι); since the covers below have p-group deck groups, this is the localization at the dual ι(`m^{Q_N}`) of the ideal `m^{Q_N}` of §0.3, and `E_{Q_N}` then selects the dual root factor. For a standing datum, a maximal ideal m of T with r̄_m ≅ r̄, a Taylor–Wiles set Q_N of level N (§1.6) and a surjection `DeltaTilde_{Q_N}` ↠ Δ_N := (ℤ/p^N)^q with S_N := O[Δ_N], let `Y_{Delta_M}(Q_N)` → Y_0(Q_N) be the intermediate covers (0 ≤ M ≤ N). Assuming ConjB(Q_N, ψ, m) for ψ ∈ {1, χ}, there are perfect complexes D̃_N and D̃^χ_N of finite free S_N-modules (homologically graded) such that: (1) they are concentrated in degrees q_0, …, q_0 + l_0; (2) D̃_N `tensor_{S_N}` `S_N/frak_m_{S_N}` has zero differentials; (3) for every i, every s ≥ 1 and 0 ≤ M ≤ N, H_i(D̃_N `tensor_{S_N}` S_M/ϖˢ) ≅ `E_{Q_N}H_i(Y_{Delta_M}(Q_N), O/varpi^s)_{m^*}` and H_i(D̃^χ_N `tensor_{S_N}` S_M/ϖˢ) ≅ `E_{Q_N}H_{i,chi^{-1}}(Y_{Delta_M}(Q_N), O/varpi^s)_{m^*}`, as S_N-modules and compatibly with the transported `T^an_{Q_N}`-action just specified; (4) D̃_N `tensor_{S_N}` O computes `E_{Q_N}H_*(Y_0(Q_N))_{m^*}`, which B^tw identifies with `H_*(Y)_{m^*}`.

Conjecture B at Q_N (vanishing and Taylor–Wiles comparison) for ψ = 1 and ψ = χ. The χ-twisted complex uses the dual local system O(`chi^{-1}`). The projector `e_{Q_N}` is the Taylor–Wiles projector for the primes of Q_N.

A proof uses the following inputs and comparisons. Apply ArithmeticLocallySymmetricSpaces gap:localized-orbifold-perfect-models to the p-group cover `Y_{Delta_N}(Q_N)->Y_0(Q_N)`, using the finite-coefficient ranges and boundary vanishing at every intermediate cover. Its selected direct summand is a finite perfect S_N-complex; base change along S_N→S_M/ϖˢ computes the selected homology at `Y_{Delta_M}(Q_N)`. This step concerns localized arithmetic groupoids and is not deduced from an unlocalized free-cell model at a level with p-torsion stabilizers. Each adjoint Hecke operator lifts to an endomorphism of this perfect complex C in D(S_N) (CG18 Lemma 7.2; ALS.3.3). Let t be the lifted localizing operator, built from separators for the selected maximal ideals together with `prod_{x in Q_N}P_x` ∘ `prod_{i in Omega}P_i` (P_i separating the other residual Galois representations, P_x the Taylor–Wiles projector). Since C is perfect over S_N and S_N is finite over O, the O-subalgebra O[t] of `End_{D(S_N)}(C)` is a finite commutative O-algebra, so the factorial powers `t^{k!}` converge to an idempotent e of O[t] that is 1 on the local factors where t is a unit and 0 on the others (IntegralHeckeAndGaloisDeterminants §2.3, factorial powers). Split e in D(S_N) (IntegralHeckeAndGaloisDeterminants §2.2, specified idempotent summands). The summand eC is perfect, as a retract of a perfect complex (DerivedModuleAlgebra §1.E.0); its cohomology after every base change S_N → S_M/ϖˢ is the image of e, which is the selected localized homology, because base change is additive and commutes with the splitting. The ordinary telescope colim(C, t) is not used: for C = O[0] and t = ϖ it is E[0], which is not finite over O, whereas e = 0 (this corrects CG18 Lemma 7.3 as stated). Over the local ring S_N, Nakayama's lemma for perfect complexes produces a minimal representative D̃_N with zero differentials mod `frak_m_{S_N}` and terms of rank dim `E_{Q_N}H_i(Y_0(Q_N), k)_{m^*}` (CG18 Lemma 7.4; DeformationAndDerivedPatchingAlgebra §7.3). Vanishing outside [q_0, q_0 + l_0] at the residual level (B^van(a), transported to homology by the universal-coefficient duality of §0.5(3)) bounds the minimal complex to those degrees; B^tw identifies the residual terms with `H_*(Y, k)_{m^*}`, independent of N.

The specialized interface records the following facts.

- D̃_N (and D̃^χ_N) as a perfect complex of finite free S_N-modules with a chosen minimal representative.

- Terms vanish outside q_0, …, q_0 + l_0.

- Differentials vanish mod `frak_m_{S_N}`.

- H_i(D̃_N ⊗ S_M/ϖˢ) ≅ `E_{Q_N}H_i(Y_{Delta_M}(Q_N), O/varpi^s)_{m^*}`, Hecke-equivariantly.

- `rank_{S_N}` `DTilde_{N,i}` = dim_k `H_i(Y, k)_{m^*}`.

- The abstract Hecke correspondences give the endomorphisms used to form the projector. The simultaneous image algebra acts on every cohomology group in (3); its compatible finite coefficient and framing-quotient actions are those of §4.4.

**Checks.**

- For l_0 = 0, D̃_N is a single finite free S_N-module in degree q_0 and its coinvariants are `H_{q_0}(Y, O)_{m^*}`.

- The ranks of D̃_N do not depend on N: dim_k `DTilde_{N,i}/frak_m` = dim_k `H_i(Y, k)_{m^*}` for every N.

- Without B^van(a), the minimal complex can have nonzero terms in degrees below q_0 and its length exceeds l_0, so the codimension count of the patching theorem fails.

- For F imaginary quadratic and n = 2, D̃_N has terms in degrees 1 and 2 only.

- For Q_N = ∅ (N = 0), D̃_0 is a minimal complex over O computing `H_*(Y, O)_{m^*}`.

- For k=O/ϖ, Ext¹_O(k,k)=k. On C=k[0]⊕k[1], a nonzero off-diagonal Ext¹ endomorphism t has H*(t)=0 and t²=0 but t≠0 in D(O). An abstract Hecke action can retain such a ghost while its cohomological image acts by zero; no derived factorization through that image is asserted.

- For Δ=C₅ and a cohomology line with deck d acting by ζ₅², standard homology at the adjoint ideal has d-eigenvalue ζ₅⁻². The transported S_N-generator acts by T_H(d⁻¹), hence by ζ₅². For the deck class d³ of diag(d,1,1), the scalar is ζ₅⁶=ζ₅, agreeing with θ(d) in §§1.4 and 2.2; using T_H(d) for the scalar action would give ζ₅⁻¹ instead.

- For C=O²[0] and t=diag(1,ϖ), the factorial idempotent is diag(1,0) and the selected summand is O[0]; the telescope colim(C,t) is O⊕E, which is not perfect. For C=O[0] and t=ϖ the idempotent is 0 and the summand is 0, while the telescope is E.

- For the two-term minimal residual complex k --0→ k in degrees 1,2, residual ranks are (1,1) and cannot be replaced by a degree-one stalk. For a contractible disk O --1→ O both residual cohomology ranks are 0 and minimalization deletes both terms.

(CG18, §7.1, Lemmas 7.1–7.4 and the paragraph after, published pp. 391–395; CG18 line 3819; CG18, §9.5, published p. 425; CG18 line 5111.)

*Needs:* §0.3; §0.4; §2.3; §2.4; §0.5; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.1.6 and gap:localized-orbifold-perfect-models; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.3.3; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §2.3; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §2.2; TauCetiRoadmap.DerivedModuleAlgebra §1.E.0; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §7.3.

### 4.2 The two patching data of the proof of Theorem 9.19

Fix q ≥ `h^1_{L^perp,T}(ad^0 rbar(1))` and Taylor–Wiles sets Q_N (N ≥ 1) as in §1.6, and put g = q + |T| − 1 − [F:ℚ]n(n − 1)/2 − l_0, S_∞ := O⟦(ℤ_p)^q⟧, S_N := O[Δ_N], j := n²|T| − 1, O^□ := O⟦z_1, …, z_j⟧. The datum i = 1 (resp. i = 2) consists of: R^1_∞ := R^1_loc⟦x_1, …, x_g⟧ (resp. R^2_∞ := R^χ_loc⟦x_1, …, x_g⟧); (R^1, H^1) := (R_S, `H^{q_0}(Y, E/O)^vee_m`) (resp. (R^2, H^2) := (`R_{S^chi}`, `H^{q_0}_chi(Y, E/O)^vee_m`)), with R^i acting through §2.7; the complex T of finite-dimensional k-spaces in degrees 0, …, l_0 with T^c = `H^{q_0+l_0-c}(Y, k)^vee_m` and zero differentials; D^1_N := D̃_N/ϖ^N and D^2_N := D̃^χ_N/ϖ^N, finite free over S_N/ϖ^N and perfect over that quotient base, regarded as cohomological complexes in degrees 0, …, l_0 by c ↦ q_0 + l_0 − c; and surjections φ^i_N : R^i_∞ ↠ `R^square_{S_{Q_N}}` ↠ `R_{S_{Q_N}}` ↠ R^i (resp. with S^χ), where the surjections R^i_∞ ↠ R^□ are chosen so that their reductions mod ϖ agree under R^1_∞/ϖ ≅ R^2_∞/ϖ, using representatives of the universal deformations of type `S_{Q_N}` and `S^chi_{Q_N}` that agree mod ϖ.

Double brackets for completed rings throughout. T^c = `H^{q_0+l_0-c}`, a reflection of degrees, not a shift by q_0. The choice of compatible surjections mod ϖ is needed for the commutative square of the two-datum patching.

A proof uses the following inputs and comparisons. `R^{square}_{S_{Q_N}}` is a quotient of R^1_loc⟦x_1, …, x_g⟧ by §1.6(4); composing with R^□ ≅ `R_{S_{Q_N}}[[z_1, ..., z_j]]` ↠ `R_{S_{Q_N}}` ↠ R_S gives φ^1_N (§1.5(1)). For i = 2 take the natural map R^χ_loc → `R^square_{S^chi_{Q_N}}`, which reduces mod ϖ to the i = 1 map, and send each x_i to a lift of the image of x_i mod ϖ; the resulting map is surjective because it is surjective on reduced cotangent spaces (complete Nakayama). D^i_N inherits from D̃_N the identification D^i_N `tensor_{S_N}` S_N/𝔪 ≅ T (after reflection), since both have zero differentials and the same residual terms.

The specialized interface records the following facts.

- The datum (R^i_∞, R^i, H^i, T, (D^i_N), (φ^i_N)) for i = 1, 2.

- dim R^i_∞ = 1 + q + j − l_0.

- T with T^c = `H^{q_0+l_0-c}(Y, k)^vee_m` and zero differentials.

- φ^i_N : R^i_∞ ↠ R^i.

- The two data agree mod ϖ: R^1_∞/ϖ ≅ R^2_∞/ϖ and φ^1_N ≡ φ^2_N under it.

- `H^{l_0}(T)` = `H^{q_0}(Y, k)^vee_m`.

**Checks.**

- For l_0 = 0, T is the single space `H^{q_0}(Y, k)^vee_m` in degree 0, dim R^i_∞ = 1 + q + j, and the data are those of Taylor–Wiles–Kisin module patching.

- Assume g,j≥1. Change the framed presentation surjection R^2_∞→R^□ by adding z₁² to the image of x₁, before augmentation. In the smooth model O⟦X,Z⟧→R^□=O⟦x,z⟧, the maps (X,Z)↦(x,z) and (X,Z)↦(x+z²,z) are surjective and differ by the nonzero z² modulo ϖ. They agree after z=0. Thus compatibility must be imposed on the framed maps themselves; the final φ_N:R_∞→R cannot detect this difference.

- For q₀=1 and ℓ₀=1, reflection gives T⁰=H²∨ and T¹=H¹∨. The formula `T^c=H^{c-l_0}` would give T⁰=0 and T¹=H⁰∨, so it fails the required top augmentation.

(CG18, §9.5, proof of Theorem 9.19, published pp. 426–427; CG18 line 5168.)

*Needs:* §4.1; §1.6; §1.5; §1.3; §1.2; §1.4; §2.7; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §3.10.

### 4.3 Comparisons of the two data modulo ϖ

Under ConjB(∅, ψ, m) for ψ = 1, χ: (1) R^1/ϖ = R_S/ϖ ≅ `R_{S^chi}/varpi` = R^2/ϖ; (2) H^1/ϖ ≅ `H^{q_0}(Y, k)^vee_m` ≅ `H^{q_0}_chi(Y, k)^vee_m` ≅ H^2/ϖ, compatibly with the actions of R^1/ϖ ≅ R^2/ϖ; (3) for M ≥ N ≥ 0 with M ≥ 1, `H^{l_0}((D^1_M)^square tensor_{S_M} S_N/varpi)` ≅ (`E_{Q_M}H^{q_0}(Y_{Delta_N}(Q_M), k)^vee_m`)^□ ≅ (`E_{Q_M}H^{q_0}_chi(Y_{Delta_N}(Q_M), k)^vee_m`)^□ ≅ `H^{l_0}((D^2_M)^square tensor_{S_M} S_N/varpi)`, compatibly with R^1_∞/ϖ ≅ R^2_∞/ϖ and with the reductions N → 0.

B^van(a) at Q = ∅ in degree q_0 − 1 (so that `H^{q_0}(Y, E/O)_m[varpi]` = `H^{q_0}(Y, k)_m`). The choices of §4.2 (compatible surjections mod ϖ).

A proof uses the following inputs and comparisons. (1) The global deformation problems agree mod ϖ because the local ones do (§1.2). (2) The exact sequence 0 → `H^{q_0-1}(Y, E/O)_m/varpi` → `H^{q_0}(Y, k)_m` → `H^{q_0}(Y, E/O)_m[varpi]` → 0 and B^van(a) give `H^{q_0}(Y, k)_m` ≅ `H^{q_0}(Y, E/O)_m[varpi]`, dual to H^1/ϖ; §0.5 gives the χ-version; Hecke equivariance and §2.7 give compatibility with R^i/ϖ. (3) is the same argument at Taylor–Wiles level using §4.1(3); the top-degree cohomology of a complex in degrees 0, …, l_0 commutes with the right exact reductions, which gives compatibility with N → 0.

**Checks.**

- For l_0 = 0, (3) is the usual comparison of patched modules mod ϖ.

- The comparisons are not asserted integrally: H^1 and H^2 differ in general.

- For O --ϖ→ O in degrees 0,1, the top cokernel is k and its reduction is k; the degree-zero kernel is 0 but becomes k after reduction. Top cohomology commutes with the displayed quotient, whereas all cohomology need not.

(CG18, §9.5, proof of Theorem 9.19, published pp. 426–427; CG18 line 5168.)

*Needs:* §4.2; §4.1; §0.5; §2.3; §2.7; §1.2.

### 4.4 Verification of the hypotheses of the two-datum patching theorem

For the data of §4.2, assuming ConjB(Q, ψ, m) for Q = ∅ and Q = Q_N (N ≥ 1), ψ = 1, χ: each datum i satisfies the hypotheses of the Calegari–Geraghty patching theorem: dim R^i_∞ = 1 + j + q − l_0; H^i is a finite R^i-module and the common residual complex is nonzero; (a) D^i_N ⊗ S_N/𝔪 ≅ T; (b) for M ≥ N ≥ 0, M ≥ 1 and 1 ≤ s ≤ M, R^i_∞ acts on H^*((D^i_M)^□ `tensor_{S_M}` S_N/ϖˢ), commuting with S^□_M and compatibly with reductions; (c) `H^{l_0}((D^i_N)^square tensor O/varpi^s)` ≅ H^i/ϖˢ for 1 ≤ s ≤ N, R^i_∞-linearly through φ^i_N; (d) the image of S^□_M lies in the image of R^i_∞, and the augmentation ideal of S^□_N maps into the image of ker φ^i_M. The comparisons of §4.3 supply the additional hypotheses of the two-datum version.

Conjecture B including the all-level, all-finite-coefficient clause (6). The nonzero residual seed is H^*(Y,k)_m; its lowest-degree nonvanishing is established by codimension concentration, rather than inferred from membership of m in the support of total cohomology.

A proof uses the following inputs and comparisons. (a) §4.1 (2) and (4) with B^tw. (b) §2.7 at Q_M, applied at the ideal `m^{Q_M}` of §0.3, gives `R_{S_{Q_M}}` → `T^an_{Q_M,psi,m}` acting on the cohomology of every intermediate cover `Y_{Delta_N}(Q_M)` (whose localization at m^abs is its localization at `m^{Q_M}`, as Δ_N is a p-group); composing with R^i_∞ ↠ `R^square_{S_{Q_M}}` ≅ `R_{S_{Q_M}}[[z]]` gives the R^i_∞-action on the framed cohomology. (c) holds for s ≤ N by §4.1(3) and §4.3. (d) clause (6) of Conjecture B identifies the S_M-action (diamond operators) with the inertial characters at Q_M, which lie in the image of `R_{S_{Q_M}}`; the augmentation ideal of S_N maps to ker(`R_{S_{Q_M}}` → R_S) (§1.4), hence into the image of ker φ^i_M.

The finite-cutoff data also contain every framing ideal (z₁ᴸ,…,zⱼᴸ)⊆I⊆(z₁,…,zⱼ), for M≥L≥1, N≤L and 1≤s≤L. Construct the ring action on each H^c(C_M^□⊗S_N^□/(ϖˢ,I)) geometrically from the intermediate quotient and the finite O-coefficient module O⟦z⟧/(ϖˢ,I), before passing to its cohomology. Every such coefficient module is a finite direct sum of cyclic modules O/ϖᵇ with 1 ≤ b ≤ s; the simultaneous Hecke image acts independently of a chosen decomposition, by naturality of correspondences and all O-linear coefficient maps. Its map from the global deformation ring then gives the required action. The scalar variables commute with it. This uses the finite-coefficient clause of IntegralHeckeAndGaloisDeterminants gap:simultaneous-orbifold-hecke-finiteness. Retain the coefficient, framing, action and augmentation diagrams and compare them on the actual coefficient maps. It is not enough to tensor an action on ordinary cohomology through a nonflat quotient. Modulo ϖ the local systems and universal-deformation maps agree; use these actual geometric identifications at every quotient for the paired contract.

A maximal ideal in the support of total residual cohomology gives a nonzero minimal residual complex T. Apply the supplied patching construction with finite H, followed by the dimension–amplitude concentration theorem. Its patched minimal free complex has these nonzero residual ranks, so cannot be exact. Concentration places its cohomology in degree ℓ₀; local Nakayama then makes its augmentation H nonzero. This proves `H^{q_0}(Y,k)_m != 0` at the point it is needed, instead of assuming it merely from total support.

**Checks.**

- Without clause (6) condition (d) cannot be verified.

- For l_0 = 0 these are the hypotheses of Taylor–Wiles–Kisin module patching.

- The verification does not need B^van at level Q_N beyond its use in §4.1.

- For O⟦z⟧ --z→ O⟦z⟧, integral H⁰=0 and after z=0 it is O. For I=(z²,ϖz), O⟦z⟧/(ϖ²,I) is the O-module O/ϖ² ⊕ (O/ϖ)z. These finite cyclic summands supply the required quotient actions, without asserting flatness.

(CG18, §9.5, proof of Theorem 9.19, published p. 427; CG18 line 5211; CG18, §6.1, Theorem 6.3 and Proposition 6.6, published pp. 386–391; CG18 line 3607 and line 3773.)

*Needs:* §4.2; §4.1; §4.3; §2.7; §2.2; §2.5; §1.4; §0.3; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §2.1 and gap:simultaneous-orbifold-hecke-finiteness; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §8.6 and gap:paired-cohomology-action-patching.

### Examples

When (q₀,ℓ₀)=(1,1), the residual complex has degree-zero term H²(Y,k)∨ and degree-one term H¹(Y,k)∨. Reduction modulo the scalar and framing augmentation recovers the lowest arithmetic cohomology dual from the top cohomological degree.

### Dependencies

Earlier layers 0–3; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.0.7–ALS.0.10, ALS.1.1–ALS.1.8, ALS.2.2–ALS.2.4, ALS.3.3–ALS.3.9 and ALS.3.14, ALS.4.1 and ALS.4.9–ALS.4.12, ALS.5a.2–ALS.5a.6, ALS.5b.4–ALS.5b.6, ALS.6.1–ALS.6.3; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §§1.2–1.3, 2.1–2.3, 3a.1 and 3b.1–3b.2; TauCetiRoadmap.DerivedModuleAlgebra §1.E.0; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §§1.12, 3.1–3.4, 3.10, 4.6, 6.1–6.8, 7.3, 7.6, 8.6 and 9.1–9.2.

## Layer 5: Patched support and the automorphy application

### 5.1 The patched complexes `P^{1,square}_infty` and `P^{2,square}_infty`

Under the hypotheses of §4.4 there are perfect complexes `P^{1,square}_infty`, `P^{2,square}_infty` of finitely generated S^□_∞-modules (S^□_∞ = S_∞ ⊗̂ O^□), concentrated in degrees 0, …, l_0, such that for i = 1, 2: (i) `P^{i,square}_infty` is a projective resolution of minimal length of `H^{l_0}(P^{i,square}_infty)`; (ii) R^i_∞ ⊗̂_O S^□_∞ acts on `H^{l_0}(P^{i,square}_infty)`, extending the S^□_∞-action, and `H^{l_0}(P^{i,square}_infty)` is a finite R^i_∞-module; (iii) `depth_{R^i_infty}` `H^{l_0}(P^{i,square}_infty)` = 1 + j + q − l_0 = dim R^i_∞; (iv) there are a surjection φ^i_∞ : R^i_∞ ↠ R^i and an isomorphism `H^{l_0}(P^{i,square}_infty)/frak_a` ≅ H^i of R^i_∞-modules, 𝔞 = ker(S^□_∞ → O), with the image of 𝔞 in End(`H^{l_0}(P^{i,square}_infty)`) contained in that of ker φ^i_∞. Moreover there is an isomorphism `H^{l_0}(P^{1,square}_infty)/varpi` ≅ `H^{l_0}(P^{2,square}_infty)/varpi` of R^1_∞/ϖ ≅ R^2_∞/ϖ-modules (linear over (R^i_∞ ⊗̂ S^□_∞)/ϖ) compatible with H^1/ϖ ≅ H^2/ϖ after reduction mod 𝔞.

All hypotheses of the two-datum patching theorem, verified in §4.4. The residual complex is nonzero and minimal; concentration and Nakayama then give a nonzero top module and H^i ≠ 0.

A proof uses the following inputs and comparisons. Apply the Calegari–Geraghty patching construction to each datum (DeformationAndDerivedPatchingAlgebra §8.6): compactness of finite patching data, inverse limit of a compatible tower, the action of R^i_∞ and the augmentation isomorphism. Patch the two data simultaneously, carrying the comparison isomorphisms mod ϖ as part of each finite datum; this two-datum version is requested from DeformationAndDerivedPatchingAlgebra §8.6 as gap:paired-cohomology-action-patching. `dim_{S^square_infty}` H^*(`P^{i,square}_infty`) = `dim_{R^i_infty}` ≤ dim R^i_∞ = dim S^□_∞ − l_0, so H^* has codimension ≥ l_0 over the regular ring S^□_∞, and the codimension–amplitude lemma (CG18 Lemma 6.2; DeformationAndDerivedPatchingAlgebra §9.2) gives (i) and depth = dim S^□_∞ − l_0, which equals the R^i_∞-depth by the patching depth comparison (DeformationAndDerivedPatchingAlgebra §§3.1–3.3 and 9.2).

**Checks.**

- For l_0 = 0, `P^{i,square}_infty` is a single finite free S^□_∞-module (DeformationAndDerivedPatchingAlgebra §9.2).

- The comparison mod ϖ is used only through its top-degree part.

- For a nonzero rank-one stalk P=S in degree 0, amplitude and codimension are 0 and depth=dim S. A contractible two-term disk has zero cohomology and no finite nonzero depth equalities, which is why the nonzero residual seed is retained.

(CG18, §6.1, Theorem 6.3 and its proof, Proposition 6.6, published pp. 386–391; CG18 line 3607 and line 3773; CG18, §9.5, proof of Theorem 9.19, published p. 428; CG18 line 5228.)

*Needs:* §4.4; §4.3; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §8.6 and gap:paired-cohomology-action-patching; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §§3.1–3.3 and 9.2.

### 5.2 Near faithfulness on the χ side

In the situation of §5.1, `H^{l_0}(P^{2,square}_infty)` is a nearly faithful R^2_∞-module, and `H^{l_0}(P^{1,square}_infty)/varpi` ≅ `H^{l_0}(P^{2,square}_infty)/varpi` is nearly faithful over R^1_∞/ϖ ≅ R^2_∞/ϖ.

Spec R^2_∞ = Spec R^χ_loc⟦x_1, …, x_g⟧ irreducible (§1.3(3)). R^2_∞ need not be shown p-torsion free: the argument uses depth = dimension.

A proof uses the following inputs and comparisons. By §5.1(iii), `H^{l_0}(P^{2,square}_infty)` is a nonzero finite R^2_∞-module of depth dim R^2_∞. A finite module of maximal depth over a Noetherian local ring with irreducible spectrum is nearly faithful (the maximal-depth support theorem; DeformationAndDerivedPatchingAlgebra §6.1). Near faithfulness passes to the quotient by ϖ (DeformationAndDerivedPatchingAlgebra §6.2), and the isomorphism of §5.1 transports it.

**Checks.**

- If R_triv = ∅ the two sides coincide and this step is not needed.

- Near faithfulness is a statement about reduced supports: it gives no integral R = T.

- For A=k[ε]/ε² and M=k, ann M=(ε), (ann M)²=0 and Spec M=Spec A is one point; nevertheless ε≠0 acts by zero. Near faithfulness survives passage to A/(ε)=k and remains distinct from faithfulness.

(CG18, §9.5, proof of Theorem 9.19, published p. 428; CG18 line 5228.)

*Needs:* §5.1; §1.3; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §6.1; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §6.2.

### 5.3 Transfer to the unipotent side and descent to R_S

In the situation of §5.1, `H^{l_0}(P^{1,square}_infty)` is p-torsion free and nearly faithful over R^1_∞, and H^1 = `H^{q_0}(Y, E/O)^vee_m` is nearly faithful over R^1 = R_S.

R^1_∞ equidimensional with minimal primes of characteristic 0, catenary, and each prime minimal over ϖ contains a unique minimal prime (§1.3(1), (4)).

A proof uses the following inputs and comparisons. Depth = dimension (§5.1(iii)) forces every associated prime of `H^{l_0}(P^{1,square}_infty)` to be a minimal prime of R^1_∞ (DeformationAndDerivedPatchingAlgebra §6.1); these have characteristic 0, so ϖ is a nonzerodivisor on the module. By the special-fibre support-lifting theorem, a finite module on which ϖ is regular and whose reduction mod ϖ is nearly faithful is nearly faithful, under the stated hypotheses on R^1_∞ (DeformationAndDerivedPatchingAlgebra §6.7), applied with §5.2. Conclusion (iv) of §5.1 and the radical comparison transfer near faithfulness from `H^{l_0}(P^{1,square}_infty)` over R^1_∞ to H^1 over R^1 (DeformationAndDerivedPatchingAlgebra §6.4).

**Checks.**

- The transfer uses only characteristic-0 minimal primes of R^1_∞, which survives the correction of Lemma 8.2.

- Catenarity holds since R^1_∞ is a quotient of a power series ring over O.

- The conclusion is near faithfulness, not faithfulness.

- For A=O⟦x,y⟧/(xy) and M=A/(x), M/ϖ has support only V(x), missing the component V(y); reduction is not nearly faithful and cannot prove the lifting conclusion. Multiplication by ϖ on M is injective, showing that regularity alone is insufficient.

(CG18, §9.5, proof of Theorem 9.19, published p. 428; CG18 line 5228.)

*Needs:* §5.1; §5.2; §1.3; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §6.1; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §6.7; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §6.4.

### 5.4 Theorem 9.19: near faithfulness of `H^{q_0}(Y, E/O)^vee_m` over R_S

Let (F, n, p, O, r̄, ξ = `epsilon^{n(n-1)/2}`, R = R_triv ⊔ R_reg, χ) be a standing datum (§1.1) with r̄(`G_{F(zeta_p)}`) big and F(ad⁰r̄) ∌ ζ_p. Let m be a maximal ideal of T = `T_{empty,1}` at level K_∅(R) with r̄_m ≅ r̄. Fix q ≥ `h^1_{L^perp,T}(ad^0 rbar(1))` and Taylor–Wiles sets Q_N (N ≥ 1) as in §1.6, and assume ConjB(Q, ψ, m) (§2.5, including clause (6) and intermediate levels) for Q = ∅ and Q = Q_N, ψ = 1 and ψ = χ. Then `H^{q_0}(Y, E/O)^vee_m`, regarded as an R_S-module through R_S ↠ T_m, is nearly faithful.

Standing hypotheses: R splits into R_triv (r̄|G_v trivial, Ihara avoidance) and R_reg (single unipotent Jordan block), N(v) ≡ 1 mod p on R_triv. Conjecture B with the Taylor–Wiles compatibility clause (6) and at intermediate levels. r̄(`G_{F(zeta_p)}`) big.

A proof uses the following inputs and comparisons. §2.7 gives R_S ↠ T_m and `R_{S^chi}` ↠ `T_{chi,m}`. §4.2 and §4.4 set up and verify the two patching data. §5.1 produces `P^{1,square}_infty`, `P^{2,square}_infty`; §5.2 and §5.3 conclude.

**Checks.**

- For F = ℚ, n = 2, l_0 = 0 and R_triv = ∅, this is the minimal R = T theorem of Taylor–Wiles (with freeness by §5.5).

- For F imaginary quadratic and n = 2 it is conditional on Conjecture B, with B^tw supplied by Lemma 9.6.

- For A=O[ε]/ε² and M=O, ann M=(ε) is nilpotent and A_red=O. Every characteristic-zero reduced point factors through the action image O although A→O is not injective.

(CG18, §9.5, Theorem 9.19 and proof, published pp. 424–428; CG18 line 5166; CGH20, §4, arXiv pp. 7–8; CGH20 line 287.)

*Needs:* §5.3; §5.2; §5.1; §4.4; §4.2; §2.7; §2.5; §1.6; §1.1.

### 5.5 Minimal R = T and freeness when the local rings are smooth

In the situation of §5.4 suppose moreover R_triv = ∅ (every v ∈ R has r̄(σ_v) a single unipotent Jordan block, or R = ∅). Then R_S → T_m is an isomorphism and `H^{q_0}(Y, E/O)^vee_m` is a free R_S-module; only the datum ψ = 1 is used, and Conjecture B is needed only for ψ = 1.

R_triv = ∅, so R^1_loc is formally smooth over O (§1.2). Conjecture B for Q = ∅ and Q = Q_N with ψ = 1.

A proof uses the following inputs and comparisons. R^1_∞ = R^1_loc⟦x_1, …, x_g⟧ is a power series ring over O, hence regular and p-torsion free. Patching the single datum i = 1 (§5.1 for one datum) gives `H^{l_0}(P^{1,square}_infty)` of depth dim R^1_∞, hence free by Auslander–Buchsbaum (DeformationAndDerivedPatchingAlgebra §§3.2 and 6.4). Freeness and conclusion (iv) give ker φ_∞ = ı(𝔞)R^1_∞ and H^1 free over R_S (DeformationAndDerivedPatchingAlgebra §6.4); since R_S acts on H^1 through T_m, R_S ≅ T_m (DeformationAndDerivedPatchingAlgebra §6.5).

**Checks.**

- This is the smooth local form used by CGH20 Theorem 1.2 (A.2), here under the additional all-level inertia–diamond clause of §2.2; there the bad places have a single unipotent block and no congruence on N(v) is imposed; CGH20 normalizes det r = `epsilon^{n(1-n)/2}`, so the statement applies to r^∨, which has the same adjoint representation.

- Complete-intersection descent requires a regular augmentation sequence; no such conclusion is inferred from R = T alone.

- If R_triv ≠ ∅ only near faithfulness is obtained.

- For a nonzero free module R^a with a≥1 the annihilator is 0; for a=0 the annihilator is R. Only the first case makes a surjective action-image map R→T injective.

(CG18, §6.1, Theorem 6.4(1) and proof, published p. 389; CG18 line 3728; CGH20, §4, arXiv pp. 7–8; CGH20 line 287.)

*Needs:* §5.1; §1.2; §1.7; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §§3.2 and 6.4; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §6.5.

### 5.6 Cuspidal recognition of the support of `H^{q_0}(Y)_m`

Let m be a maximal ideal of T at level K_∅(R) at which B^gal and B^van hold for Q = ∅, ψ = 1, with r̄_m absolutely irreducible and r̄_m(`G_{F(zeta_p)}`) big. Fix ι : Q̄_p ≅ ℂ. If f : T_m → Q̄_p is an O-algebra map such that the f-eigenspace of `H^{q_0}(Y, Qbar_p)_m` is nonzero, then there is a cuspidal automorphic representation π of GL_n(𝔸_F) with trivial central character and trivial infinitesimal character at every archimedean place, with `(pi^infty)^{K_empty(R)}` ≠ 0, whose unnormalized Hecke eigenvalues are ι f(`T_{lambda,i}`) for every λ ∉ S.

Boundary vanishing B^van(b) at m. Bigness of r̄_m(`G_{F(zeta_p)}`) (the big-subgroup condition of gap:cht-big-image), used to exclude residual eigensystems. Eisenstein (non-discrete) eigensystems of H^*(Y, ℂ) occur in boundary cohomology: requested from AutomorphicSpectralTheory §§5.12–5.14.

A proof uses the following inputs and comparisons. B^van(b) with coefficients E (universal coefficients from O/ϖᵃ) gives H^*(∂Y, E)_m = 0, so `H^{q_0}(Y, C)_m` consists of interior classes (ALS.4.1). The f-eigenclass is realized by an isobaric automorphic representation Π from a summand of the Franke–Schwermer decomposition (AutomorphicSpectralTheory §5.13; ALS.5b.4). If Π comes from a non-discrete (Eisenstein) contribution, its eigensystem occurs in H^*(∂Y, ℂ) (AutomorphicSpectralTheory §§5.12–5.14 and gap:proper-support-boundary-or-residual), contradicting the first step. If Π is residual, the Moeglin–Waldspurger classification (AutomorphicSpectralTheory §4.14a) gives Π = Speh(σ, k) with k ≥ 2. In the residual case, at every λ ∉ S with N(λ) ≡ 1 mod p the Hecke polynomial of Π_λ is a product `prod_{j<k}P_sigma(N(lambda)^{-j}cX)` whose roots reduce mod ϖ with multiplicity ≥ k; by Chebotarev (TauCetiRoadmap.Chebotarev Layer 10) every element of r̄_m(`G_{F(zeta_p)}`) is some r̄_m(Frob_λ) with N(λ) ≡ 1 mod p, contradicting bigness, which provides an element with a simple eigenvalue. Hence Π = π is cuspidal; trivial coefficients give trivial infinitesimal character, and π_∞ is tempered by Clozel's purity lemma (AutomorphicFormsOnReductiveGroups §5.5), consistent with degree q_0 (AutomorphicFormsOnReductiveGroups §5.3).

**Checks.**

- For F = ℚ and n = 2 this is the statement that non-Eisenstein classes in H^1 of a modular curve come from cusp forms.

- Without bigness, a Speh(σ, 2) eigensystem is not excluded by this argument.

- At n=4, a residual block Speh(σ,2) has two roots per cuspidal root after reduction at norm 1 modulo p: (a,a,b,b). No simple eigenvalue remains; a big image must contain one and therefore excludes this eigensystem.

(CG18, Theorem 5.16 and the sentence after it, published pp. 383–384; CG18 line 3497; CG18, §9.3, Conjecture B(4)(b), published p. 414; CG18 line 4706; CGH20, §3.1, proof of Lemma 3.1, arXiv p. 5; CGH20 line 199.)

*Needs:* §2.1; §2.3; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.4.1; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.5b.4; TauCetiRoadmap.AutomorphicSpectralTheory §5.13; TauCetiRoadmap.AutomorphicSpectralTheory §§5.12–5.14 and gap:proper-support-boundary-or-residual; TauCetiRoadmap.AutomorphicSpectralTheory §4.14a; TauCetiRoadmap.AutomorphicFormsOnReductiveGroups §5.5; TauCetiRoadmap.AutomorphicFormsOnReductiveGroups §5.3; TauCetiRoadmap.Chebotarev Layer 10; TauCetiRoadmap.ArithmeticGaloisRepresentations §§7.2 and 7.4 and gap:cht-big-image.

### 5.7 The maximal ideal m from hypothesis (8)

Let r̄ be the residual representation of a standing datum. (a) If π_0 is a cuspidal automorphic representation of GL_n(𝔸_F) with trivial central character and trivial infinitesimal character, unramified at every v | p and outside S, with `pi_{0,v}^{Iw(v)}` ≠ 0 for v ∈ R, whose unnormalized Hecke eigenvalues at λ ∉ S (after ι : ℂ ≅ Q̄_p) are integral and reduce to the coefficients of the characteristic polynomial of r̄(Frob_λ) in the convention of §2.1, then there is a maximal ideal m of T at level K_∅(R) with `H^{q_0}(Y, k)_m` ≠ 0 and r̄_m ≅ r̄ (given B^gal at m). (b) If r̄ is Serre modular of minimal level and R = R(r̄), §0.6 instead gives a maximal ideal m with H*(Y,k)_m≠0 and the matching residual Hecke polynomials, hence r̄_m≅r̄ under B^gal. This branch asserts total residual support, without a degree-q₀ conclusion.

(a) uses Clozel's purity lemma and the Borel–Wallach range to place π_0 in cuspidal cohomology in degree q_0. Uniqueness of r̄_m is Chebotarev with Brauer–Nesbitt.

A proof uses the following inputs and comparisons. `pi_{0,infty}` is tempered and cohomological for the trivial coefficient system (AutomorphicFormsOnReductiveGroups §§5.5 and 5.3), so π_0 contributes to `H^{q_0}_cusp(Y(K_empty(R)), C)` (ALS.5b.5), since `(pi_0^infty)^{K_empty(R)}` ≠ 0. T acts on the finite O-module `H^{q_0}(Y, O)` and its eigensystem on the π_0-part is integral; reduction gives a maximal ideal m in the support of `H^{q_0}(Y, O)`, hence of `H^{q_0}(Y, k)` by Nakayama and universal coefficients. The Hecke polynomials at m are the reductions of those of π_0, i.e. the characteristic polynomials of r̄(Frob_λ); so r̄_m ≅ r̄ by IntegralHeckeAndGaloisDeterminants §3b.1 (uniqueness). (b) is precisely the total-support definition in §0.6. Upgrading it to degree-q₀ nonvanishing uses the finite patching data, full strengthened Conjecture B and dimension–amplitude concentration of §§4.4 and 5.1, as invoked in §5.8.

**Checks.**

- In (a) the paper's hypothesis that the p-adic representation r_p(π_0) exists and satisfies condition (6) is replaced by the eigenvalue congruence and Iwahori-sphericity at R, which make sense over every number field.

- For F totally real or CM, (a) follows from the paper's form through the Galois representations attached to π_0 and local–global compatibility at ℓ ≠ p.

- A graded module k concentrated in degree q₀+1 has total dimension 1 and degree-q₀ dimension 0. It satisfies the support conclusion of branch (b), while no lowest-degree conclusion follows by definition.

- For a nonzero eigensummand lattice O^a with a≥1, reduction has dimension a over k and the maximal ideal stays in its support. A torsion-only k-class still defines the minimal-level residual branch without an initial O-eigenline.

(CG18, Theorem 5.16(8a)–(8b), published pp. 383–384; CG18 line 3497; CG18, §9.5, published p. 425; CG18 line 5111.)

*Needs:* §0.6; §0.3; §2.1; TauCetiRoadmap.AutomorphicFormsOnReductiveGroups §5.5; TauCetiRoadmap.AutomorphicFormsOnReductiveGroups §5.3; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.5b.5; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §3b.1.

### 5.8 The support-to-eigenclass deduction for conditional lifting

Let r:G_F→GLₙ(O′) be a continuous lift in the standing problem, with O′/O a finite coefficient extension, and let m be supplied by §5.7. Assume the big cyclotomic image, the adjoint-field condition and the strengthened Conjecture B package used in §5.4. Then the prime ker(x_r:R_S→O′) lies in the support of `H=H^{q_0}(Y,E/O)^vee_m`, and the characteristic-zero eigensystem of r occurs in `H^{q_0}(Y,Qbar_p)_m`. Applying §5.6 gives a cuspidal π with the unnormalized arithmetic Hecke polynomial of r at every place outside S. It is a kept variant of the endpoint of ModularityAndLanglandsExtensions §2.8, stated under the Res PGLₙ package of Layer 2.

To apply this statement to the native weight-zero lifting data, require p>n unramified in F; crystalline weights 0,…,n−1 each once at every p-adic embedding; absolute irreducibility on `G_{F(zeta_p)}`; the big image there; ζₚ∉F(ad⁰r̄); balanced oddness at real places; and det `r=epsilon^{n(n-1)/2}`. At each place x∤p where r, or the initial π₀ in the characteristic-zero branch, ramifies, require unipotent inertia for r and either a trivial residual local representation with N(x)≡1 modulo p, or a single residual unipotent inertia block. In branch (a), π₀ is cuspidal with trivial central and infinitesimal characters, spherical at p and off R, Iwahori-spherical on R, with integral unramified Hecke eigenvalues reducing to those of r̄. In branch (b), use the minimal-level residual class of §0.6 and require no new ramification in r. These give R_triv and R_reg and the maximal ideal by §5.7. This is narrower than CG18 Theorem 5.16(6) and than ModularityAndLanglandsExtensions §2.8, which also admit a place x where r ramifies while r̄ is unramified and nontrivial, with N(x) ≡ 1 modulo p. Such an x is in neither R_triv nor R_reg (§1.1): for n = 2 with distinct residual Frobenius eigenvalues the character ring at x is reducible after inverting p (the negative control of §1.3), so Lemma 8.2(3) and §5.2 are unavailable there, and the proof covers only R_triv ⊔ R_reg. Finite coefficient extension supplies pairwise distinct χ with product 1. At x∈R_triv the p-primary part of k_x^× is cyclic of order pᵃ with a≥1, because N(x)≡1 modulo p; after adjoining `mu_{p^a}` to O, fix a generator χ of its character group with values in 1+𝔪_O. Choose distinct a₁,…,aₙ in ℤ/pᵃℤ (possible as pᵃ≥p>n), put s=Σⱼaⱼ and aᵢ′=aᵢ−n⁻¹s with n⁻¹ taken in ℤ/pᵃℤ (it exists because p>n), and set `chi_{x,i} = chi^{a_i'}`. Then Σᵢaᵢ′=s−n·n⁻¹s=0 and aᵢ′−aⱼ′=aᵢ−aⱼ, so the product is 1 and the characters stay pairwise distinct.

For branch (b), begin with the nonzero total residual complex supplied by §5.7, construct the paired finite data using the full hypotheses of §4.4, and apply the dimension–amplitude concentration theorem of §5.1. It gives a nonzero top patched module and nonzero augmentation H, so `H^{q_0}(Y,k)_m`≠0. Thus the use of §5.4 does not require a characteristic-zero initial class.

The point x_r exists by §1.7. Since ann(H) is nilpotent by §5.4 and O′ is reduced, the kernel of R_S→T_m annihilating H is killed by x_r, so x_r factors through T_m. Put κ=Frac(x_r(R_S)). The finite module H has nonzero fibre `H tensor_{R_S} kappa` at that prime. This is distinct from merely forming H⊗_O E. After extending κ to Q̄ₚ, the dual of the fibre gives a nonzero eigenclass at x_r in characteristic-zero cohomology; finite coefficient duality and base change identify the relevant generalized eigenspace, and a finite-dimensional commuting action has a nonzero eigenspace at every point of its support. The cuspidal recognition theorem gives π. Its polynomial equality is `X^n+sum_{i=1}^n (-1)^iN(v)^{i(i-1)/2}t_{v,i}(pi)X^{n-i}=det(X-r(Frob_v))`; equivalently L^S(r,s)=L^S(π,s−(n−1)/2), in the conventions above.

**Checks.**

- A map O⟦X⟧→O′ with X↦0 has quotient O, even if O′ is strictly larger; the fibre uses the fraction field of the image order and can then extend to Frac(O′).
- Over O[ε]/ε² the module O has full support, and every O-algebra map to a reduced coefficient ring kills ε; near faithfulness controls points, while integral faithfulness is a stronger assertion.
- For n=2 and F imaginary quadratic, §3.5 supplies B^tw and §2.8 supplies the range. Boundary vanishing, Galois existence and local compatibility remain the hypotheses.
- In branch (b), a torsion-only initial mod-p class is allowed. Its lift to characteristic zero is a conclusion of the support argument, not part of the input.
- For n=2, arithmetic determinant N(v) yields the Euler factor `1-t_{v,1}T+N(v)T^2`, with the normalized automorphic shift s−1/2. Reversing Frobenius replaces both roots by their inverses.
- For n=2, p=5 and N(x)=11 the p-primary character group has order 5. Exponents (0,1) have s=1 and 2⁻¹=3 in ℤ/5ℤ, so subtracting 3 gives (2,3), sum 5≡0 and product χ⁵=1. Adding 3 instead gives (3,4), product χ²≠1, which restricts nontrivially to the diagonal scalars and is not a PGL₂ Iwahori character datum of §0.1.
- For n=3, p=5 and exponents (0,1,2), s=3 and 3⁻¹=2, so n⁻¹s=1 and the shifted exponents (4,0,1) are distinct with sum 5≡0; subtracting n·s=9≡4 instead would give (1,2,3), sum 6≡1, product χ≠1.

(CG18, Theorem 5.16(1)–(8), pp.383–384 and §9.5, pp.424–428; CG18 line 3497 and line 5166. The intermediate support argument is the deduction specified here, using the named supplier support and spectral results.)

*Needs:* §§1.1–1.7, 2.5, 4.4, 5.1, 5.4, 5.6–5.7; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §§6.1–6.5; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.5a.2–ALS.5a.6 and ALS.5b.4–ALS.5b.6; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §3a.1; TauCetiRoadmap.Chebotarev Layer 10.

### 5.9 The case n = 2 over an imaginary quadratic field

Let F be imaginary quadratic and n = 2, so l_0 = 1, q_0 = 1 and dim Y = 3. Then Theorem 5.16 holds assuming only the clauses B^gal, B^lgc and B^van(b) of Conjecture B at the relevant levels: B^tw holds by Lemma 9.6 and B^van(a) by §2.8(1). The resulting statement is the GL_2 conditional modularity lifting over imaginary quadratic fields in the form of CG18 Theorems 1.2–1.3 and 5.11 (there under Conjecture A), with Ihara avoidance at places where r̄ is trivial.

Hypotheses of §5.8 with n = 2. Conjecture A of CG18 §5.3 is the n = 2 analogue of B^gal and B^lgc in homological normalization.

A proof uses the following inputs and comparisons. Specialize §5.8, replacing B^tw by §3.5 and B^van(a) by §2.8(1). The complexes D̃_N have length one (degrees 1, 2), and the patched module `H^{l_0}(P_infty)` is balanced of codimension one.

**Checks.**

- l_0 = 1 for PGL_2 over an imaginary quadratic field.

- For a non-CM elliptic curve over F with r̄ satisfying the hypotheses, the conclusion is modularity by a cuspidal cohomological π of PGL_2(𝔸_F).

- For F=ℚ(i), n=2 and R=∅, p=5 splits so |T|=2 and g=q−2; p=7 is inert so |T|=1 and g=q−3. At q=3 the values are 1 and 0, respectively.

(CG18, §5, Theorems 1.2, 1.3 and 5.11, published pp. 301–302, 379; CG18 line 192, line 225 and line 3324; CG18, §9.3, Lemma 9.6, published p. 416; CG18 line 4782.)

*Needs:* §5.8; §3.5; §2.8.

### 5.10 Defect zero: n = 2 over a totally real field

Let F be totally real and n = 2, so l_0 = 0 and q_0 = [F:ℚ]. Then the complexes D̃_N are single free S_N-modules, the patching is module patching, and Theorem 5.16 is the weight-two Fontaine–Laffaille automorphy lifting theorem for Hilbert modular forms (with Ihara avoidance at places where r̄ is trivial), conditional on Conjecture B for the Betti cohomology of Hilbert modular varieties in middle degree.

Hypotheses of §5.8 with n = 2 and F totally real; r is totally odd by §1.1(f).

The unconditional Fontaine–Laffaille-range lifting theorem for Hilbert modular forms, with Taylor's Ihara avoidance, is GL2ModularityLifting §5.8 with Layer 4 of that roadmap; this section records only that the support-to-eigenclass deduction of the present roadmap specializes to a statement of that kind when l_0 = 0 under Conjecture B, and is not a second proof of it.

A proof uses the following inputs and comparisons. l_0 = r_1⌊1/2⌋ + r_2 = 0 and 2q_0 = 2[F:ℚ] = dim Y (AutomorphicFormsOnReductiveGroups §5.3). With l_0 = 0, §5.1 reduces to a single free module (DeformationAndDerivedPatchingAlgebra §9.2) and the argument is Taylor–Wiles–Kisin's, with Taylor's Ihara avoidance on the χ side.

**Checks.**

- For F = ℚ, Y is a modular curve, q_0 = 1, and Conjecture B holds at non-Eisenstein m.

- The numerical coincidence dim R_∞ = dim S_∞^□ holds exactly (no defect); S_∞^□=S_∞⟦z₁,…,zⱼ⟧.

- For F real quadratic, n=2 and |T|=1, ℓ₀=0, q₀=2, g=q−2 and dim R_∞=1+q+3=4+q. At q=3, both dim R_∞ and dim S_∞^□ are 7, while dim S_∞=4; dropping framing changes the comparison.

(CG18, §8.1, published p. 401; CG18 line 4167; CG18, §8.4, published pp. 405–406; CG18 line 4339.)

*Needs:* §5.8; TauCetiRoadmap.AutomorphicFormsOnReductiveGroups §5.3; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §9.2.

### Examples

Over A=k[ε]/(ε²), M=k has annihilator (ε), radical annihilator (ε)=√0, and full support, but it is not faithful. This distinguishes the near-faithfulness conclusion from the integral R=T conclusion that needs a nonzero free module.

### Dependencies

Earlier layers 0–4; TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra §§1.12, 3.1–3.4, 3.10, 4.6, 6.1–6.8, 7.3, 7.6, 8.6 and 9.1–9.2; TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.0.7–ALS.0.10, ALS.1.1–ALS.1.8, ALS.2.2–ALS.2.4, ALS.3.3–ALS.3.9 and ALS.3.14, ALS.4.1 and ALS.4.9–ALS.4.12, ALS.5a.2–ALS.5a.6, ALS.5b.4–ALS.5b.6, ALS.6.1–ALS.6.3; TauCetiRoadmap.AutomorphicSpectralTheory §§4.14a and 5.12–5.14; TauCetiRoadmap.AutomorphicFormsOnReductiveGroups Layers 4–6; ClassFieldTheory Layers 7 and 11 and Chebotarev Layer 10; TauCetiRoadmap.ArithmeticGaloisRepresentations §§7.2, 7.4 and 7.7–7.12; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §§1.2–1.3, 2.1–2.3, 3a.1 and 3b.1–3b.2; TauCetiRoadmap.PadicHodgeTheory §6.1.

## Downstream consumers

The near-faithfulness and smooth R=T conclusions supply conditional arbitrary-number-field arithmetic applications. The smooth case (§5.5), under the strengthened inertia–diamond hypothesis, together with the conditional PGLₙ comparison of §3.7 under its principal-series block hypothesis at every successive base level, supplies the corresponding inputs to the Betti-cohomology argument for adjoint Bloch–Kato Selmer vanishing in CGH20 Theorem 1.2. This use retains those additional hypotheses. The rank-two specializations of the strengthened hypothesis and of §3.5 serve conditional GL₂ automorphy lifting over number fields of positive defect, at minimal and at nonminimal level. These applications consume this roadmap; none of them is an input to any layer.

## References

- **CG18.** Frank Calegari and David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, Invent. Math. 211 (2018), 297–433. [Author's published-layout copy](https://www.math.uchicago.edu/~fcale/papers/CG.pdf). Theorem 5.16, pp.383–384; §§6–9, pp.384–428; especially Lemma 8.2, Proposition 8.5, Conjecture B, Lemma 9.6, Theorem 9.16 and Theorem 9.19. Published section and page numbering is used throughout; CG18 line 3497, line 4440, line 4543, line 4684, line 4782, line 5027 and line 5166 locate these statements and arguments.
- **CGH20.** Frank Calegari, David Geraghty and Michael Harris, *Bloch–Kato conjectures for automorphic motives*, appendix to the Duke Math. J. 169 (2020) paper. [arXiv:1907.08694v1](https://arxiv.org/abs/1907.08694v1), Theorem 1.2, Lemma 3.1, Theorem 3.2 and §4, pp.2–8; CGH20 line 71, line 169 and line 287. These are v1 preprint numbers; the published appendix numbers are A.2, A.3 and A.4 respectively.
- **KT17.** Chandrashekhar B. Khare and Jack A. Thorne, *Potential automorphy and the Leopoldt conjecture*. [arXiv:1409.7007v2](https://arxiv.org/abs/1409.7007v2), §6.6, Lemma 6.25 and Proposition 6.26, pp.40–43; KT17 line 1871, line 1893, line 1954 and line 1984. The local group there is GLₙ and the coefficient theory is ordinary completed cohomology.
