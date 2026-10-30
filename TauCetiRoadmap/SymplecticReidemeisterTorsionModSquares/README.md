# Roadmap: symplectic Reidemeister torsion mod squares and the étale Chern class

**Summary.** Build signed Reidemeister torsion for nonacyclic self-dual local systems from finite cellular cochains and graded determinants, extend it over normal domains, and identify its normalized value in dimension three with the étale second Chern transgression. The end theorem is `N(M,rho) = [(-1)^(chi_half(M,rho)/2)] RT(M,rho) = <rho*c_et,[M]>` for every closed smooth oriented three-manifold with a symplectic local system over any field of characteristic different from two. The circle and mapping-torus formulas hold in every odd characteristic. A Gaussian genus-two witness, finite-field K-theory, transfer and density arguments give the comparison for all fields, rather than only a density-one set. A separate Bockstein argument proves real Chern vanishing on full mod-two homology (AV-v1, Theorem 2.1, p. 10, line 422; §1.3.3, p. 6, line 230).

## Scope and ownership

This roadmap owns the signed Poincaré-complex and determinant-root adapters, cellular torsion, the normalized family invariant, the odd-characteristic circle calculation, the torsion–Chern comparison and its surface and real consequences. Its constructions are general library objects: finite projective coefficients, arbitrary finite ranks where meaningful, nonacyclic systems and all fields with two invertible. The real symplectic Lagrangian notion in Tau Ceti's `Geometry/Symplectic/Lagrangian/Basic.lean` concerns real vector subspaces; the retained Lagrangian subcomplex here has an exact shifted-dual quotient over general coefficient rings.

The graded-line category, tensor signs, parity reduction and general perfect-complex determinant functor are stated by KTheoryLowDegrees §§14.1–14.4 and PadicMeasuresIwasawaAlgebras §5.1. Their coherent exact-triangle, acyclic, shift, cone and base-change maps are inputs. Only the reverse-wedge and right-evaluation normalization comparisons are developed here. The orthogonal group and spinor norm are already in the library: `TauCeti.QuadraticMap.orthogonalGroup`, `CliffordAlgebra.orthogonalSpinorNorm` and `CliffordAlgebra.spinorNorm`. The reflection value at the pins is [Q(v)]; no second norm or star-norm conversion is constructed.

TangentialBordism B1–B2 owns labelled smooth bordism, its fundamental-class map and its skeletal filtration; B3.1 owns its low coefficient groups. This roadmap proves their degree-at-most-three orientation comparison as a consequence, rather than constructing another bordism theory. AlgebraicTopology Stages 2, 4, 5 and 6 owns local coefficients, cellular comparison, the constant-coefficient Wang sequence, finite-cover transfer and duality. GeometricTopology Layers 1 and 11 and its smoothing-and-triangulation comparison own the geometric cell changes.

KTheoryFiniteLocalFields §§1.5, 1.8–1.9 owns finite-field restriction/transfer, universal equivariant finite Chern classes and the finite-rank degree-three Chern isomorphism. K3BlochGroups §§2.4–2.5 and 6.7 owns indecomposable K₃ and its stable Hurewicz and coefficient comparisons. SchemeAndStackFoundations §2.11 owns Kummer torsors as line pairs; §§0.9 and 0.21 own approximation and finite normalization. Chebotarev Layers 7, 11 and 13 owns number-field weighted density; the arithmetic-scheme detection input is its explicit supplier extension below. RepresentationTheory/LieGroups Layer 5 owns universal covering groups, and MetaplecticAutomorphicForms §2.4b owns the metaplectic cover. This roadmap owns the application to real Chern components, without reconstructing either cover.

MorseNovikov §N4 owns based cellular torsion over Novikov total quotient rings with zero assigned to nonacyclic components; the retained invariant here uses the Poincaré cohomology root and is defined for nonacyclic self-dual systems. HermitianKTheoryOfPoincareCategories §4.7 owns Ranicki structures in homotopy fixed points and their cobordism groups; the retained signed cochain pairing is the strict bilinear adapter with the evaluation conventions below.

The arithmetic application to central values of symplectic L-functions modulo squares and Hurwitz/PEL geometry is outside this roadmap’s ownership.

## Conventions

Fix universes for spaces, discrete groups, rings and modules; homology lies in the required larger module universe. CW spaces have small cell sets; labelled compact smooth manifolds are Hausdorff, second countable and finite dimensional. A closed manifold is compact without boundary; boundaries use the outward-normal-first orientation. Disconnected compact manifolds are finite disjoint unions. Rings are commutative with unit; rings used for families are nonzero normal integral domains with 2 invertible, while the linear algebra of Layers 0–2 allows arbitrary commutative rings with 2 invertible. Fields have characteristic different from two. Finite projectives have locally constant finite rank; a symplectic system has a perfect alternating pairing and constant rank 2r on each connected component. Positive symplectic rank means r≥1; rank zero has zero degree-three source and trivial torsion.

Cochains increase degree: R[k] is concentrated in degree −k, C[1] has differential −d, and the dual differential in degree q is `(-1)^(q+1) (d^(-q-1))*`. Cone(f:C→D) has terms `D^q` ⊕ `C^(q+1)` and differential (y,x)↦(d_Dy+fx,−d_Cx). A dimension-n pairing lands in R[−n]. Tensor interchange has sign `(-1)^(p*q)`. All finite alternating sums use integer signs and an explicit finite support interval, with independence of that interval proved (AV-v1, A.1–A.3, pp. 61–64, line 2832).

Determinant tensors are ordered by increasing degree. Line inversion reverses factor order; evaluation is right ordered, and the signed double inverse on parity a is (−1)^a. Determinant duality uses the reversed dual wedge, with correction `(-1)^(n*(n-1)/2)`. The shift scalar is fixed by Cone(id), rather than chosen independently. A two-term based complex K —a→ K in degrees 0,1 has acyclic volume a⁻¹ times its based determinant generator and based-to-acyclic ratio a; shifting inverts this scalar (AV-v1, B.1–B.4, pp. 68–76, lines 3181, 3282, 3506).

Square classes are written multiplicatively: 1 is trivial. `TauCeti.SquareClassGroup` is additive with identity 0; `TauCeti.squareClassHom` uses its multiplicative wrapper. A line square-class torsor has no preferred origin. Over rings use H¹_et(R,μ₂), including its Pic(R)[2] contribution. Unsigned discriminant means Gram determinant modulo squares, with no dimension sign. For a quadratic form Q the bilinear form in the Lean signature is its associated form B, so B(v,v)=Q(v); the polar form is 2B. Reflection values are [Q(v)] under the pinned convention. On SO, replacing B by 2B changes each even-reflection word by a square (JRV, Theorem 5.1, pp. 16–17, line 782).

The source of both transformations is B_r(R)=H₃(BSp₂ᵣ(R);ℤ)/2, the integral group modulo doubling. Its manifold labels use local systems with a fibre identified with the standard free symplectic module R²ʳ; arbitrary finite-projective families use §3.5. It is not full H₃(−;𝔽₂): the homological coefficient sequence has H₂(−;ℤ)[2] as cokernel. The two agree for the finite symplectic groups over odd finite fields supplied below. The real conclusion has the larger full-mod-two domain and uses a separate proof. All group homology uses discrete groups, including real symplectic groups. Frobenius at an unramified closed point acts arithmetically by x↦x^q; quadratic character values are unchanged by inversion (AV-v1, §2.6, p. 16, line 690; §2.11, p. 21, line 921).

## Exact supplier contracts

### From Mathlib

`CochainComplex` in `Mathlib/Algebra/Homology/HomologicalComplex.lean` and `HomologicalComplex.homology` in `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean` supply cochains and their native homology. Boundedness, finite projectivity and a pairing are additional hypotheses, not fields of the bare cochain carrier. `groupHomology` in `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean` supplies homology of representations; trivial integral coefficients and reduction modulo two are specified explicitly. `Sylow` in `Mathlib/GroupTheory/Sylow.lean` supplies the subgroup carrier. `SymplecticGroup.det_eq_one` in `Mathlib/LinearAlgebra/SymplecticGroup.lean` holds over a commutative ring and supplies every finite-rank change-of-basis determinant. `QuadraticForm`, `QuadraticMap.associated`, `Module.Basis`, `LinearMap.ker`, `LinearMap.range`, `LinearMap.restrict`, `LinearMap.det` and `Matrix.det` supply the exact carriers in the Zassenhaus acceptance test. Its restriction witness says that A+1 preserves its stable image; it is no assumption about a spinor value. `Nat.forall_exists_prime_gt_and_eq_mod` in `Mathlib/NumberTheory/LSeries/PrimesInAP.lean` supplies a prime above any bound in any unit residue class; §6.3 uses the unit class 1+h modulo 2h for even h.

### From Tau Ceti

Use `TauCeti.SquareClassGroup`, `TauCeti.squareClassHom` and `TauCeti.squareClass_eq_zero_iff` from `TauCeti/FieldTheory/SquareClassGroup/Basic.lean`, and `RingHom.squareClassMap` from `TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean`. They identify a trivial scalar class with a square and supply coefficient functoriality. Use `TauCeti.QuadraticMap.orthogonalGroup` from `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean` and `CliffordAlgebra.orthogonalSpinorNorm`, `CliffordAlgebra.orthogonalSpinorNorm_reflectionOrthogonal`, `CliffordAlgebra.spinorNorm` and `CliffordAlgebra.spinorNorm_apply` from `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean`, with finite dimension, nondegeneracy and two invertible. A reflection with Q(v)=2 has value [2], whereas the erroneous negative convention gives [−2] over ℚ. A real positive definite plane has trivial image, so no unconditional surjectivity assertion is consumed.

**Checks for the conventions.**

- Over the zero ring, 0=1 and the only module and determinant map are the zero module and its unique isomorphism; the empty prime spectrum imposes no positive-rank inference. Family theorems require a nonzero domain.
- Over ℚ[ε]/(ε²), the strict two-term model with cross matrix I₂ and differential ε[[0,1],[−1,0]] has residual H⁰ dimension 2 and parity 0. It belongs to the ring linear algebra, while the ring is nonreduced and is outside the normal-domain family hypotheses.
- At n=0,1,2 the reverse-wedge exponents n(n−1)/2 are 0,0,1; the signs are +1,+1,−1. Empty determinants are 1, and no inverse determinant is used without a nonzero determinant.

### From TauCetiRoadmap.KTheoryLowDegrees

Sections 14.1–14.4: integer-graded lines and their signed coherence, parity comparison, projective determinants and the determinant of perfect complexes with ordered exact-triangle, shift, acyclic, cone and pullback comparisons. Their affine parity specialization is PadicMeasuresIwasawaAlgebras §5.1. Over an empty spectrum the line groupoid is terminal; over a field a line in odd grade has self-interchange −1. The scalar normalization for K —a→ K is a⁻¹ for its acyclic volume.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

Section 5.1: the finite-projective determinant line with quasi-isomorphism, exact-sequence, base-change, dual, shift, acyclic and cone maps. The field cohomology comparison uses boundary/cycle exact sequences with these maps. Its AV-normalized duality compatibility is proved in Layer 1. At a=2 the based-to-acyclic ratio is 2; a=0 is not an acyclic complex.

### From TauCetiRoadmap.AlgebraicTopology

Stage 2: local systems and coefficient pullbacks; Stage 4: cellular chains; Stage 6.1: local-system cellular cochains and their singular comparison. Section 4.7 derives its presentation-specific crossed-homomorphism description from that cellular model. Stage 5: the constant-coefficient Wang cone of a mapping torus, with endomorphism id − f_*, and integral finite-cover transfer with inclusion after transfer equal to subgroup index. Section 4.6 derives the local-coefficient Wang triangle for a mapping torus with a chosen coefficient intertwiner from Stage 6.1's Mayer–Vietoris sequence of a binary open cover; for f = id with intertwiner −I its endomorphism is 1 − T = 2, whereas id − f_* is zero. Stage 6.2: cup and cap products; Stage 6.3: the orientation local system and fundamental classes; Stage 6.4: Poincaré–Lefschetz duality, including `compactTriadPoincareLefschetz`. The chain-level boundary-pairing comparison is the additional contract below. The orientation on an interval gives endpoint coefficients −1,+1. For an index-three transfer, the composite on integral homology modulo two is multiplication by 3, hence identity.

The following contract extends Stage 6.4’s `compactTriadPoincareLefschetz`.

What AlgebraicTopology must provide (gap:poincare-boundary-cone): Provide a chain-homotopy-compatible identification of the cone of the relative self-duality adjoint with boundary cochains, carrying its signed pairing to outward-first Poincaré duality for finite projective self-dual local systems with two invertible.

### From TauCetiRoadmap.GeometricTopology

Layers 1 and 11 and the smoothing-and-triangulation comparison: compact smooth cellulations, boundary-compatible dual cells and simple comparisons. A single even-rank elementary cell pair contributes determinant one; arbitrary quasi-isomorphisms need not preserve a based volume. The scope is smooth manifolds, without a triangulability assertion for arbitrary topological manifolds.

What GeometricTopology must provide (gap:smooth-cell-comparison): Provide finite smooth-compatible triangulations, boundary dual cells, common subdivisions and simple comparison maps in every finite dimension, preserving transported local-coefficient cellular volumes.

What GeometricTopology must provide (gap:marked-surface-twists): Provide, for marked closed smooth oriented surfaces, compatibility between orientation-preserving Dehn twists and their induced automorphisms of marked fundamental-group presentations, including basepoint-path conjugation and preservation of the oriented relator up to conjugacy with exponent +1.

### From TauCetiRoadmap.TangentialBordism

B1, B2.1–B2.5 and B3.1: labelled compact smooth cycles, the witness quotient, collars/gluing, pushforward, orientation reversal, fundamental classes, the relative skeletal filtration and the coefficients Ω₀^SO=ℤ, Ω₁^SO=Ω₂^SO=Ω₃^SO=0. A positive point maps to 1, a constant-labelled circle is zero, and the identity-labelled circle over Bℤ maps to 1 in H₁(Bℤ;ℤ). The last circle is not a nullbordism over its label.

**Checks.**

- The signed count of a positive point and a negative point is 1−1=0.
- A constant-labelled circle has class 0 over a point.
- The identity-labelled circle over Bℤ maps to 1 in integral H₁, excluding a bordism relation that forgets the parameter map.

### From TauCetiRoadmap.StableHomotopyKTheory

Sections 1.17 and 1.30–1.32: filtered-colimit homology of group classifying spaces and the natural bar/nerve comparisons. The classifier itself is the supplied discrete-group classifier used there. Section 1.31 supplies free homotopies for conjugate group maps, hence conjugation invariance on integral homology. The comparison carries the identity-labelled circle to the integral bar generator; it does not replace integral H₃/2 by full mod-two homology.

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 2.9 and 2.11: finite étale covers, μ₂ and Kummer line pairs; §0.9: finite-presentation approximation and descent; §0.21: excellence and finiteness of normalization for finite-type ℤ-algebras. Over ℚ[s]_(s), s defines a ramified generic quadratic extension and has no étale extension to the whole base; normality extends isomorphisms between existing étale covers, not arbitrary ramified covers. A unit 1+s does define an étale torsor and specializes to 1.

What SchemeAndStackFoundations must provide (gap:normal-torsor-gluing): Provide generic-fibre full faithfulness for finite étale covers of an arbitrary normal integral affine scheme, including injectivity on μ₂-torsor classes and extension of generic isomorphisms between covers already defined on the base.

### From TauCetiRoadmap.KTheoryFiniteLocalFields

Sections 1.5 and 1.9: all odd finite fields, every positive finite symplectic rank, the order-two integral H₃ quotient and its Chern isomorphism, rank stabilization and compatible field restriction and transfer. H₂ has odd order; SL₂(𝔽₉) has H₂=ℤ/3. Under 𝔽_q→𝔽_(q²), restriction in degree three has multiplier q²+1, which is even (10 at q=3, 26 at q=5). Section 1.8: universal equivariant finite-coefficient Chern classes on commutative rings with the coefficient modulus invertible, including slant, stabilization and coefficient compatibility. Its second Chern map in degree three is additive at modulus two; the degree-two even-modulus exception is not applied here. Over 𝔽₃ the nonzero class evaluates to [−1]; over 𝔽₅ it evaluates to [2], not to [−1].

What KTheoryFiniteLocalFields must provide (gap:witt-sylow-lift): Provide compatible lifts of every finite-field symplectic Sylow 2-subgroup representation through truncated Witt rings to the full Witt ring in odd residue characteristic, using smooth congruence kernels and averaging.

What KTheoryFiniteLocalFields must provide (gap:real-chern-bockstein): Provide the real c₂₂ and c₃₁ components of the universal standard-representation étale c₂ for discrete Sp₂ᵣ(ℝ), r≥1, with c₂₂ equal to the discrete pullback of the real metaplectic double-cover class.

What KTheoryFiniteLocalFields must provide (gap:real-chern-bockstein-compatibility): For discrete G=Sp₂ᵣ(ℝ), r≥1, prove β_et(c₃₁(z))=c₂₂(β_G z) for every z∈H₃(G;𝔽₂), where β_G:H₃(G;𝔽₂)→H₂(G;𝔽₂) is the homological coefficient Bockstein and β_et:H¹_et(ℝ,𝔽₂)→H²_et(ℝ,𝔽₂) is the étale coefficient Bockstein.

### From TauCetiRoadmap.K3BlochGroups

Sections 2.4–2.5: the natural stable number-field Hurewicz equivalence from indecomposable K₃ and its rank r₂. Section 6.7: genuine finite-coefficient second Chern comparison, with its K₂-torsion correction distinguished from the integral quotient. Over ℚ, stable Hurewicz is ℤ/48→ℤ/24 and has a nonzero order-two kernel; it is not an integral K₃ isomorphism. The unstable and dyadic interfaces needed here are the precise extensions below.

What K3BlochGroups must provide (gap:unstable-sl2-chern-lift): Provide the natural surjection from integral H₃ of SL₂ of every infinite field onto indecomposable K3, compatible with stabilization and the number-field stable Hurewicz equivalence.

What K3BlochGroups must provide (gap:dyadic-number-field-chern-rank): Provide for every number field F the standard-representation degree-three Chern surjection from indecomposable K3(F) onto H¹(F,ℤ₂(2))/2, whose F₂-dimension is at least r₂(F), including the real-place corrections.

What K3BlochGroups must provide (gap:dyadic-number-field-chern-reduction): For every number field F, provide the injective coefficient reduction H¹(F,ℤ₂(2))/2→H¹(F,μ₂), compatible with the degree-three second Chern map and its real-place normalization.

### From TauCetiRoadmap.Chebotarev

Layers 7, 11.3 and 13: auxiliary cyclotomic disjointness, the negligible residue-degree and prime-power tails and weighted natural Chebotarev for a conjugacy-invariant subset S of a finite Galois group G. Its weighted density is |S|/|G|. The nonidentity class of C₂ has density 1/2; a finite exceptional set has limiting weight zero. Arithmetic-scheme detection is the Part II extension of the number-field theory, with its exact contract below; the number-field theorem alone does not supply it. In that affine extension, for each connected nontrivial double cover in characteristic zero require constants c>0 and Q₀≥1 such that every Q≥Q₀ has nonsplit weighted count at least cQ^d; the residue-order estimate has one constant C such that every prime power q has at most Cq^(d−1) closed points of that order. For independent quadratic classes the finite quotient detects each required character pattern, in particular (0,1), rather than merely detecting the two classes separately.

**Checks.**

- A nontrivial quadratic number-field character has nonsplit proportion 1/2; a finite exceptional set has weight O(1/X).
- On Spec ℤ[1/2,t], dimension d=2 gives degree-one main term Q²/2, so its normalized total is 1/2 and a universal total limit 1 is false.
- For Spec 𝔽₃, the nontrivial torsor is detected by its unique closed-point Frobenius; there cannot be two independent quadratic classes since H¹ has dimension 1. No norm-counting real limit is requested in this case.

What Chebotarev must provide (gap:arithmetic-scheme-frobenius-detection): For every normal integral affine finite-type ℤ[1/2]-scheme, detect finite étale quadratic quotients and independent pairs of μ₂-classes by Frobenius at closed points, in every characteristic.

What Chebotarev must provide (gap:arithmetic-scheme-nonsplit-weight): For every connected nontrivial double cover of a normal integral affine finite-type ℤ[1/2]-scheme of characteristic zero and Krull dimension d, provide c>0 and Q₀≥1 such that the logarithmically weighted nonsplit closed-point count of order at most Q is at least cQ^d for every Q≥Q₀.

What Chebotarev must provide (gap:arithmetic-scheme-residue-order-count): For every normal integral affine finite-type ℤ[1/2]-scheme of characteristic zero and Krull dimension d, provide one constant C with at most Cq^(d-1) closed points of residue field order q for every prime power q.

### From TauCetiRoadmap.RepresentationTheory/LieGroups

Layer 5: the universal covering Lie group of a connected finite-dimensional Lie group with discrete central kernel its fundamental group. The symplectic kernel identification required below is an additional contract. Rank zero has a trivial group and trivial fundamental group, so the ℤ assertion is restricted to positive rank.

What RepresentationTheory/LieGroups must provide (gap:symplectic-universal-cover-kernel): Identify the fundamental group of positive-rank real symplectic groups with ℤ and the quotient of their universal covering group by 2ℤ with the metaplectic double cover, preserving its central generator modulo two.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

Section 2.4b: the real topological double cover and its central sign, including the zero-dimensional cover. For positive rank it is the cover compared with the universal symplectic covering group in the contract below. Its central sign remains the same after forgetting topology.

## How to read the build

Layer 0 fixes signed complexes and their strict models. Layer 1 adapts the supplied determinant to square-root volumes. Layer 2 constructs torsion and proves its boundary sign. Layer 3 proves evenness, family naturality and the two homology transformations. Layer 4 supplies the all-odd circle and mapping-torus formulas and the Gaussian witness. Layers 5–6 propagate that witness through Chern lifts and weighted density. Layer 7 upgrades the density result to every odd finite field, every indicated normal ring and every coefficient field, and evaluates the comparison on manifolds. Layer 8 uses the real Chern/Bockstein contract to obtain the stronger full-mod-two conclusion. Dependencies inside a layer follow the subsection order; a proof route lists its actual inputs separately from the target's hypotheses.


## Layer 0: signed Poincaré complexes

### 0.1 Cochain, shift, dual and cone conventions

Use bounded cochain complexes of finite projective R-modules, R commutative and 2 invertible. R[k] is in degree −k; `C[1]^q = C^(q+1)` with differential −d. The dual has `(C^dual)^q = (C^(-q))*`, differential `(-1)^(q+1) (d^(-q-1))*`. Tensor symmetry on degrees p,q is `(-1)^(p*q)`. `Cone(f)^q = D^q` ⊕ `C^(q+1)`, d(y,x)=(d_D y+f x,−d_C x). The comparison (C[1])∨≃C∨[−1] multiplies degree q by (−1)^q, and cone-duality uses the corresponding signed summand interchange. (AV-v1, Appendix A.1–A.2, (A.1)–(A.5), pp. 61–63, line 2832).

A proof route is as follows. Express these as identifications on the existing cochain carrier, rather than a second complex structure. Check the chain-map equations degree by degree; derive cone-duality from the displayed differential and the Koszul evaluation.

The signed comparison API has the following consequences on these bounded finite projective complexes.

- The dual-shift chain isomorphism has component (−1)^q in degree q.
- The cone-duality chain isomorphism uses the displayed summand interchange and its Koszul sign.
- Both comparisons commute with cochain isomorphisms and coefficient extension that preserves finite projectivity.

**Checks.**

- For C=K —a→ K in degrees 0,1, C[1] is in degrees −1,0 with differential −a; at a=2 the two differentials are 2 and −2, excluding an unsigned shift.
- For C=K in degree zero, Cone(id) is K —1→ K in degrees −1,0 and has zero cohomology; Cone(0) instead has K in both degrees.
- The dual-shift comparison has coefficients +1 at degree zero and −1 at degree one; treating it as identity fails its chain-map equation for a=2.

*Needs:* `CochainComplex`.

### 0.2 Symmetric Poincaré complexes

For such C, n∈ℤ and ε∈{1,−1}, an ε-symmetric dimension-n structure is a degree-zero chain map T:C⊗C→R[−n] satisfying `T(x,y) = epsilon * (-1)^(p*q) * T(y,x)` on x∈C^p,y∈C^q. Its adjoint f:C→C∨[−n] uses the evaluation convention of cochain-conventions. It is Poincaré when f is a quasi-isomorphism and strict when f is an isomorphism. These are distinct predicates on the same pairing data. (AV-v1, Appendix A.3, (A.6)–(A.7) and Remark A.1, pp. 63–64, line 2963).

A proof route is as follows. Construct the adjoint using the signed evaluation and prove its chain-map law. Show that shifting once changes (ε,n) to (−ε,n−2).

The API has the following consequences under these hypotheses.

- Recover the bilinear degree-n pairing and its symmetry and closedness laws.
- The associated cochain map C→C∨[−n].
- Shift by one changes dimension by −2 and symmetry sign by −1.
- Strictness is equivalent to every component of the adjoint being an isomorphism.

**Checks.**

- L⊕L∨[−n] with evaluation cross terms is strict.
- A nonzero contractible complex with zero pairing is Poincaré but is not strict.
- A skew dimension-3 structure becomes symmetric of dimension 1 after one shift.

*Needs:* §0.1; `HomologicalComplex.homology`.

### 0.3 The algebraic boundary

Given an ε-symmetric dimension-n C with adjoint f, put ∂alg C=Cone(f). It has a canonical strict ε-symmetric structure of dimension n−1, with Lagrangian C∨[−n] and quotient C[1]. In degree q write `(alpha,x)` ∈ `(C^(n-q))*` ⊕ `C^(q+1)`; for p=n−1−q set `T_boundary((alpha,x),(beta,y)) = (-1)^q * alpha(y) + epsilon * (-1)^(q*p+p) * beta(x)`. The cone differential is the one fixed above. (AV-v1, Appendix A.5, diagram (A.9), p. 65, line 3015).

A proof route is as follows. Check closedness using symmetry of f and the signed dual differential. The cross-term matrix is invertible with unit signs, independently of whether f is a quasi-isomorphism. Identify the adjoint of the first summand with the projection to its shifted dual.

The API has the following consequences under these hypotheses.

- Construct the boundary with the displayed signed cross pairing.
- Its adjoint is an isomorphism.
- The inclusion C∨[−n]→∂alg C has quotient C[1].
- Isometries of C induce isometries of its boundary.

**Checks.**

- The boundary of the zero complex is zero.
- For C=R in degree zero and symmetric f=(a), the boundary is R —a→ R in degrees −1,0 with the prescribed hyperbolic cross pairing, even when a=0.
- The kernel of the cone projection to C[1] is the summand C∨[−n], whose degrees agree with the cone inclusion.

*Needs:* §0.2.

### 0.4 Semicharacteristic

For a bounded cochain complex C of finite-dimensional K-vector spaces and a cutoff m, define `chi_le_m(C) = sum_(q<=m) (-1)^q dim_K H^q(C)`; the sum is finite. For dimension 2m+1 Poincaré complexes use χ₁/₂=χ≤m. For a local coefficient system on a closed 3-manifold this is dim H⁰−dim H¹. Over rings only the fibrewise value modulo two is initially defined. (AV-v1, Appendix A.6, (A.10), pp. 65–66; §2.3.4, p. 13, line 3047).

A proof route is as follows. Take the finite sum on any support interval; show independence of that interval. Transport under cohomology isomorphisms, keeping the integer value rather than only parity.

The API has the following consequences under these hypotheses.

- Return the finite alternating cohomology sum at a cutoff.
- Quasi-isomorphic complexes have the same value at every cutoff.
- The integer is additive under finite direct sums.
- For support [0,3] the midpoint value is dim H⁰−dim H¹.

**Checks.**

- The zero complex has semicharacteristic zero.
- The degree-zero/degree-three rank-two cohomology of S³ has χ₁/₂=2.
- K concentrated in degree 1 has χ≤1=−1, so omitting the alternating sign fails.

*Needs:* `CochainComplex`; `HomologicalComplex.homology`.

### 0.5 Local strictification

For a bounded finite projective ε-symmetric Poincaré complex over a commutative ring R with 2 invertible, every prime has a Zariski neighbourhood on which it admits a finite free strict model related by a pairing-preserving quasi-isomorphism up to chain homotopy. (AV-v1, Appendix A.6.2, p. 66, line 3078).

A proof route is as follows. Over a local ring cancel differential entries that are units, obtaining a finite minimal free complex. On its residue-field reduction the differential is zero; the Poincaré adjoint is then an isomorphism in each degree. Nakayama makes the adjoint invertible after localization. Transfer the pairing through the contraction and average it with its signed transpose using 1/2; shrink to a finite free neighbourhood.

**Checks.**

- The strict hyperbolic two-term zero-differential model with cross matrix 1 remains unchanged; its adjoint determinant is 1.
- The contractible complex K —1→ K with zero pairing contracts to zero: its adjoint has zero components before contraction, while the strict zero model has the unique invertible zero-space adjoint.
- Over ℚ[s]_(s), the symmetric dimension-one model with cross matrix I₂ and differential s[[0,1],[−1,0]] is strict, although its fibre H⁰ dimensions are 0 generically and 2 at s=0; strictification cannot mean constant cohomology.

*Needs:* §0.2.

### 0.6 Parity and local constancy

For a strict symmetric dimension-1 complex over a field of characteristic ≠2, `chi_le_0(C)` ≡ `sum_(q<=0) dim C^q` (mod 2). For a finite projective symmetric Poincaré complex over a ring with 2 invertible, this fibrewise parity is locally constant. Shift to obtain the analogous statement in dimension 2m+1 with symmetry (−1)^m. (AV-v1, Appendix A.6, (A.11)–(A.12), pp. 65–66, line 3057).

A proof route is as follows. The form (x,y)↦T(d⁰x,y) on C⁰ is alternating with radical ker d⁰; hence rank d⁰ is even. The relevant quotient is C⁰/ker d⁰, not coker d⁰. Euler cancellation below degree zero gives `sum_(q<=0) (-1)^q (dim C^q - dim H^q) = rank d^0`. Use local strictification and locally constant ranks of finite projectives.

**Checks.**

- For the strict symmetric model with C⁰=C¹=K and d=0, the lower term sum and χ≤0 are both 1; evenness without strong evenness would be false.
- For C⁰=C¹=K², cross matrix I₂ and d=[[0,1],[−1,0]], the lower term sum is 2, cohomology is zero and the rank difference is 2.
- For d=s[[0,1],[−1,0]] over ℚ[s]_(s), the generic and special χ≤0 are 0 and 2, both parity zero; the ordinary integer is not locally constant.
- Over 𝔽₂ the model C⁰=C¹=𝔽₂, cross pairing 1 and differential 1 is strict and symmetric, but χ≤0=0 while the lower term rank is 1. This refutes the parity statement without two invertible.

*Needs:* §0.4; §0.5.

### 0.7 Splitting a strict symmetric complex

Over a field of characteristic ≠2, a strict symmetric dimension-1 complex splits isometrically as Q⊕Q∨[−1]⊕E, where Q is quasi-isomorphic to τ≤0 C and E is acyclic, supported in degrees 0,1, with invertible alternating middle differential after dual identification. (AV-v1, Appendix A.7, pp. 66–67, line 3107).

A proof route is as follows. Choose complements to boundaries in cycles and to cycles in terms. Pair complementary degrees by strict duality; absorb off-diagonal terms using 1/2. The residual acyclic pair has terms in degrees 0 and 1. Its middle map has even rank.

**Checks.**

- For the zero complex all three summands are zero and the middle rank is 0.
- For K² —J→ K², J=[[0,1],[−1,0]], with cross matrix I₂, the entire complex is the acyclic middle summand in degrees 0,1, of rank 2.
- For K in degree zero paired perfectly with K in degree one and d=0, Q=K in degree zero and the acyclic middle part is zero; a splitting placing the latter in degrees 1,2 would fail the previous test.

*Needs:* §0.2.

### 0.8 Cellular Poincaré pairing

For a compact smooth oriented n-manifold X with boundary and a finite projective locally constant ε-self-dual R-system ρ, construct a finite cellular cochain model and the Poincaré–Lefschetz adjoint C*(X,∂X;ρ)→C*(X;ρ)∨[−n]. For closed X, transfer from a compatible dual cellulation and symmetrize to obtain an ε-symmetric Poincaré complex. Its pairing is well defined up to pairing-preserving homotopy equivalence. The relative self-pairing composes this adjoint with the dual of the relative-to-absolute inclusion, giving C*(X,∂X;ρ)→C*(X,∂X;ρ)∨[−n]; its algebraic boundary is compared with C*(∂X;ρ). (AV-v1, Appendix A.4–A.5, pp. 64–65, line 2991).

A proof route is as follows. Import finite smooth triangulations and dual cells with boundary, rather than assuming arbitrary topological manifolds triangulable. Use local-coefficient cap product and orientation; compare dual and primal cellular complexes. Average the transferred pairing with its signed transpose. Record the relative triangle compatible with restriction to ∂X.

The API has the following consequences under these hypotheses.

- The pairing on a closed oriented cellular model.
- The absolute/relative adjoint realizes Poincaré–Lefschetz duality.
- The algebraic boundary of the compactly supported/relative pairing models boundary cochains with the boundary orientation.

**Checks.**

- On an oriented point the pairing is the original fibre pairing.
- Reversing the fundamental orientation negates the pairing.
- For an interval the cone comparison gives its two endpoints with opposite orientations.
- For the noncompact line ℝ, ordinary H⁰ has dimension 1 and ordinary H¹ has dimension 0; a closed-manifold perfect pairing between them would fail. Compact support is required for the corresponding noncompact duality.

*Needs:* §0.2; AlgebraicTopology Stage 2; AlgebraicTopology Stage 4; AlgebraicTopology Stages 6.1–6.4; GeometricTopology Layer 11 and smoothing comparison; gap:poincare-boundary-cone.

### Examples

The scalar cone K —a→ K, the alternating pair K² —J→ K² and the interval with endpoint signs −1,+1 distinguish degeneracy, strictness and boundary orientation. Their computed values are recorded in the Checks above.

### Dependencies

`CochainComplex`; `HomologicalComplex.homology`; AlgebraicTopology Stage 2; AlgebraicTopology Stage 4; AlgebraicTopology Stages 6.1–6.4; GeometricTopology Layer 11 and smoothing comparison. The subsection Needs lines separate statement inputs from the indicated proof route.

## Layer 1: determinant lines and square-root volumes

### 1.1 Parity and inverse conventions for graded lines

Use the supplied parity reduction of integer-graded lines. Compare its inverse evaluation with the right-ordered evaluation convention: inversion reverses tensor factors, and the double inverse on parity a acts by (−1)^a. Prove the resulting comparison diagrams with tensor and duality; the underlying Picard groupoid is an input. (AV-v1, Appendix B.1, (B.1)–(B.2), pp. 68–69, line 3181).

A proof route is as follows. Descend the commutor through parity since `(-1)^(a*b)` depends only on residues modulo two. Compute double inverse using evaluation and the commutor on a homogeneous line.

**Checks.**

- An even line has double-inverse scalar +1; an odd line has −1, so an ungraded double dual loses a sign.
- Swapping two odd lines has scalar −1, while swapping grades 1 and 2 has scalar +1; integer grades enter only through parity.
- For an odd line over ℚ, right evaluation of a chosen element against its inverse is 1 and the opposite evaluation has scalar −1; both cannot be normalized to +1.

*Needs:* KTheoryLowDegrees §§14.1–14.4; PadicMeasuresIwasawaAlgebras §5.1.

### 1.2 Square classes in a determinant line

For a one-dimensional K-vector space L, let Sq(L)=(nonzero vectors of L)/Kˣ². It is a torsor under Multiplicative(TauCeti.SquareClassGroup K), without a preferred element. Every L⊗L has a canonical square class represented by l⊗l. A chosen nonzero e∈L turns a root identification A⊗A≃L into the scalar square class e/ν_A. Carry parity when tensoring graded root lines. (AV-v1, Appendix B.1.1, (B.3)–(B.4), p. 69, line 3197).

A proof route is as follows. Construct the quotient relation and prove independence of a nonzero generator of A. Transport along line isomorphisms; retain the commutor sign when rearranging two root squares.

The API has the following consequences under these hypotheses.

- The class of a nonzero vector in a line.
- The canonical class of A⊗A.
- The ratio of two classes in the same line is a scalar square class.
- Moving two root lines of parities a,b past one another multiplies the resulting square class by `[(-1)^(a*b)]`.

**Checks.**

- e and u²e define the same class, while over Q, e and 2e do not.
- Changing the reference e to 2e changes scalar coordinates by [2].
- Two odd root lines introduce [−1] on swapping their middle factors; two even root lines introduce 1.

*Needs:* §1.1; `TauCeti.SquareClassGroup`; `TauCeti.squareClassHom`.

### 1.3 Reverse-wedge determinant duality

For finite-dimensional V, equip det(V∨)≃det(V)⁻¹ with the reverse-wedge convention: on a basis v₁,…,vₙ use reversed dual wedge. Its scalar difference from standard wedge duality is the scalar `(-1)^(n*(n-1)/2)`. Extend this normalization through the imported determinant functor and its exact-sequence coherence; the shift map det(C[1])≃det(C)⁻¹ is the one induced by Cone(id_C). (AV-v1, Appendix B.2–B.3.1, (B.6)–(B.12), pp. 70–73, line 3254).

A proof route is as follows. The number of transpositions reversing n entries is n(n−1)/2. Use the exact-sequence determinant coherence to extend to bounded complexes. Check that duality and the Cone(id) shift commute in the signed diagram, rather than independently choosing a shift scalar.

The API has the following consequences under these hypotheses.

- The unit `(-1)^(n*(n-1)/2)` over a field.
- The determinant-dual line equivalence with this normalization.
- The duality/shift square is commutative with the signed double-inverse identification.
- The dimension m+n correction equals the product of the dimension m and n corrections times `(-1)^(m*n)`.

**Checks.**

- For dimensions 0,1,2,3,4 the signs are 1,1,−1,−1,1.
- In rank two reverse-wedge duality is the negative of the standard duality.
- The direct sum of two rank-one lines has an extra −1, so ungraded multiplicativity fails.

*Needs:* §1.1; KTheoryLowDegrees §§14.1–14.4; PadicMeasuresIwasawaAlgebras §5.1.

### 1.4 Strongly even complexes

A finite projective complex is strongly even when every term has locally constant even rank. Over a field this means Even(dim C^q) for every integer q. For bounded complexes this implies even Euler characteristic. It is independent of requiring every cohomology group to have even dimension: neither condition implies the other. (AV-v1, Appendix B.4.1, pp. 73–75, line 3415).

A proof route is as follows. Use the rank predicate on each term; over a general ring impose it at every prime. Show invariance under termwise isomorphism, shifts, duality and finite direct sums, but do not claim invariance under arbitrary quasi-isomorphism.

The API has the following consequences under these hypotheses.

- Every term has even rank.
- Every integer shift of a strongly even complex is strongly even.
- The dual has the same parity condition.
- A direct sum of strongly even complexes is strongly even.
- The Euler characteristic of a bounded strongly even complex is even, over each field fibre.

**Checks.**

- The zero complex is strongly even.
- K —id→ K is acyclic with Euler characteristic zero but is not strongly even.
- K² concentrated in degree −1 is strongly even with Euler characteristic −2, and its shift to degree 0 has Euler characteristic +2: an odd shift preserves strong evenness and the parity of the Euler characteristic but changes its sign, so only parity, not the value, is shift-invariant.
- The complex K²→K² in degrees zero and one with differential diag(1,0) is strongly even, but both cohomology groups have dimension one.

*Needs:* `CochainComplex`.

### 1.5 Termwise determinants of strongly even complexes

For a strongly even bounded complex, the canonical ordered tensor identification det C≃⊗_q `(det C^q)^((-1)^q)` is compatible with degreewise split exact sequences, the Cone(id) shift and reverse-wedge duality. Use increasing degree order and the corrected brutal-truncation exact sequence σ≥r C→σ≥r−1 C→`C^(r-1)[1-r]`. (AV-v1, Appendix B.4.1, (B.13)–(B.14), pp. 73–75, line 3427).

A proof route is as follows. Filter by brutal truncations and apply the imported exact-triangle determinant. Every term determinant has even grading, so the rearrangements have sign one. Compare dual and shifted filtrations with the fixed reverse-wedge and Cone(id) conventions.

**Checks.**

- For K² in degree zero the determinant has parity zero and is its ordinary top wedge.
- For K² in degree −1 the determinant line is the inverse top wedge; replacing the negative degree by natural subtraction gives the wrong line.
- The quotient of σ≥r−1 by σ≥r is concentrated in degree r−1; at r=1 it is C⁰ in degree zero, not C¹ in degree one.

*Needs:* §1.4; §1.3; KTheoryLowDegrees §§14.1–14.4; PadicMeasuresIwasawaAlgebras §5.1.

### 1.6 Determinant versus cohomology

For every bounded finite-dimensional cochain complex over K, adapt the supplied determinant/cohomology comparison to reverse-wedge duality. The map det C→det H*(C) uses the boundary-cycle and cycle-term exact sequences in that order and cancels boundary factors with the fixed shift evaluation. Prove its compatibility with the AV-normalized duality, shifts and split exact sequences, retaining the exact-sequence torsion signs for a cone. Its underlying determinant functor is the supplier object. (AV-v1, Appendix B.4.2–B.4.3, (B.15)–(B.17), pp. 75–76, lines 3498, 3513, 3526).

A proof route is as follows. Use the supplied boundary/cycle determinant comparison, then compare its duality diagram with reversed dual wedges and the cone-normalized shift. For an injection A→B carry the supplied cone/quotient determinant comparison with its exact-sequence torsion signs.

The API has the following consequences under these hypotheses.

- The determinant isomorphism from C to its graded cohomology.
- Naturality for quasi-isomorphisms.
- Compatibility with the chosen duality and shift.
- For an injection A→B, identify the cone determinant with the quotient determinant using the exact triangle and shift.

**Checks.**

- For zero differential the comparison is the identity on the ordered determinant tensor.
- For K —a→ K in degrees 0,1 with a≠0, the acyclic volume is a⁻¹ times the based determinant generator, so the based-to-acyclic ratio is a and its square class is [a].
- Shifting K —a→ K inverts its determinant scalar; it must not leave the ungraded determinant unchanged.

*Needs:* §1.3; KTheoryLowDegrees §§14.1–14.4; PadicMeasuresIwasawaAlgebras §5.1; `HomologicalComplex.homology`.

### 1.7 Lagrangian subcomplexes

For a strict ε-symmetric dimension-n complex C, a Lagrangian is a finite projective subcomplex ι:L→C for which the adjoint quotient gives a degreewise split exact sequence 0→L→C→L∨[−n]→0. This includes isotropy and L=L⊥. In the vector-space case n=0, the adjoint quotient is q(w)(l)=T(w,l). For odd n the determinant has a square-root identification from L. (AV-v1, Appendix B.5, (B.18), pp. 76–77, lines 3565, 3583).

A proof route is as follows. Form the adjoint quotient by restricting the pairing to L. Require the exact sequence and its pairing compatibility, rather than defining a Lagrangian by dimension alone.

The API has the following consequences under these hypotheses.

- The isotropic inclusion into C.
- The quotient is the prescribed shifted dual of L.
- The first summand of L⊕L∨[−n] is Lagrangian.
- For a strict dimension-(2m+1) complex C, the brutal truncation in degrees at least m+1 is Lagrangian.

**Checks.**

- The coordinate K in a two-dimensional hyperbolic plane is Lagrangian.
- The zero subcomplex is Lagrangian only if C is zero.
- Over Q, the line spanned by (1,1) in the form diag(1,1) has half dimension but is not Lagrangian.

*Needs:* §0.2.

### 1.8 The square class of a Lagrangian

For odd n, a Lagrangian L in a strict ε-symmetric C induces det C≃det L⊗det(L∨[−n])≃(det L)² using the exact sequence, reverse-wedge duality and the fixed shifts. Transport the canonical square to ν_L∈Sq(det C). Direct sums obey `nu_(L1 direct_sum L2) = (-1)^(chi(L1)*chi(L2)) * nu_L1 * nu_L2`; the sign is one if both Lagrangians are strongly even. In degree zero the analogous vector-space volume is independent of L for a symplectic form, and in the orthogonal case depends only on its Grassmannian component. (AV-v1, Appendix B.5, (B.18)–(B.19), pp. 76–78, line 3588).

A proof route is as follows. Apply the imported determinant exact-sequence isomorphism, then the signed dual and odd shift. The tensor-square class is independent of the root generator. Compute the direct-sum permutation once; for symplectic vector spaces compare Darboux bases.

The API has the following consequences under these hypotheses.

- The distinguished square class in det C.
- Isometries carrying L to L′ carry their classes to one another.
- The direct-sum formula includes `(-1)^(chi(L1)*chi(L2))`.
- For strongly even L, it is the product of the paired-degree vector-space Lagrangian volumes, with their adjoint-quotient normalization.

**Checks.**

- Rescaling a root determinant generator by u multiplies its image by u², leaving ν_L unchanged.
- Two odd root determinant lines produce a minus sign in the direct-sum class.
- Over ℚ with ω(e,f)=1, L=ℚe has quotient f↦−e*, while L=ℚf has quotient e↦f*; both give ν_L=−e∧f. The ordered Darboux wedge is e∧f, so their ratio is the nontrivial class [−1].

*Needs:* §1.7; §1.2; §1.3; §1.5.

### Examples

The rank-one acyclic pair has even cohomology but odd terms; the rank-one differential on K²→K² has even terms but odd cohomology. Two odd determinant roots supply the extra −1 that the rank-two reverse wedge also detects.

### Dependencies

Earlier local inputs: Layer 0. KTheoryLowDegrees §§14.1–14.4; PadicMeasuresIwasawaAlgebras §5.1; `TauCeti.SquareClassGroup`; `TauCeti.squareClassHom`; `CochainComplex`; `HomologicalComplex.homology`. The subsection Needs lines separate statement inputs from the indicated proof route.

## Layer 2: cellular torsion and the boundary sign

### 2.1 The symplectic determinant volume

A finite projective R-module of rank 2r with perfect alternating form has a canonical trivialization of its determinant line. Locally choose a symplectic basis (e₁,f₁,…,e_r,f_r) with ω(e_i,f_i)=1 and use their ordered wedge. The local generators glue because every symplectic change of basis has determinant one. This is the Pfaffian volume normalization; do not divide ω^r by r! in positive characteristic. (AV-v1, §2.3, pp. 11–12; Appendix B.5 and B.7, pp. 76–78, 80, line 3753).

A proof route is as follows. Construct symplectic bases over local rings by splitting a hyperbolic plane and induction, then shrink to neighbourhoods. Use the existing all-rank determinant-one theorem on transitions and glue the determinant trivializations. With q(w)(l)=ω(w,l), quotient lifts for the dual basis of L=⟨e₁,…,e_r⟩ are −f₁,…,−f_r. Reverse-wedge duality and reordering to (e₁,f₁,…,e_r,f_r) give ν_L=(−1)^r times this Darboux volume; the cellular normalization uses the Darboux volume.

The API has the following consequences under these hypotheses.

- The canonical determinant generator for a finite projective symplectic module.
- Symplectic isometries preserve the generator.
- The generator commutes with extension of scalars.
- Over a field the vector-space Lagrangian volume is (−1)^r times the ordered Darboux volume, so their square classes differ by [(−1)^r].

**Checks.**

- Over ℚ with ω(e,f)=1 the Darboux generator is e∧f, whereas the adjoint-quotient Lagrangian generator is −e∧f; their ratio [−1] is nontrivial.
- In rank zero the Darboux and Lagrangian generators are both 1∈R, agreeing with (−1)^0=1.
- In rank six over F₃ the volume remains nonzero even though 3! vanishes, so a formula requiring division by 3! is invalid.

*Needs:* `SymplecticGroup.det_eq_one`; §1.3; §1.8.

### 2.2 The Reidemeister cellular volume

For a finite cell pair (X,A) and an even-rank self-dual local system ρ, choose a symplectic volume on fibres, or in the orthogonal case a specified locally constant self-dual determinant generator for standard wedge duality. The ordered tensor of the oriented cell-fibre generators defines `e_(X,A)` ∈ det C*(X,A;ρ). Even rank makes this independent of cell orientations, cell ordering and compatible fibre trivializations. It respects the absolute/relative exact sequence. (AV-v1, §2.3, pp. 11–12; Appendix B.7, p. 80, lines 509, 3770).

A proof route is as follows. Use the finite-cell decomposition of each cochain term. Changing a cell orientation gives `(-1)^(rank rho) = 1`; swapping blocks gives the same even-rank sign; monodromy preserves the given volume. Use the determinant exact-sequence map in the fixed cell order to identify `e_X = e_(X,A) * e_A`.

The API has the following consequences under these hypotheses.

- The determinant generator of the relative cochain model.
- Orientation, ordering and volume-preserving cell trivializations leave the generator unchanged.
- For A⊂X, the absolute generator factors as the relative generator followed by the generator of A.
- The determinant generator commutes with base change of the coefficient system.

**Checks.**

- For one zero-cell the generator is the fibre volume.
- Reversing one edge in even rank does not change its determinant generator.
- For a rank-one system over Q, reversing a cell orientation changes its generator by −1; the even-rank hypothesis is necessary.

*Needs:* §2.1; §1.5; AlgebraicTopology Stage 4; AlgebraicTopology Stage 6.1.

### 2.3 Subdivision and simple cellular invariance

For compact smooth manifolds with compatible finite triangulations, the determinant quasi-isomorphism induced by an elementary cellular expansion/collapse with volume-preserving even-rank coefficients carries e to e. Hence the scalar torsion square class is independent of triangulation, using common subdivisions and elementary simple changes. An arbitrary quasi-isomorphism alone does not preserve a chosen cellular volume. (AV-v1, §2.3, pp. 11–12; Appendix B.7, p. 80, line 3766).

A proof route is as follows. Compute the two-term acyclic cell pair of an elementary expansion: its attaching matrix is a signed monodromy matrix of determinant one in even rank. Apply determinant multiplicativity to its cancellation. Use compatible subdivisions and simple comparison maps for smooth finite triangulations; transport Poincaré duality with them.

**Checks.**

- An elementary rank-two cell pair with attaching matrix I₂ has acyclic determinant 1 and changes the cellular generator by 1.
- Replacing that matrix by −I₂ still has determinant 1, whereas the rank-one matrix −1 has determinant −1.
- The based acyclic complex K —2→ K has torsion scalar 2; its quasi-isomorphism to zero does not by itself send a based generator to an acyclic generator.

*Needs:* §2.2; §1.6; GeometricTopology Layer 11 and smoothing comparison; AlgebraicTopology Stage 4; AlgebraicTopology Stages 6.1–6.4.

### 2.4 Poincaré duality and cellular volumes

For a compact oriented n-manifold X and rank-2d symplectic ρ, the determinant Poincaré–Lefschetz map `det C_X -> det((C_(X,boundary X))^dual[-n]) -> (det C_(X,boundary X))^((-1)^(n+1))` sends e_X to `(-1)^(d*chi(X)) * e_(X,boundary X)^((-1)^(n+1))` under reverse-wedge duality. In the orthogonal case track the specified standard self-dual volume and its conversion to reverse-wedge duality explicitly. (AV-v1, Appendix B.7.1, (B.24)–(B.27), pp. 80–81, line 3783).

A proof route is as follows. Compute on a pair of oriented primal and dual cells using the fibre pairing. In rank 2d the reverse-wedge/standard-duality correction is (−1)^d. The alternating product over cells contributes `(-1)^(d*chi(X))`. Check the relative orientation convention against the boundary triangle.

**Checks.**

- On a positive point with standard symplectic K² fibre, d=1 and χ=1, so the reverse-wedge correction is −1.
- For a rank-two system on a closed three-manifold, χ=0 and the duality scalar is +1.
- For rank four on a point, d=2 and the scalar is +1; using the full coefficient rank as exponent would miss the rank-two test.

*Needs:* §0.8; §2.2; §2.3; §1.3; AlgebraicTopology Stage 6.4.

### 2.5 Reidemeister torsion modulo squares

Let X be a closed smooth oriented (2m+1)-manifold and K a field of characteristic ≠2. Let ρ have even rank and a perfect locally constant (−1)^m-symmetric pairing: symplectic if m is odd; orthogonal with a specified standard self-dual volume if m is even. Transport e_X through det C≃det H*(X;ρ). The upper cohomology truncation `H^(>m)` is Lagrangian for Poincaré duality. Define `RT(X,rho) = e_X / nu_(H^(>m))` in Kˣ/Kˣ². No acyclicity is required. (AV-v1, §2.1, (2.1), p. 10; §2.3, pp. 11–13; Appendix B.7, pp. 80–81, line 3751).

A proof route is as follows. Construct the cohomological root class using the induced perfect pairing. Use cellular invariance and pairing-compatible comparison maps to show independence of choices. In the acyclic case the denominator is the canonical acyclic determinant class.

The API has the following consequences under these hypotheses.

- The scalar square class `e_X / nu_(H^(>m))`.
- Oriented homeomorphisms with compatible smooth cell models and local-system isometries preserve RT.
- For two systems of the same odd manifold dimension, torsion of their disjoint union is the product of their torsions times `[(-1)^(chi_half(X)*chi_half(Y))]`, from the root-line interchange law. In dimension three with symplectic coefficients, §3.2 makes that sign 1 and gives multiplicativity.
- For acyclic coefficients RT agrees with the cellular determinant torsion with these fixed sign conventions.

**Checks.**

- The empty manifold has torsion 1.
- For the constant symplectic K²-system on S³, RT=[−1], and its normalized class is 1.
- For S¹ over Q, Gram matrix I₂ and rotation A=[[0,−1],[1,0]], RT=[2].

*Needs:* §1.8; §1.6; §0.8; §2.3.

### 2.6 Orientation reversal

Under the hypotheses of torsion, `RT(X with reversed orientation,rho) = [(-1)^(chi_half(X,rho))] * RT(X,rho)`, where `chi_half = sum_(q<=m) (-1)^q dim H^q`. In particular it is unchanged for the dimension-three symplectic systems once their semicharacteristic evenness is proved. (AV-v1, §1.5, (1.13), p. 8; §2.3.4, (2.6), p. 13, line 578).

A proof route is as follows. The cellular volume does not use the global orientation; Poincaré pairing changes sign. Compute the determinant of −1 on the lower half of cohomology in the Lagrangian root identification.

**Checks.**

- The empty manifold has χ₁/₂=0 and reversal changes torsion by 1.
- For the constant rank-two symplectic system on S³, χ₁/₂=2, so both orientations have raw class [−1].
- In a dimension-one strict hyperbolic algebraic model of lower rank one, negating its pairing changes its root class by [−1]; omitting the semicharacteristic exponent fails this algebraic sign test.

*Needs:* §2.5; §0.4.

### 2.7 Three volumes on an algebraic boundary

Let C be a strongly even skew-symmetric dimension-4j complex over K, j≥1, and D=∂alg C. On det D compare a from C∨[−4j]⊂D, b from σ≥2j D, and c from upper cohomology via det D≃det H*D. Then a=b=(−1)^r c, with r≡(χ(C)+χ₁/₂(D))/2 (mod 2). In particular χ₁/₂(D) is even. Only the parity of r is asserted by this formula; the actual acyclic middle rank is 2r after the splitting. (AV-v1, Appendix B.6, (B.20)–(B.23), pp. 78–80, lines 3653, 3675).

A proof route is as follows. Shift by 2j−1 to the strict symmetric dimension-1 case. Compare a and b degree by degree using strongly even Lagrangians. Apply strict-splitting: Q and its dual give the same classes, while the acyclic alternating block of rank 2r has square determinant and reverse-wedge scalar (−1)^r. With `dim D^i = dim C^(4*j-i) + dim C^(i+1)`, perform the Euler count modulo four to obtain the displayed parity.

**Checks.**

- For C=0 all root classes are 1, χ(C)=χ₁/₂(D)=0 and r=0.
- Take C=K² concentrated in degree zero with the zero skew-symmetric dimension-four pairing and j=1. Its boundary has K² in degrees −1 and 4 with zero differential: χ(C)=2, χ₁/₂(D)=−2 and r≡0, hence a=b=c.
- For the strict acyclic middle model K² —J→ K² after the indicated shift, det J=1 but the upper-term versus acyclic root ratio is −1; a determinant-square argument alone misses this sign.

*Needs:* §0.3; §0.6; §0.7; §1.8; §1.5; §1.6.

### 2.8 Normalized boundary torsion

If N is compact smooth oriented of dimension 4j, j≥1, and ρ is a symplectic K-local system, then its oriented boundary M satisfies χ₁/₂(M,ρ) even and `RT(M,rho) = [(-1)^(chi_half(M,rho)/2)]`. Equivalently `[(-1)^(chi_half/2)] * RT(M,rho) = 1`. The dimension parameter j is independent of half the coefficient rank. (AV-v1, §2.4, Theorem 2.2, pp. 14–15; Appendix B.8, p. 81, line 605).

A proof route is as follows. Use the relative pairing on N and the boundary-cone comparison. All cellular term ranks are even. Factor e_N into relative and boundary generators. Use duality-volume to compute the cone-Lagrangian class on the boundary. Apply boundary-volumes; the Euler-characteristic sign cancels the duality-volume factor, leaving the semicharacteristic half-sign.

**Checks.**

- For the constant K² system on ∂D⁴=S³, χ₁/₂=2, raw RT=[−1] and normalized RT=1.
- For ∂(M×[0,1])=M⊔(−M), the two normalized values multiply to a square, hence 1.
- For a constant rank-four system on S³, χ₁/₂=4 and raw RT=1; this distinguishes half the semicharacteristic from the full semicharacteristic.

*Needs:* §2.7; §2.4; §2.5; §0.8; AlgebraicTopology Stage 6.4.

### Examples

The point, elementary cell pair, S³ with constant symplectic coefficients and orthogonal rotation circle fix the cellular, duality and torsion signs independently.

### Dependencies

Earlier local inputs: Layer 0, Layer 1. `SymplecticGroup.det_eq_one`; AlgebraicTopology Stage 4; GeometricTopology Layer 11 and smoothing comparison; AlgebraicTopology Stages 6.1–6.4. The subsection Needs lines separate statement inputs from the indicated proof route.

## Layer 3: normal coefficients and the two transformations

### 3.1 Low-dimensional oriented bordism and homology

For every CW space Y and 0≤d≤3, prove that the supplied fundamental-class map Ω_d^SO(Y)→H_d(Y;ℤ) is an isomorphism, natural in Y. Use the supplied relative skeletal filtration and Ω₀^SO(point)=ℤ, Ω₁^SO=Ω₂^SO=Ω₃^SO=0: only the coefficient-degree-zero row contributes in these total degrees. This identifies the actual orientation map, not an unspecified group isomorphism. (AV-v1, §2.3.4–§2.4, pp. 13–15, line 623; Thom, IV §8, Theorem IV.13, p. 81, line 2527).

A proof route is as follows. Use TangentialBordism B2.4–B2.5 and B3.1: its connective skeletal filtration has no positive coefficient groups below degree four. Compare its degree-zero coefficient row with integral cellular chains and the actual fundamental-class map; filtered CW continuity handles infinitely many cells.

**Checks.**

- At Y=point and d=0, one positive point maps to 1∈ℤ and one negative point to −1.
- At Y=point in degrees 1,2,3, both source and target are zero; a constant-labelled circle bounds a disc.
- At Y=Bℤ and d=1, the identity-labelled circle maps to 1 and cannot be zero; in degree four, Ω₄^SO(point)=ℤ but H₄(point)=0, so the degree bound is necessary.

*Needs:* TangentialBordism B1–B3.1; AlgebraicTopology Stages 4 and 6; StableHomotopyKTheory §§1.30, 1.32.

### 3.2 Evenness in dimension three

For every closed smooth oriented three-manifold and symplectic finite-dimensional local system over any field of characteristic ≠2, χ₁/₂=dim H⁰−dim H¹ is even. For finite projective coefficient families over a connected normal domain with 2 invertible, fibre parity is the same even value. (AV-v1, §2.3.4, pp. 13–14; §2.7, pp. 16–18, line 588).

A proof route is as follows. Boundary parity vanishes by boundary-volumes, so parity is a natural homomorphism H₃(BSp₂ᵣ(K);ℤ)→F₂. This uses no torsion–Chern equality. For `F_q -> F_(q^2)`, finite-field K₃ restriction is multiplication by q²+1 on the cyclic target index, hence zero modulo two. The finite-rank comparison and odd-order H₂ give zero on H₃ with F₂ coefficients. Naturality forces parity over F_q to vanish. Spread finitely many monodromy matrices to a connected normal finite-type Z[1/2]-domain, use local constancy, and specialize to a finite residue field.

**Checks.**

- The constant rank-two system on S³ has H⁰=K², H¹=0 and χ₁/₂=2.
- For the Gaussian mapping torus, H⁰=H¹=0 and χ₁/₂=0; for identity surface monodromy on a rank-two genus-two system with H⁰=0, χ₁/₂=−4.
- The restriction multipliers for q=3 and q=5 are 10 and 26, both zero modulo two; characteristic two has no inverse to the symmetrizing factor 2.
- For the constant rank-two system on the lens space L(3,1), characteristic three gives dimensions dim H⁰=dim H¹=2 and χ₁/₂=0; characteristic zero gives dimensions 2,0 and χ₁/₂=2. Both parities are zero.

*Needs:* §0.6; §2.8; §3.1; KTheoryFiniteLocalFields §§1.5, 1.8–1.9.

### 3.3 Even strict models

For a symmetric dimension-1 finite projective Poincaré complex over R with 2 invertible and even fibre semicharacteristic on a connected neighbourhood, Zariski locally there is a pairing-compatible strict free model whose every term has even rank, after adjoining canonically trivialized symmetric contractible summands. The determinant comparison preserves any given determinant volume. (AV-v1, Appendix A.6–A.7, pp. 65–67; Appendix B.10, pp. 85–86, line 3088).

A proof route is as follows. First strictify locally. Work from the outermost degrees inward: a contractible free rank-one pair together with its shifted dual adjusts two adjacent term parities and their reflected partners. Continue until only degrees 0,1 can have odd rank. Their parity is the lower-half rank sum, equal to χ≤0 modulo two, hence is even. Use the canonical acyclic determinant trivializations to transport the volume. This stabilization argument is part of the theorem, not an assumed property of all strict models.

**Checks.**

- The zero complex is a strongly even strict model with every rank 0.
- The strict model K in degrees 0,1 with d=0 has semicharacteristic 1; canonically acyclic stabilization cannot make every term even.
- K² in degrees 0,1 with d=sJ already has term ranks 2,2 in every fibre, although its lower cohomology rank jumps from 0 to 2; even stabilization preserves its determinant volume.

*Needs:* §0.5; §0.6; §1.4.

### 3.4 Torsion over normal rings

For a normal integral R with 2 invertible, a closed smooth oriented odd-dimensional X and a finite projective self-dual R-local system satisfying the parity and volume hypotheses of torsion, the generic RT over Frac(R) is the restriction of a unique class RT_R(X,ρ)∈H¹_et(R,μ₂). This raw extension need not commute with a map to another normal domain when cohomology jumps. (AV-v1, §2.3.3, p. 13; Appendix B.10, (B.38)–(B.39), pp. 85–86, line 3987).

A proof route is as follows. Locally strictify and form the determinant root line from upper brutal truncation. Over the fraction field its class differs from RT by a sign; extend that constant unit sign on the neighbourhood. Classify the resulting determinant line with square trivialization by a μ₂-torsor. Generic isomorphisms between finite étale torsors already defined over a normal integral R extend uniquely. Glue the local torsors and use injectivity H¹(R,μ₂)→H¹(Frac R,μ₂); no extension of an arbitrary ramified generic torsor is asserted.

The API has the following consequences under these hypotheses.

- The unique extension of generic torsion to H¹(R,μ₂).
- Restriction to the fraction field is the field-valued torsion.
- Restriction to a localization agrees with the same generic extension.
- A strict model represents it by its root line with the generic acyclic sign correction.

**Checks.**

- For R a field it agrees with torsion through the Kummer square-class isomorphism.
- A nontrivial two-torsion root line need not be represented by a global unit; use H¹(R,μ₂), not only Rˣ/Rˣ².
- For the orthogonal circle family over Q[s]_(s) with monodromy diag(1+s,(1+s)⁻¹)⊕I₂, generic RT=[−(1+s)] while special RT=1.

*Needs:* §2.5; §0.5; §1.8; SchemeAndStackFoundations §2.11; gap:normal-torsor-gluing.

### 3.5 Normalized torsion in families

For a closed smooth oriented three-manifold with a symplectic finite projective R-local system, R normal integral with 2 invertible, define `N_R = [(-1)^(chi_half(generic)/2)] * RT_R`. It commutes with every ring map R→S between such domains, including specialization where cohomology jumps. On a local strongly even strict symmetric dimension-1 model D of C*(M;ρ)[1], with `s = sum_(q<=0) (-1)^q rank D^q` and L=σ≥1 D, its root-line representative is `[(-1)^(s/2)]` e_D/ν_L. Every field fibre F has value `[(-1)^(chi_half(M,rho_F)/2)] * RT(M,rho_F)`. (AV-v1, §2.4–§2.6, pp. 14–16; Appendix B.10, pp. 85–86, line 4014).

A proof route is as follows. After strictification and even stabilization use the displayed expression, which uses ranks and line-pairing data and therefore commutes with arbitrary base change. For a field fibre let h=χ≤0(D_F). The middle alternating differential has rank s−h=2r, and ν_L=(−1)^rν_upperH. Thus `(-1)^(s/2) * e_D / nu_L = (-1)^(h/2) * RT(D_F)`. Undo the shift: h=−χ₁/₂(M,ρ_F), which has the same half-sign modulo two. Gluing uses the generic torsor and normality; base change uses the local formula, not an unjustified injection between generic fields.

The API has the following consequences under these hypotheses.

- The normalized μ₂-torsor class over R.
- The field-fibre value includes its own semicharacteristic half-sign.
- Every map of normal domains preserves the normalized class.
- On a strongly even strict shifted model use the lower-half term rank s.

**Checks.**

- The constant rank-two symplectic system on S³ has normalized class 1 over every such R.
- In the orthogonal circle regression family, normalized generic [1+s] specializes to normalized special 1 although raw torsion changes by [−1]. This tests the same dimension-one model formula.
- Changing a local basis of the root line changes its scalar by a square and cannot change the torsor.
- Over R=ℝ[x,y,z]/(x²+y²+z²−1), P=ker((x,y,z):R³→R) with ω(v,w)=det((x,y,z),v,w) is symplectic projective of rank two. Its real fibres are TS², so P has no global frame. The constant P-system on S³ still has normalized value 1 by generic restriction and normality; it supplies no standard-free group label.

*Needs:* §3.4; §3.3; §3.2; §0.7; §1.8.

### 3.6 The étale Chern transformation

For rank 2r and a normal integral Z[1/2]-algebra R, evaluate the standard symplectic representation’s universal étale c₂ in degree (3,1) to obtain c_et:H₃(BSp₂ᵣ(R);ℤ)/2→H¹_et(R,μ₂). Use μ₂⊗μ₂≃μ₂ with its unique nontrivial geometric element to compare coefficients. Require naturality in all such R and stabilization in r. This is an evaluation adapter to the Chern-class supplier, not a second construction of Chern classes. (AV-v1, §2.5–§2.7, (2.7)–(2.9), pp. 15–18, line 644).

A proof route is as follows. Import the universal equivariant finite-coefficient c₂ with its normalization for the standard representation and slant it with integral degree-three cycles. The target is killed by two, so factor through integral H₃ modulo two. Compare at finite fields with the existing finite-rank étale isomorphism, and keep the integral quotient distinct from full H₃(−;F₂).

The API has the following consequences under these hypotheses.

- The homomorphism from integral H₃ modulo two.
- It commutes with maps of normal Z[1/2]-domains.
- For every odd finite field and every symplectic rank r≥1 it is the finite-rank K-theoretic isomorphism; at r=0 its source is zero and it is the zero map.
- Block inclusion of symplectic groups preserves the evaluated class.

**Checks.**

- The zero integral cycle maps to the trivial torsor.
- The nonzero element of H₃(Sp₂(F₃);ℤ)/2 maps to its nonsquare class.
- Do not identify integral H₃/2 with H₃(F₂) over a general ring; the UCT H₂[2] term need not vanish.
- At rank zero over 𝔽₃, Sp₀ is trivial, so the source H₃(BSp₀;ℤ)/2 is zero while H¹(𝔽₃,μ₂)=𝔽₃ˣ/𝔽₃ˣ² has two elements; the map is not an isomorphism there, so the isomorphism claim needs r≥1.

*Needs:* KTheoryFiniteLocalFields §1.8; SchemeAndStackFoundations §2.11; gap:normal-torsor-gluing; StableHomotopyKTheory §§1.17, 1.30, 1.32; KTheoryFiniteLocalFields §§1.5, 1.8–1.9.

### 3.7 The normalized torsion transformation

For each rank 2r and normal integral Z[1/2]-algebra R, define B_r(R)=H₃(BSp₂ᵣ(R);ℤ)/2 and N_R:B_r(R)→H¹(R,μ₂) by a labelled manifold representative and normalized torsion. It is a homomorphism natural in R and compatible with block stabilization. For ρ on M equipped with a symplectic identification of its fibre with R²ʳ, `N_R(rho_*[M]) = [(-1)^(chi_half(M,rho)/2)] * RT_R(M,rho)`. (AV-v1, §2.4–§2.6, (2.8), pp. 14–16, line 618).

Changing this symplectic frame conjugates the representation; inner automorphisms act trivially on group homology, so the label and its value are unchanged. Arbitrary finite-projective fibres have the invariant of §3.5, without an asserted BSp₂ᵣ(R) label.

A proof route is as follows. Use low-bordism to choose a smooth labelled representative for every integral H₃ class. Bordism invariance and orientation reversal make the value independent of that choice and additive. Since H¹(R,μ₂) has exponent two the homomorphism factors through B_r; use normalized-family for naturality.

The API has the following consequences under these hypotheses.

- The homomorphism N_R on B_r(R).
- Its value on a labelled manifold is the normalized torsion.
- Every map of normal domains commutes with N.
- Adding a constant standard free symplectic summand preserves N, since its normalized torsion is trivial.

**Checks.**

- Every labelled boundary maps to 1.
- Twice any integral homology class maps to 1.
- A constant label factors through H₃(point;ℤ)=0 and maps to 1, including the S³ rank-two example with raw RT=[−1].

*Needs:* §3.5; §3.1; §2.8; §2.6; StableHomotopyKTheory §§1.17, 1.30–1.32; §3.6.

### Examples

The family over ℚ[s]_(s) distinguishes raw generic extension from normalized specialization. The constant symplectic plane on S³ distinguishes a nonsquare raw value from a nontrivial normalized value.

### Dependencies

Earlier local inputs: Layer 0, Layer 1, Layer 2. AlgebraicTopology Stage 4; GeometricTopology Layer 11 and smoothing comparison; KTheoryFiniteLocalFields §§1.5, 1.8–1.9; SchemeAndStackFoundations §2.11; gap:normal-torsor-gluing; KTheoryFiniteLocalFields §1.8; StableHomotopyKTheory §§1.17, 1.30, 1.32; TangentialBordism B1–B3.1. The subsection Needs lines separate statement inputs from the indicated proof route.

## Layer 4: circle torsion and mapping tori

### 4.1 Zassenhaus determinant formula

Prove `zassenhaus_primary_formula` for every finite-dimensional nondegenerate symmetric space (V,B) over K and every isometry A, with no determinant-one or even-dimension restriction. For N at least dim V let V₋=ker(A+1)^N and U=im(A+1)^N. They are nondegenerate orthogonal complements and θ(A)=disc(V₋) det((1+A)/2 on U). The Lean statement takes B to be the associated form of Q and uses the stable exponent dim V; for every basis of V₋ and every witness that A+1 preserves U it asserts the product determinant is nonzero and its unit square class equals the pinned orthogonal spinor norm. If additionally A∈SO(V), dim V is even and disc(V) is square, both generalized ±1 blocks and the corresponding ordinary eigenspaces have even dimensions, and the equivalent formula is θ(A)=disc(V₊) det(1−A on V₊⊥), with V₊ the generalized +1 block. This second formula is asserted only under these additional hypotheses. (AV-v1, Appendix B.9.1, (B.31), pp. 82–83, lines 3840, 3854; JRV, Theorem 5.1 and (5.1), pp. 16–17, line 782).

A proof route is as follows. Use orthogonal primary decomposition and JRV Theorem 5.1, equation (5.1); the nondegenerate stable image makes its determinant a unit. Under the additional SO, even-dimension and square-discriminant hypotheses, compare reciprocal primary blocks and the even rank of the alternating middle maps to derive the generalized +1 version.

**Checks.**

- For A=1 on the zero space, both determinant factors are empty determinants 1, and θ(1)=1.
- On the one-dimensional form B=(2) with A=−1, V₋=V, U=0 and the product is 2=θ(A); the unrestricted plus-one formula would instead give det(1−A)=2 only accidentally, while B=(3) gives θ(A)=[3] versus [2].
- On B=I₂ over ℚ with A=[[0,−1],[1,0]], V₋=0 and det((1+A)/2)=1/2, giving θ(A)=[2]; on a hyperbolic plane A=−1 the unsigned discriminant and θ(A) are both [−1].

- For the S₃ permutation action on the standard three-dimensional rational quadratic space, the commutator of two transpositions is a three-cycle; its spinor class is [2]²=1 and its determinant factor is 1/4. For Q₈ acting by left quaternion multiplication on the four-square norm, [i,j]=−I has spinor class disc(I₄)=1. These test the homomorphism on nonabelian groups.

*Needs:* Tau Ceti spinor-norm contract.

### 4.2 The circle Poincaré complex

For an isometry A of a finite-dimensional nondegenerate symmetric (V,B), the circle complex is V —(1−A)→ V in degrees 0,1, with cross pairings P₀₁(x,y)=B((1+A)x/2,y) and P₁₀(y,x)=B((1+A⁻¹)y/2,x). It is symmetric Poincaré of dimension 1, and strict exactly when 1+A is invertible. The identical determinant factors of the two copies of V cancel to a canonical based generator e, independently of the chosen basis. For the topological circle invariant, the even-rank volume-preserving hypotheses of §2.5 are imposed separately. (AV-v1, Appendix A.4, (A.8), p. 64; Appendix B.9, pp. 82–85, line 3003).

A proof route is as follows. Check closedness by expanding (1+A)(1−A)=1−A² and using the isometry law. The induced pairing on kernel/cokernel is perfect, even when the cochain pairing is not termwise invertible. Compute the adjoint cross blocks; each is invertible exactly when 1+A is.

The API has the following consequences under these hypotheses.

- The two-term complex and its signed pairing.
- Strictness is equivalent to invertibility of 1+A.
- H⁰=ker(1−A), H¹=coker(1−A), naturally paired by B.
- The same basis in both degrees gives the based generator independently of basis.

**Checks.**

- For A=1 the differential is zero and the cross pairing is B.
- For A=−1 the differential is 2 and the cross pairing is zero: it is Poincaré and acyclic but not strict.
- For A=[[0,−1],[1,0]] over Q, det(1−A)=det(1+A)=2.

*Needs:* §0.2; §1.6.

### 4.3 The strict two-term sign calculation

Let (V,B) be finite dimensional and nondegenerate, dim V=n even, A∈SO(V,B), 1+A invertible and h=dim ker(1−A). Use the based circle generator e, without requiring disc(B)=1 in this intermediate calculation. Then h is even and `(-1)^(h/2) * RT_based(Circle(A,B)) = disc(B) * det((1+A)/2)`. The based ratio is defined by e and the upper-cohomology root even when the orthogonal volume is not self-dual. (AV-v1, Appendix B.5–B.6, pp. 76–80; B.9, (B.30), pp. 82–85, line 3715).

A proof route is as follows. Write P=B((1+A)/2−,−), an invertible cross pairing. The form P(x,(1−A)y)=B((A−A⁻¹)x/2,y) is alternating. Its right radical is ker(1−A), so n−h=2r. The upper-term root class divided by e is `(-1)^(n/2) * det(P)` modulo squares; the inverse determinant gives the same square class. By strict-splitting, upper-term versus upper-cohomology root contributes (−1)^r. Multiply the normalization `(-1)^(h/2)`; the total sign is `(-1)^(h/2+n/2+r) = 1`.

**Checks.**

- Over Q with B=I₂ and A=[[0,−1],[1,0]], P(e₁,(1−A)e₁)=0 whereas P((1−A)e₁,e₁)=1. The differential must act in the second argument of this P.
- For A=1 on B=I₂, n=h=2 and r=0: raw RT=[−1] and multiplication by [−1] gives disc(B)det(1)=1.
- For the rotation on B=I₂, h=0, n=2 and r=1: det P=1/2 and both normalized classes are [2].

*Needs:* §4.2; §0.7; §1.6; §1.8.

### 4.4 The circle formula in odd characteristic

Let K have characteristic ≠2, V have even dimension and nondegenerate symmetric form of square unsigned discriminant, choose a standard self-dual volume, and let A∈SO(V). Then h=dim `V^(A=1)` is even and `(-1)^(h/2) * RT(S^1,A) = theta(A)`. No semisimplicity, lifting or characteristic-zero assumption is imposed. (AV-v1, Appendix B.9, (B.30), pp. 82–85; §2.3.2, p. 13, lines 3840, 3854).

A proof route is as follows. Split V=V₋⊥U at the generalized −1 block. Both blocks have even dimension, and 1+A is invertible on U. On V₋ the circle is acyclic and `det(1-A) = 2^(dim V_minus)`, a square. On U use strict-circle-calculation, retaining disc(B|U). Since the total discriminant is square, disc(B|U)=disc(B|V₋) modulo squares. Multiply the even-block determinant classes and apply the minus-one Zassenhaus formula. This proves the finite-characteristic case without Jacobson–Morozov or a logarithm.

**Checks.**

- Over Q with B=I₂ and A=1, raw RT=[−1], h=2 and normalized RT=θ(1)=1.
- Over F₃ take B hyperbolic of dimension four and A=diag(U,U⁻ᵀ), U=[[1,1],[0,1]]. Then h=2, θ(A)=1 and raw RT=[−1]; this detects both the sign and a characteristic-zero-only proof.
- For an even-dimensional square-discriminant form and A=−1, h=0 and both sides equal 1.

*Needs:* §4.3; §4.1; §2.5.

### 4.5 The orthogonal cohomology of a surface

For a closed smooth oriented genus-g surface Σ, symplectic rank-2r local system over K of characteristic ≠2 and H⁰(Σ;ρ)=0, the cup-product/fibre pairing makes V=H¹(Σ;ρ) nondegenerate symmetric, of dimension 4r(g−1) and square unsigned discriminant. A chosen symplectic intertwiner for an orientation-preserving diffeomorphism induces T∈SO(V). (AV-v1, Appendix C.2, Lemma C.2.1, pp. 87–88; B.7.1, pp. 80–81, line 4073).

A proof route is as follows. Poincaré duality gives H²=0 and the symmetric perfect H¹ pairing. Cellular Euler characteristic gives the dimension, divisible by four. The cellular volume and its duality comparison have scalar `(-1)^(r*chi(Sigma)) = 1`. Transport through det C≃(det H¹)⁻¹; the reverse-wedge correction in dimension divisible by four is one. Hence the Gram determinant is square. The diffeomorphism and chosen symplectic intertwiner preserve the cellular volume. Since only H¹ remains, their determinant on H¹ is one. This is a determinant argument in any odd characteristic, rather than a lift of the representation.

**Checks.**

- For genus two and rank two with no global sections, dim H¹=4 and its unsigned discriminant class is 1.
- For genus one under the same no-section condition, dim H¹=0 and T has determinant 1 as an empty determinant.
- For the constant rank-two genus-two system, H⁰ has dimension 2 and H¹ dimension 8; using 4r(g−1)=4 would be false without the no-section hypothesis.

*Needs:* AlgebraicTopology Stages 6.1–6.4; §2.4; §2.3; §1.6.

### 4.6 Torsion of a mapping torus

With Σ,ρ as above, an orientation-preserving diffeomorphism f and a specified symplectic intertwiner f*ρ≃ρ define ρ_f on M_f and T on H¹(Σ;ρ). For every field of characteristic ≠2, h=dim ker(1−T)=dim H¹(M_f;ρ_f) is even and `(-1)^(h/2) * RT(M_f,rho_f) = theta(T)`. Also θ(T)=det(1−T|V₊⊥)disc(V₊), where V₊ is the generalized 1-eigenspace, not merely the fixed space. (AV-v1, Appendix C.2, Lemma C.2.1, (C.1)–(C.4), pp. 87–88, line 4073).

The local-coefficient Wang comparison is part of this target: cover M_f by two cylinders over Σ meeting in two copies of Σ; the Mayer–Vietoris sequence with coefficients ρ_f, the specified intertwiner identifying the second restriction with T, gives the triangle C*(M_f;ρ_f)→C*(Σ;ρ)→(1−T)C*(Σ;ρ), naturally in the intertwiner.

A proof route is as follows. Use that triangle, whose H¹ part is V[−1]→(1−T)V[−1]. Track the cellular numerator through the cylinder decompositions; identical unknown transport determinants occur twice and cancel modulo squares. Track Poincaré pairings with the fixed shift. Apply the circle formula to V and T, then the equivalent plus-one Zassenhaus formula. The local-coefficient Wang triangle gives H⁰(M_f;ρ_f)=0 and H¹(M_f;ρ_f)=ker(1−T).

**Checks.**

- For T=1 on the four-dimensional genus-two cohomology space, h=4 and θ(T)=1, so raw and normalized torsion are 1.
- For T with characteristic polynomial x⁴+1, h=0 and det(1−T)=2, giving normalized torsion [2].
- For the hyperbolic four-dimensional 𝔽₃ unipotent model, h=2 and the fixed-space restricted form has determinant 0; its generalized +1 space is the whole nondegenerate space, with discriminant 1. This is the linear-algebra control for the generalized-space formula.
- For f=id with intertwiner −I on genus-two rank-two coefficients, T=−1 on the four-dimensional H¹, so 1−T=2I, h=0 and θ(T)=det(2I₄)=16, a square; the constant-coefficient endomorphism id−f_* would be zero and give h=4.

*Needs:* §4.5; §4.4; AlgebraicTopology Stage 6.1; §2.2.

### 4.7 A genus-two cocycle model

For π=⟨a₁,b₁,a₂,b₂ | [a₁,b₁][a₂,b₂]=1⟩ and a representation on V with ρ(b₁)−1 invertible, evaluate a crossed homomorphism by φ(gh)=ρ(g)φ(h)+φ(g) and φ(g⁻¹)=−ρ(g)⁻¹φ(g). The single relator determines φ(a₁) from the other three values. Thus H¹(Σ;ρ)=coker(ι:V→V³), ι(v)=((b₁−1)v,(a₂−1)v,(b₂−1)v). An automorphism t with a symplectic intertwiner M satisfying ρ(t(g))=Mρ(g)M⁻¹ for every g induces T̃(φ)=M⁻¹φ∘t, descending to T on this cokernel. If 1−M⁻¹ is invertible, det(1−T)=det(1−T̃)/det(1−M⁻¹). (AV-v1, Appendix C.1, C.3, (C.5)–(C.9), pp. 86–89, line 4142).

A proof route is as follows. Use cellular degree-one cochains of the surface presentation and expand the relator by the crossed-homomorphism rule; its a₁ coefficient is 1−ρ(a₁b₁a₁⁻¹), invertible by hypothesis. The principal crossed homomorphisms give exactly ι, which is injective because b₁−1 is. Check T̃ι=ιM⁻¹, then apply determinant multiplicativity to the short exact sequence. Acyclicity of 1−T is unnecessary for the polynomial identity, but is needed to use a nonzero determinant as torsion.

The API has the following consequences under these hypotheses.

- Evaluate a crossed homomorphism on a word from its generator values.
- The quotient by principal cocycles is the stated V³/ι(V).
- The action is M⁻¹φ∘t and preserves ι(V).
- The quotient determinant identity follows from the equivariant short exact sequence.

**Checks.**

- Over ℚ take a₁=a₂=b₂=I₂, b₁=diag(2,1/2), φ(b₁)=e₁ and the other generator values zero; the relator evaluates to I₂ and its cocycle value is e₁−e₁=0. Then φ(b₁⁻¹)=−e₁/2; omitting the minus sign gives e₁/2 and omitting the inverse gives −e₁, and either makes the relator value nonzero.
- The cocycle φ_v(g)=ρ(g)v−v is sent by T̃ to `phi_(M^(-1)*v)`.
- For rank-two coefficients satisfying the hypothesis, the relator imposes two independent equations on eight generator coordinates: the cellular cocycle space has dimension 6, principal cocycles have dimension 2, and dim H¹=6−2=4, matching the genus-two Euler calculation.

*Needs:* AlgebraicTopology Stage 2; AlgebraicTopology Stage 4; AlgebraicTopology Stage 6.1; §4.5.

### 4.8 A nonsquare Gaussian torsion class

Let i²=−1. On a genus-two surface use a₁=diag(−i,i), b₁=a₂=−I, b₂=1/2[[-1−i,−1−i],[1−i,−1+i]]. Take the twists T₁:b₁↦b₁a₁⁻¹, T₂:a₁↦a₁b₁, T₃:(b₁,b₂)↦(a₁⁻¹a₂⁻¹b₁,a₂⁻¹a₁⁻¹b₂), T₄:b₂↦b₂a₂⁻¹, T₅:a₂↦a₂b₂, with unspecified generators fixed. Realize T₁,…,T₅ by orientation-preserving smooth Dehn twists on the marked surface, with these based word actions, including the basepoint paths. For the oriented relator R=[a₁,b₁][a₂,b₂], verify each T_i sends R to a conjugate of R with exponent +1 (AV-v1, C.1, pp. 86–87, lines 4053, 4065). Apply T₄,T₄,T₂,T₃,T₁ in that order to each group word, so t=T₁∘T₃∘T₂∘T₄∘T₄. The intertwiner is M=[[0,−1],[1,0]]. Then char_T(x)=x⁴+1, det(1−T̃)=4, det(1−M⁻¹)=2, h=0 and N=RT=[2]=[i]≠1 in Q(i)ˣ/Q(i)ˣ². The second AV-v1 C.4.2 system with a₁=b₁=[[0,1],[−1,0]], a₂=I, b₂=diag(i,−i), twists T₅,T₅,T₄,T₅,T₅ and the same M gives determinants 8 and 2, hence RT=[4]=1. (AV-v1, Appendix C.4.1–C.4.2, pp. 89–90, line 4196).

A proof route is as follows. Use the marked-surface-twist compatibility to identify the displayed automorphisms with the smooth twists, and compose their basepoint paths to realize t. Form its oriented smooth mapping torus. Verify the surface relator and the intertwining relation on all four generators by exact arithmetic in Q(i). Build the relator derivative matrix by the cocycle rule, solve for φ(a₁), and compute T̃ on the six remaining coordinates. Check its invariant two-dimensional principal-cocycle subspace and the quotient characteristic polynomial. Compute determinants 4/2 and 8/2. The identity 2=(1−i)²i identifies the first square class; if (a+bi)²=i with rational a,b, then a=±b and 2a²=±1, impossible.

**Checks.**

- The four twists T₁,T₂,T₄,T₅ fix R as a free-group word, so their oriented-relator exponent is +1.
- T₃(R)=(a₂⁻¹a₁⁻¹)R(a₁a₂); its conjugating word is nontrivial and the relator exponent is +1.
- Swapping (a₁,b₁,a₂,b₂) with (b₂,a₂,b₁,a₁) sends R to R⁻¹ and has orientation exponent −1, excluding realization as an orientation-preserving mapping class.
- The first surface relator evaluates to I₂ and all four intertwining residual matrices are zero; reversing the order of word composition gives a nonzero residual on b₂.
- The first six-dimensional characteristic polynomial is (x²+1)(x⁴+1), the principal part has polynomial x²+1, and the determinant ratio is 4/2=2 with h=0.
- The second example has characteristic polynomial (x²+1)³ before quotient and (x²+1)² after quotient, with ratio 8/2=4 and trivial square class.

*Needs:* §4.7; §4.6; GeometricTopology Layer 3; gap:marked-surface-twists.

### Examples

The rotation plane and the nonsemisimple hyperbolic 𝔽₃ model test the circle formula. The two genus-two Gaussian systems distinguish the nontrivial class [2] from the square [4].

### Dependencies

Earlier local inputs: Layer 0, Layer 1, Layer 2. AlgebraicTopology Stages 6.1–6.4; AlgebraicTopology Stage 2; AlgebraicTopology Stage 4; GeometricTopology Layer 3; gap:marked-surface-twists. The subsection Needs lines separate statement inputs from the indicated proof route.

## Layer 5: transfer and controlling extensions

### 5.1 Good finite fields

An odd finite field k is good if N_k=c_et on B_r(k)=H₃(Sp₂ᵣ(k);ℤ)/2 for every r≥1. The finite-rank comparison makes these groups cyclic of order two and stabilization an isomorphism. Thus it suffices at one rank to find x with normalized torsion N_k(x)≠1. A nonsquare raw RT witness is sufficient only after also accounting for its semicharacteristic half-sign. (AV-v1, §2.7, Definition 2.7.1 and preceding discussion, pp. 16–18, line 743).

A proof route is as follows. Define the predicate by equality of homomorphisms. Use the finite-field étale isomorphism and rank stabilization to characterize goodness by a nonzero normalized value.

The API has the following consequences under these hypotheses.

- The predicate N=c_et on the finite-field integral quotient.
- Goodness is equivalent to existence of a nonzero normalized value.
- The criterion is independent of positive symplectic rank.

**Checks.**

- On a cyclic two-element source and target, the zero homomorphism fails the criterion and the isomorphism satisfies it.
- A constant rank-two system on S³ over F₃ has raw nonsquare RT=[−1] but normalized value 1, so it cannot be the nonzero witness.
- A nonzero witness at Sp₂ remains nonzero under every standard stabilization.

*Needs:* §3.7; §3.6; KTheoryFiniteLocalFields §§1.5, 1.8–1.9.

### 5.2 Chern-liftable square classes

For a normal integral Z[1/2]-algebra R, a∈H¹(R,μ₂) is c_et-liftable when it is c_et(x) for some x∈B_r(R), allowing stabilization in finite rank. Over a field use the Kummer square-class identification. Liftable classes form an F₂-subspace, functorial under scalar extension and under field automorphisms. (AV-v1, §2.9–§2.10, pp. 18–20, line 762).

A proof route is as follows. Take the image of the stabilized Chern homomorphism. Finite sums have representatives in a common finite symplectic rank. Use functoriality to transport witnesses.

The API has the following consequences under these hypotheses.

- Membership in the image of c_et.
- A class with this predicate has a finite-rank integral homology witness modulo two.
- The liftable classes form an F₂-subspace.
- Ring maps send liftable classes to liftable classes.

**Checks.**

- The trivial torsor is liftable by the zero cycle.
- Over ℝ the class [−1] is not Chern-liftable: §8.2 makes the Chern image {1}, whereas ℝˣ/ℝˣ²={1,[−1]}. This excludes the predicate that every square class is liftable.
- Every square class over an odd finite field is liftable by the finite-field isomorphism at any rank r≥1; rank zero lifts only the trivial class.
- The product of classes represented by x and y is represented by x+y after stabilization, rather than by multiplying bar cycles.

*Needs:* §3.6; SchemeAndStackFoundations §2.11; gap:normal-torsor-gluing.

### 5.3 The transfer lemma

Let S be a normal integral finite-type Z[1/2]-algebra with maps to odd finite fields k₀,k₁. If a=c_et(x)∈H¹(S,μ₂) specializes nontrivially at both maps, then k₀ is good if and only if k₁ is good. (AV-v1, §2.9, Lemma 2.9.1, pp. 18–19, line 767).

A proof route is as follows. Put b=N_S(x). At every finite closed-point specialization with a=0, the finite-field Chern isomorphism forces x=0 and then b=0. Quadratic-cover Frobenius detection implies b lies in the F₂-span of a: otherwise there is a closed point where a=0 but b≠0. If k₀ is good, b specializes there to the nonzero a, so b=a globally. Its nonzero specialization at k₁ proves goodness there; reverse the roles for the converse.

**Checks.**

- For the zero homology class both specializations of its Chern class are 1, so it cannot satisfy the two nontrivial-specialization hypotheses.
- For independent quadratic classes a,b, the four character patterns are (0,0),(0,1),(1,0),(1,1); pattern (0,1) rules out b=N(x) outside the span of a.
- If b lies in the two-element span of nonzero a and specializes nontrivially where a does, then b=a rather than 0; the criterion is symmetric in k₀,k₁.

*Needs:* §5.1; §5.2; §3.7; KTheoryFiniteLocalFields §§1.5, 1.8–1.9; Chebotarev arithmetic-scheme contract (gap:arithmetic-scheme-frobenius-detection).

### 5.4 Many liftable classes over number fields

For every number field F, the image of c_et:H₃(SL₂(F);ℤ)→Fˣ/Fˣ² has F₂-dimension at least r₂(F). The same bound holds for the stabilized symplectic group via SL₂=Sp₂. (AV-v1, §2.10, Lemma 2.10.1, pp. 19–20, line 820).

A proof route is as follows. Import the number-field stable Hurewicz equivalence K₃^ind(F)≃H₃(SL(F);ℤ) and the Hutchinson–Tao surjection from H₃(SL₂(F);ℤ). Use the supplier’s precise dyadic degree-three Chern surjection K₃^ind(F)→H¹(F,ℤ₂(2))/2, with compatibility with the standard representation. The latter group has at least r₂(F) independent mod-two classes, and coefficient reduction injects it into H¹(F,μ₂). Keep the real-place corrections rather than applying odd-prime Quillen–Lichtenbaum blindly at 2.

**Checks.**

- For ℚ, r₂=0 and the lower bound is 0, without asserting that the image is zero.
- For ℚ(i), r₂=1 and the image has at least 2 elements; for a totally imaginary degree-four field it has at least 4.
- The stable Hurewicz map for ℚ has orders 48→24, not 48→48; replacing indecomposable K₃ by integral K₃ loses its kernel.

*Needs:* §5.2; K3BlochGroups §§2.4–2.5, 6.7; gap:unstable-sl2-chern-lift; gap:dyadic-number-field-chern-rank; gap:dyadic-number-field-chern-reduction; KTheoryFiniteLocalFields §1.8.

### 5.5 Weighted density and controlling extensions

For a set P of finite places of a number field L and real X≥1 set `w_P(X) = X^(-1) * sum_(v in P, Nv<=X) log Nv`. Record both lower and upper limits. A controlling pair (E/L,S) consists of a finite Galois extension and a nonempty conjugacy-invariant subset S⊂Gal(E/L) such that the bad unramified places with Frobenius in S have upper weighted density zero, equivalently w_bad(X)→0. A place is good when its odd residue field is good. Finite exceptional places and residue degree greater than one have weight tending to zero. (AV-v1, §2.11, Definition 2.11.1, p. 20, line 866).

A proof route is as follows. Define the counting functions and exceptional-set condition with an actual zero limit. Import weighted Chebotarev for conjugacy subsets and the prime-power/residue-degree tail estimates from Chebotarev Layers 11 and 13. Allow an empty controlling subset only as a formal input to the compositum operation when its output subset is nonempty.

The API has the following consequences under these hypotheses.

- The logarithmically weighted counting function divided by X.
- A finite Galois extension, a nonempty conjugacy subset and a zero upper-density bad set.
- The lower density of good places is at least |S|/|Gal(E/L)|.
- Changing finitely many places leaves the condition unchanged.

**Checks.**

- The empty subset is not a controlling witness for a field extension.
- Places of residue degree at least two have weight O(X⁻¹/² log X), hence limit zero.
- A finite union of upper-density-zero sets has upper density zero; two sets of lower density zero need not have a zero-density union.

*Needs:* §5.1; Chebotarev Layer 11; Chebotarev Layer 13.

### 5.6 A torsion witness gives a controlling extension

Let L be a number field and α≠1 the normalized torsion class N_L(x) of a labelled oriented three-manifold. Then L(√α)/L with its nonidentity Frobenius class is controlling, with only finitely many exceptional places. In particular a nonsquare raw torsion witness is sufficient when its normalization sign is square, as over Q(i). (AV-v1, §2.11, Lemma 2.11.1, pp. 20–21, line 890).

A proof route is as follows. Spread the representation, pairing and its finite bar cycle to an S-integer ring with 2 invertible. At any unramified place where α is nonsquare, naturality makes N nonzero, hence the residue field good. Discard only finitely many denominator and ramified places.

**Checks.**

- The Gaussian normalized class [i] gives a genuine degree-two extension ℚ(i)(√i), and its nonidentity Frobenius set has relative size 1/2.
- The constant rank-two S³ system over 𝔽₃ has raw class [−1] but normalized class 1, so it gives no nontrivial controlling quadratic extension.
- A normalized square class gives the degree-one extension with no nonidentity element; the assumption α≠1 excludes this empty controlling subset.

*Needs:* §5.5; §3.5; §5.1.

### 5.7 Composita of controlling extensions

Inside a fixed algebraic closure of L, let E₁/L and E₂/L be finite Galois, with conjugacy-invariant subsets S₁,S₂. Assume the bad Frobenius locus for each Sᵢ has upper weighted density zero, permitting an empty Sᵢ for this auxiliary assertion. If the union S of their inverse images in Gal(E₁E₂/L) is nonempty, then (E₁E₂/L,S) is controlling. Each individual restriction projection is onto. The map to the product of the two Galois groups is not asserted onto. (AV-v1, §2.11, Lemma 2.11.2, p. 21, line 903).

A proof route is as follows. Use compatibility of Frobenius under restriction. Every bad place for the union belongs to one of the two exceptional sets; apply subadditivity of upper weighted density. Discard the finite ramification set.

**Checks.**

- If E₁=E₂ is quadratic and both subsets contain the nonidentity, the compositum Galois group has 2 elements, while the product has 4; its image is diagonal.
- For disjoint quadratic E₁,E₂ and their nonidentity subsets, the union of inverse images has 3 of 4 elements.
- An empty first subset and a nonempty second subset yield the second inverse image; two empty subsets yield an empty union and no controlling witness.

*Needs:* §5.5.

### 5.8 Controlling extensions and intermediate fields

Let E/L be finite Galois, L⊂M⊂E, S_M⊂Gal(E/M) nonempty and invariant under conjugation by Gal(E/M), and S_L its conjugacy closure in Gal(E/L). Then (E/L,S_L) is controlling if and only if (E/M,S_M) is controlling. (AV-v1, §2.11, Lemma 2.11.3, pp. 21–22, line 913).

A proof route is as follows. Remove places with residue degree greater than one over the rational prime in either field; their weighted contribution tends to zero. Use the Frobenius orbit criterion: a class in the conjugacy closure meets Gal(E/M) exactly when there is a residue-degree-one place of M with that Frobenius class. Goodness agrees because the residue fields then agree. Bound the number of primes lying over a prime by [M:L] and preserve the zero upper-density condition in both directions.

**Checks.**

- When M=L the subsets and weighted bad sets coincide, with multiplicity 1.
- For E=M=ℚ(i) over L=ℚ, the identity subset descends to split primes of relative density 1/2; the two primes above each split prime have the same residue field.
- A prime p≡3 modulo 4 has norm p² in ℚ(i), so its upstairs contribution has limiting normalized weight 0 although the downstairs set has density 1/2; unrestricted density preservation is false.

*Needs:* §5.5; Chebotarev Layer 11.

### Examples

A diagonal C₂ compositum and a disjoint C₂×C₂ compositum distinguish individual projection surjectivity from product surjectivity. Split and inert primes of ℚ(i) distinguish degree-one descent from unrestricted density preservation.

### Dependencies

Earlier local inputs: Layer 3. KTheoryFiniteLocalFields §§1.5, 1.8–1.9; SchemeAndStackFoundations §2.11; gap:normal-torsor-gluing; K3BlochGroups §§2.4–2.5, 6.7; gap:unstable-sl2-chern-lift; gap:dyadic-number-field-chern-rank; gap:dyadic-number-field-chern-reduction; KTheoryFiniteLocalFields §1.8; Chebotarev Layer 11; Chebotarev Layer 13; Chebotarev arithmetic-scheme contract. The subsection Needs lines separate statement inputs from the indicated proof route.

## Layer 6: density amplification

### 6.1 Independent liftable classes propagate goodness

Let α,β be linearly independent classes in Lˣ/Lˣ², with β Chern-liftable. Suppose L(√α)/L is controlling for a nonempty subset of its two-element Galois group. Then, outside a finite set, every place where β is nonsquare is good. (AV-v1, §2.12, Lemma 2.12.1, p. 22, line 953).

A proof route is as follows. Spread β and its finite-rank lift to an S-integer ring. Independence gives a biquadratic extension and a positive-density Frobenius class where β is nonsquare and α has the controlling value. Choose a good place outside its zero-density exceptional set. Use this place and any other nonsquare specialization of β in the transfer lemma. Only finitely many excluded denominators remain.

**Checks.**

- For independent α,β the biquadratic Galois group has 4 characters and the selected controlling value of α together with β nonsquare occurs in exactly 1 of 4.
- For β=α and a controlling identity class for α, the requested simultaneous square/nonsquare pattern has 0 elements; independence cannot be dropped from this proof.
- For β=1 the nonsquare locus is empty and the conclusion carries no goodness witness; independent β is nontrivial.

*Needs:* §5.3; §5.2; §5.5; Chebotarev Layer 13.

### 6.2 Multiquadratic controlling extensions

Let α≠1 define a controlling quadratic extension of L. Let W be a finite-dimensional Chern-liftable F₂-subspace of Lˣ/Lˣ² with dim W≥1 and W≠⟨α⟩. Then L(√W)/L, with group W* and subset W* minus its identity, is controlling with finitely many exceptional places. (AV-v1, §2.12, Lemma 2.12.2, pp. 22–23, line 973).

A proof route is as follows. Choose a basis of W whose members are independent of α: if α∈W, replace one basis vector by its sum with another, using dim W≥2. Apply independent-classes to each basis witness, and union the finitely many exceptional sets. Any nonidentity element of W* detects at least one basis class. The dim W≥1 condition ensures the controlling subset is nonempty.

**Checks.**

- For dim W=1 with W≠⟨α⟩, the extension has degree 2 and its controlling subset has 1 element.
- For dim W=2, its character group has 4 elements and the nonidentity subset has 3; if α∈W, a basis β,α+β avoids α.
- For W=0 the character group has 1 element and the proposed nonidentity subset has 0 elements; positive dimension is necessary.

*Needs:* §6.1; §5.2; §5.7.

### 6.3 A disjoint totally imaginary cyclic extension

For a number field K, a fixed finite Galois E/K and every even h≥4, there is a cyclic extension L/K of degree h, linearly disjoint from E, with L totally imaginary. One may choose a sufficiently large rational prime r≡1+h (mod 2h), unramified in E and K, and take the degree-h cyclic subextension of K(ζ_r)/K. (AV-v1, §2.12, proof of Lemma 2.12.3, pp. 23–24, line 1012).

A proof route is as follows. Choose r>N in the unit class 1+h modulo 2h using `Nat.forall_exists_prime_gt_and_eq_mod`, with N larger than every prime ramifying in E or K; gcd(1+h,2h)=1 because h is even. Chebotarev §7.2 gives irreducibility of the r-th cyclotomic polynomial over K. The cyclotomic extension is totally ramified at r, while E and K are unramified there; obtain the degree and disjointness. Because (r−1)/h is odd, complex conjugation has nontrivial image in the cyclic quotient, so every real embedding becomes complex.

**Checks.**

- For K=ℚ, h=4 and r=5, the degree-four cyclotomic field is totally imaginary and complex conjugation is the nonidentity element of order two.
- For h=4 and r=13, (r−1)/h=3 is odd; the degree-four quotient again has nontrivial complex conjugation.
- For h=4 and r=17, (r−1)/h=4 is even and complex conjugation dies in the degree-four quotient; merely requiring r≡1 modulo h is insufficient.

*Needs:* `Nat.forall_exists_prime_gt_and_eq_mod`; Chebotarev Layer 7 (§7.2); Chebotarev Layer 13.

### 6.4 The cubic density improvement

Given a controlling (E/K,S) containing a fixed controlling quadratic subextension, put δ=1−|S|/|Gal(E/K)|. If 0<δ≤1/2, construct a controlling (E′/K,S′), E⊂E′, with δ′≤δ−δ³/16. Iteration gives lower weighted density one for good places of K. (AV-v1, §2.12, Lemma 2.12.3 and its proof, pp. 23–25, line 992).

A proof route is as follows. Take the least even h≥4 with `2^(-h/4) <= delta/2` and a disjoint totally imaginary cyclic L/K of degree h. The controlling quadratic class remains nonsquare in L. Choose a finite Galois-stable liftable subspace W over L of dimension N≥h/2, by taking the orbit span of finitely many independent classes. Let L̃=L(√W), so Gal(L̃/L)=W*. Descend its nonidentity controlling subset to K and combine it with E. Write Γ=Gal(EL̃/K). The projection Γ→Gal(E/K)×Gal(L/K) is surjective, but no surjection to Gal(E/K)×Gal(L̃/K) is assumed. The fraction outside S and over identity in Gal(L/K) is δ/h; at most 1/(h2^N) also maps to identity in Gal(L̃/K). New good fraction is at least `(delta-2^(-N))/h`. Minimality of h gives h⁻¹≥δ²/8 and `2^(-N) <= delta/2`; hence the cubic decrease. A positive limiting δ contradicts the recurrence.

**Checks.**

- At δ=1/2 the least even h is 8; with N=4 the gained fraction is at least (1/2−1/16)/8=7/128, exceeding δ³/16=1/128.
- At δ=1/4 take h=12 and N=6: the gain is at least (1/4−1/64)/12=5/256, exceeding δ³/16=1/1024.
- At δ=0 the density is already 1 and the displayed minimum for h has no solution; the induction is explicitly restricted to δ>0.

*Needs:* §6.3; §6.2; §5.4; §5.7; §5.8; Chebotarev Layer 13.

### 6.5 Density one for good rational primes

The set of rational primes p with F_p good has weighted counting function `X^(-1) * sum_(p<=X, F_p good) log p` tending to 1. Consequently its complement has upper weighted density zero. (AV-v1, §2.13, p. 25, line 1096).

A proof route is as follows. Over Q(i) the Gaussian witness has nontrivial normalized class, so it gives a controlling quadratic extension and density-one good places of Q(i). Then Q(i)/Q with identity Frobenius subset is controlling by residue-degree-one descent; the exceptional set is zero in upper density. Apply density-improvement over Q with its fixed quadratic class −1.

**Checks.**

- The C₂ identity Frobenius class for ℚ(i)/ℚ initially supplies fraction 1/2, not 1; density amplification is required.
- The Gaussian determinant ratio is 2, and 2=(1−i)²i; it is nonsquare in ℚ(i), while the constant S³ normalized ratio is 1.
- Omitting the single prime 2 changes the normalized logarithmic count by at most log(2)/X→0, rather than weakening the all-odd-field result.

*Needs:* §4.8; §5.6; §6.4; §5.8; Chebotarev Layer 13.

### Examples

The W=0 and dim W=2 cases distinguish an empty character locus from its three nonidentity elements. The δ=1/2 and δ=1/4 computations measure the actual density gain.

### Dependencies

Earlier local inputs: Layer 4, Layer 5. Chebotarev Layer 13; Chebotarev Layer 7 (§7.2); `Nat.forall_exists_prime_gt_and_eq_mod`. The subsection Needs lines separate statement inputs from the indicated proof route.

## Layer 7: the universal comparison

### 7.1 Comparison in characteristic zero

For every normal integral finite-type Z[1/2]-algebra S of characteristic zero and each positive symplectic rank, N_S=c_et on H₃(BSp₂ᵣ(S);ℤ)/2. (AV-v1, §2.14, pp. 25–26, line 1108).

A proof route is as follows. For fixed x, the difference a=N_S(x)−c_et(x) is a μ₂-torsor split at every closed point with good residue field. For d=dim S, use `#(closed points of order q) = O(q^(d-1))`. Bad degree-one prime powers have total logarithmic weight o(Q); higher powers have `O(Q^(1/2) * (log Q)^2)`, so the bad closed-point weight is o(Q^d). A nontrivial double cover has nonsplit closed points of positive Q^d-order weight by quadratic-cover-detection, contradicting that bound. No assertion that `Q^(-d)` times the count of all closed points tends to 1 is needed.

**Checks.**

- For Spec ℤ[1/2], d=1 and the total weighted closed-point count is asymptotic to Q; a nontrivial quadratic cover has positive nonsplit proportion.
- For Spec ℤ[1/2,t], d=2 and the degree-one contribution is asymptotic to Q²/2; its Q⁻²-normalized limit is 1/2, not 1.
- A bad rational-prime weight o(Q) contributes at most `Q^(d-1) * o(Q) = o(Q^d)`; the higher prime-power bound `O(Q^(1/2) * (log Q)^2)` gives `O(Q^(d-1/2) * (log Q)^2)`.

*Needs:* §6.5; Chebotarev arithmetic-scheme contracts (gap:arithmetic-scheme-frobenius-detection, gap:arithmetic-scheme-nonsplit-weight, gap:arithmetic-scheme-residue-order-count); §3.7; §3.6; Chebotarev Layer 11.

### 7.2 Lifting finite-field homology through Witt vectors

For every odd finite field k, r≥1 and x∈H₃(Sp₂ᵣ(k);ℤ)/2, there is a normal integral finite-type Z[1/2]-domain S⊂W(k), a reduction map S→k and a class x_S∈H₃(Sp₂ᵣ(S);ℤ)/2 mapping to x. No integral surjectivity of a Sylow inclusion is claimed. (AV-v1, §2.15, p. 26, line 1132).

A proof route is as follows. For a Sylow 2-subgroup Q, transfer followed by inclusion is multiplication by the odd index, hence inclusion H₃(Q;ℤ)/2→H₃(Sp(k);ℤ)/2 is surjective. Lift Q→Sp(k) through Sp(W_n(k)). Each congruence kernel is a k-Lie algebra of odd characteristic, whose positive-degree Q-cohomology vanishes by averaging since |Q| is invertible; obstruction classes vanish and compatible lifts exist. Take the finite-type subring of W(k) generated by lifted matrix coefficients, form coefficients, inverses and 1/2. Normalize in its fraction field: finite-type Z-algebras are excellent, so normalization is finite; W(k) is integrally closed, so reduction extends. The finite bar cycle descends.

**Checks.**

- For Sp₂(𝔽₃) of order 24, a Sylow 2-subgroup has order 8 and index 3; the transfer composite is multiplication by 3, hence identity modulo two.
- For an odd-characteristic additive module and a group of order 8, averaging divides by the unit 8; over 𝔽₃ that inverse is 2.
- At residue characteristic 2 the same order 8 is zero, so averaging fails; for x=0 the zero bar cycle lifts without any surjectivity assertion over ℤ.

*Needs:* `Sylow`; KTheoryFiniteLocalFields §§1.5, 1.8–1.9; AlgebraicTopology Stage 5; `groupHomology`; gap:witt-sylow-lift; SchemeAndStackFoundations §§0.9, 0.21.

### 7.3 Every odd finite field is good

For every finite field k of odd characteristic and every symplectic rank r≥1, N_k=c_et on H₃(Sp₂ᵣ(k);ℤ)/2. (AV-v1, §2.15, p. 26, line 1132).

A proof route is as follows. Lift any x through a normal characteristic-zero S by sylow-witt-lift. Apply the characteristic-zero equality over S and reduce it along S→k using naturality of both transformations.

**Checks.**

- For 𝔽₃ and 𝔽₉ the positive-rank integral degree-three quotients have 2 elements; equality must hold on the nonzero element, not only on zero.
- At 𝔽₉, H₂(SL₂)=ℤ/3 contributes H₂[2]=0 to the coefficient sequence.
- Rank zero has H₃=0 and trivial comparison; characteristic two is outside the theorem and the averaging step.

*Needs:* §7.2; §7.1; §3.7; §3.6.

### 7.4 The transformation comparison

For all normal integral finite-type Z[1/2]-algebras R and all fields K of characteristic ≠2, N=c_et on H₃(BSp₂ᵣ(−);ℤ)/2, for each r≥1 and after stabilization. (AV-v1, §2.6, (2.9), p. 16; §2.16, p. 26, line 1152).

A proof route is as follows. In characteristic p, a difference torsor is split at every finite closed point by all-finite-fields. Frobenius detection makes it trivial. Every field of characteristic ≠2 is a filtered union of finite-type domains with 2 invertible and their finite normalizations inside the field. Integral bar cycles and their relations use finitely many group elements, and finite étale torsors and Chern constructions descend along filtered colimits. Transport equality to all fields without assuming a particular field embeds in characteristic zero.

**Checks.**

- For an algebraically closed coefficient field the scalar square-class group is trivial, so both values are 1.
- Over 𝔽₃(t), finite bar data descend to a finite-type normal subring; no embedding of that field into characteristic zero exists.
- Over the identity ring map both transformations and their torsors are unchanged; a specialization ℚ[s]_(s)→ℚ has no induced inclusion of fraction fields, so such an inclusion is not a naturality hypothesis.

*Needs:* §7.3; §7.1; Chebotarev arithmetic-scheme contract (gap:arithmetic-scheme-frobenius-detection); §3.7; §3.6; KTheoryFiniteLocalFields §1.8.

### 7.5 The topological torsion theorem

Let M be a closed smooth oriented three-manifold and ρ a symplectic rank-2r local system over any field K with characteristic ≠2. Then χ₁/₂(M,ρ)=dim H⁰−dim H¹ is even and `[(-1)^(chi_half/2)] * RT(M,rho) = <rho*c_et,[M]>` in Kˣ/Kˣ². The evaluation is on the integral fundamental cycle reduced modulo two. (AV-v1, §2.1, Theorem 2.1, (2.2), p. 10; §1.1, (1.7), p. 3, line 422).

A proof route is as follows. Choose a symplectic frame over K and apply the transformation equality to the image of the oriented fundamental class in integral group homology modulo two; conjugation invariance makes the result independent of the frame. Use the manifold evaluation formula and Kummer comparison to identify the two sides.

**Checks.**

- The constant rank-two system on S³ has χ₁/₂=2 and raw [−1]; its normalized value and the Chern evaluation of its zero homology label are both 1.
- The Gaussian mapping torus has χ₁/₂=0 and both normalized torsion and Chern evaluation equal [2]=[i].
- A disjoint union of two copies of that witness has value [2]²=1 and doubled integral fundamental class; an empty manifold has value 1.

*Needs:* §7.4; §3.7; §3.2.

### 7.6 The mapping-class spinor identity

For any closed smooth oriented surface Σ, field K of characteristic ≠2, symplectic local system ρ with H⁰(Σ;ρ)=0, orientation-preserving diffeomorphism f and specified symplectic isomorphism f*ρ≃ρ, let T on H¹ and ρ_f on M_f be induced by that choice. Then θ(T)=⟨ρ_f*c_et,[M_f]⟩. This includes all odd finite coefficient fields. (AV-v1, §1.1, (1.5), p. 3; Appendix C.2, Lemma C.2.1, pp. 87–88, line 94).

A proof route is as follows. The local-coefficient Wang triangle of §4.6 gives χ₁/₂(M_f)=−h, h=dim ker(1−T), so its half-sign agrees with `(-1)^(h/2)`. Combine the all-odd mapping-torus formula with the topological theorem. Keep the chosen intertwiner as part of the data: f*ρ≃ρ without a choice does not specify T or ρ_f.

**Checks.**

- Identity surface monodromy on a four-dimensional H¹ gives h=4 and θ(1)=1; χ₁/₂ of its mapping torus is −4 and the Chern evaluation is 1.
- The Gaussian monodromy has h=0 and θ(T)=[2], agreeing with the Chern evaluation.
- In the linear rank-two rotation model, h=0 and θ(A)=[2]; changing the intertwiner can change T, so a mere assertion that an isomorphism exists does not determine either side.

*Needs:* §4.6; §7.5.

### Examples

Spec ℤ[1/2,t] has normalized total weight 1/2, while the comparison needs only positive-order nonsplit weight. The Sylow subgroup of Sp₂(𝔽₃) checks the odd transfer index before reduction.

### Dependencies

Earlier local inputs: Layer 3, Layer 4, Layer 6. Chebotarev Layer 11; gap:arithmetic-scheme-frobenius-detection; gap:arithmetic-scheme-nonsplit-weight; gap:arithmetic-scheme-residue-order-count; `Sylow`; KTheoryFiniteLocalFields §§1.5, 1.8–1.9; AlgebraicTopology Stage 5; `groupHomology`; KTheoryFiniteLocalFields §1.8. The subsection Needs lines separate statement inputs from the indicated proof route.

## Layer 8: real Chern vanishing

### 8.1 The real Chern component and the metaplectic cover

For G=Sp₂ᵣ(ℝ) considered as a discrete group, r≥1, identify the degree-(2,2) component c₂₂ of the standard representation’s mod-two étale c₂ with the pullback of its topological metaplectic double-cover class in H²(G;F₂). The latter is the reduction modulo two of the integral class of the universal covering group, whose central kernel is ℤ. Its coefficient Bockstein to H³(G;F₂) therefore vanishes. (AV-v1, §1.3.3, p. 6, argument following (1.10), line 230).

A proof route is as follows. Import the universal Chern class and its real comparison, with the standard-representation normalization. Use the universal symplectic covering group with kernel ℤ; push out by ℤ→ℤ/4→ℤ/2. This lifts the metaplectic extension to a ℤ/4-extension. Apply the exact coefficient sequence to conclude its Bockstein is zero, also after forgetting topology. The real Chern/metaplectic identification is a supplier request, not a consequence of the integral H₃/2 comparison.

**Checks.**

- In positive rank one, the covering kernel ℤ maps to ℤ/2 with 1↦1; its intermediate quotient ℤ/4 maps 1↦1 as well, so the class has Bockstein zero.
- Rank zero has fundamental group 0, not ℤ; it is outside the positive-rank kernel comparison.
- For the discrete group C₂ itself, its nontrivial H²(C₂;ℤ) class reduces nontrivially in H²(C₂;𝔽₂), yet lifts through ℤ/4 and has zero Bockstein; nonzero class does not imply nonzero Bockstein.

*Needs:* KTheoryFiniteLocalFields §1.8; RepresentationTheory/LieGroups Layer 5; MetaplecticAutomorphicForms §2.4b; gap:real-chern-bockstein; gap:symplectic-universal-cover-kernel.

### 8.2 Vanishing of the real degree-three Chern component

For G=Sp₂ᵣ(ℝ) discrete, c₃₁:H₃(G;F₂)→H¹_et(ℝ,F₂) is zero on the full mod-two homology group, for every r≥1. In particular its restriction to integral H₃(G;ℤ)/2 is zero. (AV-v1, §1.3.3, (1.10), p. 6, line 233).

A proof route is as follows. Use the coefficient Bockstein compatibility of the universal étale c₂: for z∈H₃(G;𝔽₂), β_et(c₃₁(z))=c₂₂(β_G z)=⟨β_G^coh(c₂₂),z⟩, with the ℝ-Galois degree-two coefficient identified with 𝔽₂. That group Bockstein is zero by metaplectic-component. For Gal(ℂ/ℝ)=C₂, the connecting map β_et:H¹(ℝ,F₂)→H²(ℝ,F₂) is an isomorphism, as the generator squares nontrivially. Hence c₃₁=0. Do not infer this stronger domain statement solely from integral H₃ modulo two.

**Checks.**

- For Gal(ℂ/ℝ)=C₂ the degree-one generator t has β(t)=t²≠0, giving an isomorphism between the two one-dimensional coefficient groups.
- A hypothetical nonzero c₃₁ value would therefore give β_et(c₃₁)=t² rather than 0, contradicting the lifted metaplectic component.
- For the zero group cycle the value is 0 in additive notation, or 1 as a square class; vanishing on integral cycles alone leaves the possible H₂[2] cokernel and cannot prove the full-domain claim.

*Needs:* §8.1; KTheoryFiniteLocalFields §1.8; gap:real-chern-bockstein-compatibility.

### Examples

The real quadratic character has nonzero coefficient Bockstein; the metaplectic class has zero group Bockstein because it lifts through ℤ/4. These two facts force the degree-three component to vanish.

### Dependencies

KTheoryFiniteLocalFields §1.8; gap:real-chern-bockstein; gap:real-chern-bockstein-compatibility; RepresentationTheory/LieGroups Layer 5; MetaplecticAutomorphicForms §2.4b. The subsection Needs lines separate statement inputs from the indicated proof route.

## Downstream consumers

Consumers can use the normalized topological theorem (§7.5), the odd-finite-field mapping-class identity (§7.6), real full-mod-two vanishing (§8.2), the circle formula (§4.4), normalized specialization (§3.5) and the boundary theorem (§2.8). The maps are the finite-rank maps above, with stabilization compatibility; consumers do not need an acyclicity hypothesis.

## Worked examples

For the first genus-two Gaussian system of §4.8, the surface relator is I₂, the four intertwining equations hold and the principal-cocycle plane is invariant. Its six-dimensional characteristic polynomial is x⁶+x⁴+x²+1=(x²+1)(x⁴+1), and the principal plane has characteristic polynomial x²+1. Thus the quotient polynomial is x⁴+1, h=0 and the determinant ratio at 1 is 4/2=2. The normalized torsion is [2]=[i] because 2=(1−i)²i. If (a+bi)²=i for rational a,b, then a²=b² and 2ab=1, forcing a²=1/2 or a²=−1/2; neither is a rational square. For the second system, the polynomials are (x²+1)³ and (x²+1)² before and after quotient, the determinant ratio is 8/2=4 and torsion is square. These are mathematical identities in ℚ(i), with the action on group words and the coefficient intertwiner fixed in §4.8 (AV-v1, C.3–C.4, pp. 89–90, lines 4154, 4196, 4244, 4246).

For the specialization witness, use the hyperbolic plane H with Gram matrix [[0,1],[1,0]] and coefficient ring ℚ[s]_(s). On H⊕H take A=diag(1+s,(1+s)⁻¹)⊕I₂. The generic fixed dimension is 2 and the special fixed dimension is 4. The generalized moving block has determinant factor −s²/(1+s), hence generic raw torsion [−(1+s)], while the special raw value is 1. Multiplying by the respective half-fixed-dimension signs gives generic [1+s] and special 1, which commute with specialization. This is the dimension-one strict-model witness used by §3.5; it does not assert a geometric three-dimensional symplectic counterexample. Its local root formula has s₀=Σ_(q≤0)(−1)^q rank D^q and h₀=χ≤0(D_F), with s₀−h₀=2a and ν_upper-term=(−1)^aν_upper-cohomology, so the normalized exponents differ by 2a and agree modulo two (AV-v1, B.6 and B.10, pp. 78–80, 85–86, lines 3715, 3987).

For density amplification, let Γ project onto Δ×C_h and onto a group of order h2^N. The old bad fraction over the identity of C_h is δ/h; at most 1/(h2^N) also maps to the identity in the latter group. The gained fraction is therefore at least (δ−2^(−N))/h. This count needs no product decomposition with the larger group. At δ=1/2, h=8 and N=4 it gives 7/128. A partition of primes into alternating blocks whose weighted masses dominate all preceding blocks gives two sets of lower weighted density zero whose union has density one; this excludes a liminf-zero definition of exceptional sets (AV-v1, §2.11–§2.12, pp. 20–25, lines 881, 1066).

## References

- **AV-v1.** Amina Abdurrahman and Akshay Venkatesh, *Symplectic L-functions and symplectic Reidemeister torsion (mod squares)*, [arXiv:2303.13436v1](https://arxiv.org/abs/2303.13436v1), 2023. All page and statement numbers refer to this 98-page version: §1.1, §1.3.3, §§2.1–2.16 and Appendices A–C. The normalization refinements are specified by the displayed formulas and Checks; no numbering from another edition is used.
- **JRV.** Florent Jouve and Fernando Rodriguez Villegas, *On the bilinear structure associated to Bezoutians*, [arXiv:1004.4208v3](https://arxiv.org/abs/1004.4208v3), 2013. Theorem 5.1 and (5.1), pp. 16–17, JRV line 782; Lemma 6.1, p. 18, JRV line 855. Only the determinant formula and its primary decomposition are used, with no unrestricted spinor-surjectivity claim.
- **Thom.** René Thom, *Quelques propriétés globales des variétés différentiables*, Commentarii Mathematici Helvetici 28 (1954), 17–86, [institutional copy](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/thomcob.pdf), Chapter IV §8, Theorem IV.13, p. 81, Thom line 2527. This locator gives the coefficient bordism groups; the labelled-space comparison uses the supplier filtration stated above.
