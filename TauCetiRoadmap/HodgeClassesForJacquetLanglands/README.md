# Roadmap: Hodge classes for the Jacquet–Langlands correspondence

**Summary.** This roadmap constructs a rational Hodge class that realises the Jacquet–Langlands
correspondence between the cohomology of two quaternionic Shimura varieties attached to one cuspidal
representation of `GL₂(𝔸_F)`. From a four-dimensional Hermitian space it builds the exterior-square
construction, a conjugate-linear Hodge-star operator `L` on `⋀²U` with `L∘L = vol`, which turns `⋀²U`
into a rank-three skew-Hermitian space over a quaternion algebra and yields the exceptional
isomorphism `PGU_E(U) ≃ PGU_B(⋀²U)°`. It then restricts explicit harmonic Kudla–Millson Schwartz forms
along the block decomposition `U = B₁ ⊥ B₂`, proves that one global theta class pairs nontrivially
with every archimedean sign vector, identifies the Hecke eigenspace containing that class as purely of
Hodge type `(d,d)`, and descends a complex invertible correspondence to a rational one by a
determinant argument. The end theorems are: the existence of an `L`-rational Hodge class
`ξ₀ ∈ V₁ ⊗_L V₂(d)` inducing an isomorphism of `L`-Hodge structures `V₁ ≃ V₂` between the quaternionic
multiplicity realizations (IP23, Theorem 3.2(i) and Theorem 12.4(i)); the same class chosen fixed in
every `ℓ`-adic realization under the degree-`2d` Kottwitz hypothesis, giving `G_{F_Σ}`-equivariant
isomorphisms for all `ℓ` at once (Theorem 3.2(ii), Theorem 12.4(ii)); and, in parallel weight two
with `ℚ(π) = ℚ`, the rational correspondence on `H^{2d}(X₁ × X₂, ℚ)(d)` (Theorem 1).

## Scope and ownership

This roadmap owns: the Hermitian exterior construction and its block restrictions (Layers 1–2),
with the unitary and quaternionic unitary similitude group schemes they act through (§1.2);
the explicit local torus, weight and signature computations of the exceptional maps (Layer 3);
the harmonic Schwartz forms on real quadratic spaces of even signature, their polynomial Fock
description, with the generator formulas of the real Weil representation it uses, and their
restriction formulas (Layer 4); the specified Shimura diagram, its component
torus and component character class (Layer 5); the quaternionic theta lifts of IP23 §§9–10 and the
simultaneous nonvanishing theorem (Layers 6–7); the Hodge-type and degree analysis of the theta
Hecke eigenspace (Layer 8); the degree-`2d` Galois analysis (Layer 9); and the rational descent and
end theorems (Layer 10). It also owns the cohomology of compact Shimura varieties with automorphic
coefficient systems as compatible realizations (its Hodge structure, `ℓ`-adic properties, Hecke
isotypic parts and Matsushima description, and the descent of the coefficient systems along the
infinite central kernel of a neat level), the same realizations for the definite pairs with
`G(ℝ)/Z(ℝ)` compact, which are not Shimura data, and their pullbacks and normalized traces (§§0.2–0.3),
the Hodge-type criterion for coefficient cohomology of compact unitary similitude Shimura varieties
(§8.6) and the local fact that de Rham additive characters are unramified (§9.3); no earlier
roadmap states these in this generality, and they are needed here first. For a quaternion algebra
split at exactly one real place, HilbertModularVarietiesAndShimuraCurves states the coefficient
systems on the Shimura curve and their descent through the effective central kernel (§R18.4.1), the
comparison of its cohomology with the arithmetic quotient and the compact automorphic comparison
(§§R18.4.24b and R18.4.25a) and the Hecke multiplicity spaces of its `H¹` (§R18.4.25), with integral and
`ℓ`-adic coefficients over a splitting field; §§0.2–0.5 differ in treating every compact datum of
abelian type, the definite pairs and every `d`, with `L`-rational Hodge and `ℓ`-adic realizations in
`M_E^L`.

It leaves the following to the named roadmaps and does not state them again.

- Pure Hodge structures, Tate twists, tensor products, duals and internal Hom are Tau Ceti's
  `TauCeti.Hodge` library (`TauCeti/Geometry/Hodge/`), specified by `Completed/HodgeStructures`.
  The compatible-realization category `M_k^L` and the subspace `HT(V)` of simultaneous Hodge and
  Tate classes are MotivesAndAlgebraicCycles §7.15; rational Hodge classes are its §7.1; Weil
  cohomology, Künneth, Poincaré duality and the correspondence action `c_*(α) = pr₂,*(cl(c) ∪ pr₁*α)`
  are its §§2.2–2.3, with Betti and étale realizations in §§2.6–2.7.
- Exterior powers, the determinant pairing `exteriorPower.pairingDual`, the wedge pairing
  `exteriorPower.wedgePairing` and the bilinear Hodge star `exteriorPower.hodgeStar` are Mathlib's.
  The operator `L` of §1.3 is the conjugate-linear analogue in degree `(2,2)`: for `σ = id` and a
  bijective bilinear form it is the inverse of `exteriorPower.hodgeStar`, and for a symmetric one
  §1.4 specialises to the degree-`(2,2)` case of the identity `Δ • ⋆(⋆x) = (−1)^{kl} x` that the
  module documentation of `Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean` states without
  proof. Tau Ceti's conjugate
  Hodge star `Orientation.barHodgeStar`, with its square `Orientation.barHodgeStar_barHodgeStar`, is
  the case `E = ℂ`, `U = ℂ ⊗_ℝ V` for an oriented four-dimensional real inner product space `V` and
  `H` the sesquilinear extension of its inner product: under `⋀²_ℂ(ℂ ⊗_ℝ V) ≅ ℂ ⊗_ℝ ⋀²V`, `L` is
  that star when `d_U` is the volume form of the orientation and its negative for the opposite
  sign. Sections 1.3–1.4 differ in allowing any field with a ring endomorphism `σ` and any
  sesquilinear form, indefinite or degenerate, with the volume as the square. The determinant
  action on the top exterior power is Tau Ceti's `LinearMap.map_exteriorPower_finrank_eq_det_smul`,
  and a basis trivializes the top power through Tau Ceti's `Module.Basis.exteriorPowerTopEquiv` and
  Mathlib's `Module.Basis.topVector`.
- Quaternion algebras, their norm-rescaling isomorphisms `TauCeti.QuaternionAlgebra.normMulEquiv`
  and `TauCeti.QuaternionAlgebra.rescaleJEquiv`, the common-slot tensor isomorphism
  `TauCeti.QuaternionAlgebra.tensorAlgEquivTensorMatrix` and the Brauer identity
  `TauCeti.BrauerGroup.quaternionClass_mul` are Tau Ceti's. Hilbert 90 is Mathlib's
  `groupCohomology.H1ofAutOnUnitsUnique`. Global Brauer invariants and their sum are ClassFieldTheory
  Layer 10, and local invariants with their multiplication by the degree under restriction are its
  Layer 5; reciprocity is its Layers 6–8 and 11; quadratic norm symbols are its §5.4. The criterion
  for a field to embed in a central simple algebra is EndoscopicTransferAndUnitaryTraceComparison
  §8.3. The
  realization of every finite set of non-complex places of even cardinality as the ramification set
  of a quaternion algebra, and the classification of quaternion algebras by their local splitting,
  are GL2AutomorphicRepresentationsAndTransfer §R17.1.5.
- General spin and Clifford theory stay in OrthogonalSpinGroups, which excludes Hermitian and
  unitary groups; the complex exceptional isomorphism `Spin₆ ≃ SL₄` is
  RepresentationTheory/SpinRepresentations Layer 6. The exceptional maps here carry the additional
  Hermitian, volume, multiplier and quaternionic data and do not restate a spin theory.
- Traceless tensors and the trace maps are RepresentationTheory/SchurWeyl Layer 9
  (`harmonicTensors`); positive-definite harmonic polynomials are
  GeometryOfNumbersAndQuadraticArithmetic §4.3. Section 4.1 is the symmetric part of the former for
  a complexified real form of arbitrary signature, with an undivided pairing.
- The oscillator representation, its Schrödinger models, local theta modules, Howe duality, the
  quaternionic similitude dual pairs with their splittings and the Harris–Kudla comparison
  (IP23 Appendix A), the real discrete-series theta lifts of IP23 §7.2, the unramified quaternionic
  lift of IP23 Lemma 9.4, the similitude theta correspondence of IP23 Lemma 9.3, global theta lifts,
  the Rallis inner product formula and nonvanishing criterion, the global see-saw and the toric theta
  pairing are MetaplecticAutomorphicForms §§0.15–0.17, 2.4c, 3.3, 3.7, 3.16, 3.23–3.36, 3.38, 5.6,
  6.4, 6.10–6.15 and 6.22. The Periods-I splitting of `B₁ ⊗_E B₂`, which its §3.32a compares with
  its §3.24 without constructing it, and the stable-range nonvanishing for unitary dual pairs, which
  its §3.9 states for orthogonal–symplectic pairs only, are asked of it in
  gap:quaternionic-shimizu-lift and gap:unitary-stable-range.
- Vogan–Zuckerman modules, their relative Lie algebra cohomology and its Hermitian Hodge
  decomposition are AutomorphicFormsOnReductiveGroups §§5.2 and 5.4; fields of rationality and
  descent are its §5.7; explicit `GL₂(ℝ)` modules are its §2.6; algebraic modular forms, with their
  restriction, trace and Hecke operators, and the finite effective stabilizers of a group compact
  modulo its centre at infinity, are its §§7.4 and 7.6. Arithmetic locally symmetric
  spaces `X_K` with their local systems, Hecke actions and automorphic comparison are
  ArithmeticLocallySymmetricSpaces; `X_K` divides out only the `ℚ`-split central torus (§ALS.0.4), so
  it is not `Sh_K(ℂ)` when the centre has real-split directions that are not `ℚ`-split, and the
  analogous theory on the quotient by `K_h = Stab_{G(ℝ)}(h)` is that roadmap's contract
  gap:shimura-matsushima-comparison. The transfer of a finite covering is AlgebraicTopology §5.3 and
  the finite étale trace in étale cohomology is EtaleCohomologyFoundations §0.8. The spectral
  decomposition of a compact quotient is AutomorphicSpectralTheory §4.7.
- Global Jacquet–Langlands, strong multiplicity one, cohomological rationality, Hilbert algebraic
  weights, base change, the adjoint lift and quadratic automorphic induction are
  GL2AutomorphicRepresentationsAndTransfer §§R16.4.4, R16.4.5, R16.6.3, R17.3.1, R17.3.5–R17.3.8,
  R17.4.2, R17.4.13 and R17.4.16.
- Finite level maps with their effective quotient actions, holomorphic maps of data, canonical
  models, reflex norms, finite-level reciprocity, functoriality in the datum and zero-dimensional
  Shimura varieties are ShimuraVarieties §§1.3, 1.6, 4.2, 4.3, 4.9, 6.7, 8.1, 8.3, 8.5 and 8.6; neat
  levels are AdelicAlgebraicGroups §4.3.
  Variations of Hodge structure, the rational Hodge structures of SV4 and Kostant representatives are
  ShimuraData §§3.1, 3.3, 3.10 and 4.3.
- The Betti and `ℓ`-adic local systems on a Shimura variety of a representation of `Gᶜ = G/Z_s`,
  the fibre condition on the central units of a neat level, descent along a finite tame quotient,
  their comparison and their tensor, dual and Hecke compatibilities are AutomorphicBundles §§0.1–0.2,
  3.4, 3.5, 3.7 and 3.8; the quotient `Gᶜ` is ShimuraData §4.9. Descent along the infinite central
  kernel `Z(ℚ) ∩ K` of a neat level, which AutomorphicBundles §0.2 leaves to an effective-quotient
  argument, is stated in §0.2 here.
- Weak approximation, ray class groups, finite ideles and Hecke characters are GlobalNumberFields
  Layers 1, 2, 4, 6, 9 and 10. Dual groups and `L`-groups, including the `L`-group of a Weil
  restriction, are ReductiveGroupsPartII §§RG2.5.1–RG2.5.2; the dual group of `GU_E(V)` over `F` and
  of its restriction of scalars to `ℚ` is computed from them in §9.1.
  EndoscopicTransferAndUnitaryTraceComparison §1.8 treats a different group, the similitudes over `ℚ`
  with rational multiplier, of codimension `[F : ℚ] − 1` in `Res_{F/ℚ}GU_E(V)`.
  Algebraic group quotients and identity components are ReductiveGroups Layers 3 and 6.
- Proper and smooth base change are EtaleCohomologyFoundations §§F.2.1–F.2.2 and F.3; Artin's
  comparison is ComplexComparisonPartII §C6.3 for finite coefficients and §C6.6 for `ℤ_ℓ`- and
  `ℚ_ℓ`-coefficients; Huber's comparison of the étale cohomology of a proper scheme with that of its
  analytification, for torsion coefficients, is ClassicalAdicEtaleCohomology §8.2. Admissible
  representations and their stability under subobjects and quotients are PadicHodgeTheory §3.1;
  de Rham representations are its §3.3, the character criterion with coefficients its §3.6, and the
  de Rham comparison for lisse coefficients on proper smooth adic spaces its §7.2; Tate's
  computation of `H¹(G_K, ℂ_p)` is PadicPeriodRings §1.4; the unramified and Bloch–Kato finite local
  conditions are SelmerIwasawaCohomology §§2.7 and 4.9, and the Bloch–Kato subgroup `H¹_g` of de Rham
  classes is AnabelianGeometryAndNonabelianChabauty §4.6.

This roadmap does not assert that `ξ₀` is algebraic or absolutely Hodge, and it does not prove
Kottwitz's conjecture: the all-`ℓ` statement is conditional on the explicit hypothesis of §9.2.

## Conventions

Fix a totally real number field `F` of degree `n`, with real places `Σ_∞`, and quaternion algebras
`B₁, B₂` over `F` split at exactly the same subset `Σ ⊂ Σ_∞`. Put `d = |Σ|` and assume `d < n`:
some real place ramifies in both algebras. `F_Σ` is the fixed field of `{γ ∈ Gal(ℚ̄/ℚ) : γΣ = Σ}`,
the reflex field of every Shimura datum below; for `Σ = ∅` it is `ℚ`.

`π` is a cuspidal automorphic representation of `GL₂(𝔸_F)` with trivial central character and even
weights `k = (k_v)_{v∈Σ_∞}`, all `k_v ≥ 2`, admitting Jacquet–Langlands transfers `π₁, π₂` to
`B₁^×, B₂^×`. The coefficient field is `L = ℚ(π)`; it contains `ℚ(k)`, the fixed field of the
permutations of `k`. Unitary normalization `r = 0` is used: the coefficient representation is
`τ_k = ⊗_v Nrd_v^{(2−k_v)/2} Sym^{k_v−2}(τ_v)` and the local system is attached to its dual.
An `L`-Hodge structure is a rational Hodge structure with an action of `L` by Hodge endomorphisms;
complexification keeps every embedding of `L`. The Tate twist `(m)` changes Hodge type by
`(−m,−m)` and weight by `−2m`, the convention of `TauCeti.Hodge.HodgeStructureOn.tateTwist`.

Hermitian forms are conjugate-linear in the first variable. For a quadratic extension `E/F` with
nontrivial automorphism `σ`, a right quaternionic module has `⟨xβ, yγ⟩ = β*⟨x,y⟩γ`, where `*` is the
main involution. In the Hermitian exterior construction the basis of `⋀²U` is ordered
`e₁₂, e₁₃, e₁₄, e₂₃, e₂₄, e₃₄` and the top trivialization is normalized by `d_U(e₁∧e₂∧e₃∧e₄) = −1`;
these fix the signs of `L`. At split real places the coordinate calculations use the explicit local
basis of IP23 §6.3, and a change of orientation is transported, not dropped.

For the distinct-algebra case the product class `[B₁] + [B₂]` is represented by a division
quaternion algebra `B`, split at every real place. A CM quadratic `E/F` embedded in both `B_i` is
fixed, `B_i = E ⊕ Ej_i` with `j_i² = J_i ∈ F^×`, and `U = B₁ ⊥ B₂` with its mixed summand
`W = B₁ ⊗_E B₂` of `B`-rank two and diagonal summand `W₀` of `B`-rank one. The group
`(B₁^× × B₂^×)/{(t,t⁻¹)}` uses the anti-diagonal scalar quotient. The exterior map squares the
similitude multiplier; its scheme-theoretic kernel is `Res_{E/F}μ₂`, whose `F`-points are `±1`
(§1.7), and an isogeny of algebraic groups is never taken to be surjective on `F`-points.

Theta integrals use the convention `θ(f) = ∫ Θ(g,h) f(h) dh`, linear in the automorphic input.
MetaplecticAutomorphicForms §5.6 integrates the complex conjugate of its input, so its lift of
`f̄` is used. Locally `θ(τ)` is attached to the maximal `τ^∨`-isotypic quotient `Θ(τ) ⊠ τ^∨` of the
oscillator, the convention of IP23 §7.2 (p. 47). MetaplecticAutomorphicForms §3.4 attaches its lift
to the maximal `τ`-isotypic quotient instead, so that, locally and globally (`f̄` lies in the
conjugate of `τ`, which is `τ^∨` for unitary `τ`), `θ(τ)` here is the lift of `τ^∨` there. Its
§3.35, stated in its own convention, is therefore read here with the input dualized (§3.5); its
§3.36 restates IP23 Lemma 9.4 in that source's setup, whose convention (IP23, §9.4, p. 59) is the
one used here, and is read as stated. In particular the source `τ_v` above `Σ` is antiholomorphic of
weight `−k_v−1`, and its lift is the module `A_{q₁}` with nonzero `(1,1)` cohomology (§3.5); the
product in the see-saw has the dual holomorphic weight `k_v+1`.

`H_N^+ = {h ∈ B^×(𝔸_F) : Nrd(h) ∈ N(𝔸_E^×)}` is the norm-support subgroup and `H_∞^+` imposes only
positivity of `Nrd` at real places; finite local norm obstructions distinguish them. The index-two
statement used for extension by zero is for `𝔸_F^×/(F^× N(𝔸_E^×))`. Normalized traces go to the
actual image of a finite map of Shimura varieties, are extended by zero and carry the ratio of the
volumes of the levels in the effective groups `G(𝔸_f)/Z(ℚ)⁻` of §0.3, `Z(ℚ)⁻` the closure of the
rational points of the centre, for *rational* Haar measures: a Haar measure on a locally profinite
group is rational when every compact open subgroup has rational volume, so the ratio is a positive
rational number; compact averages have volume one. For such a measure on `G(𝔸_f)` and a compact
open `K`, the rational Hecke algebra `H_ℚ(G(𝔸_f), K)` is the `ℚ`-algebra of `ℚ`-valued `K`-biinvariant
compactly supported functions under convolution (Wal85, §I.2, p. 124).

Harmonic coefficients are the kernel of trace contraction on symmetric tensors; the symmetric
bilinear pairing on `Sym^ℓ` sums over all permutations without a factorial denominator, so the
isotropic vector in a restriction formula is `e^ℓ/ℓ!`. The archimedean additive character is
`ψ(x) = exp(2πix)`. The real Schwartz forms assume the signature `(p,q)` has `p, q` even. The
algebraic Fock space is the polynomial-times-Gaussian subspace, not all Schwartz functions.

Galois conventions are those of ArithmeticGaloisRepresentations: Frobenius elements are arithmetic
unless named geometric, the cyclotomic character `ε_ℓ` has Hodge–Tate weight `+1`, and `ℚ_ℓ(m)` is
`ε_ℓ^m`.

## Exact supplier contracts

### From Mathlib

- Exterior powers `⋀[R]^n M`, `exteriorPower.ιMulti`, `exteriorPower.map` and
  `exteriorPower.map_apply_ιMulti` (`Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`); the
  determinant pairing `exteriorPower.pairingDual` with `exteriorPower.pairingDual_ιMulti_ιMulti`
  (`Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean`); the wedge product `exteriorPower.wedge`, the scalar pairing
  `exteriorPower.wedgePairing` and its perfectness instance `exteriorPower.instIsPerfPairWedgePairing`
  for finite free modules (`Mathlib/LinearAlgebra/ExteriorPower/WedgePairing.lean`); the induced bilinear form
  `LinearMap.BilinForm.exteriorPower` (`Mathlib/LinearAlgebra/ExteriorPower/BilinForm.lean`); and the bilinear Hodge
  star `exteriorPower.hodgeStar` (`Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean`). The wedge pairing needs a
  trivialization of the top power and `k + l = finrank`; the Hodge star needs a bijective bilinear
  form. Neither accepts a conjugate-linear form, and Tau Ceti's `Orientation.barHodgeStar` covers
  only the positive definite form of a complexified real space: the general case is the content of
  §§1.3–1.4.
- `Module.Basis.topVector` and `exteriorPower.isUnit_apply_topVector`
  (`Mathlib/LinearAlgebra/ExteriorPower/WedgePairing.lean`): for a basis `b` of a finite free module
  over a nontrivial ring, the wedge of all its vectors in increasing order, an element of
  `⋀^{finrank}`, and the fact that any trivialization `vol` of the top power takes a unit value on
  it.
- Semilinear maps `M →ₛₗ[σ] N`, `LinearMap.det`, `Module.Basis`, `Matrix.det`, `Module.Dual`.
- `QuaternionAlgebra` (`ℍ[R,c₁,c₂,c₃]`) and its basis lemmas.
- `MvPolynomial.funext` (`Mathlib/Algebra/MvPolynomial/Funext.lean`): over an infinite integral
  domain two polynomials agreeing at every point are equal. It is the nonvanishing input of §10.6.
- `groupCohomology.H1ofAutOnUnitsUnique` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean`): Hilbert 90 for a
  finite Galois extension, used in §1.8.
- `SchwartzMap`, the Gaussian integrals and `Complex.Gamma`, used in Layer 4 and §7.5.

### From Tau Ceti

- `TauCeti.Hodge.HodgeStructureOn` (`TauCeti/Geometry/Hodge/Structure.lean`): a pure Hodge structure
  on a complex space with conjugation, filtration `F` opposed to its conjugate in the given weight.
  `TauCeti.Hodge.HodgeStructureOn.tateTwist` (`TauCeti/Geometry/Hodge/Tate/Twist.lean`) shifts `F` by `m` and the weight
  by `−2m`; the internal Hom structure `TauCeti.Hodge.HodgeStructureOn.internalHom`
  (`TauCeti/Geometry/Hodge/InternalHom/Basic.lean`) has weight `n₂ − n₁`; the tensor product is in
  `TauCeti/Geometry/Hodge/TensorProduct/Basic.lean`. The carrier has no coefficient action; the `L`-action of an
  `L`-Hodge structure is extra data commuting with `F`.
- `LinearMap.map_exteriorPower_finrank_eq_det_smul` and `Module.Basis.exteriorPowerTopEquiv`
  (`TauCeti/LinearAlgebra/ExteriorPower/Basis.lean`): an endomorphism `f` of a free module `M` acts
  on `⋀^{finrank M}` as `det f • id`, and a basis indexed by `Fin n` identifies `⋀ⁿM` with the scalars,
  sending an exterior product of `n` vectors to its determinant against the basis and the wedge of
  the basis to `1`.
- `TauCeti.QuaternionAlgebra.normMulEquiv` and `TauCeti.QuaternionAlgebra.rescaleJEquiv`
  (`TauCeti/Algebra/Quaternion/SymbolEquiv.lean`): `ℍ[R,a,N(z)b] ≃ₐ ℍ[R,a,b]` for a unit `z` of the
  quadratic algebra `R[√a]`, sending `j` to `(x + y i) j`, and its scalar special case.
- `TauCeti.QuaternionAlgebra.tensorAlgEquivTensorMatrix`
  (`TauCeti/Algebra/Quaternion/TensorProduct.lean`) and `TauCeti.BrauerGroup.quaternionClass_mul`
  (`TauCeti/Algebra/Quaternion/BrauerClass.lean`): the common-slot identity
  `[(a,bc)] = [(a,b)]·[(a,c)]`.
- `TauCeti.brauerCohomologyEquiv` (`TauCeti/Algebra/CrossedProduct/Comparison.lean`) and
  `TauCeti.brauerCohomologyEquiv_baseChange` (`TauCeti/Algebra/CrossedProduct/BaseChange/Naturality.lean`):
  the identification of the Brauer group of central simple algebras over a field `K` with
  `H²(G_K, (Kˢ)ˣ)`, under which scalar extension to a finite separable `L/K` is restriction; through
  it the cohomological invariants of ClassFieldTheory are read on quaternion algebras (§§0.4, 10.2).
- `TauCeti.symPowerRep` (`TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean`): the
  `d`-th symmetric power of the standard representation of `GL n` over a commutative ring, used at
  `n = 2` for the factors `Sym^{k_v−2}` of `τ_k`.
- `Orientation.barHodgeStar` and `Orientation.barHodgeStar_barHodgeStar`
  (`TauCeti/Analysis/InnerProductSpace/HodgeStar/Complex.lean`): for an oriented finite-dimensional
  real inner product space `V`, the conjugate-linear Hodge star `β ↦ ⋆(β̄)` from `ℂ ⊗_ℝ ⋀^k V` to
  `ℂ ⊗_ℝ ⋀^l V` (`k + l = dim V`), whose wedge with `α` is the Hermitian Gram product `h(β, α)` times
  the volume, with square `(−1)^{kl}`. The operator `L` of §1.3 differs in allowing any field with a
  ring endomorphism and any sesquilinear form, indefinite or degenerate, with the volume as the
  square; it is used only as a comparison (§1.3, Checks).

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

§7.15: the category `M_k^L` of compatible realizations (an `L`-Hodge structure `V_B`, for every `ℓ`
a continuous `G_k`-module `V_ℓ` and a comparison `i_ℓ : V_B ⊗ ℚ_ℓ ≃ V_ℓ`) and the subspace `HT(V)` of
classes of type `(0,0)` whose image is `G_k`-invariant for every `ℓ`, with functoriality and the
scalar-extension map `HT(V) ⊗_L L′ → HT(V ⊗_L L′)` (not asserted to be bijective). §7.1: rational
Hodge classes as inverse images of the Hodge pieces. §§2.2–2.3: Weil cohomology with Künneth,
Poincaré duality, pushforward along projections and the correspondence action. §§2.6–2.7: Betti and
étale realizations with their comparison after forgetting the Galois action.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

No construction on its spaces `X_K = G(ℚ)∖(G(ℝ)/K_∞A_∞ × G(𝔸_f)/K)` is consumed. They divide out only
`A_∞`, the identity component of the real points of the maximal `ℚ`-split central torus (§ALS.0.4),
and their trace along level maps composes with pullback to the index `[K : K′]` (§ALS.3.6). A Shimura
variety divides out `K_h = Stab_{G(ℝ)}(h)`, which contains all of `Z(ℝ)`: for `Res_{ℚ(√2)/ℚ}𝔾_m` with
trivial `h` at level `K(3)` the first space is a circle and the second a point (§0.2, Checks).

What ArithmeticLocallySymmetricSpaces must provide (gap:shimura-matsushima-comparison): let `G` be
connected reductive over `ℚ`, `K_h ⊂ G(ℝ)` a closed subgroup containing `Z(ℝ)` with `K_h/Z(ℝ)`
compact (for a Shimura datum `(G, X)` and `h ∈ X`, `K_h = Stab_{G(ℝ)}(h)`), put
`S_K = G(ℚ)∖(G(ℝ)/K_h × G(𝔸_f)/K)` for compact open `K ⊂ G(𝔸_f)` (so `S_K = Sh_K(ℂ)` for a Shimura
datum), and let `V` be a finite-dimensional representation of `G` over a number field `L ⊂ ℂ` on
which `Z(ℚ) ∩ K` acts trivially for every sufficiently small `K`. For neat `K`, let `𝕍_K` be the
local system of `L`-vector spaces on `S_K` obtained by descending the constant sheaf `V` along the
action of `G(ℚ)` on `G(ℝ)/K_h × G(𝔸_f)/K`, whose stabilizers are then all equal to the central group
`Z(ℚ) ∩ K`, acting trivially on `V` (the descent that gives the local systems on `X_K`, with
`K_∞A_∞` replaced by `K_h`). Supply: the Hecke action of `H(G(𝔸_f), K)` on `H^*(S_K, 𝕍)`, with
pullback along level maps and right translations; the de Rham and relative Lie algebra comparison
`H^*(S_K, 𝕍_ℂ) ≃ H^*(𝔤, K_h; C^∞(G(ℚ)∖G(𝔸)/K) ⊗ V_ℂ)`, whose relative complex is built on `𝔤/𝔨_h`
and so divides out the real central directions `Lie Z(ℝ)`, `K_h`-invariance forcing the functions to
transform under `Z(ℝ)°` by the inverse of its action on `V`; when `S_K` is compact, the
Hecke-equivariant Matsushima decomposition
`H^*(S_K, 𝕍_ℂ) ≃ ⊕_π m(π) H^*(𝔤, K_h; π_∞ ⊗ V_ℂ) ⊗ π_f^K`, the sum over the automorphic
representations `π` occurring discretely in the functions on `G(ℚ)∖G(𝔸)` with that central behaviour
and `m(π)` their multiplicity. It is obtained from the discrete decomposition, at each level `K`, of
`L²` of the compact space `G(ℚ)A_∞∖G(𝔸)/K = ⊔_g Γ_g∖G(ℝ)¹`: here `A_∞` is the identity component of
the real points of the maximal `ℚ`-split central torus (§ALS.0.4), `G(ℝ)¹ ≃ G(ℝ)/A_∞` is the common
kernel of the `|χ|` for the rational characters `χ` of `G`, `g` runs over the finite set
`G(ℚ)∖G(𝔸_f)/K`, and `Γ_g = G(ℚ) ∩ gKg⁻¹` lies in `G(ℝ)¹` by the product formula and is a cocompact
lattice there, because `G(ℚ)∖G(𝔸)¹` is compact when `S_K` is (AdelicAlgebraicGroups §3.4, `G^der`
being `ℚ`-anisotropic); AutomorphicSpectralTheory §4.7 applies to each `Γ_g`. It is applied to each
summand of `V` on which `A_∞` acts by one character `λ`, after multiplying the functions by
`|χ|^{1/N}`, a positive character of `G(ℚ)∖G(𝔸)` restricting to `λ` on `A_∞` (`χ` rational with
`χ|_{A_∞} = Nλ`, `N ≥ 1`). The quotient by `G(ℚ)Z(ℝ)°` is not used: `Z(ℚ)Z(ℝ)°` is not closed in
`Z(𝔸)` when `Z(ℚ)` is not discrete in `Z(𝔸_f)` (§0.2, Checks), and a quotient by `Z(ℝ)°K` at each
level keeps only functions invariant under `Z(ℝ)°`, losing a central character that is unitary and
nontrivial on its compact part (§0.2, Checks). The relative Lie algebra cohomology is taken relative
to `K_h`, not `K_∞A_∞`, so this is not the Matsushima formula of `X_K`, and no Eisenstein series
enter. Supply also the compatibility of these with the covering transfers of the finite level maps
`S_{K₁} → S_{K₂}`, `K₁ ⊂ K₂`, whose composite with pullback is the effective degree
`[K₂ : K₁(K₂ ∩ Z(ℚ))]` of §0.3 and whose automorphic counterpart sums right translates over
`K₂/K₁(K₂ ∩ Z(ℚ))` (IP23, §2.2.2, p. 16; Mil17, Lemma 5.13 and footnote 40, p. 57). It sits beside
§§ALS.5b.1 and ALS.5b.4, with `K_∞A_∞` replaced by `K_h`; axiom SV5 is not imposed, so
`Res_{F/ℚ}B^×` is covered for every totally real `F`.

### From TauCetiRoadmap.ComplexKahlerGeometry

§K6.1: Hodge decomposition of compact Kähler manifolds with its functoriality; §K6.0: the twisted
Kähler identities for bundle-valued forms.

What ComplexKahlerGeometry must provide (gap:vhs-hodge-decomposition): for a compact Kähler manifold
`X` and a polarized real variation of Hodge structure `𝕍` of weight `w` on `X`, a pure Hodge
structure of weight `k + w` on `H^k(X, 𝕍)`, functorial for morphisms of variations and pullback along
holomorphic maps, compatible with cup products into `H^*(X, 𝕍 ⊗ 𝕍′)` and with the trace on top
degree (the Hodge decomposition of IP23, §11.3, p. 85).

### From TauCetiRoadmap.ShimuraVarieties

§1.3 `TauCeti.Shimura.holomorphic_level_maps` (finite level maps, locally biholomorphic at neat
target, with the effective image of `K/K′` acting with quotient `Sh_K`); §1.6 holomorphic maps of
Shimura varieties induced by morphisms of data and compatible levels; §8.3 finiteness and, at neat
level, étaleness of the algebraic level maps of canonical models, with the effective quotient action;
§4.2
`TauCeti.Shimura.ReflexNorm`; §4.3 `TauCeti.Shimura.reciprocity_finite_action` (the action of
`r_h(s)` on `T(ℚ)∖T(𝔸_f)/K` factors through `art_E`); §4.9 `TauCeti.Shimura.ReflexNorm.map_full`
(reflex norms under a torus morphism); §6.7 `TauCeti.Shimura.abelian_canonical`; §8.1 the canonical
algebraic level tower over the reflex field; §8.5 `CanonicalModel.datum_map_defined_over_compositum`
(maps of canonical models for a datum morphism, defined over the reflex field of the source);
§8.6 `ZeroDimShimura.shimuraSet` and its canonical model. Its §8.7 identification of components
assumes a simply connected derived group and is not used: the derived group of §5.2 is not simply
connected.

### From TauCetiRoadmap.ShimuraData

§3.1 variations of Hodge structure and §3.3 rational polarized variations; §3.10 Kostant
representatives `kostantRepresentatives`; §4.3 `sv4_rationalHodge`: under SV4 every rational
representation of the Shimura group gives rational Hodge structures `(V, ρ∘h)`; §4.9 the largest
central subtorus `Z_s` that is split over `ℝ` and contains no `ℚ`-split subtorus, and the quotient
`Gᶜ = G/Z_s`.

### From TauCetiRoadmap.AutomorphicBundles

Names are as that roadmap writes them, under its common prefix `AutomorphicBundles`. §0.1
`centralSplitQuotient` with `centralSplitQuotient_factor_iff`: a representation of `G` factors
through `Gᶜ` exactly when `Z_s` acts trivially, and when `Z(G)°` splits over a CM field the quotient
`Z(G)°/Z_s` has equal `ℚ`- and `ℝ`-split ranks. §0.2 `ineffectiveFibreDescent`: the fibre
condition, that the ineffective central kernel of an arithmetic group act trivially on every
coefficient fibre, and, for a finite tame quotient in characteristic zero, descent of a coefficient
exactly when the stabilizers act trivially on the fibres; it records that a neat level can contain
central units of infinite order and leaves that case to an effective-quotient argument, which §0.2
of this roadmap states. §3.4
`bettiCoefficientLocalSystem`: for a rational representation `W` of `Gᶜ` and a neat effective
arithmetic component `Γ∖X⁺`, the local system `Γ∖(X⁺ × W)` with monodromy `W`, functorial in `W`,
compatible with tensor products and duals, and, when the projected weight is rational, underlying
the rational variation of Hodge structure of ShimuraData §§3.1–3.6, weight by weight. §3.5
`etaleCoefficientLocalSystem`: the `ℓ`-adic local system on the canonical model, from a stable
lattice through the canonical tower, independent of the lattice after inverting `ℓ`, functorial in
the representation and compatible with level and Hecke pullbacks. §3.7 `realizationComparison`:
`W_B ⊗ ℚ_ℓ ≃ W_ℓ|S_ℂ` under the algebraic–analytic comparison, compatible with tensors, duals, Tate
twists and Hecke pullbacks. §3.8 `coefficientTensorHecke`: coherence of these realizations with
tensor products, duals, units, coefficient maps and finite-level and Hecke pullbacks. A
representation over a number field `L` enters through its underlying rational representation, `L`
acting by endomorphisms through the functoriality of §§3.4–3.5.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

§2.6 explicit `GL₂(ℝ)` discrete-series modules `D_k`; §5.1 highest-weight characters and the
algebraicity conventions; §4.2 cuspidal occurrence (vacuous cusp
condition for anisotropic derived group); §5.2 relative Lie algebra cohomology with coefficients;
§5.4 `A_q(λ)`, its cohomology `Hom_{L∩K}(Λ^{i−R}(𝔩∩𝔭), ℂ)` and, for a Hermitian datum, the
bidegree formula `H^{p+R₊, p+R₋} ≃ Hom_{𝔩∩𝔨}(Λ^{2p}(𝔩∩𝔭), ℂ)`; §5.7 fields of rationality, models
and descent; §7.4 `IsAlgebraicModularForm`, the rational coefficient model
`{F : G(𝔸_f) → V : F(γgu) = ρ(γ)F(g), γ ∈ G(ℚ), u ∈ K}` of algebraic modular forms over any
commutative scalar ring, compared by `algebraicModularForm_iff_levelCovariant` with the level
carrier, on which restriction, trace (whose composite with restriction is `[K₂ : K₁]`), Hecke
operators and the evaluation equivalence with the stabilizer invariants at class representatives
are defined, none of them needing a finite class set or finite stabilizers; §7.6
`centralArithmeticDescent`: when `G(ℝ)/Z(ℝ)` is compact, the stabilizers of the class
representatives are finite modulo the rational centre, whether or not `Z(ℚ)` is discrete in
`Z(𝔸_f)`. These are used for the definite case of §0.2.

### From TauCetiRoadmap.AutomorphicSpectralTheory

§4.7 `compact_quotient_spectrum`: `L²` of a compact quotient is a discrete Hilbert sum of irreducible
unitary representations with finite multiplicities. §§0.25–0.26: the Bessel and Whittaker functions
used in the archimedean Whittaker coefficients of §7.5.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

§AL.3.6.3, *Rankin–Selberg nonvanishing on the boundary*: for unitary cuspidal `π₁, π₂` over a number
field, the partial `L^S(s, π₁ × π₂)` has no zeros on `Re(s) ≥ 1`; used at `GL₁ × GL₁` in §6.1 and for
the adjoint lift in §8.1.

### From TauCetiRoadmap.AdelicAlgebraicGroups

§3.4: arithmetic quotients of anisotropic connected reductive groups are compact; used for the
exterior isometry group in §§6.4 and 7.1. §4.3: neat elements and levels, and the existence of neat
levels inside every compact open subgroup; used for the degree formula of §0.3.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Conventions: Frobenius elements are arithmetic unless named geometric, and the cyclotomic character has
Hodge–Tate weight `+1`; Tate twists `tateTwist` of §1.2.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

§R16.1.8 finite Hecke characters with prescribed local components and its finite-quotient extension
criterion; §R17.1.5 `existsQuaternionRamification_iff` (finite sets `S_f, S_∞` of finite and
infinite places are the nonsplit places of a quaternion algebra exactly when `S_∞` is real and
`|S_f| + |S_∞|` is even) and `nonempty_quaternionAlgEquiv_of_localSplitting` (two quaternion
algebras are isomorphic exactly when they split at the same places); §R17.3.1 global
Jacquet–Langlands `JL_D` with its local-components, central-character and inverse clauses;
§R17.3.5 quaternionic strong multiplicity one; §R17.3.6 multiplicity one of non-one-dimensional
discrete series in the discrete spectrum; §R17.3.7 coefficient conjugation of
global transfer, with `ℚ(π_f) = ℚ(π′_f)`; §R17.3.8 rational-model comparison, which compares given
`L`-models and does not construct them over `L` itself; §R16.4.4
strong multiplicity one through agreeing unitary eigensystems off a finite set; §R16.4.5 the field
`ℚ(π)` and its finite-part rational model; §R16.6.3 Hilbert cohomological algebraic weights
`k_τ + 2m_τ = w`; §R17.4.2 cyclic base change; §R17.4.13 the adjoint lift `Ad(π) = Sym²π ⊗ ω_π⁻¹`;
§R17.4.16 quadratic automorphic induction, whose base change is `θ ⊞ θ^σ`.

What GL2AutomorphicRepresentationsAndTransfer must provide (gap:quaternionic-rational-model): for a
quaternion algebra `D` over a number field `F` and an irreducible admissible representation `π′_f` of
`D^×(𝔸_{F,f})` with trivial central character, a `D^×(𝔸_{F,f})`-stable model of `π′_f` over every
subfield `L ⊂ ℂ` containing `ℚ(π′_f)`, unique up to homothety, whose `K`-invariants are, for every
compact open `K`, the `H_ℚ(D^×(𝔸_{F,f}), K)`-stable `L`-structure of `(π′_f)^K` (rational Hecke
algebra as in the Conventions), unique up to homothety. Locally, at a place `v` where `D` splits, a
one-dimensional `π′_v = χ_v∘det` has the model `L` itself, on which `g` acts by
`χ_v(det g) ∈ ℚ(π′_v)`, and an infinite-dimensional `π′_v` has the model spanned over `L` by the
translates of a nonzero vector of its newvector line, the one-dimensional space of
`K₁(𝔭_v^c)`-invariants at its conductor `c`; a one-dimensional `π′_v` with ramified `χ_v` has no
`K₁(𝔭_v^r)`-invariants for any `r`, so the newvector clause is not applied to it. At a place where
`D` ramifies the model is spanned over `L` by the translates of a nonzero vector of a line fixed by a
maximal torus, and there the trivial central character cannot be dropped (Wal85, Lemma I.1, p. 123,
Lemmas I.2.1–I.2.2, p. 124, whose proof treats dimension one separately, and §II.1 with its remark,
pp. 147–148; IP23, §3.2, p. 19). This is the case with `L = ℚ(π′_f)` that §R17.3.8 leaves to a finite
extension.

What GL2AutomorphicRepresentationsAndTransfer must provide (gap:norm-subgroup-restriction): for a
quaternion algebra `B` over a totally real `F`, a CM extension `E/F` in `B` and the subgroups
`H_N^+ ⊂ H_∞^+ ⊂ B^×(𝔸_F)`, every irreducible unitary automorphic representation of `H_N^+` with
central character `ξ_E` is a constituent of the restriction of a cuspidal representation of
`B^×(𝔸_F)` whose Jacquet–Langlands transfer `σ` has base change `σ_E` to `GL₂(𝔸_E)` independent of
the choice, with restriction through `H_∞^+` compatible with the archimedean discrete-series signs
(IP23, §11.3, p. 86 and §12.2.4, pp. 96–97).

### From TauCetiRoadmap.MetaplecticAutomorphicForms

§§0.15–0.17 Schrödinger models, including the real Schwartz model; §2.4c the genuine Weil
representation `ω_ψ` on the Schwartz space of that model, over every local field of characteristic
other than two, the real one included (its generator formulas, §2.5, are stated for nonarchimedean
fields only, and the real ones are part of §4.2 here); §3.3 unitary dual-pair splittings and the
Weil representation `ω_{ψ,χ_V,χ_W}`, over local fields archimedean or not and for `E` a field or
`F × F`; §3.3c quaternionic type-I oscillator and doubling inputs; §3.7 Howe duality; §3.16
nonarchimedean conservation relations, for unitary towers among others; §3.23
`quaternionSimilitudeEmbedding` (the dual pair `GU(V)° × B^×` with norm-image multipliers); §3.24
`quaternionSplitting` (`s_v` with `s_v(zg) = ξ_{E,v}(z)^m s_v(g)` and product one on rational points);
§§3.25–3.28 doubled and sharp splittings and the quaternionic see-saw; §3.32a
`quaternionSplitting_periodsI`, the comparison, for `V = B₁ ⊗_E B₂`, of the Periods-I splitting with
the splitting of §3.24 on the norm-image group, which assumes `F` totally real, `E` CM and a real place
split in both `B₁` and `B₂` (here `d ≥ 1`); that section uses the Periods-I splitting without
constructing it, and its construction is part of gap:quaternionic-shimizu-lift; §3.33 the Harris–Kudla
comparison `V† = Ve` for split `B`; §3.34 `similitudeTheta_howe`; §3.35 `theta_realDiscreteSeries`
(for the holomorphic discrete series `π` of `SL₂(ℝ)` of weight `k+1`, `k ≥ 2`, in that roadmap's
maximal `π`-isotypic convention: `θ(π)|G° = A_{q₁}(k−2,0,0)` and `θ(π^∨)|G° = A_{q₀}(0,0,k−2)` on
`SO(4,2)°`; to `O(0,6)`, `θ(π^∨)` is the representation of highest weight `(k−2,0,0)` and
`θ(π) = 0`; through the dualization of the Conventions these become IP23's labels, as in §3.5);
§3.36 `theta_quaternionUnramified`; §3.38 `theta_gl2Gso4`; §5.6 `globalThetaLift` (with conjugated
input); §6.4 `siegelWeil_anisotropic`; §§6.10–6.12 doubling Schwartz map, standard doubling factors,
`localDoublingZeta` and `thetaPairing_factorization` for orthogonal, symplectic, unitary and
metaplectic data; §6.13 `rallis_innerProduct`; §6.14 `globalTheta_nonvanishing`; §6.15
`globalTheta_seeSaw`; §6.22 `toricTheta_pairingComparison`.

What MetaplecticAutomorphicForms must provide (gap:quaternionic-doubling-residue): extend §§6.4,
6.10a–6.12 to the doubled anisotropic rank-three skew-Hermitian space over a division quaternion
algebra, with the degenerate principal series `I_v(s)` of functions satisfying
`F(pg) = |Nrd(a)|^{s+5/2} F(g)` for `p` in the Siegel parabolic with Levi component `a ∈ GL₃(B_v)`,
that is the normalized induction of `|Nrd(a)|^s`, since `δ_P(a)^{1/2} = |Nrd(a)|^{5/2}`, the
normalized intertwining operator `(b_v(s)/a_v(s)) M_v(s)`, the local doubling integrals and the
residue of the global doubling integral at `s = 3/2` related to the theta pairing by the
second-term Siegel–Weil identity (IP23, §9.5, Lemmas 9.6–9.8, pp. 61–64).

What MetaplecticAutomorphicForms must provide (gap:quaternionic-shimizu-lift): for a number field
`F`, a quadratic extension `E/F` embedded in quaternion algebras `B₁, B₂` over `F`, `B = B₁·B₂` in
the Brauer group, `V = B₁ ⊗_E B₂` and `W = B`, the Periods-I splitting: for every place `v` a map
`s̃_v` to `ℂ¹` on the group of pairs `(g, h) ∈ GU(V_v)° × GU(W_v)` with `ν(g) = ν(h)`, trivialising
the Weil cocycle `z_Y` of the similitude dual pair of §3.23 for its polarization, equal to the
standard compact splitting at almost every place, with `∏_v s̃_v(γ) = 1` at rational points (the
splitting that §3.32a compares with §3.24; IP23, §9.3, p. 58, and §A.10, pp. 112–113); and the
theorem that the global similitude theta lift formed with it, from `B^×` to
`GU(B₁ ⊗_E B₂)° ≃ (B₁^× × B₂^×)/F^×`, of an irreducible unitary cuspidal `σ̄` is
`π̄_{B₁} ⊠ π̄_{B₂}` for the Jacquet–Langlands transfers of the transfer `π` of `σ`, and zero when
either transfer is missing (IP23, proof of Lemma 9.2, p. 58).

What MetaplecticAutomorphicForms must provide (gap:unitary-stable-range): for a local field `F_v` of
characteristic zero, archimedean or not and of any residue characteristic, a quadratic étale algebra
`E_v/F_v`, a one-dimensional Hermitian `E_v`-space `V_v` and the split two-dimensional
skew-Hermitian `E_v`-space `W_v`, the theta lift of every character of `U(V_v)` to `U(W_v)`, for the
Weil representation of §3.3 with any admissible pair of splitting characters, is nonzero (the stable
range for unitary dual pairs, which §3.9 states for orthogonal–symplectic pairs only; IP23, proof of
Lemma 9.1, p. 57).

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

§4.3 `polynomial_fischer_decomposition` and the positive-definite harmonic decomposition, of which
§4.1 is the arbitrary-signature symmetric-tensor form.

### From TauCetiRoadmap.ClassFieldTheory

Layer 5 (`invMap` on the local Brauer group, with `invMap_brRes`: restriction to a finite
extension multiplies the invariant by the degree); Layers 6–8 local reciprocity, the local Artin
map, units in inertia and local norm subgroups; Layer 10 (`brauerSupport`, `sumLocalInv`,
`sumLocalInv_brLocalization_eq_zero`, `brLocalization_injective`, `exists_br_of_sum_eq_zero`, and
the archimedean invariant `infiniteInvMap` with `infiniteInvMap_eq_zero_of_isComplex`); Layer 11
(`globalArtinMap`); §5.4 quadratic norm symbols
(`localArtinMap_quadratic_eq_nontrivial_iff_not_norm`).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§8.3, the field-embedding criterion: for a central simple algebra `A` over a field `K` and a finite
field extension `E/K`, a `K`-embedding `E ↪ A` exists exactly when `[E : K]·ind(A ⊗_K E)` divides
`deg A`; for a quaternion algebra and a quadratic `E` this says that `E` embeds exactly when it
splits the algebra. Used in §10.2.

### From TauCetiRoadmap.GlobalNumberFields

Layer 1 `GlobalNumberFields.weakApproximation_denseRange`; Layer 2 `finite_rayClassGroup`; Layer 4
the finite-idele description of the class group; Layer 6 `IdeleClassGroup`; Layer 9 `HeckeCharacter`,
`HeckeCharacter.IsFiniteOrder` and local components; Layer 10 `HeckeCharacter.infinityType` and
algebraic Hecke characters.

### From TauCetiRoadmap.ReductiveGroups and ReductiveGroupsPartII

ReductiveGroups Layer 3 (closed subgroups, quotients, identity components) and Layer 6 (central
isogenies). ReductiveGroupsPartII §RG2.5.1 (*dual-based-root-datum*: the dual based root datum with
its Galois action, the action on cocharacters being the transpose-inverse of the action on
characters) and §RG2.5.2 (the `L`-group and its functoriality, with *dual-of-weil-restriction*: for
`H = Res_{K′/K}G′`, `Ĥ = ∏_τ Ĝ′` over the `K`-embeddings `τ` of `K′`, with `Γ_K` permuting the factors
and acting inside them through the Galois action on `Ĝ′`).

### From TauCetiRoadmap.RepresentationTheory (SchurWeyl, SpinRepresentations)

SchurWeyl Layer 9: the trace maps and `harmonicTensors`. SpinRepresentations Layer 6: `Spin₆ ≃ SL₄`
over `ℂ`.

### From TauCetiRoadmap.EtaleCohomologyFoundations, ClassicalAdicEtaleCohomology and ComplexComparisonPartII

EtaleCohomologyFoundations §F.2.1 proper base change, §F.2.2 smooth base change, §F.3 finiteness
and generic acyclicity, and §0.8 the trace of a finite étale map, whose composite with pullback is
multiplication by its degree. ComplexComparisonPartII §C6.3 `artinComparison` (finite coefficients,
constructible complexes on a scheme of finite type over `ℂ`) and §C6.6 `adicArtinComparison` (the
integral and rational Artin comparison for normalized `ℓ`-adic systems, the form used for `𝕍_ℓ`).
ClassicalAdicEtaleCohomology §8.2, *Universal compactifications and proper algebraic comparison*:
for a proper morphism of schemes of finite type over a base and its analytification, and torsion
coefficients, the base-change map from algebraic to analytic higher direct images is an isomorphism
(Huber's comparison).

### From TauCetiRoadmap.AlgebraicTopology

§2.6 local systems and their functoriality; §5.3 the transfer of a finite covering, built on Tau
Ceti's `IsCoveringMap.singularTransfer`, whose composite with the projection is multiplication by the
number of points in a fibre when that number is constant, with the permutation local system of a
finite cover for twisted coefficients.

### From TauCetiRoadmap.PadicHodgeTheory, PadicPeriodRings and SelmerIwasawaCohomology

PadicHodgeTheory §3.1 (`B`-admissible representations for a regular period ring `B`, among them
`B_dR`: the functor is exact on them, and subobjects and quotients of an admissible object are
admissible), §3.3 (Fontaine's functors; `D_dR` exact on de Rham objects, preserving tensors,
duals and determinants; finite extensions of `K` commute with `D_dR` and its filtration, so they
detect the de Rham property; finite induction), §3.6 (a character `G_K → E^×`, `E` containing the
embeddings of `K`, that agrees on an open subgroup of `𝒪_K^×` with `∏_τ τ^{−h_τ}` under local
reciprocity is potentially crystalline), §4.4 (Sen's operator and differential de Rham
realizations) and §7.2 (de Rham lisse `ℚ_p`-sheaves on a smooth adic space over a complete
discretely valued `k/ℚ_p` with perfect residue field, and, for a de Rham lisse `L` on a proper smooth
`X` with associated filtered bundle `E`, the Galois-equivariant strictly filtered comparison
`H^i(X_{k̄}, L) ⊗ B_dR ≃ H^i_dR(X, E) ⊗_k B_dR`, so that `H^i(X_{k̄}, L)` is a de Rham representation
with `D_dR = H^i_dR(X, E)`).
PadicPeriodRings §1.4 (`H¹(G_K, ℂ_p)` is spanned by `log χ`).
SelmerIwasawaCohomology §2.7 the unramified condition and §4.9 the Bloch–Kato local condition `H¹_f`,
with `H¹_f(K, ℚ_p) = H¹_ur(K, ℚ_p)` for the trivial representation.

What PadicHodgeTheory must provide (gap:derham-local-system-cohomology): a lisse `ℚ_p`-sheaf `𝕃` on a
geometrically connected smooth variety over a finite extension `K` of `ℚ_p` whose stalk at one
classical point `x`, defined over a finite extension `K′` of `K`, is a de Rham representation of
`G_{K′}` is de Rham in the sense of §7.2 (the de Rham input of IP23, Remark 11.10, p. 90). That
subquotients of de Rham representations are de Rham is §3.1 for `B = B_dR`, consumed from there.

### From TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty

§4.6, *The Bloch–Kato subgroups `H¹_e ⊆ H¹_f ⊆ H¹_g`*: for a finite extension `K/ℚ_p` and a
finite-dimensional continuous `ℚ_p`-representation `V` of `G_K`, the subgroups
`H¹_f(K, V) = ker(H¹(K, V) → H¹(K, V ⊗ B_cris))` and `H¹_g(K, V) = ker(H¹(K, V) → H¹(K, V ⊗ B_dR))`,
functorial in `V`, with `H¹_f ⊆ H¹_g`, and, for de Rham `V`, the description of `H¹_g(K, V)` as the
classes whose extension `0 → V → E → ℚ_p → 0` is de Rham. Used in §9.3 with `V = ℚ_ℓ`.

## How to read the build

Layer 0 fixes the target: the realizations of compact Shimura cohomology with automorphic
coefficients, the reduction to a division algebra `B = B₁·B₂`, the quaternionic multiplicity
realizations `V₁, V₂` with their archimedean sign lines, and the correspondence operator that turns a
tensor in `V₁ ⊗ V₂(d)` into a map. Layer 1 builds the conjugate-linear exterior operator on `⋀²U`, the
quaternion algebra `(E, vol)` and the exceptional isogeny and isomorphism; Layer 2 restricts them to
the block subgroup of `U = B₁ ⊥ B₂` and assembles the group diagram. Layer 3 localizes the diagram
(signatures, torus maps, the weight lattice) and records the relative Lie algebra cohomology of the
archimedean theta modules. Layer 4 builds the harmonic Schwartz forms and proves their restriction
formulas; Layer 5 turns the group diagram into a diagram of Shimura data with its coefficient systems
and component character. Layer 6 proves the quaternionic theta identities and near-equivalence
rigidity, Layer 7 the simultaneous nonvanishing of the restricted theta class for all archimedean
signs. Layer 8 shows that the rational Hecke eigenspace containing the theta class is purely of type
`(d,d)`; Layer 9, under the degree-`2d` Kottwitz hypothesis, that its Galois action after twist `(d)`
is trivial. Layer 10 builds the realization-compatible restriction map, proves complex invertibility,
puts the component parameter in the Galois-invariant subspace and descends to a rational Hodge class.
The see-saw, nonvanishing and descent steps (§§7.4, 7.10, 10.4, 10.6) assume `d ≥ 1`; for `d = 0` the
end theorems are immediate (§§10.7–10.8). The unconditional Hodge theorem §10.7 does not depend on
Layer 9; only §10.8 does. Every target's `*Needs:*` line lists what its statement and its stated route
use, item by item; a different proof is not tied to an unrelated layer.

## Layer 0: quaternionic realizations and the correspondence target

The target is fixed at the level of multiplicity realizations, so that the tensor, trace and
coefficient conventions have one meaning throughout. The division hypothesis enters only after the
equal-algebra case is separated.

### 0.1 Jacquet–Langlands Hodge data

Define the *Jacquet–Langlands Hodge data* to consist of: a totally real field `F` of degree `n`;
quaternion algebras `B₁, B₂` over `F` split at exactly the same set `Σ` of real places, with
`d = |Σ| < n`; a cuspidal automorphic representation `π` of `GL₂(𝔸_F)` with trivial central
character and even weights `k_v ≥ 2` at every real place; its Jacquet–Langlands transfers `π_i` to
`B_i^×(𝔸_F)` (GL2AutomorphicRepresentationsAndTransfer §R17.3.1); the coefficient field `L = ℚ(π)`
(§R16.4.5), which contains `ℚ(k)`; the unitary-normalized coefficient representation
`τ_k = ⊗_v Nrd_v^{(2−k_v)/2} Sym^{k_v−2}(τ_v)` of `Res_{F/ℚ} B_i^×` with its `ℚ(k)`-structure,
unique up to homothety; and the reflex field `F_Σ`. When `d = 0` the pair `(Res_{F/ℚ}B_i^×, 1)` with
trivial cocharacter fails Deligne's condition excluding compact `ℚ`-factors of the adjoint group, so
it is not a Shimura datum; it is a definite pair in the sense of §0.2, whose Shimura varieties are
finite sets with the constant canonical model over `ℚ` defined there (IP23, §§2.1, 3.1–3.2,
pp. 14–19; Theorem 3.2, p. 20, whose hypothesis is `d < n`).

- The local system is attached to the dual `τ_k^∨`; since every `k_v` is even the exponents
  `(2−k_v)/2` are integers.
- The reflex field is the fixed field of the stabilizer of `Σ` in `Gal(ℚ̄/ℚ)`; for `Σ = ∅` it is `ℚ`.
- `L` acts on the realizations by Hodge endomorphisms of the underlying rational structure; the
  conjugate `π^γ`, `γ ∈ Aut(ℂ)`, has weights permuted by `γ` (§R17.3.7), and `L` is totally real
  because `π` is self-dual.

**Checks.**

- If every `k_v = 2`, then `τ_k` is the trivial representation and the coefficient systems are
  constant.
- For `Σ = ∅`, `d = 0` is accepted and the Shimura varieties are finite sets; `d = n` is rejected,
  since `Theorem 3.2` requires a real place ramified in both algebras.
- A weight `k_v = 3` is rejected: with trivial central character all weights are even (IP23,
  Remark 3.1, p. 18), and the exponent `(2−3)/2` is not an integer.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R16.4.5, R17.3.1, R17.3.7; Tau Ceti
`TauCeti.symPowerRep`; Tau Ceti `TauCeti.Hodge.HodgeStructureOn`.

### 0.2 Coefficient systems and realizations of compact Shimura cohomology

Let `(G, X)` be a Shimura datum of abelian type whose Shimura varieties are compact, with reflex
field `E = E(G,X) ⊂ ℂ`, and let `ρ : G → GL(V)` be a finite-dimensional representation over a number
field `L ⊂ ℂ` that factors through `G/Z_s`, where `Z_s` is the largest subtorus of the centre that
is split over `ℝ` but has no subtorus split over `ℚ`, and assume that the weight cocharacter of
`(G, X)`, composed with `G → G/Z_s`, is defined over `ℚ` (axiom SV4 of ShimuraData §4.3 for the
quotient datum; for `G = Res_{F/ℚ}B^×` the weight lands in the centre `Res_{F/ℚ}𝔾_m`, whose quotient
by `Z_s = ker N_{F/ℚ}` is `𝔾_m`, so this holds). Assume also that `Z(ℚ) ∩ K` acts trivially on `V`
for every sufficiently small compact open `K` (the fibre condition of AutomorphicBundles §0.2).
Factoring through `G/Z_s` does not give this (Checks); it holds when the torus `Z°/Z_s` has the same
split rank over `ℚ` and over `ℝ`, for then the rational points of `Z/Z_s` are discrete in its finite
adelic points (Mil17, Theorem 5.26 and Remark 5.27, p. 64), the image of `Z(ℚ) ∩ K` there is finite,
and a neat `K` makes it trivial. By AutomorphicBundles §0.1 the ranks agree when `Z°` splits over a
CM field, which holds for every group of this roadmap: their centres are `Res_{F/ℚ}` of `F`-tori
split by the CM field `E`, so they split over the Galois closure of `E`, again a CM field; for
`G = Res_{F/ℚ}B^×`, `Z/Z_s = 𝔾_m` through the norm. The weight cocharacter is central, so
`V = ⊕_w V_w` as representations over `L`, where `V_w` is the summand on which `(V, ρ∘h)` has Hodge
weight `w`. For `h ∈ X` let `K_h = Stab_{G(ℝ)}(h)`, the centralizer of `h`; it contains `Z(ℝ)`, and
`Sh_K(ℂ) = G(ℚ)∖(G(ℝ)/K_h × G(𝔸_f)/K)` (Mil17, footnote 40, p. 57). Construct, for every
sufficiently small neat compact open `K ⊂ G(𝔸_f)`:

- the local system `𝕍 = ⊕_w 𝕍_w` of `L`-vector spaces on `Sh_K(ℂ)` attached to `ρ`: on the component
  `Γ_g∖X⁺` of `Sh_K(ℂ)`, `Γ_g = G(ℚ)₊ ∩ gKg⁻¹` the stabilizer of `X⁺ × {gK}` in `G(ℚ)`, with `G(ℚ)₊`
  the stabilizer of `X⁺`, put `Γ̄_g = Γ_g/(Γ_g ∩ Z(ℚ))`. For neat `K` it acts freely and properly
  discontinuously on `X⁺`: it embeds in `G^ad(ℝ)` as an arithmetic, hence discrete, subgroup, and an
  element of `Γ_g` fixing a point of `X⁺` has image in `G^ad(ℝ)` in a compact subgroup, so of finite
  order, so trivial by neatness, and lies in `Z(ℚ)` (Mil17, Lemma 5.13 and the paragraph after it,
  pp. 57–58). The central group `Γ_g ∩ Z(ℚ) = Z(ℚ) ∩ gKg⁻¹ = Z(ℚ) ∩ K` acts trivially
  on `X⁺` and, by the fibre condition, on `V`, so the diagonal action on `X⁺ × V` factors through
  `Γ̄_g`, and `Γ̄_g∖(X⁺ × V)` is a local system on `Γ_g∖X⁺` with monodromy `V`: the local system
  `Γ∖(X⁺ × V)` of AutomorphicBundles §3.4 for the effective group `Γ̄_g`. This effective-quotient
  descent along the central kernel `Z(ℚ) ∩ K`, infinite for `Res_{F/ℚ}B^×` when `[F : ℚ] ≥ 2`, is part
  of this target; AutomorphicBundles §0.2 proves descent only along finite tame quotients. It is the
  descent of the constant sheaf `V` along `G(ℚ)`, which is the local system `𝕍_K` of
  gap:shimura-matsushima-comparison. Each `𝕍_w` underlies a polarizable variation of Hodge structure
  of weight `w` (AutomorphicBundles §3.4; ShimuraData §§3.1, 3.3, 4.3), and the `L`-Hodge structure
  `H^i(Sh_K(ℂ), 𝕍) = ⊕_w H^i(Sh_K(ℂ), 𝕍_w)`, whose summand `H^i(Sh_K(ℂ), 𝕍_w)` is pure of weight
  `i + w` (gap:vhs-hodge-decomposition); `H^i(Sh_K(ℂ), 𝕍)` is pure exactly when the nonzero summands
  share one weight, in particular when `ρ` has a single weight;
- for every prime `ℓ`, the étale sheaf `𝕍_ℓ` of `L ⊗ ℚ_ℓ`-modules on the canonical model of `Sh_K`
  over `E`, obtained from a `K`-stable lattice through the canonical tower of ShimuraVarieties §8.1
  (AutomorphicBundles §3.5);
- the Hecke-equivariant comparison `H^i(Sh_K(ℂ), 𝕍) ⊗_ℚ ℚ_ℓ ≃ H^i_et(Sh_K ⊗_E ℚ̄, 𝕍_ℓ)`, from the
  comparison of sheaves `𝕍 ⊗ ℚ_ℓ ≃ 𝕍_ℓ|Sh_K(ℂ)` (AutomorphicBundles §3.7) and Artin's rational
  comparison for their cohomology (ComplexComparisonPartII §C6.6), so that `H^i(Sh_K, 𝕍)` with its
  `ℓ`-adic realizations is an object of `M_E^L` (MotivesAndAlgebraicCycles §7.15) on which the Hecke
  algebra `H(G(𝔸_f), K)` acts by morphisms;
- for an irreducible cohomological `Π`, the complex isotypic part
  `H^i(Sh, 𝕍_ℂ)_Π = Hom_{H(G(𝔸_f),K)}(Π_f^K, H^i(Sh_K(ℂ), 𝕍_ℂ))`, `𝕍_ℂ = 𝕍 ⊗_L ℂ`, independent of
  `K` small, with the Matsushima description
  `H^i(Sh_K(ℂ), 𝕍_ℂ)_Π ≃ ⊕_{π_f^K ≃ Π_f^K} m(π) H^i(𝔤, K_h; π_∞ ⊗ V_ℂ)`, relative to `K_h` and so
  with the real central directions divided out (gap:shimura-matsushima-comparison); and, when `Π_f`
  has a `G(𝔸_f)`-stable model `Π_f(L)` over `L`, the `L`-rational isotypic part
  `H^i(Sh, 𝕍)_Π = Hom_{H_ℚ(G(𝔸_f),K)}(Π_f(L)^K, H^i(Sh_K, 𝕍))` of `L`-linear maps commuting with the
  rational Hecke algebra of the Conventions, formed in each realization and independent of `K`
  small: an object of `M_E^L` whose complexification along `L ⊂ ℂ` is the complex isotypic part.
  Without such a model only the complex part is defined (Checks).

(IP23, §2.2.2, pp. 16–17, including the comparison (2.1).) *Proof route:* the étale realizations are
unramified outside a finite set by spreading out a smooth proper model of the canonical model and
the lisse sheaf, with proper and smooth base change; they are de Rham at places above `ℓ` because
`𝕍_ℓ` is de Rham at a special point. There reciprocity (ShimuraVarieties §4.3) makes the
decomposition group act through the `ℚ_ℓ`-points of a torus, by a homomorphism that agrees, on an
open subgroup of the local units and under local reciprocity, with an algebraic homomorphism; after
a finite extension of coefficients that splits the torus and contains every embedding of the local
field `K′` of definition of the special point, the stalk is a sum of characters of `G_{K′}` which
agree on an open subgroup of `𝒪_{K′}^×` with characters `∏_τ τ^{−h_τ}` over those embeddings `τ`, and
so are potentially crystalline by the character criterion of PadicHodgeTheory §3.6, hence de Rham (its
§3.3: finite extensions detect the de Rham property), and the stalk, a direct summand of its
coefficient extension viewed over `ℚ_ℓ`, is de Rham (its §3.1). Each geometric connected component
of the canonical model is geometrically connected over a finite extension `E′` of `E` and contains a
special point, so the one-point rigidity of gap:derham-local-system-cohomology makes `𝕍_ℓ` a de Rham
lisse sheaf on each component at each place of `E′` above `ℓ`. The étale cohomology of a component
with coefficients in `𝕍_ℓ` is that of its analytification, by Huber's proper algebraic comparison
(ClassicalAdicEtaleCohomology §8.2) applied to the `ℓ`-power torsion quotients of a stable lattice
and passed to the limit; the filtered comparison of PadicHodgeTheory §7.2 then makes it de Rham, and
finite induction (PadicHodgeTheory §3.3) makes `H^i_et(Sh_K ⊗_E ℚ̄, 𝕍_ℓ)` de Rham.

*The definite case.* The same objects are constructed for a *definite pair* `(G, h)`: a connected
reductive `G` over `ℚ` with `G(ℝ)/Z(ℝ)` compact and `h` the trivial cocharacter, with `ρ` a
finite-dimensional representation over `L` satisfying the fibre condition. When `G^ad ≠ 1` such a
pair fails axiom SV3 of ShimuraVarieties §P.1, so it is not a Shimura datum, and ShimuraVarieties
§8.6 treats tori only; for Jacquet–Langlands Hodge data with `d = 0` it is `(Res_{F/ℚ}B_i^×, 1)`.
Here `K_h = G(ℝ)`, the domain `G(ℝ)/K_h` is a point, and `Sh_K = G(ℚ)∖G(𝔸_f)/K` is a finite set
(AdelicAlgebraicGroups §3.4, *class-number-finite*); its canonical model is defined to be the
constant finite étale `ℚ`-scheme on this set, with reflex field `ℚ`, the model that
ShimuraVarieties §8.6 gives a torus with trivial cocharacter. For neat `K` the stabilizer
`Γ_g = G(ℚ) ∩ gKg⁻¹` of `gK` is central: its image in `G^ad(ℚ)` is an arithmetic, hence discrete,
subgroup of the compact group `G^ad(ℝ)`, so finite, so trivial by neatness (in the language of
algebraic modular forms, AutomorphicFormsOnReductiveGroups §7.6, `centralArithmeticDescent`); so
`Γ_g = Z(ℚ) ∩ K`, which acts trivially on `V` by the fibre condition. Put
`H⁰(Sh_K, 𝕍) = {F : G(𝔸_f) → V : F(γgu) = ρ(γ)F(g), γ ∈ G(ℚ), u ∈ K}`, the rational coefficient
model `IsAlgebraicModularForm` of AutomorphicFormsOnReductiveGroups §7.4, which evaluation at
representatives `g` of `Sh_K` identifies with `⊕_g V`, and `H^i(Sh_K, 𝕍) = 0` for `i > 0`. Since `h`
is trivial, `(V, ρ∘h)` has the single weight `0` and type `(0,0)`, and so does the `L`-Hodge structure
`H⁰`. For every `ℓ`, `𝕍_ℓ` is the constant sheaf with stalk `V ⊗_ℚ ℚ_ℓ`, so
`H⁰_et(Sh_K ⊗ ℚ̄, 𝕍_ℓ) = H⁰(Sh_K, 𝕍) ⊗_ℚ ℚ_ℓ` with trivial action of `Gal(ℚ̄/ℚ)`, unramified at every
place and crystalline above `ℓ`, the comparison is the identity, and `H⁰` is an object of `M_ℚ^L`.
For `K₁ ⊂ K₂` the level map `Sh_{K₁} → Sh_{K₂}` is the projection of finite sets; pullback is the
inclusion of forms, and the fibre over `[g]` is `{[gu] : u ∈ K₂/K₁(K₂ ∩ Z(ℚ))}`, of
`[K₂ : K₁(K₂ ∩ Z(ℚ))]` points, so the covering trace of §0.3 is `(tr F)(g) = Σ F(gu)` over these `u`,
which is `1/[K₂ ∩ Z(ℚ) : K₁ ∩ Z(ℚ)]` times the sum over all of `K₂/K₁`. The Hecke operator of
`KxK = ⊔_i x_iK` is `F ↦ Σ_i F(·x_i)`; Poincaré duality, with `D = 0`, is the pairing
`(F, F′) ↦ Σ_{x ∈ Sh_K} ⟨F(x), F′(x)⟩` with `𝕍^∨`; the isotypic parts and their Matsushima description
are gap:shimura-matsushima-comparison with `K_h = G(ℝ)`, which its hypothesis that `K_h/Z(ℝ)` be
compact covers. The statements below hold in both cases.

- The construction is functorial in `ρ`, compatible with tensor products and duals
  (AutomorphicBundles §3.8), and with extension of coefficients `L ⊂ L′`.
- Hecke correspondences act by morphisms of `M_E^L`; the isotypic parts are compatible with
  level changes and independent of the level.
- The `ℓ`-adic realizations are unramified outside a finite set of places of `E` and de Rham at the
  places above `ℓ`.
- Poincaré duality pairs `H^i(Sh_K, 𝕍)` with `H^{2D−i}(Sh_K, 𝕍^∨)(D)`, `D = dim Sh_K`, compatibly in
  all realizations.

**Checks.**

- For the trivial representation the realizations are the singular and étale cohomology of the
  canonical model, the object `Hⁱ(X)` of MotivesAndAlgebraicCycles §§2.6–2.7.
- For `G = Res_{F/ℚ}B^×` with `B` totally definite and the trivial cocharacter of §0.1, a definite
  pair, `Sh_K` is a finite set and `H^i = 0` for `i > 0`; with trivial coefficients `H^0` is the
  space of `L`-valued functions on it, of Hodge type `(0,0)`.
- The definite case lies outside the Shimura data and needs neatness. For `F = ℚ` and `B` ramified
  at `{∞, 2}`, `G^ad(ℝ) = SO(3)` is compact and `h` is trivial on it, so SV3 fails. The maximal order
  `O` has class number one, so `Sh_{Ô^×}` is one point, and its stabilizer `B^×(ℚ) ∩ Ô^× = O^×` has
  order `24` and image of order `12` in `G^ad(ℚ)`; on the three-dimensional `V = Nrd^{−1} ⊗ Sym²` of
  weight `k = 4`, the conjugation action on trace-zero quaternions, that image is the rotation group
  of a regular tetrahedron and fixes no nonzero vector, so the forms space at level `Ô^×` is
  `V^{O^×} = 0`. At a neat `K` every stabilizer is `ℚ^× ∩ K = 1` and `H⁰` has dimension
  `3·#Sh_K`. Taking the constant sheaf `V` on `Sh_{Ô^×}` would give dimension `3`.
- For the torus `T = Res_{ℚ(i)/ℚ}𝔾_m` with `h(z) = z` and `ρ = 1 ⊕ N_{ℚ(i)/ℚ}`, `Z_s = 1` and the
  weight `r ↦ r⁻¹` lies in the rational subtorus `𝔾_m`; on the finite set `Sh_K`, `H^0` is the sum of
  a summand of type `(0,0)` and a summand of type `(−1,−1)`, weights `0` and `−2`. It is not pure;
  each weight summand is.
- The real central directions are divided out. For `T = Res_{ℚ(√2)/ℚ}𝔾_m` with trivial `h`, trivial
  coefficients and the level `K(3)` of §0.3, `K_h = T(ℝ)`, the domain is a point and `Sh_{K(3)}` is one
  point, so `(dim H⁰, dim H¹) = (1, 0)`. The arithmetic quotient of ArithmeticLocallySymmetricSpaces
  §ALS.0.6 divides `T(ℝ)` only by `{±1}² · ℝ_{>0}` (diagonal `ℝ_{>0}`), leaving the line
  `log|a| − log|b|`, on which the unit `−ε⁴ ≡ 1 mod 3`, `ε = 1 + √2`, translates by `8 log ε ≠ 0`; it is
  a circle with `(dim H⁰, dim H¹) = (1, 1)`. A comparison relative to `K_∞A_∞` instead of `K_h` would
  give the circle's cohomology.
- The descent is along an infinite central kernel, not a finite tame quotient. For
  `T = Res_{ℚ(√2)/ℚ}𝔾_m` with trivial `h` at the level `K(3)`, `Γ = T(ℚ) ∩ K(3)` contains the unit
  `−ε⁴` of infinite order and `Γ̄ = 1`. For `ρ = N_{ℚ(√2)/ℚ}`, which factors through
  `T/Z_s = 𝔾_m`, `N(−ε⁴) = N(ε)⁴ = (−1)⁴ = 1`, so the fibre condition holds and the descended local
  system on the point `Sh_{K(3)}` is the line `V`, with `dim H⁰ = 1`.
- The isotypic part is a multiplicity space, not the whole `Π`-isotypic summand: for
  `dim Π_f^K = r` the summand of `H^i` is `r` copies of it.
- The `L`-rational part needs a model of `Π_f` over `L`. Take the definite pair of the quaternion
  algebra over `ℚ` ramified at `{23, ∞}`, trivial coefficients, `L = ℚ`, and `Π` the transfer of one
  of the two newforms of weight two and level `Γ₀(23)`, which are conjugate under `√5 ↦ −√5`. At a
  neat level `K` with `Π_f^K ≠ 0`, some `T_p` with `p` prime to the level acts on `Π_f^K` by an
  irrational `a ∈ ℚ(√5)`; an `H_ℚ(G(𝔸_f),K)`-stable `ℚ`-structure of dimension `r` would give `T_p`
  the rational characteristic polynomial `(x − a)^r`, whose coefficient `−ra` is irrational. So the
  complex part is a line and the `ℚ`-rational part is not defined; over `L = ℚ(√5)` the model
  exists (gap:quaternionic-rational-model) and the `L`-rational part is a line.
- Replacing `ρ` by its dual exchanges degrees `i` and `2D − i` under Poincaré duality, with the twist
  `(D)`.
- The de Rham argument is made component by component: `Sh_K` has `π₀(Sh_K ⊗_E ℚ̄)` in bijection with
  `G(ℚ)₊∖G(𝔸_f)/K`, `G(ℚ)₊` the stabilizer of `X⁺` as above, the index set of the components
  `Γ_g∖X⁺` (Mil17, Lemma 5.13, p. 57), and is not geometrically connected in general, so the
  one-point rigidity cannot be applied to it as a whole; every component `X⁺ × gK` contains a special
  point, because a special `h ∈ X⁺` gives the special point `[h, g]`. The stabilizer of `X⁺` is not
  `G(ℚ) ∩ G(ℝ)°`: for `T = Res_{ℚ(√2)/ℚ}𝔾_m` with trivial `h` at the level `K(3)` of §0.3, `T(ℚ)₊ = T(ℚ)`
  and `𝔽₉^×/⟨ε⟩` is one point, while the totally positive units `ε^{2ℤ}` give `𝔽₉^×/⟨ε²⟩`, two points,
  since `ε = 1 + √2` has order `8` in `𝔽₉^×`.
- Factoring through `G/Z_s` does not give the fibre condition. For `F = ℚ(∛2)` and
  `T = Res¹_{F/ℚ}𝔾_m` with trivial `h`, the character module of `T` is the irreducible
  two-dimensional rational representation of `S₃`, so `T` has no proper nontrivial `ℚ`-subtorus, and
  `T(ℝ) ≃ ℂ^×` is not split; hence `Z_s = 1` and every representation factors through `T/Z_s`. The
  unit `u = ∛2 − 1` (minimal polynomial `x³ + 3x² + 3x − 1`, norm `1`) has infinite order, so some
  `u^m`, `m ≥ 1`, lies in `T(ℚ) ∩ K` for every compact open `K`, and the character `ρ = σ₁|_T` of the
  real embedding takes the value `(∛2 − 1)^m ≠ 1` on it. No level satisfies the fibre condition and
  `𝕍` does not descend; `T` has no rational character while `T(ℝ)` is not compact, so its rational
  points are not discrete (Mil17, Theorem 5.26), as the rank condition above predicts.
- The adelic quotient by `G(ℚ)Z(ℝ)°` is not Hausdorff when `Z(ℚ)` is not discrete in `Z(𝔸_f)`. For
  `T = Res_{ℚ(√2)/ℚ}𝔾_m` and `ε = 1 + √2`, the idele `(1, 1; ε^{2m})`, trivial at both real places,
  equals `ε^{2m}·(ε^{−2m}, ε′^{−2m})_∞` and so lies in `T(ℚ)T(ℝ)°` for every `m`. The closure of
  `ε^{2ℤ}` in `Ô^×` is an infinite compact group, hence uncountable, and contains some `u ∉ ε^{2ℤ}`;
  `(1, 1; u)` is a limit of points of `T(ℚ)T(ℝ)°` and is not in it, since a rational `q` equal to `u`
  at every finite place and totally positive is a totally positive unit, so `q ∈ ε^{2ℤ}`. The spectral
  input of gap:shimura-matsushima-comparison divides only by `A_∞`, the diagonal `ℝ_{>0}`: at level
  `K(3)` it is `Γ∖T(ℝ)¹` with `T(ℝ)¹ = {(a, b) : |ab| = 1}` and `Γ = ⟨−ε⁴⟩` acting by the sign
  `(−1, −1)` and the translation `8 log ε` of `log|a| − log|b|`, two circles exchanged by `T(ℝ)`; the
  `T(ℝ)`-invariant functions are the constants, of dimension `1 = dim H⁰(Sh_{K(3)})`.
- A central character that is unitary but nontrivial on the compact part of `Z(ℝ)°` contributes. For
  `T = Res_{ℚ(i)/ℚ}𝔾_m` with `h(z) = z`, `L = ℚ(i)`, `ρ = σ₁` the identity embedding and `K` neat,
  `T(ℚ) ∩ K = 1` and `dim H⁰(Sh_K, 𝕍) = #Sh_K ≥ 1`. In the relative complex the functions transform
  under `T(ℝ) = ℂ^×` by `z⁻¹`; `A_∞ = ℝ_{>0}` acts on `V` by `r ↦ r`, and multiplying by `|N|^{1/2}`
  leaves the character `z ↦ |z|/z`, nontrivial on the unit circle. Such functions live on the circles
  `T(ℚ)A_∞∖T(𝔸)/K`; on the finite set `T(ℚ)∖T(𝔸)/T(ℝ)°K` only `Z(ℝ)°`-invariant functions exist, and
  a decomposition there would give `0`.

*Needs:* AutomorphicBundles §§0.1–0.2, 3.4–3.5, 3.7–3.8; ArithmeticLocallySymmetricSpaces
gap:shimura-matsushima-comparison; AutomorphicSpectralTheory §4.7; AdelicAlgebraicGroups §§3.4, 4.3;
AutomorphicFormsOnReductiveGroups §§7.4, 7.6 (the definite case);
ShimuraData §§3.1, 3.3, 4.3, 4.9; ComplexKahlerGeometry §K6.1 and
gap:vhs-hodge-decomposition; ShimuraVarieties §§4.3, 6.7, 8.1; ComplexComparisonPartII §C6.6;
EtaleCohomologyFoundations §§F.2.1–F.2.2, F.3; ClassicalAdicEtaleCohomology §8.2; PadicHodgeTheory
§§3.1, 3.3, 3.6, 7.2 and gap:derham-local-system-cohomology; MotivesAndAlgebraicCycles §7.15.

### 0.3 Pullback and normalized trace along morphisms of Shimura data

Let `f : (G, X₁) → (H, X₂)` be a morphism of Shimura data with the same reflex field `E`, and `ρ` a
representation of `H` as in §0.2, viewed on `G` through `f`. Construct the pullback
`f^* : H^i(Sh_H, 𝕍) → H^i(Sh_G, 𝕍)` in Betti and `ℓ`-adic realizations as a morphism of `M_E^L`, by
pulling the local system and the étale sheaf back along the map of Shimura varieties and of their
canonical models (ShimuraVarieties §§1.6, 8.5; AlgebraicTopology §2.6). If `G → H` is surjective with
central kernel `Z` and `G(𝔸) → H(𝔸)` is surjective, prove that `f^*` identifies the complex
`Π_H`-isotypic part with the complex `Π_G`-isotypic part for the corresponding automorphic
representations on which `Z` acts trivially, and, when `Π_{H,f}` has a model over `L` and `Π_{G,f}`
carries the model obtained through `f`, the `L`-rational parts of §0.2, as an isomorphism in `M_E^L`
(IP23, §2.2.3, pp. 16–17).

For a Shimura datum `(G, X)` with centre `Z`, let `Z(ℚ)⁻` be the closure of `Z(ℚ)` in `Z(𝔸_f)`. It
acts trivially on the tower: `Z(ℚ)⁻K = Z(ℚ)K` for every compact open `K`, and
`Sh_K(ℂ) = (G(ℚ)/Z(ℚ))∖X × G(𝔸_f)/Z(ℚ)⁻K` (Mil17, the passage to the limit and Theorem 5.28, p. 65).
Call `Ḡ = G(𝔸_f)/Z(ℚ)⁻` the *effective group* of the datum, write `K̄` for the image of `K` in it, and
fix a rational Haar measure on `Ḡ` (Conventions). Rational Haar measures exist and any two differ by
a factor in `ℚ_{>0}`: for compact opens `K̄, K̄′` of `Ḡ` every Haar measure gives
`vol(K̄)/vol(K̄′) = [K̄ : K̄ ∩ K̄′]/[K̄′ : K̄ ∩ K̄′]`, so giving one compact open rational volume (for
instance volume one) makes every volume rational. Prove the degree formula: for a neat compact open
`K₂ ⊂ G(𝔸_f)` and an open subgroup `K₁ ⊂ K₂`, the map `Sh_{K₁} → Sh_{K₂}` is finite étale of constant degree
`[K₂ : K₁(K₂ ∩ Z(ℚ))] = [K̄₂ : K̄₁] = vol(K̄₂)/vol(K̄₁)`. *Proof route:* every point over `[x, g]` is
`[x, gk]` with `k ∈ K₂`; an element `q ∈ G(ℚ) ∩ gK₂g⁻¹` fixing `x` has image in `G^ad(ℝ)` both in a
compact group and in a discrete arithmetic group, so of finite order, so trivial by neatness; hence
`q ∈ Z(ℚ) ∩ K₂`, and `[x, gk] = [x, gk′]` exactly when `k ∈ k′(K₂ ∩ Z(ℚ))K₁` (Mil17, Lemma 5.13,
p. 57; ShimuraVarieties §§1.3, 8.3). When `Z(ℚ)` is discrete in `Z(𝔸_f)` (axiom SV5; Mil17,
Theorem 5.26 and Remark 5.27, p. 64) a neat level meets `Z(ℚ)` trivially and the degree is
`[K₂ : K₁]`. For `Res_{F/ℚ}B^×` with `[F : ℚ] ≥ 2`, `Z(ℚ) = F^×` is not discrete: every compact open level meets it in
a subgroup of finite index in `O_F^×`, of rank `[F : ℚ] − 1`, and the degree can be smaller than
`[K₂ : K₁]`.

If `G → H` is surjective as a morphism of algebraic groups with central kernel, whether or not
`G(𝔸) → H(𝔸)` is surjective, construct the pushforward `f_*`: for small `K₁, K₂` the map
`Sh_{G,K₁} → Sh_{H,K₂}` is finite étale onto a union of components, and `f_*` is the covering trace
onto the image, that is the transfer of this finite covering (AlgebraicTopology §5.3 in the Betti
realization, with twisted coefficients through the permutation local system of the cover;
EtaleCohomologyFoundations §0.8 in the `ℓ`-adic realization), extended by zero and multiplied by
`vol(K̄₁)/vol(K̄₂) ∈ ℚ_{>0}` for the fixed rational
Haar measures on the effective groups `Ḡ` and `H̄` (IP23, §2.2.3, pp. 16–17, and Remark 2.2, p. 17,
whose Haar measures on `G(𝔸_f)` and `H(𝔸_f)` agree with these at neat levels, up to a constant, when
both centres satisfy SV5). The measures are rational, as Wal85, §I.2, p. 124, takes them for the
Hecke algebra: an arbitrary pair of Haar measures multiplies `f_*` by an arbitrary positive real
number and can move it off the rational structure (Checks). For a morphism of data that is not
surjective with central kernel only the pullback is constructed.

- `f^*` and `f_*` commute with Hecke operators away from the levels and with every comparison
  isomorphism.
- `f_*` is a morphism of `M_E^L`: the covering trace preserves the `L`-structure of the Betti
  realization and commutes with the `ℓ`-adic comparisons, and the volume ratio is a positive
  rational number. Replacing either rational Haar measure by another multiplies `f_*` by a factor in
  `ℚ_{>0}`.
- The normalized `f_*` does not depend on the levels: for `K₁′ ⊂ K₁` and `K₂′ ⊂ K₂` with
  `f(K₁′) ⊂ K₂′`, the normalized `f_*` at `(K₁, K₂)` equals the normalized `f_*` at `(K₁′, K₂′)`,
  preceded by pullback from level `K₁` to `K₁′` and followed by the normalized trace of the identity of
  `H` from level `K₂′` to `K₂`; this follows from the degree formula on the source and transitivity of
  covering traces on the target.
- Pullback and normalized trace are functorial for composable morphisms of data.

**Checks.**

- For a level change `K₁ ⊂ K₂` inside one group with `K₂` neat, `f_*∘f^*` is multiplication by
  `[K₂ : K₁(K₂ ∩ Z(ℚ))]·vol(K̄₁)/vol(K̄₂) = 1`.
- For the torus `T = Res_{ℚ(√2)/ℚ}𝔾_m` with trivial `h` and trivial coefficients, and the principal
  levels `K(9) ⊂ K(3)` of `Ô^×`, `O = ℤ[√2]` (class number one, so `Sh_{K(N)} = (O/N)^×/im(O^×)`): the
  unit `ε = 1 + √2` has order `8` in `(O/3)^× = 𝔽₉^×` and order `24` in `(O/9)^×`, of order `72`, with
  `ε¹² ≡ −1 mod 9`, so the two levels have `1` and `3` points. Both levels are neat, the compact-open
  index is `72/8 = 9`, and the degree is `3 = [K(3) : K(9)(K(3) ∩ ℚ(√2)^×)]`, the unit `−ε⁴` having
  image of order `3` in `K(3)/K(9)`. Haar volumes on `T(𝔸_f)` would give `f_*f^* = 3/9 = 1/3`; the
  effective volumes give `3·(1/3) = 1`. This `T` is the centre of `Res_{F/ℚ}B^×` for `F = ℚ(√2)`.
- The trace is that of the finite étale map of Shimura varieties, not a trace on the arithmetic
  quotients of ArithmeticLocallySymmetricSpaces §ALS.0.6. In the torus instance above those quotients
  are one circle at level `K(3)` and three circles at level `K(9)`: the units `−ε⁴` and `−ε¹²` fixing
  the points of `(O/3)^×` and `(O/9)^×` translate the line `log|a| − log|b|` by `8 log ε` and
  `24 log ε`, so each circle covers with degree `3`. Their trace composed with pullback is
  `9 = [K(3) : K(9)]` (§ALS.3.6), and with the effective volume ratio it would give `9·(1/3) = 3`;
  the transfer of three points onto one point gives `3`, normalized to `3·(1/3) = 1`.
- A component of `Sh_{H,K₂}` outside the image receives zero under `f_*`; the trace is not an
  isomorphism induced by a covering.
- Shrinking `K₁` to a normal subgroup `K₁′` with `[K̄₁ : K̄₁′] = m` multiplies the covering trace of a
  class pulled back from level `K₁` by `m` and the volume factor by `1/m`, so the normalized `f_*` is
  unchanged; with Haar volumes on `G(𝔸_f)` the volume factor would be `1/[K₁ : K₁′]`, which differs
  from `1/m` as soon as `K₁ ∩ Z(ℚ) ⊄ K₁′`.
- Rationality of the measures is needed. Take the projection `𝔾_m × 𝔾_m → 𝔾_m` onto the first
  factor, both data with trivial cocharacter and reflex field `ℚ` (central kernel, surjective on
  adeles), and the levels `K(3) × K(3) → K(3)`, `K(3) = ker(Ẑ^× → (ℤ/3)^×)`. Since
  `𝔸_f^× = ℚ_{>0}·Ẑ^×` and `(ℤ/3)^× = {±1}`, each Shimura set `ℚ^×∖𝔸_f^×/K(3) = Ẑ^×/{±1}K(3)` is
  one point; `ℚ^×` is discrete in `𝔸_f^×`, so `K̄ ≅ K`, and the covering trace on `H⁰ = ℚ` is the
  identity. Rational Haar measures giving both levels volume one give `f_*(1) = 1`. A Haar measure on
  `Ḡ` giving `K̄(3) × K̄(3)` volume `√2`, with volume one for `K̄(3)` on `H̄`, would give
  `f_*(1) = √2 ∉ ℚ`; normalizing compact averages to volume one does not fix this relative factor.
- The diagonal map from the datum of a compact Shimura curve to the product datum of its square has
  trivial, hence central, kernel but is not surjective: its map of Shimura varieties goes from
  dimension one to dimension two and is not étale onto a union of components. Pullback along it is
  defined; the normalized trace is not.

*Needs:* §0.2; ShimuraVarieties §§1.3, 1.6, 8.3, 8.5 (the finite étale level maps and the maps of
data, whose covering transfer composed with pullback is the effective degree of the degree formula);
AdelicAlgebraicGroups §4.3; AlgebraicTopology §§2.6, 5.3; EtaleCohomologyFoundations §0.8;
ArithmeticLocallySymmetricSpaces gap:shimura-matsushima-comparison (its compatibility with level
maps and covering transfers, for the isotypic statement); MotivesAndAlgebraicCycles §7.15.

### 0.4 The division-algebra reduction

For Jacquet–Langlands Hodge data, if `B₁ ≃ B₂` the identity of the multiplicity realization,
read through Poincaré duality, is the required class. Otherwise prove that `[B₁] + [B₂] ∈ Br(F)` is
the class of a quaternion division algebra `B`, ramified exactly at the finite places where exactly
one `B_i` ramifies and split at every real place, because `B₁` and `B₂` have the same real
ramification (IP23, §4.1, pp. 20–21; §10.1, p. 65; §12.2.1, p. 94). The theta construction of
Layers 6–10 is used only in this second case. *Proof route:* the local invariant of a quaternion
algebra is `1/2` at the places where it ramifies and `0` elsewhere, so those of `[B₁] + [B₂]` are
`1/2` exactly on the set `S` of finite places where exactly one `B_i` ramifies and `0` at the real
places, where both or neither ramify; `S` is finite of even cardinality, so
GL2AutomorphicRepresentationsAndTransfer §R17.1.5 (`existsQuaternionRamification_iff`) gives a
quaternion algebra `B` ramified exactly at `S`, and `[B] = [B₁] + [B₂]` because `Br(F)` injects into
the sum of the local Brauer groups (ClassFieldTheory Layer 10, `brLocalization_injective`). If `S`
were empty, `B₁` and `B₂` would split at the same places and be isomorphic by §R17.1.5
(`nonempty_quaternionAlgEquiv_of_localSplitting`); so `S` is nonempty and `B` is a division
algebra.

**Checks.**

- For `B₁ = B₂` the diagonal correspondence is used; division is not imposed on the zero class.
- For `F` real quadratic, `Σ = {∞₁}`, `B₁` ramified at `{∞₂, 𝔭}` and `B₂` at `{∞₂, 𝔮}` with
  `𝔭 ≠ 𝔮`, the algebra `B` is ramified exactly at `{𝔭, 𝔮}`.
- If `B₁` and `B₂` had different real ramification, `B` would ramify at a real place; equal `Σ`
  excludes this.

*Needs:* §0.1; ClassFieldTheory Layer 10; GL2AutomorphicRepresentationsAndTransfer §R17.1.5;
MotivesAndAlgebraicCycles §2.3; Tau Ceti `TauCeti.brauerCohomologyEquiv`.

### 0.5 Quaternionic multiplicity realizations

For Jacquet–Langlands Hodge data let `V_i` be the `L`-rational `π_i`-multiplicity space
`Hom_{H_ℚ(G_{B_i}(𝔸_f),K)}((π_{i,f})^K(L), H^*(Sh_{B_i,K}, 𝕍_k(L)))` of §0.2 (its definite case when
`d = 0`), for `K` small, with its `ℓ`-adic realizations. Prove that it is independent of `K`,
concentrated in cohomological degree `d` (IP23 prints `2d` on p. 19; the Shimura variety has
dimension `d` and each split place contributes degree one), of `L`-dimension `2^d`, pure of weight `d` (the centre acts trivially on `τ_k`, so
`τ_k^∨` has the single weight `0` in §0.2), an object of `M_{F_Σ}^L`, and self-dual:
the coefficient pairing and Poincaré duality give `V_i ≃ V_i^∨(−d)` (IP23, §3.2, pp. 18–19; §12.3,
p. 98). Here `(π_{i,f})^K(L)` is the space of `K`-invariants of a `B_i^×(𝔸_f)`-stable model of `π_{i,f}`
over `L` itself, unique up to homothety: `π_{i,f}` has trivial central character (§0.1) and
`ℚ(π_{i,f}) = ℚ(π_f) = L` (GL2AutomorphicRepresentationsAndTransfer §R17.3.7), so
gap:quaternionic-rational-model applies; equality of rationality fields alone does not give the model
(§R17.3.8), and `L` is not enlarged. The rank `2^d` is the multiplicity one of `π_i` in the discrete
spectrum (§R17.3.6) times the dimension of the relative Lie algebra cohomology of `π_{i,∞}`.

- `V_i ⊗_L ℂ` is the space of Hecke maps from `(π_{i,f})^K` to the complex cohomology, so the rank over
  `L` is computed over `ℂ`.

**Checks.**

- For `d = 1`, `V_i` is a rank-two `L`-space in `H¹`.
- For `d = 0`, `V_i` is a rank-one space in `H⁰` of type `(0,0)`.
- The rank is `2^d`, not `2^n`: compact factors contribute degree zero and a one-dimensional
  relative Lie algebra cohomology.
- A field of rationality need not be a field of definition: the two-dimensional irreducible
  representation of the quaternion group `Q₈` has rational character values `2, −2, 0`, and
  `i ↦ diag(i, −i)`, `j ↦ [[0, 1], [−1, 0]]` is a model over `ℚ(i)`, but its Frobenius–Schur
  indicator is `(2·2 + 6·(−2))/8 = −1`, so it has no model over `ℝ`, let alone `ℚ`. Its centre acts by
  `−1`; the trivial central character of §0.1 is what excludes this obstruction at the places where
  `B_i` ramifies, so that `V_i` is defined over `L` without enlarging it.
- A one-dimensional split component has a model but no newvector. Let `χ₃` be the quadratic
  character of `ℚ₃^×` that is the Legendre symbol on `ℤ₃^×`, and `π₃ = χ₃∘det` on `GL₂(ℚ₃)`. Its
  central character is `t ↦ χ₃(t²) = 1`, but `diag(−1, 1)` lies in every `K₁(3^r)`, `r ≥ 0`, and acts
  by `χ₃(−1) = −1`, so `π₃^{K₁(3^r)} = 0`; its model is the line `ℚ`, on which `g` acts by
  `χ₃(det g) = ±1`. The finite part of the quadratic idele class character of conductor `3`,
  composed with `det`, is a global instance for `D = M₂(ℚ)`. This is why
  gap:quaternionic-rational-model gives one-dimensional split components their character line; the
  components `π_{i,v}` at places where `B_i` splits are those of the cuspidal `π`, infinite-dimensional,
  and use the newvector line.

*Needs:* §§0.1–0.3; GL2AutomorphicRepresentationsAndTransfer §§R16.4.5, R17.3.1, R17.3.5, R17.3.6,
R17.3.7, R17.3.8 and gap:quaternionic-rational-model; AutomorphicFormsOnReductiveGroups §§2.6, 5.4;
Tau Ceti `TauCeti.Hodge.HodgeStructureOn.tateTwist`.

### 0.6 Archimedean sign lines

Prove that `V_i ⊗_ℚ ℂ` decomposes, along each embedding of `L`, into `2^d` lines indexed by signs
`ε ∈ {±1}^Σ`. At `v ∈ Σ` the two cochain contributions have relative Lie algebra bidegrees `(1,0)` and
`(0,1)` and actual Hodge types `(k_v/2, 1−k_v/2)` and `(1−k_v/2, k_v/2)`; outside `Σ` the degree-zero
line has type `(0,0)`. The line of `ε` has type the sum over `v ∈ Σ`. Poincaré duality pairs the line
of `ε` with that of `−ε`. Equal total types can occur with multiplicity, so the full sign indexing is
kept (IP23, §3.3, p. 19; Proposition 12.3, p. 98).

**Checks.**

- For `d = 2` and both split weights equal to `2`, the four lines have types `(2,0), (1,1), (1,1),
  (0,2)`: the type-`(1,1)` space is two-dimensional, and a nonzero pairing on one line does not
  give an isomorphism.
- For split weights `2` and `4` the types are `(3,−1), (2,0), (0,2), (−1,3)`: no line has type
  `(1,1)`.
- For `d = 1` and weight `k_v` the two types `(k_v/2, 1−k_v/2)` and its reverse have total weight one;
  in the classical normalization they are `(k_v−1, 0)` and `(0, k_v−1)`.

*Needs:* §0.5; AutomorphicFormsOnReductiveGroups §§2.6, 5.4.

### 0.7 The cohomological correspondence operator

Prove that Poincaré duality and `V₁ ≃ V₁^∨(−d)` give an `L`-linear identification
`V₁ ⊗_L V₂(d) ≃ Hom_L(V₁, V₂)` in `M_{F_Σ}^L`, and that on geometric cohomology it sends `ξ` to
`x ↦ p₂,*(ξ ∪ p₁^* x)`, where the cup product is followed by the coefficient pairing
`𝕍₁ ⊗ 𝕍₁^∨ → L` and `p₂,*` is the transpose of `p₂^*` under the Poincaré duality with coefficients of
§0.2 on `Sh₁ × Sh₂` and on `Sh₂`; for constant coefficients this is the correspondence action of
MotivesAndAlgebraicCycles §2.3. Under this identification a rational tensor of type `(0,0)` is a
morphism of `L`-Hodge structures, and an element of `HT(V₁ ⊗_L V₂(d))` gives `G_{F_Σ}`-equivariant maps `V₁ ⊗ ℚ_ℓ → V₂ ⊗ ℚ_ℓ` for every `ℓ` at once
(IP23, §1.1, pp. 4–5; §3.3, pp. 19–20; §12.3, p. 98). No statement that Hodge classes are algebraic
is used.

**Checks.**

- For `B₁ = B₂` and `ξ` the class of the diagonal, the operator is the identity of `V₁`.
- `V₁ ⊗ V₂(d)` has weight `d + d − 2d = 0`, the weight of `Hom(V₁, V₂)`.
- A class in `HT` for one prime `ℓ` only does not give equivariance at the other primes.

*Needs:* §§0.2, 0.5; MotivesAndAlgebraicCycles §§2.2–2.3, 7.1, 7.15; Tau Ceti
`TauCeti.Hodge.HodgeStructureOn.internalHom` and `TauCeti.Hodge.HodgeStructureOn.tateTwist`.

### Examples

For `F` real quadratic, `Σ = {∞₁}`, `B₁` ramified at `{∞₂, 𝔭}`, `B₂` at `{∞₂, 𝔮}` and `π` of parallel
weight two with `ℚ(π) = ℚ`, the realizations `V₁, V₂` are rank-two `ℚ`-Hodge structures of weight one
in `H¹` of two Shimura curves over `F`, `B` is ramified at `{𝔭, 𝔮}`, and the target is a class in
`H²(X₁ × X₂, ℚ)(1)` of type `(0,0)` acting as an isomorphism `V₁ ≃ V₂`.

### Dependencies

GL2AutomorphicRepresentationsAndTransfer §§R16.4.5, R17.1.5, R17.3.1, R17.3.5–R17.3.8 and
gap:quaternionic-rational-model; MotivesAndAlgebraicCycles §§2.2–2.3, 2.6–2.7, 7.1, 7.15;
AutomorphicBundles §§0.1–0.2, 3.4–3.5, 3.7–3.8;
ArithmeticLocallySymmetricSpaces gap:shimura-matsushima-comparison; AutomorphicSpectralTheory §4.7;
ShimuraData §§3.1, 3.3, 4.3, 4.9; ShimuraVarieties §§1.3, 1.6, 4.3, 6.7, 8.1, 8.3, 8.5; AdelicAlgebraicGroups
§§3.4, 4.3; AlgebraicTopology §§2.6, 5.3; ComplexKahlerGeometry §K6.1 and gap:vhs-hodge-decomposition;
ComplexComparisonPartII §C6.6; EtaleCohomologyFoundations §§0.8, F.2.1–F.2.2, F.3;
ClassicalAdicEtaleCohomology §8.2; PadicHodgeTheory §§3.1, 3.3, 3.6, 7.2 and
gap:derham-local-system-cohomology; ClassFieldTheory Layer 10; AutomorphicFormsOnReductiveGroups
§§2.6, 5.4, 7.4, 7.6; Tau Ceti `TauCeti.Hodge`, `TauCeti.symPowerRep`, `TauCeti.brauerCohomologyEquiv`.

## Layer 1: the Hermitian exterior construction

The volume and its inverse-norm rescaling law determine the quaternion symbol. The wedge pairing
gives an intrinsic conjugate-linear operator on `⋀²U`; basis computations test it without replacing
Mathlib's exterior-power carrier. Its square and skew identities are exactly the relations needed for
the right quaternionic action.

Throughout, `E` is a field with a ring endomorphism `σ`, `U` a finite-dimensional `E`-space and
`H : U →ₛₗ[σ] U →ₗ[E] E` a sesquilinear form, conjugate-linear in the first variable. `H` is
*Hermitian* if `H y x = σ (H x y)`; for nonzero Hermitian `H` this forces `σ² = id`, and `F` denotes
the fixed field. The zero form on the zero space is Hermitian for every `σ`, so the statements of
§§1.1–1.2 that call an induced form Hermitian or place a value in `F` assume `σ² = id`; §§1.3–1.4 and
the point-level identity of §1.7 hold for every `σ`, since in dimension four a nonzero Hermitian form
forces `σ² = id` and the zero form gives `L = 0`. In the applications `E/F` is a quadratic extension
of number fields or of local fields, or the split étale algebra `F × F` at a split place.

### 1.1 Hermitian volume

For `dim_E U = n` and a trivialization `d_U : ⋀ⁿU ≃ E`, the sesquilinear form `H` induces the
sesquilinear form `h(v₁∧…∧v_n, w₁∧…∧w_n) = det[H(v_i, w_j)]` on `⋀ⁿU`, Hermitian when `σ² = id` and
`H` is Hermitian. Define `vol(H, d_U) = h(w, w)` for the vector `w` with `d_U(w) = 1` (IP23,
Definition 5.2, p. 28). For any basis `b` of `U`, `vol(H, d_U) = det[H(b_i, b_j)] / (σ(c)·c)` with
`c = d_U(b₁ ∧ … ∧ b_n)`.

- The diagonal formula: if `H` is diagonal in `b` with entries `a_i ∈ E`, then
  `vol = (∏ a_i)/(σ(c)·c)`.
- Rescaling: `vol(H, α d_U) = (σ(α)·α)⁻¹ vol(H, d_U)` for `α ∈ E^×`, for every sesquilinear `H`
  (IP23, p. 28).
- The volume is nonzero exactly when the Gram matrix `[H(b_i, b_j)]` is invertible.
- If `σ² = id` and `H` is Hermitian, the volume lies in the fixed field `F` of `σ`, and when it is
  nonzero its class in `F^×/N(E^×)`, `N(x) = σ(x)·x`, is the discriminant class of `H`. Hermitian
  symmetry is needed: the Gram matrix of a Hermitian form satisfies `σ(det) = det`, while that of a
  general sesquilinear form need not. The involution is needed in rank zero, where the volume is
  `1/(σ(c)·c)` and `σ` fixes it for every trivialization only when `σ² = id`; in positive rank a
  nonzero Hermitian form forces `σ² = id` and the zero form has volume `0`.

**Checks.**

- For `H = diag(1,1,1,1)` and `d_U(e₁∧e₂∧e₃∧e₄) = −1`, the volume is `1`.
- For `H = diag(1, −J₁, 1, −J₂)` and the same `d_U`, the volume is `J₁J₂`.
- Scaling `d_U` by `2` divides the volume by `4`; for `diag(1, 2, 1, −5)` it changes from `−10` to
  `−5/2`, not to `−40`.
- A degenerate Hermitian form has volume `0`.
- Over `E = ℚ(i)` with complex conjugation, the sesquilinear form `H = diag(i, 1, 1, 1)` is not
  Hermitian (`H(e₁, e₁) = i` is not fixed by `σ`); with `d_U(e₁∧e₂∧e₃∧e₄) = −1` its volume is
  `i/(σ(−1)·(−1)) = i`, whose conjugate is `−i`: the volume of a non-Hermitian form need not lie in
  `F = ℚ`.
- Rank zero needs `σ² = id`: for `E = ℚ(t)` with the ring endomorphism `σ(t) = t²`, `U = 0`, the zero
  form (Hermitian) and `d_U(a) = ta` on `⋀⁰U = E`, the induced form is `h(a, b) = σ(a)·b`, so
  `h(1, t) = t` while `σ(h(t, 1)) = t⁴`, and `vol = σ(t⁻¹)·t⁻¹ = t⁻³` while `σ(vol) = t⁻⁶`. With `σ = id`
  the same trivialization gives `vol = t⁻²`, fixed; for a quadratic involution `vol = 1/N(c)` lies in
  `F`.

*Needs:* Mathlib `exteriorPower.pairingDual`, `exteriorPower.ιMulti`, `Matrix.det`,
`Module.Basis.topVector`, `exteriorPower.isUnit_apply_topVector`; Tau Ceti
`Module.Basis.exteriorPowerTopEquiv`.

### 1.2 Unitary similitude groups and the determinant norm identity

Let `F` be a field of characteristic zero and `E` a quadratic étale `F`-algebra with nontrivial
involution `σ`: a quadratic field extension, or `F × F` with the swap, which enters at the split
places of §3.1. For a nondegenerate Hermitian form `H` on a free `E`-module `U` of rank `n`, define
`GU_E(U)` as the `F`-group functor sending an `F`-algebra `R` to the pairs
`(g, ν) ∈ GL_{E⊗_F R}(U ⊗_F R) × R^×` with `H(gx, gy) = ν·H(x, y)` for all `x, y`, with multiplier
`ν(g) = ν`; put `U_E(U) = ker ν` and, for `n = 4`, let `GSU_E(U)` be the subfunctor on which
`det_{E⊗R} g = ν²` in `(E ⊗_F R)^×`. For a quaternion algebra `B` over `F` with main involution `*` and
a free right `B`-module `X` of rank `m` with a nondegenerate skew-Hermitian form,
`⟨xβ, yγ⟩ = β*⟨x, y⟩γ` and `⟨y, x⟩ = −⟨x, y⟩*`, define `GU_B(X)` in the same way inside
`GL_{B⊗_F R}(X ⊗_F R) × R^×`, put `U_B(X) = ker ν`, and let `GU_B(X)°` be its identity component
(ReductiveGroups Layer 3). For `U ≠ 0` put `PGU_E(U) = GU_E(U)/Res_{E/F}𝔾_m`, the quotient by the
central subgroup of `E`-scalars `α ↦ (α, N_{E/F}(α))`, and for `X ≠ 0` put
`PGU_B(X)° = GU_B(X)°/𝔾_m`, the quotient by the central subgroup of `F`-scalars `t ↦ (t, t²)`
(quotients by normal closed subgroups, ReductiveGroups Layer 3; IP23, §5.2, p. 27). Prove that
`N_{E/F}(det g) = ν(g)^n` for `g ∈ GU_E(U)`, and that the induced Hermitian form on `⋀^rU` is a
similitude for `⋀^r g` with multiplier `ν(g)^r` (IP23, §5.1 and Proposition 5.1, pp. 25–26, with
(5.1)–(5.3); the dimensions are those of the proof of Proposition 5.6, p. 31).

- Each functor is a closed subgroup scheme of `GL_F(U) × 𝔾_m`, resp. `GL_F(X) × 𝔾_m`, with `U` and
  `X` regarded as `F`-spaces, cut out by `E`- or `B`-linearity and the multiplier equation; its
  formation commutes with extension of `F`.
- For `U ≠ 0`, resp. `X ≠ 0`, the multiplier is determined by `g` over every `R`: for `x, y` with
  `c = H(x, y) ≠ 0`, resp. `c = ⟨x, y⟩ ≠ 0`, the image of `(x, y)` under `g` pairs to `ν·c`, and some
  coordinate of `c` in an `F`-basis of `E`, resp. `B`, lies in `F^×`.
- Over a field `F′ ⊃ F` splitting `E`, the two idempotents of `E ⊗_F F′` split `U ⊗_F F′ = U₁ ⊕ U₂`
  into isotropic subspaces paired perfectly by `H`, and `(g, ν) ↦ (g|_{U₁}, ν)` identifies `GU_E(U)`
  with `GL_n × 𝔾_m`, `U_E(U)` with `GL_n` and, for `n = 4`, `GSU_E(U)` with
  `{(g₁, ν) : det g₁ = ν²}`. So these groups are smooth and connected, of dimensions `n² + 1`, `n²`
  and `16`. An `E`-scalar with components `(a, b)` acts on `U₁` by `a` with multiplier `ab`, so for
  `n ≥ 1` the `E`-scalars become the centre `𝔾_m × 𝔾_m` of `GL_n × 𝔾_m` and `PGU_E(U)` is smooth and
  connected of dimension `n² − 1`.
- Over a field `F′ ⊃ F` splitting `B`, a primitive idempotent `e` of `B ⊗_F F′ ≅ M₂(F′)` identifies
  `GU_B(X)` with the similitude group of a nondegenerate symmetric bilinear form on the
  `2m`-dimensional space `(X ⊗_F F′)e`. So `U_B(X)` has dimension `m(2m − 1)` and, for `m ≥ 1`,
  `GU_B(X)` has dimension `m(2m − 1) + 1` and two geometric components; the `F`-scalars become the
  scalar similitudes, of multiplier `t²`, so `PGU_B(X)°` has dimension `m(2m − 1)`.

**Checks.**

- For a scalar `α ∈ E^×`, `ν = N(α)` and both sides equal `N(α)^n`.
- For `n = 4` and a non-scalar similitude of a non-diagonal Hermitian form over `ℚ(i)`,
  `N(det g) = ν⁴`.
- `det g` itself need not equal `ν^{n/2}`; only its norm is determined.
- For `n = 4`, `dim GU_E(U) = 17` and `dim GSU_E(U) = dim U_E(U) = 16`, yet `GSU_E(U) ≠ U_E(U)`: a
  scalar `t ∈ F^×` has `ν = t²` and `det g = t⁴ = ν²`, so it lies in `GSU_E(U)`, and in `U_E(U)` only
  when `t² = 1`.
- For `U = 0` every `ν ∈ R^×` is a multiplier of the identity, so `GU_E(0) = 𝔾_m` and `U_E(0)` is
  trivial: the multiplier is part of the point, and only in rank zero is it not determined by `g`.
  There `α ↦ (α, N(α))` has the norm-one torus as kernel, and on `GU_B(0) = 𝔾_m` the map
  `t ↦ (1, t²)` has kernel `μ₂`; neither map embeds the scalars as a subgroup, so the projective
  quotients are formed for `U ≠ 0`, resp. `X ≠ 0`.
- For `n = 4` and the rank-three space of §1.6,
  `dim PGU_E(U) = 17 − 2 = 15 = 16 − 1 = dim PGU_B(X)°`, as §1.8 requires; dividing `GU_E(U)` by
  the `F`-scalars alone would give `16`.
- For the rank-three space of §1.6, `dim U_B(X) = 15` and `dim GU_B(X)° = 16 = dim GSU_E(U)`, and
  `GU_B(X)` has two geometric components; for `m = 1`, `GU_B(X)°` has dimension `2`, as
  `GU_B(W₀)° ≃ E^×` of §2.5 requires.

*Needs:* §1.1; ReductiveGroups Layer 3; Mathlib `QuaternionAlgebra`; Tau Ceti
`LinearMap.map_exteriorPower_finrank_eq_det_smul`; Mathlib `exteriorPower.map`.

### 1.3 The exterior operator

For `dim_E U = 4`, a sesquilinear `H` and `d_U : ⋀⁴U ≃ E`, the predicate `IsExteriorStar` says that a
`σ`-semilinear `L : ⋀²U → ⋀²U` satisfies `d_U(L(u₁∧u₂) ∧ y) = det[H(u_i, ·)](y)` for all `u₁, u₂` and
`y ∈ ⋀²U`, the left side being Mathlib's `exteriorPower.wedgePairing` and the right side
`exteriorPower.pairingDual` applied to `H u₁ ∧ H u₂`. Prove `existsUnique_isExteriorStar`: exactly one
such `L` exists, for every sesquilinear `H` (IP23, §5.2, pp. 27–28: `L = ψ⁻¹ ∘ ι ∘ ∧²φ`). The
construction regards the conjugate-linear map `φ : U → U^∨` as a linear map on the conjugate module
before taking `⋀²`, and uses that the wedge pairing is perfect.

- `L` is additive and `σ`-semilinear.
- For an orthogonal basis with `H = diag(a₁,…,a₄)` and `d_U(e₁₂₃₄) = −1`, `L` sends
  `e₁₂, e₁₃, e₁₄, e₂₃, e₂₄, e₃₄` to `−a₁a₂e₃₄, a₁a₃e₂₄, −a₁a₄e₂₃, −a₂a₃e₁₄, a₂a₄e₁₃, −a₃a₄e₁₂`
  (IP23, p. 29).
- Replacing `d_U` by `α d_U` replaces `L` by `α⁻¹ L` (IP23, p. 28).
- For `σ = id` and a bijective bilinear form `H`, symmetric or not, `L` is the inverse of
  `exteriorPower.hodgeStar` in degrees `(2,2)`: the star `⋆` is characterized by
  `H₂(⋆x, y) = d_U(x ∧ y)` for the induced form `H₂` on `⋀²U`, so
  `H₂(⋆(Lu), y) = d_U(Lu ∧ y) = H₂(u, y)` for every `y`, and `H₂` is nondegenerate.

**Checks.**

- For all `a_i = 1`: `L(e₁₂) = −e₃₄` and `L(e₁₃) = e₂₄`.
- For `E = F(i)` with `σ(i) = −i`: `L(e₁₂ i) = −L(e₁₂) i`, so `L` is not `E`-linear.
- Replacing `d_U` by `−d_U` negates `L` and leaves `L∘L` unchanged.
- The six basis images, recomputed from the defining identity with the signs of `e_K ∧ e_J` in
  `⋀⁴`, agree with the list above.
- For `E = ℂ` with `σ` complex conjugation, `U = ℂ ⊗_ℝ ℝ⁴` with the sesquilinear extension of the
  standard inner product and `d_U(e₁₂₃₄) = 1`, `L` is Tau Ceti's conjugate Hodge star:
  `L(e₁₂) = e₃₄ = ⋆e₁₂` and `L(i·e₁₂) = −i·e₃₄`, where a complex-linear star would give `i·e₃₄`. With
  `d_U(e₁₂₃₄) = −1` it is the negative of that star (`L(e₁₂) = −e₃₄`, the first Check); in both cases
  `L∘L = 1 = (−1)^{2·2}`.

*Needs:* §1.1; Mathlib `exteriorPower.wedgePairing`, `exteriorPower.instIsPerfPairWedgePairing`,
`exteriorPower.pairingDual`, `exteriorPower.ιMulti`.

### 1.4 The square of the exterior operator

Prove `IsExteriorStar.comp_self`: if `H` is Hermitian and `L` satisfies `IsExteriorStar`, then
`L (L x) = vol(H, d_U)·x` for every `x ∈ ⋀²U`, with the volume computed in any basis as in §1.1
(IP23, Proposition 5.3, pp. 28–29). Nondegeneracy of `H` is not needed; the volume is zero exactly
for degenerate `H`. For a diagonal form with `d_U(e₁₂₃₄) = −1`, every `L∘L` coefficient is
`a₁a₂a₃a₄`.

**Checks.**

- For `diag(1, −J₁, 1, −J₂)` the square is `J₁J₂`.
- For random non-diagonal Hermitian `4 × 4` matrices over `ℚ(i)` and random `d_U`, `L∘L` equals the
  volume on all six basis vectors and on non-real multiples of them.
- Some symmetry of `H` is needed: for `σ = id`, `d_U(e₁₂₃₄) = −1` and the bilinear form with Gram
  matrix `1 + E₁₂` (`H(e₁, e₂) = 1`, `H(e₂, e₁) = 0`, `H(e_i, e_i) = 1`, all other entries `0`), the
  volume is `1` but `L(L(e₁₃)) = e₂₃` and `L(L(e₂₃)) = −e₁₃ + e₂₃`.
- Symmetry up to sign suffices for the identity itself. For `σ = id`, `c = d_U(e₁₂₃₄)` and an
  invertible Gram matrix `A = [H(e_i, e_j)]`, `L∘L = (det A / c²)·⋀²(A⁻¹Aᵀ)`, which is `det A / c²`
  when `Aᵀ = ±A` because `⋀²(−1) = 1`: for the standard alternating form
  (`H(e₁, e₂) = −H(e₂, e₁) = H(e₃, e₄) = −H(e₄, e₃) = 1`, other entries `0`) and `c = −1`,
  `L∘L = 1 = det A`, and for the alternating Gram matrix with rows `(0,1,2,3)`, `(−1,0,4,5)`,
  `(−2,−4,0,6)`, `(−3,−5,−6,0)` and `c = −1`, `L∘L = 64 = det A`.

*Needs:* §§1.1, 1.3.

### 1.5 Exterior skew-pairing identities

Assume that `H` is Hermitian and that `σ` has order two, with fixed field `F` of characteristic zero.
Choose a trace-zero `i ∈ E^×` and put `b = i·h₂`, the skew-Hermitian `E`-valued form from the induced
Hermitian form `h₂` on `⋀²U`. For `L` of §1.3 with `J = vol(H, d_U)`, prove `b(Lx, y) = b(Ly, x)` and
`σ(b(Lx, Ly)) = −J·b(x, y)`; the second follows from the first and `L∘L = J` (IP23, Lemma 5.4 and
Remark 5.5, pp. 29–30).

**Checks.**

- The first identity is symmetric in `x, y`; for the two-dimensional analogue of §2.1 it is
  antisymmetric.
- For a random non-diagonal Hermitian form over `ℚ(i)` with volume `J = −164/5`, both identities
  hold exactly on twenty random pairs of vectors.
- For the plane of §2.1 with `H = diag(a₁, a₂)`: `b(L₁e₁, e₂) = −i a₁a₂ = −b(L₁e₂, e₁)`.
- The Hermitian hypothesis is needed: for the non-Hermitian `H = diag(i, 1, 1, 1)` over `ℚ(i)` with
  `d_U(e₁₂₃₄) = −1`, `L(e₁₂) = −i e₃₄` and `L(e₃₄) = −e₁₂`, so `b(Le₁₂, e₃₄) = −1` while
  `b(Le₃₄, e₁₂) = 1`.

*Needs:* §1.4.

### 1.6 The quaternionic exterior space

Assume that `σ` has order two, with fixed field `F` of characteristic zero, so that `E/F` is a
quadratic extension (the split étale algebra enters through the localizations of §3.1), and that `H`
is nondegenerate Hermitian. Then `J = vol(H, d_U)` lies in `F^×` (§1.1). Put `B = E ⊕ Ej` with
`j² = J`, `αj = jσ(α)` and main involution `*`, a quaternion algebra over `F` because `J ≠ 0`. On
`⋀²U` define the right action `x·j = Lx`; by §1.4 it makes `⋀²U` a right `B`-module, free of rank
three. With `b` of §1.5 put `⟨x, y⟩ = b(x, y) − J⁻¹ j b(Lx, y)`; prove that it is a nondegenerate
`B`-skew-Hermitian form (IP23, (5.6), p. 30; §5.2, pp. 26–31). For `d′_U = α d_U` one has `L′ = α⁻¹L`,
`J′ = J/N(α)` and `j′ = jα⁻¹ = σ(α)⁻¹j`; the algebra isomorphism is
`TauCeti.QuaternionAlgebra.normMulEquiv` with `z = σ(α)⁻¹`, and the action and the form are
transported along it. The algebra `B` is an existing quaternion algebra; this target supplies its
action and form.

- The right action of `j` on `⋀²U` is `L`.
- The `E`-component of `⟨x, y⟩` is `b(x, y)` and its `j`-component is `−J⁻¹ b(Lx, y)`, in the
  displayed multiplication order.
- Changing `d_U` by `α` gives an isometry after `TauCeti.QuaternionAlgebra.normMulEquiv`.

**Checks.**

- The `E`-dimension `6` becomes `B`-rank `3`.
- `⟨xβ, yγ⟩ = β*⟨x, y⟩γ` for `β, γ ∈ B`, `⟨y, x⟩ = −⟨x, y⟩*`, and `x·(βγ) = (x·β)·γ`: all three
  hold exactly for random vectors and quaternions over `ℚ(i)`.
- The zero vector pairs to zero with every `y`; nondegeneracy says it is the only such vector.
- Writing the `j`-term as `−J⁻¹ b(Lx, y) j` instead breaks sesquilinearity in `y`.
- For the zero form on `ℚ(i)^4`, `J = 0` and `L = 0`: the symbol algebra with `j² = 0` is not a
  quaternion algebra, right multiplication by `j` has `E`-rank `0` on `⋀²U` but rank `3` on
  `(E ⊕ Ej)³`, and `J⁻¹` is undefined; nondegeneracy is part of the hypothesis. For the unit diagonal
  form with `d_U(e₁₂₃₄) = −1`, `J = 1` and `L∘L = id`, so `L` is invertible and `B ≃ M₂(F)`.

*Needs:* §§1.1, 1.4–1.5; Mathlib `QuaternionAlgebra`; Tau Ceti `TauCeti.QuaternionAlgebra.normMulEquiv`,
`TauCeti.QuaternionAlgebra.rescaleJEquiv`.

### 1.7 The exceptional exterior isogeny

Under the hypotheses of §1.6 let `GSU_E(U) = {g ∈ GU_E(U) : det_E g = ν(g)²}` (§1.2). Prove that
`g ↦ ⋀²g` is an isogeny of algebraic `F`-groups `GSU_E(U) → GU_B(⋀²U)°` with multiplier `ν(g)²` on the
target, whose scheme-theoretic kernel is `Res_{E/F}μ₂`, the `E`-scalars `c` with `c² = 1`, of order
four with `F`-points `±1` (IP23, Proposition 5.6, pp. 30–31). The point-level identity is
`IsExteriorStar.map_similitude`: for every `E`-linear automorphism `g` with `H(gx, gy) = ν·H(x, y)`,
`L ∘ ⋀²g = (ν²/det g)·(⋀²g ∘ L)`, for every sesquilinear `H` (IP23, (5.10), from (5.7)–(5.9)).
*Proof route:* compute the kernel on geometric points and the differential, and use connectedness and
equal dimension sixteen in characteristic zero; over `F̄` this is the identification `Spin₆ ≃ SL₄` of
RepresentationTheory/SpinRepresentations Layer 6.

**Checks.**

- For a scalar `t ∈ F^×`, `ν = t²`, `det = t⁴ = ν²`, `⋀²t = t²` and the target multiplier is `t⁴`.
- For random similitudes of non-diagonal Hermitian forms over `ℚ(i)`, the factor `ν²/det g` makes the
  identity hold, while its conjugate `σ(ν²/det g)` does not.
- `⋀²g = id` for `g = −1`, which lies in `GSU`; the kernel is not trivial.
- The kernel is not `μ₂`. Over `F̄`, `E ⊗_F F̄ = F̄ × F̄` and the `E`-scalar `c = (1, −1)` has
  `ν = σ(c)c = −1` and `det c = c⁴ = 1 = ν²`, so it lies in `GSU_E(U)`, and `⋀²c = c² = 1`; it is not
  an `F`-point when `E` is a field.

*Needs:* §§1.2, 1.3, 1.6; Tau Ceti `LinearMap.map_exteriorPower_finrank_eq_det_smul`; ReductiveGroups
Layers 3, 6;
RepresentationTheory/SpinRepresentations Layer 6.

### 1.8 The exceptional projective isomorphism

Under the hypotheses of §1.6, prove that the exterior construction induces an isomorphism of algebraic
`F`-groups `PGU_E(U) ≃ PGU_B(⋀²U)°`: for `g ∈ GU_E(U)` choose `β ∈ E^×` with `β/σ(β) = ν(g)²/det g`
(Hilbert 90, using `N(ν²/det g) = 1` from §1.2) and send `x` to `(⋀²g)(x)β` modulo `F^×`. The class is
independent of `β` and of the representative of `g` modulo `E^×`, and agrees with §1.7 on `GSU` (IP23,
Proposition 5.7 and Remarks 5.8–5.9, p. 31). The isomorphism is descended as algebraic groups; no
surjectivity of the isogeny on `F`-points is inferred.

**Checks.**

- Replacing `β` by `βt`, `t ∈ F^×`, has no projective effect.
- Replacing `g` by `gα`, `α ∈ E^×`, multiplies `ν²/det g` by `(σ(α)/α)²`; the choice `βα⁻²` gives
  the same class.
- On `GSU_E(U)` one may take `β = 1`, recovering §1.7.

*Needs:* §§1.2, 1.7; Mathlib `groupCohomology.H1ofAutOnUnitsUnique`; ReductiveGroups Layers 3, 6.

### Examples

For `U = B₁ ⊥ B₂` with `E`-basis `(1, j₁, 1, j₂)`, `H = diag(1, −J₁, 1, −J₂)` and `d_U(e₁₂₃₄) = −1`:
`vol = J₁J₂`; `L(e₁₂) = J₁e₃₄`, `L(e₃₄) = J₂e₁₂`, so `L` exchanges the two diagonal lines and
`L²(e₁₂) = J₁J₂e₁₂`; on the mixed vectors `e₁₃, e₂₃, e₁₄, e₂₄` the images are
`e₂₄, J₁e₁₄, J₂e₂₃, J₁J₂e₁₃`.

### Dependencies

Mathlib `exteriorPower` (Basic, Pairing, WedgePairing, BilinForm, HodgeStar), `QuaternionAlgebra`,
`groupCohomology.H1ofAutOnUnitsUnique`, `Module.Basis.topVector`; Tau Ceti
`LinearMap.map_exteriorPower_finrank_eq_det_smul`, `Module.Basis.exteriorPowerTopEquiv`,
`TauCeti.QuaternionAlgebra.normMulEquiv`,
`TauCeti.QuaternionAlgebra.rescaleJEquiv`; ReductiveGroups Layers 3, 6;
RepresentationTheory/SpinRepresentations Layer 6.

## Layer 2: block restrictions of the exceptional maps

The mixed and diagonal wedge summands connect the exceptional map to the product of the two
original quaternion groups. Kernels, multipliers and quotient directions are matched before the
diagram is used on adelic points.

### 2.1 Quaternionic Hermitian planes

For a quadratic `E/F` embedded in `B_i`, write `B_i = E ⊕ Ej_i` with `j_i² = J_i ∈ F^×`, and regard
`U_i = B_i` as a right `E`-plane with `H_i(a + j_i b, c + j_i d) = σ(a)c − J_i σ(b)d`. Define the
action of `(β, α) ∈ B_i^× × E^×` by `x ↦ βxα⁻¹`. Prove that it identifies `GU_E(U_i)` with
`(B_i^× × E^×)/diag(F^×)`, with multiplier `Nrd(β)/N(α)` and `E`-determinant `Nrd(β)α⁻²`. For a
general orthogonal plane `diag(a₁, a₂)` with top trivialization one, the plane operator `L₁` defined
like §1.3 through the alternating pairing `U_i × U_i → ⋀²U_i` has `L₁e₁ = −a₁e₂`, `L₁e₂ = a₂e₁` and
`L₁² = −a₁a₂` (IP23, §4.1, pp. 20–21; Lemma 5.12 and (5.14)–(5.15), p. 33; §5.3.1, pp. 35–36).

- The action of `(β, α)` has multiplier `Nrd(β)/N(α)`.
- Its `E`-determinant is `Nrd(β)α⁻²`.
- The action is trivial exactly for `(β, α) = (t, t)` with `t ∈ F^×`.

**Checks.**

- For `(β, α) = (t, t)` the action is the identity and the determinant is `1`.
- For `β = 1` the multiplier is `N(α)⁻¹`, not `N(α)`.
- For `diag(1, −J_i)` the plane square is `L₁² = J_i`, whereas the volume of that plane is `−J_i`.
- For `β = (1 + 2i) + j·i`, `α = 2 − i` over `F = ℚ`, `E = ℚ(i)`, `J = −3`: `Nrd(β) = 5 + 3 = 8`, the
  multiplier is `8/5` and the determinant `24/25 + 32i/25`, matching `Nrd(β)/N(α)` and
  `Nrd(β)α⁻²`.

*Needs:* §1.1; Mathlib `QuaternionAlgebra`; Tau Ceti `TauCeti.QuaternionAlgebra.rescaleJEquiv`.

### 2.2 The two-plane exterior decomposition

For `U = U₁ ⊥ U₂` with `dim_E U_i = 2`, decompose `⋀²U = W ⊕ W₀` with `W = U₁ ⊗_E U₂` embedded by
`u₁ ⊗ u₂ ↦ u₁ ∧ u₂` and `W₀ = ⋀²U₁ ⊕ ⋀²U₂`. Prove that `L` preserves both summands, that they have
`B`-ranks two and one, and that the decomposition is orthogonal for the form of §1.6; the block group
of equal-multiplier pairs acts compatibly (IP23, (5.11) and Proposition 5.10, p. 32).

- The mixed inclusion sends `u₁ ⊗ u₂` to `u₁ ∧ u₂` in that order.
- `W` has `B`-rank two and `W₀` has `B`-rank one.
- Forgetting the `B`-action, the splitting is the exterior-power decomposition of a direct sum.

**Checks.**

- The `E`-dimensions are four and two, summing to six.
- Interchanging `u₁` and `u₂` changes the sign of the mixed wedge.
- The line `⋀²U₁` alone is not `L`-stable: `L` exchanges `⋀²U₁` and `⋀²U₂`.

*Needs:* §§1.6, 2.1; Mathlib `exteriorPower.map`.

### 2.3 The block exterior isogeny

Let `H = GSU_E(U) ∩ G(U_E(U₁) × U_E(U₂))`, where `G(·)` means equal similitude multipliers. Prove that
the exterior isogeny of §1.7 restricts to a central isogeny `H → G(U_B(W) × U_B(W₀))°` with kernel
`Res_{E/F}μ₂` (§1.7), between connected groups of dimension eight (IP23, Proposition 5.10, (5.12),
p. 32).

**Checks.**

- The target is the identity component of the equal-multiplier subgroup.
- `g = −1` lies in `H` and maps to the identity.
- Both groups have dimension eight: `5 + 5 − 1 − 1` for two `GU(2)` factors with equal multipliers
  and `det g = ν²` (only the norm-one part of `det g/ν²` is a new condition, since
  `N(det g) = ν⁴` by §1.2), and `7 + 2 − 1` for `(B₁^× × B₂^×)/F^×` and `E^×` with equal
  multipliers.

*Needs:* §§1.7, 2.2.

### 2.4 The projective block isomorphism

Prove that the exceptional projective map of §1.8 restricts to
`G(U_E(U₁) × U_E(U₂))/E^× ≃ G(U_B(W) × U_B(W₀))°/F^×`. For `U_i = B_i` and
`g = ([b₁, α₁], [b₂, α₂])` with equal multipliers, its image is `[[b₁, b₂], Nrd(b₁)α₁⁻¹α₂]`, which
equals the expression with `det(g₁)α₁α₂`; the quotient of `B₁^× × B₂^×` uses `t ↦ (t, t⁻¹)` (IP23,
Proposition 5.11, (5.13), p. 32; §5.3.1, pp. 35–36).

**Checks.**

- `det(g₁)α₁α₂ = Nrd(b₁)α₁⁻²α₁α₂ = Nrd(b₁)α₁⁻¹α₂`.
- `(t, t⁻¹)` acts trivially on `W = B₁ ⊗_E B₂`; `(t, t)` acts by `t²`.
- Changing the central representative of `g` by `α ∈ E^×` does not change the image class.

*Needs:* §§1.8, 2.1, 2.3.

### 2.5 The quaternionic block groups

Prove `GU_B(W)° ≃ (B₁^× × B₂^×)/{(t, t⁻¹)}` with multiplier `Nrd(b₁)Nrd(b₂)`, and `GU_B(W₀)° ≃ E^×`
with multiplier `N_{E/F}`; the full rank-one group has a second component normalizing `E` (IP23,
§5.3.1, pp. 32–34; Proposition 5.13, p. 34). The rank-one block is a `B`-unitary group; the `E`-label
of the rotated diagram on p. 22 of IP23 is read as `U_B`.

**Checks.**

- An element of the normalizer component outside `E^×` is not in the identity component.
- `(b₁, b₂) = (t, t⁻¹)` has multiplier `t²·t⁻² = 1` and acts trivially.
- On `W₀` the element `α ∈ E^×` has multiplier `N(α)`, not `α²`.

*Needs:* §§2.1, 2.2, 2.4.

### 2.6 The explicit quaternion tensor model

For `U = B₁ ⊥ B₂` with ordered `E`-basis `(1, j₁, 1, j₂)`, prove that `H = diag(1, −J₁, 1, −J₂)`,
`J = J₁J₂`, that `L` sends `(e₁₃, e₂₃, e₁₄, e₂₄)` to `(e₂₄, J₁e₁₄, J₂e₂₃, J₁J₂e₁₃)`, that the
`E`-Hermitian form on `W` is `diag(1, −J₁, −J₂, J₁J₂)`, and that `[B] = [B₁] + [B₂]`; this identifies
the exterior block with the quaternion tensor model used for periods (IP23, Example 5.14,
pp. 36–37). The Brauer identity is `TauCeti.BrauerGroup.quaternionClass_mul` with the common slot
`u = i²`, through `TauCeti.QuaternionAlgebra.tensorAlgEquivTensorMatrix`.

**Checks.**

- The `4 × 4` semilinear matrix on `W` squares to `J₁J₂`.
- `(u, J₁J₂) = (u, J₁)·(u, J₂)` in `Br(F)`, the common-slot identity.
- With `d_U(e₁₂₃₄) = +1` instead of `−1` every image changes sign, while the square is unchanged.

*Needs:* §§1.4, 2.5; Tau Ceti `TauCeti.BrauerGroup.quaternionClass_mul`,
`TauCeti.QuaternionAlgebra.tensorAlgEquivTensorMatrix`.

### 2.7 The three-plus-one restriction

For `U = U₃ ⊥ U₄` of dimensions three and one, put `W = U₃ ⊗_E U₄`, embedded as the mixed wedge
summand. Prove that the `B`-action identifies `⋀²U` with `W ⊗_E B`, that the skew form extends the
`E`-skew form on `W`, and that the exceptional map restricts to
`G(U_E(U₃) × U_E(U₄))/E^× ≃ GU_E(W)/F^×` (IP23, (5.16), p. 37; Proposition 5.15, p. 38).

**Checks.**

- `W` has `E`-dimension three and `W ⊗_E B` has `B`-rank three.
- `W` and `Wj` are complementary: `Wj = ⋀²U₃`.
- The summand is `U₃ ⊗ U₄`, not `⋀²U₃`.

*Needs:* §§1.6, 1.8.

### 2.8 The exceptional group diagram

For `U = B₁ ⊥ B₂` put `Ũ = GU_E(U)`, `H̃ = G(U_E(B₁) × U_E(B₂))`, `G̃ = GU_B(⋀²U)°` and
`H̃_B = G(U_B(W) × U_B(W₀))°`. Construct the inclusions `H̃ → Ũ`, `H̃_B → G̃`, the central quotients
`Ũ/E^×`, `G̃/F^×` and the projective isomorphisms of §§1.8 and 2.4; with §2.5 write
`H̃_B = {(g, α) ∈ G × E^× : ν(g) = N(α)}` where `G = (B₁^× × B₂^×)/{(t, t⁻¹)}`. Prove that the diagram
commutes as algebraic `F`-groups, and after `Res_{F/ℚ}` and localization (IP23, §4.1, pp. 20–23;
Propositions 5.7 and 5.11, pp. 31–32). Every arrow carries its kernel and the component of its source.

- Block inclusion followed by projectivization equals the exceptional projective map followed by the
  quaternionic block inclusion.
- `H̃_B` is exactly the fibre product `ν(g) = N(α)`.
- All arrows commute with `Res_{F/ℚ}` and with extension to local fields.

**Checks.**

- The `E`-side quotient kills `E^×` and the `B`-side quotient kills `F^×`.
- The scalar `(t, t)` in `B₁^× × B₂^×` is not the kernel defining `G`; `(t, t⁻¹)` is.
- Both composites applied to `([b₁, α₁], [b₂, α₂])` give `[[b₁, b₂], Nrd(b₁)α₁⁻¹α₂]`.

*Needs:* §§2.4, 2.5; ReductiveGroups Layer 3.

### Examples

For `F = ℚ`, `E = ℚ(i)`, `J₁ = −2`, `J₂ = 5`: `H = diag(1, 2, 1, −5)`, `vol = J₁J₂ = −10`,
`B = (−1, −10)`, and on `W` the operator `L` has matrix entries `1, −2, 5, −10` in the order of §2.6.

### Dependencies

Layer 1; Mathlib `QuaternionAlgebra`, `exteriorPower.map`; Tau Ceti
`TauCeti.QuaternionAlgebra.rescaleJEquiv`, `TauCeti.BrauerGroup.quaternionClass_mul`,
`TauCeti.QuaternionAlgebra.tensorAlgEquivTensorMatrix`; ReductiveGroups Layer 3.

## Layer 3: local models, weights and cohomological theta modules

Localizing the explicit model fixes the real signatures, compact tori and character lattice.
Archimedean cohomology is relative Lie algebra cohomology at this stage; its indices acquire their
Hodge interpretation in Layer 8.

### 3.1 Local quadratic models

Localize the exterior construction at a characteristic-zero local field, allowing `E` quadratic
étale. When `B` splits, MetaplecticAutomorphicForms §3.33 supplies the transfer `X ↦ X† = Xe` along
a primitive idempotent `e`, from skew-Hermitian `B`-spaces of rank `m` to quadratic `F`-spaces of
dimension `2m`, with `GU_B(X)° ≃ GSO(X†)` and compatible splittings. Prove that for the exterior space
the real signatures are `(4,2)` above `Σ` and `(0,6)` elsewhere, for `W` they are `(2,2)` and
`(0,4)`, and for `W₀` they are `(2,0)` and `(0,2)` (IP23, §6.1, p. 38; §6.3, pp. 42–44; §10.3, p. 66).

**Checks.**

- The real exterior model above `Σ` has four positive and two negative directions.
- The signatures of `W` and `W₀` add to that of the exterior space at every real place.
- At a place outside `Σ` the quadratic space is definite, so its orthogonal group is compact.

*Needs:* §2.6; MetaplecticAutomorphicForms §3.33.

### 3.2 The split exceptional torus map

For the split local model, parametrize the unitary maximal torus by `(t₁, t₂, ν) ∈ E^× × E^× × F^×`,
with central `z` represented by `(z, z, N(z))`, and the quadratic torus by
`(s₁, s₂, α) ∈ F^× × F^× × E^×` modulo its centre `(z, z, z)`, `z ∈ F^×`. Prove that the exceptional
map is `(t₁, t₂, ν) ↦ (N(t₁t₂), νN(t₁), νt₁σ(t₂))` modulo that centre (IP23, Lemma 6.1, p. 41).

**Checks.**

- The central element `(z, z, N(z))` maps to `(N(z)², N(z)², N(z)²)`, a central quadratic element.
- `t₁ = t₂ = 1` gives `(1, ν, ν)`: the similitude enters the last two coordinates only.
- Replacing `t₂` by `σ(t₂)` changes the third coordinate, so the conjugation is not cosmetic.

*Needs:* §§1.8, 3.1.

### 3.3 The real exceptional torus map

For the real maximal compact tori write `z_i = y_i²` with `z_i, y_i ∈ ℂ¹`. Prove that in projective
coordinates the map sends `(diag(z₁, z₂, z₃, z₄), r)` to
`(y₁y₃/(y₂y₄), y₁y₄/(y₂y₃), y₁y₂/(y₃y₄), r²)` modulo the real scalar centre; changing any square root
changes the triple by a common sign (IP23, Lemma 6.2, p. 44).

**Checks.**

- Replacing `y₁` by `−y₁` negates all three coordinates, a central sign.
- The radial coordinate is squared, as the multiplier is in §1.7.
- `y = (1, 1, 1, −1)`, a square root of the identity, gives `(−1, −1, −1)`, central;
  `y = (1, 1, i, i)` gives `(1, 1, −1)`, not central.

*Needs:* §§1.7, 3.1.

### 3.4 The exceptional weight map

Define the map on character lattices `{(l₁, l₂, l₃) ∈ ℤ³ : l₁ + l₂ + l₃ even} → {k ∈ ℤ⁴ : Σ k_i = 0}`,
`(l₁, l₂, l₃) ↦ ((l₁+l₂+l₃)/2, (−l₁−l₂+l₃)/2, (l₁−l₂−l₃)/2, (−l₁+l₂−l₃)/2)`, the pullback of
characters along §3.3, and prove that `(k₁, k₂, k₃, k₄) ↦ (k₁+k₃, k₁+k₄, k₁+k₂)` is its inverse
(IP23, Corollary 6.3, p. 45).

- The image has zero coordinate sum.
- The two formulas are mutually inverse bijections of the two integral lattices.
- For `l = (k−2, 0, 0)`, `k` even, the image in torus order is
  `((k−2)/2, −(k−2)/2, (k−2)/2, −(k−2)/2)`; reordering the coordinates as `(1, 3, 2, 4)` gives the
  Borel-dominant weight `((k−2)/2, (k−2)/2, −(k−2)/2, −(k−2)/2)` of IP23 §11.3.

**Checks.**

- `(2, 0, 0) ↦ (1, −1, 1, −1)` and `(0, 0, 2) ↦ (1, 1, −1, −1)`.
- `(1, 0, 0)` has odd sum and would give `(1/2, −1/2, 1/2, −1/2)`: it is outside the domain, and
  integer division on all of `ℤ³` is not the definition.
- The two maps compose to the identity on every lattice point with coordinates in `[−4, 4]`.
- The exponent of `y₁` in `t₁^{l₁}t₂^{l₂}t₃^{l₃}` of §3.3 is `l₁ + l₂ + l₃`, twice the first
  coordinate, as `z₁ = y₁²` requires.

*Needs:* §3.3.

### 3.5 Cohomology of the archimedean theta modules

For every integer `k ≥ 2`, odd as well as even (this local statement is not subject to the global
even-weight convention), let `D_{k+1}` be the holomorphic discrete series of `SL₂(ℝ)` of weight `k + 1`
and `D_{k+1}^∨` its dual, the antiholomorphic discrete series of weight `−k − 1`. In the convention of
this roadmap, where `θ(τ)` is MetaplecticAutomorphicForms' lift of `τ^∨` (Conventions), its §3.35
gives: the real theta lift of the antiholomorphic `D_{k+1}^∨` to `O(4,2)` restricts to
`A_{q₁}(k−2, 0, 0)` on `SO(4,2)°` (lowest `K`-type `(k, 0, 0)`), and that of the holomorphic
`D_{k+1}` to the holomorphic `A_{q₀}(0, 0, k−2)`; the lift of the holomorphic `D_{k+1}` to `O(0,6)`
is the irreducible representation of highest weight `(k−2, 0, 0)`, and that of `D_{k+1}^∨` is zero.
These are IP23's labels (§7.2, p. 47, and §§7.2.1–7.2.2, pp. 47–48), which use the same convention.
A source antiholomorphic above `Σ` and holomorphic elsewhere, as used in §7.1, therefore has nonzero
local lifts at every real place: `A_{q₁}` above `Σ` and the compact representation elsewhere. Prove
that the relative Lie algebra cohomology of `A_{q₁}(k−2, 0, 0)` with the harmonic coefficient of
degree `k − 2` is one-dimensional in bidegrees
`(1,1)` and `(3,3)`, two-dimensional in `(2,2)` and zero elsewhere (IP23, §§7.2.1–7.2.2, pp. 47–48),
by the Hermitian bidegree formula of AutomorphicFormsOnReductiveGroups §5.4 with
`(R₊, R₋) = (1, 1)` and Levi `𝔰𝔬(2) ⊕ 𝔰𝔬(2,2)`, whose compact dual has Poincaré polynomial
`1 + 2t² + t⁴`.

**Checks.**

- At `k = 2` the coefficient is trivial and the cohomology is still nonzero in degree two, with
  middle dimension two.
- The total dimension is four, the Euler characteristic of `ℙ¹ × ℙ¹`.
- The holomorphic module `A_{q₀}` has cohomology in a single bidegree, so it cannot contribute to
  bidegree `(1,1)`.
- At `k = 2`, the input that matters is the dual one: the lift of the antiholomorphic `D₃^∨` is
  `A_{q₁}(0, 0, 0)`, with `dim H^{1,1} = 1`, while the lift of the holomorphic `D₃` is `A_{q₀}(0, 0, 0)`,
  whose Levi is `𝔨`, so `𝔩 ∩ 𝔭 = 0`, `(R₊, R₋) = (4, 0)` and its cohomology is the single line in
  bidegree `(4, 0)`: `dim H^{1,1} = 0`. Reading MetaplecticAutomorphicForms' labels without dualizing
  the input would put the `(1,1)` class on `D₃`.
- At `k = 2` and the compact place, the lift of the holomorphic `D₃` to `O(0,6)` has highest weight
  `(0, 0, 0)`, so it is one-dimensional and its relative Lie algebra cohomology is the line `H⁰`;
  the lift of `D₃^∨` is zero.
- Odd weight `k = 3`: the lift of `D₄^∨` is `A_{q₁}(1, 0, 0)`, with lowest `K`-type
  `(1, 0, 0) + 2ρ(𝔲₁ ∩ 𝔭) = (3, 0, 0)`; with the harmonic coefficient of degree one, the
  six-dimensional standard representation of highest weight `(1, 0, 0)`, its cohomology has
  dimensions `1, 2, 1` in bidegrees `(1,1), (2,2), (3,3)`, the coefficients of `t⁰, t², t⁴` in
  `(1 + t²)² = 1 + 2t² + t⁴` shifted by `(1,1)`. The lift of `D₄` to `O(0,6)` is that six-dimensional
  representation, whose coefficient cohomology is the line `H⁰`. Its weight `(1, 0, 0)` has odd
  coordinate sum and is outside the domain of §3.4, so the projective coefficient constructions
  (§5.4, Layer 8) use only even `k`; the statement here does not.

*Needs:* MetaplecticAutomorphicForms §3.35; AutomorphicFormsOnReductiveGroups §§5.2, 5.4.

### Examples

For `k = 4`: `l = (2, 0, 0)` gives the torus weight `(1, −1, 1, −1)` and the Borel-dominant weight
`(1, 1, −1, −1)`; the lift of the antiholomorphic `D₅^∨`, `A_{q₁}(2, 0, 0)`, has lowest `K`-type
`(4, 0, 0)` and cohomology dimensions `1, 2, 1` in bidegrees `(1,1), (2,2), (3,3)`, while the lift of
the holomorphic `D₅` is `A_{q₀}(0, 0, 2)`, with cohomology only in bidegree `(4, 0)`, and its lift to
`O(0,6)` has highest weight `(2, 0, 0)`.

### Dependencies

Layers 1–2; MetaplecticAutomorphicForms §§3.33, 3.35; AutomorphicFormsOnReductiveGroups §§5.2, 5.4.

## Layer 4: harmonic Schwartz forms

The harmonic coefficient carrier, its pairing and the Fock normalization precede the global
coefficient comparison. The restriction computations test orientation, factorial and
negative-signature signs directly; both are needed because the real places contain compact and
noncompact factors.

Throughout, `V` is a real quadratic space of signature `(p, q)`, `m = p + q`, with orthonormal basis
`e₁, …, e_m` (`⟨e_i, e_i⟩ = +1` for `i ≤ p`, `−1` otherwise), and `p, q` are even (IP23, §8.1,
p. 48).

### 4.1 Harmonic symmetric tensors

Define `ℋ^ℓV` as the kernel of the contraction `S^ℓV → S^{ℓ−2}V` on `S^ℓV = Sym^ℓV ⊗ ℂ`,
`v₁⋯v_ℓ ↦ Σ_{i<j} ⟨v_i, v_j⟩ v₁⋯v̂_i⋯v̂_j⋯v_ℓ`, zero for `ℓ < 2`. Equip `S^ℓV` with the bilinear
pairing `⟨v₁⋯v_ℓ, w₁⋯w_ℓ⟩ = Σ_{s∈𝔖_ℓ} ∏_i ⟨v_i, w_{s(i)}⟩`, with no division by `ℓ!`, and let
`S^ℓV → ℋ^ℓV` be the orthogonal projection (IP23, §8.2, pp. 49–50, (8.1)). This is the symmetric
part of the traceless tensors `harmonicTensors` of RepresentationTheory/SchurWeyl Layer 9 for the
complexified form; for `q = 0` it is the space of harmonic polynomials of
GeometryOfNumbersAndQuadraticArithmetic §4.3.

- The contraction sends `v²` to `⟨v, v⟩` and is zero in degrees zero and one.
- The projection is the identity on `ℋ^ℓV` and kills its orthogonal complement, the image of
  multiplication by the quadratic element `Σ ⟨e_i, e_i⟩ e_i²`.
- For an isotropic `e`, `e^ℓ ∈ ℋ^ℓV` and `⟨e^ℓ, w^ℓ⟩ = ℓ!⟨e, w⟩^ℓ`.
- For `r = m/2 ≥ 2`, `ℋ^ℓV` is irreducible of highest weight `(ℓ, 0, …, 0)` with highest weight vector
  `(e₁ + ie₂)^ℓ`.

**Checks.**

- `ℋ⁰V = ℂ` with the identity projection, and `ℋ¹V = V_ℂ` with the original bilinear form.
- In degree two, `⟨v², w²⟩ = 2⟨v, w⟩²`; the divided-power convention would give `⟨v, w⟩²`.
- For `V = ℝ²` positive definite, `ℋ²V` is spanned by `e₁² − e₂²` and `e₁e₂`, of dimension two, and
  `(e₁ + ie₂)²` lies in it while `e₁²` does not.

*Needs:* RepresentationTheory/SchurWeyl Layer 9; AutomorphicFormsOnReductiveGroups §5.1.

### 4.2 The polynomial Fock comparison

For `ψ(x) = exp(2πix)`, let `S(V)` be the polynomial-times-Gaussian subspace of the Schrödinger
model (MetaplecticAutomorphicForms §§0.15–0.17), with `φ₀(x) = exp(−π Σ x_i²)`. The groups
`G = O(V)` and `G′ = SL₂(ℝ)` act on the Schwartz space of `V` through the real Weil representation
`ω` of MetaplecticAutomorphicForms §2.4c, which in this model is `ω(g)φ(x) = φ(g⁻¹x)`,
`ω(diag(a, a⁻¹))φ(x) = a^{m/2}φ(ax)` for `a ∈ ℝ^×`, `ω(n(b))φ(x) = exp(πib⟨x, x⟩)φ(x)` for the upper
unipotent `n(b)`, and `ω([[0, −1], [1, 0]])φ(x) = i^{(q−p)/2} ∫_V φ(y) exp(−2πi⟨x, y⟩) dy` for the
self-dual measure; `𝔤 = 𝔬(V)` and `𝔤′ = 𝔰𝔩₂(ℝ)` act by their derivatives. Proving that these
formulas give the Weil representation of that roadmap, whose generator formulas (its §2.5) are
stated for nonarchimedean fields only, and that the derivatives preserve `S(V)` is part of this
target (IP23, §8.3, p. 50). Prove that there is a `𝔤 × 𝔤′`-equivariant isomorphism `ι : S(V) ≃ ℂ[z₁, …, z_m]` with `ι(φ₀) = 1` such that, for a positive
coordinate `α ≤ p`, `x_α − (2π)⁻¹∂_α` corresponds to multiplication by `(2πi)⁻¹z_α` and
`x_α + (2π)⁻¹∂_α` to `2i ∂/∂z_α`, and for a negative coordinate `μ > p` the corresponding operators are
`−(2πi)⁻¹z_μ` and `−2i ∂/∂z_μ` (IP23, §8.3 and (8.2), pp. 50–51). The comparison concerns the algebraic
Gaussian subspace, not all Schwartz functions.

**Checks.**

- `(x_α + (2π)⁻¹∂_α)φ₀ = 0`, matching `2i ∂/∂z_α (1) = 0`.
- For `w = x₁ + ix₂` with both coordinates positive, `(x₁ + ix₂ − (2π)⁻¹(∂₁ + i∂₂))^N φ₀ = 2^N w^N φ₀`,
  so `ι(w^N φ₀) = (z₁ + iz₂)^N/(4πi)^N`; with both coordinates negative the same vector maps to
  `(−1)^N (z₁ + iz₂)^N/(4πi)^N`.
- A single coordinate is not isotropic: `ι⁻¹(z₁²) = (2πi)²(4x₁² − π⁻¹)φ₀`, not a multiple of
  `x₁²φ₀`; and a Schwartz function outside the Gaussian subspace has no polynomial preimage.

*Needs:* §4.1; MetaplecticAutomorphicForms §§0.15–0.17, 2.4c.

### 4.3 Harmonic Schwartz forms

Let `ℓ ≥ 0`. For `p > 0` define `φ_{q,ℓ} ∈ ℂ[z] ⊗ ⋀^q𝔭^* ⊗ S^ℓV` by
`φ_{q,ℓ} = (4πi)^{−(q+ℓ)} Σ_{α∈{1..p}^q} Σ_{β∈{1..p}^ℓ} z_α z_β ⊗ ω_α ⊗ e_β`, with
`ω_α = ω_{α₁,p+1} ∧ ⋯ ∧ ω_{α_q,p+q}`, and `φ′_{q,ℓ}` its image under the harmonic projection. For
`p = 0` define `φ_ℓ = (4πi)^{−ℓ} Σ_{β∈{1..m}^ℓ} z_β ⊗ e_β` and its harmonic projection `φ′_ℓ`. Prove
that `φ′_{q,ℓ}` is `K`-invariant, closed for the relative Lie algebra differential and of weight
`ℓ + m/2` for `K′ = U(1) ⊂ SL₂(ℝ)`, and that `φ′_ℓ` is `G`-invariant of weight `−ℓ − m/2` (IP23, §8.4,
pp. 51–52). The first formula is `2^{−q/2}` times the Funke–Millson form, whose constant is
`2^{q/2}(−i/4π)^{q+ℓ}` and whose coefficients lie in the tensor power `V^{⊗ℓ}`, composed with the
projection `V^{⊗ℓ} → S^ℓV` (FM06, §6.2, p. 25; IP23, §8.4, p. 51). The `K`-invariance with the
`K′`-character `ℓ + m/2` and the closedness are FM06, Theorems 5.6 and 5.7, p. 20, for that form; the
scalar and the `G`-equivariant projections `V^{⊗ℓ} → S^ℓV → ℋ^ℓV` preserve both.

- `dφ′_{q,ℓ} = 0`.
- The `K′`-character is `ℓ + m/2` for `p ≥ 1` and `−ℓ − m/2` for `p = 0`.
- The coefficient lies in `ℋ^ℓV`, and before projection `φ_{q,ℓ}` differs from `φ′_{q,ℓ}` by trace
  terms.

**Checks.**

- For `ℓ = 0` the projection is the identity and the coefficient is a scalar.
- The normalisation: `(4πi)^{−1} = −i/4π`, so the first constant is `2^{−q/2}` times Funke–Millson's,
  the ratio `1/2` at `(p, q) = (4, 2)`. At `ℓ = 0` the wedge pairings of `ω_{a5} ∧ ω_{b6}` with `ω^ε`
  of §4.5 are `1, −1, εi, εi` for `(a, b) = (1,1), (2,2), (1,2), (2,1)`, so the contraction is
  `(z₁ + εiz₂)²/(4πi)²`, whose preimage under `ι` is `(x₁ + εix₂)²φ₀` by §4.2; their constant would
  give `2(x₁ + εix₂)²φ₀`, twice the value of §4.5.
- For `p = 0` and `ℓ = 0`, `φ′₀ = φ₀` with `K′`-weight `−m/2`; for `(0, 6)` this is `−3`.
- For `(p, q) = (4, 2)` and `ℓ = 0` the form has degree two and `K′`-weight `+3`, so the linear theta
  integral pairs it with a vector of weight `−3` of the antiholomorphic input `D₃^∨`, whose lift is
  `A_{q₁}(0, 0, 0)` with its `(1,1)` class, the case `k = 2` of §3.5; against the holomorphic `D₃`,
  whose lift `A_{q₀}` has no `(1,1)` cohomology, the `U(1)`-integral of the weights `+3` and `+3`
  vanishes.
- The compact formula is not the first formula read at `p = 0`. There the index set
  `{1..0}^q × {1..0}^ℓ` is empty once `q + ℓ > 0`, so that reading gives `0` at `(p, q, ℓ) = (0, 6, 0)`,
  while the compact formula gives `φ′₀ = 1`. At `(0, 0, 0)`, the zero quadratic space, both index sets
  consist of the empty tuple, the empty products and the empty wedge are `1`, and both formulas give
  the constant `1`.

*Needs:* §§4.1–4.2; AutomorphicFormsOnReductiveGroups §5.2.

### 4.4 The harmonic restriction map

In the six-dimensional model of §3.1 take `V′ = span(e₁, e₂, e₅, e₆)` and `V₀ = span(e₃, e₄)`. Prove that
the composite `ℋ^ℓ(V′ ⊕ V₀) ⊂ S^ℓ(V′ ⊕ V₀) → S^ℓV′ → ℋ^ℓV′` is an `O(V′)`-equivariant retraction of
the harmonic inclusion, and that with `r` the symmetric restriction and `P` the harmonic projections,
`P_{V′} ∘ r = res ∘ P_{V′⊕V₀}` on `S^ℓ(V′ ⊕ V₀)`; raw restriction need not preserve harmonic tensors
(IP23, §8.5, (8.3), pp. 52–54).

**Checks.**

- A harmonic tensor supported in `V′` is fixed by the composite.
- `e₃² − e₄²` is harmonic in `V′ ⊕ V₀` and restricts to zero.
- For `ℓ = 2` and positive `V′` directions, `r(e₁e₃) = 0` while `r(e₁²) = e₁²` is not harmonic; its
  projection is `e₁² − (e₁² + e₂² − e₅² − e₆²)/4`, with the sign of the trace element read from the
  signature.

*Needs:* §§3.1, 4.1.

### 4.5 The noncompact Schwartz restriction formula

For signature `(4, 2)`, normalize `ω₁₅ ∧ ω₂₅ ∧ ω₁₆ ∧ ω₂₆ ↦ 1`, put
`ω^ε = (ω₁₅ + εiω₂₅) ∧ (ω₁₆ + εiω₂₆)` and `v^ε = (e₁ + εie₂)^ℓ/ℓ!` for `ε = ±1`. Prove that contracting
the restricted `φ′_{2,ℓ}` against `ω^ε` by the wedge pairing and against `v^ε` by the coefficient
pairing gives the Schwartz function `(x₁ + εix₂)^{ℓ+2} φ₀(x)` (IP23, Proposition 8.1, pp. 54–55).

**Checks.**

- For `ℓ = 0` the result is the quadratic `(x₁ + εix₂)²φ₀`, not the Gaussian.
- The factor `1/ℓ!` in `v^ε` cancels the `ℓ!` of the undivided pairing; with the divided pairing the
  result would carry an extra `1/ℓ!`.
- The two partial sums are `Σ_α z_α(ω_α ∧ ω^ε) = (z₁ + εiz₂)²` and `Σ_β z_β⟨e_β, v^ε⟩ = (z₁ + εiz₂)^ℓ`;
  in the first, `α = (1,1)` contributes `+1` and `α = (2,2)` contributes `−1` under the normalization
  `ω₁₅ ∧ ω₂₅ ∧ ω₁₆ ∧ ω₂₆ ↦ 1`, so the orientation is visible in the cross term `2εi z₁z₂`.

*Needs:* §§4.2–4.4.

### 4.6 The compact Schwartz restriction formula

For signature `(0, 6)`, with the same `V′` and `v^ε = (e₁ + εie₂)^ℓ/ℓ!`, prove that contracting the
restricted `φ′_ℓ` against `v^ε` gives `(x₁ + εix₂)^ℓ φ₀(x)` for every `ℓ ≥ 0` (IP23, Proposition 8.2,
p. 55, which prints an extra factor `(−1)^ℓ`). *Proof route:* by §4.4, and because the harmonic
projection is orthogonal and `v^ε` is harmonic, the contraction of the restricted `φ′_ℓ` equals that
of the restricted `φ_ℓ`; the sum over `β ∈ {1, 2, 5, 6}^ℓ` gives
`Σ_β z_β⟨e_β, v^ε⟩ = (Σ_j ⟨e_j, e₁ + εie₂⟩ z_j)^ℓ = (−1)^ℓ (z₁ + εiz₂)^ℓ`, since `⟨e_j, e_j⟩ = −1`;
by §4.2 for negative coordinates, `(4πi)^{−ℓ}(z₁ + εiz₂)^ℓ` corresponds to `(−1)^ℓ (x₁ + εix₂)^ℓ φ₀`.
The two factors `(−1)^ℓ` cancel. The application has `ℓ = k_v − 2` even, where the printed sign is
`1`.

**Checks.**

- At `x = e₁` the contraction equals `e^{−π}` for `ℓ = 0, 1, 2`; a factor `(−1)^ℓ` would give
  `−e^{−π}` at `ℓ = 1`.
- For `ℓ = 1`, `φ′₁ = (4πi)⁻¹ Σ_j z_j ⊗ e_j` corresponds to `−Σ_j x_j φ₀ ⊗ e_j` (§4.2), and the
  coefficient pairing gives `⟨e₁, e₁ + εie₂⟩ = −1`, `⟨e₂, e₁ + εie₂⟩ = −εi`, so the contraction is
  `(x₁ + εix₂)φ₀`: the sign of the Fock comparison and the sign of the negative definite pairing
  cancel.
- The exponent is `ℓ`, not `ℓ + 2`: there is no differential-form factor in the compact case.

*Needs:* §§4.2–4.4.

### Examples

For `k_v = 4` at a split place: `ℓ = 2` and the restricted noncompact contraction is
`(x₁ ± ix₂)⁴φ₀`; at a compact place it is `(x₁ ± ix₂)²φ₀`. These are the archimedean vectors of §7.5.

### Dependencies

Layer 3; RepresentationTheory/SchurWeyl Layer 9; GeometryOfNumbersAndQuadraticArithmetic §4.3;
MetaplecticAutomorphicForms §§0.15–0.17, 2.4c; AutomorphicFormsOnReductiveGroups §§5.1–5.2.

## Layer 5: Shimura data, coefficients and component characters

The group diagram becomes a diagram of specified Shimura data. The torus map constructs the component
character by pullback, without asserting a bijection of component sets. The rational coefficient
comparison connects the harmonic and quaternionic coefficient systems.

### 5.1 The Shimura diagram

Apply `Res_{F/ℚ}` to the diagram of §2.8. At `v ∈ Σ` take `h_U(z) = diag(z, z, z̄, z̄)` in the unitary
realization and `h_i(z) = diag(z, z̄)` on the block planes; outside `Σ` take the trivial cocharacter.
On the quaternionic exterior realization take `h_B(z) = diag(z², zz̄, zz̄)` in the basis of IP23. Prove
that the projective isomorphisms identify these data, that the block arrows are morphisms of Shimura
data, and that all data have reflex field `F_Σ` (IP23, §4.2, p. 23; §12.2.2, pp. 94–96). The Deligne
axioms are asserted for `d > 0`; for `d = 0` the construction is on finite Shimura sets with trivial
cocharacter and constant models, the definite pairs of §0.2 (§0.1). Canonical models exist by
ShimuraVarieties §6.7 and the arrows
give maps of canonical models over `F_Σ` by §8.5.

- Every datum of the diagram has reflex field `F_Σ`, with compatible base changes.
- The real cocharacters agree after the exceptional projective isomorphism.
- Compatible compact opens give maps of canonical models over `F_Σ`, agreeing with the double-quotient
  maps over `ℂ`.

**Checks.**

- At a real place outside `Σ` every `h` is trivial.
- The quaternionic product has complex dimension `2d` and the unitary variety `4d`.
- Replacing `z²` by `z` in `h_B` breaks compatibility with the exterior representation.

*Needs:* §§0.1, 2.8; ShimuraVarieties §§6.7, 8.5; ShimuraData §4.3.

### 5.2 The component torus

For `H̃_B` of §2.8, prove that its derived group is `(B₁¹ × B₂¹)/μ₂` and that its abelian quotient is
`T = {([t₁, t₂], α) : t₁t₂ = N(α)}`, with `(t₁, t₂)` modulo `(t, t⁻¹)`, the quotient map sending
`([b₁, b₂], α)` to `([Nrd b₁, Nrd b₂], α)`. Its centre `Z = {([t, 1], α) : t² = N(α)}` maps to `T` by
`([t, 1], α) ↦ ([t², 1], α) = ([t, t], α)`. The morphism of Shimura data to the zero-dimensional torus
datum of `T` (ShimuraVarieties §8.6) gives, by §8.5, a map `Sh_{H̃_B} → Sh_T` over `F_Σ`, used to
pull back functions on components (IP23, §4.3, pp. 23–24). No bijection of component sets is asserted:
the derived group is not simply connected, so ShimuraVarieties §8.7 does not apply.

- The two representatives `[t², 1]` and `[t, t]` agree modulo the anti-diagonal.
- The map to `T` is a morphism of Shimura data over `F_Σ`.
- The torus cocharacter factors through `j : Res_{F/ℚ}𝔾_m → T`, `j(s) = ([s, s], s)`, with components
  `zz̄` at `Σ` and `1` elsewhere.

**Checks.**

- If `N(α) = t²` then `([t, t], α)` satisfies `t₁t₂ = N(α)`.
- The kernel of `Z → T` is generated by `([−1, 1], 1)`.
- The derived group is not simply connected, so several component classes may lie over one torus
  class; no bijection is part of the API.

*Needs:* §§2.5, 5.1; ShimuraVarieties §§8.5, 8.6.

### 5.3 The component character class

Let `η` be a finite-order Hecke character of `𝔸_E^×/E^×𝔸_F^×` with trivial archimedean components. On
`T` put `η_T([t₁, t₂], α) = η((t₁t₂)⁻¹α) = η(α)`. The locally constant function `η_T` on `Sh_T`,
for a level on which `η` is trivial, pulls back to `c_η ∈ H⁰(Sh_{H̃_B}, ℚ(η))` (IP23, §4.3,
pp. 23–24; §10.4, pp. 68–69). The full idele-class character is used: the argument `(t₁t₂)⁻¹α` need
not have norm one, so a character defined only on `𝔸_E¹` cannot be evaluated there.

- On `([t, 1], α) ∈ Z` the value is `η(t⁻¹α) = η(α)`.
- Pullback along smaller levels preserves `c_η`.
- `c_η` has coefficients in `ℚ(η)`, and `Gal(ℚ̄/F_Σ)` acts on it through its permutation of
  components (ShimuraVarieties §4.3), fixing the coefficients.

**Checks.**

- For `η = 1` the class is the constant function `1`.
- `η_T(j(s)) = η(s⁻¹) = 1` for every `s ∈ 𝔸_F^×`.
- The value does not depend on the representative of `[t₁, t₂]`: `(t₁s, t₂s⁻¹)` gives the same
  product `t₁t₂`.

*Needs:* §5.2; ShimuraVarieties §§4.3, 8.6; GlobalNumberFields Layer 9.

### 5.4 Rational harmonic coefficients

Put `ℓ_v = k_v − 2`. Prove that the harmonic representation `ℋ^{ℓ_v}` of the real quadratic model
extends to the connected similitude group by `ν^{−ℓ_v/2}`, algebraic with trivial centre because
`ℓ_v` is even; that its pullback through the exceptional maps is the representation of the unitary
group of highest weight `((k_v−2)/2, (k_v−2)/2, −(k_v−2)/2, −(k_v−2)/2)` in the Borel order of IP23
§11.3 (§3.4 with the reordering `(1, 3, 2, 4)`); that the global coefficient has a `ℚ(k)`-form unique up
to homothety; and that its restriction to the block subgroup has a rational equivariant projection to
`τ_k^∨ ⊠ τ_k^∨` (IP23, §11.3, pp. 83–85; Proposition 12.2 and §12.2.3, p. 96; §§12.2.6 and 12.2.10,
p. 97). The projection is normalized by the harmonic inclusion and pairing of §4.1.

**Checks.**

- For `k_v = 2` all coefficients are trivial.
- For odd `ℓ` the twist `ν^{−ℓ/2}` is not an algebraic character, and the centre would act
  nontrivially.
- For `k_v = 4` the unitary highest weight is `(1, 1, −1, −1)`, the image of `(2, 0, 0)` under §3.4.

*Needs:* §§3.4, 4.1, 5.1; AutomorphicFormsOnReductiveGroups §5.7; ShimuraData §4.3.

### Examples

For `η` of order three on `𝔸_E^×/E^×𝔸_F^×` and a level on which `η` is trivial, `c_η` is constant on
each fibre of `Sh_{H̃_B} → Sh_T`, equal to the value of `η_T` at the image point, a cube root of unity;
its coefficient field is `ℚ(ζ₃)`. The Galois action on `Sh_T` is through the reflex norm, whose finite
image lies in `j(𝔸_{F,f}^×)`, where `η_T` is trivial (§10.5).

### Dependencies

Layers 0, 2–4; ShimuraVarieties §§4.3, 6.7, 8.5, 8.6; ShimuraData §4.3; AutomorphicFormsOnReductiveGroups
§5.7; GlobalNumberFields Layer 9.

## Layer 6: quaternionic theta transfer and near equivalence

The two lower-rank lifts identify the scalar periods. The rank-three backward lift constrains every
nearly equivalent automorphic representation. Its doubled residue is kept separate from the
positive-range Rallis inner product formula.

Throughout this layer `F` is a number field, `B` a division quaternion algebra over `F` split at every
archimedean place, `E/F` a quadratic extension embedded in `B`, and the dual pairs, splittings and
global theta lifts are those of MetaplecticAutomorphicForms §§3.23–3.28 and 5.6, in the convention
`θ(f) = ∫ Θ f` of the Conventions; §6.2 uses instead the Periods-I splitting of
gap:quaternionic-shimizu-lift, which its §3.32a compares with that of its §3.24.

### 6.1 Toric theta lifting and automorphic induction

Let `V = B` with the skew-Hermitian form `⟨x, y⟩ = x*κiy` for a fixed `κ ∈ F^×` and a trace-zero
`i ∈ E^×`, so that `GU(V)° ≃ E^×`, and let `η` be a
character of `𝔸_E^×/E^×` such that `η_v` does not factor through `N_{E_v/F_v}` at any place where
`B_v` is ramified. The theta lift `θ(η)`, defined on the norm-image subgroup and extended by zero
using `[𝔸^× : F^×N(𝔸_E^×)] = 2`, equals `π(η)_B`, the transfer to `B^×(𝔸)` of the automorphic
induction `π(η)` (IP23, §9.2, pp. 56–57; Lemma 9.1, p. 57). *Proof route:* at almost all places the
lift is the unramified induction, so strong multiplicity one identifies every constituent; nonvanishing
reduces to the theta lift of `χ = η|_{𝔸_E¹}` from `U(1)` to the rank-two skew-Hermitian space, for
the standard splitting of that unitary dual pair (MetaplecticAutomorphicForms §3.3), where
`L(1, χ) ≠ 0` and the Rallis inner product formula reduce it to local nonvanishing, given at the places
where `B` splits, archimedean ones included, by the unitary stable range of
gap:unitary-stable-range and at the places where `B` ramifies by the conservation relation
(MetaplecticAutomorphicForms §3.16).

**Checks.**

- A character factoring through the norm at a place where `B` ramifies is excluded: the local lift to
  the ramified quaternionic space vanishes.
- For `χ = 1` the factor `L(s, χ)` has a pole at `s = 1` and the argument does not apply; the
  hypothesis forces `χ_v ≠ 1` at every ramified place.
- The central character of `π(η)` is `η|_{𝔸^×} ξ_E`; for `η` trivial on `𝔸^×` it is `ξ_E`.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R16.4.4, R17.3.1, R17.4.16;
MetaplecticAutomorphicForms §§3.3, 3.16, 3.23, 3.24, 5.6, 6.13, 6.14 and gap:unitary-stable-range;
AutomorphicLFunctionsAndLocalFactors §AL.3.6.3 (Rankin–Selberg nonvanishing on the boundary, at
`GL₁ × GL₁`); §0.4.

### 6.2 Quaternionic product theta lifting

Let `B = B₁·B₂` in the Brauer group, `V = B₁ ⊗_E B₂` the two-dimensional skew-Hermitian `B`-space with
`GU(V)° ≃ (B₁^× × B₂^×)/F^×`, and `σ_i` irreducible unitary cuspidal representations of `B_i^×(𝔸)` with
the same central character, with transfers `π_i` to `GL₂(𝔸)`. Form `θ(σ₁ ⊠ σ₂)` with the Periods-I
splitting of gap:quaternionic-shimizu-lift, which is defined on the whole similitude dual pair:
the lift is defined on the elements of `B^×(𝔸)` whose reduced norm is positive at the real places
where `B₁` or `B₂` ramifies, and extended to `B^×(𝔸)` by left `B^×(F)`-invariance. Prove that
`θ(σ₁ ⊠ σ₂) = 0` if `π₁ ≠ π₂`, and that if `π₁ = π₂` it is the transfer of `π_i` to `B^×(𝔸)`, which
exists (IP23, §9.3, pp. 57–58; Lemma 9.2, p. 58). No condition on `Σ` is imposed and no comparison of
splittings is used; the splitting of §3.24 enters only in §7.4. *Proof route:* the see-saw identity
(MetaplecticAutomorphicForms §6.15) for this splitting pairs `θ(σ₁ ⊠ σ₂)` with `f′ ∈ σ̄` against
`σ₁ ⊠ σ₂` paired with the lift of `σ̄` to `GU(V)°`, which is the quaternionic Shimizu lift
`π̄_{B₁} ⊠ π̄_{B₂}` for the same splitting (gap:quaternionic-shimizu-lift).

**Checks.**

- If the two cuspidal transfers differ, every theta period vanishes.
- `(t, t⁻¹)` acts trivially on `V`, so `σ₁ ⊠ σ₂` descends to `GU(V)°` only with equal central characters.
- For `B₁ = B₂` the class `[B] = 2[B₁]` is zero and `B ≃ M₂(F)` is split, outside the standing
  hypothesis of this layer: the statement there is the classical lift from `GL₂` to
  `GSO(B₁, Nrd) ≃ (B₁^× × B₁^×)/F^×` (locally MetaplecticAutomorphicForms §3.38), which
  gap:quaternionic-shimizu-lift, stated for every `B = B₁·B₂`, covers; the division case begins at
  `B₁ ≄ B₂` (§0.4).
- For `F = ℚ`, `Ram(B₁) = {∞, 2}` and `Ram(B₂) = {∞, 3}` (`d = 0`) the lift is first defined on the
  `h` with `Nrd(h_∞) > 0`; `B` is ramified exactly at `{2, 3}` and split at `∞`, so `B^×(ℚ)` contains
  elements of negative reduced norm, and the extension reaches all of `B^×(𝔸)`.

*Needs:* §2.6; GL2AutomorphicRepresentationsAndTransfer §§R16.4.4, R17.3.1;
MetaplecticAutomorphicForms §§3.23, 3.38, 5.6, 6.15 and gap:quaternionic-shimizu-lift.

### 6.3 The backward-lift doubling point

Let `X` be the rank-three skew-Hermitian `B`-space of §1.6 with `U(X)` anisotropic over `F`,
`G = GU_B(X)°`, `H_N^+ = {h ∈ B^×(𝔸) : Nrd(h) ∈ N(𝔸_E^×)}` and `τ` an irreducible unitary automorphic
representation of `H_N^+`. Write `X□ = X ⊕ X⁻` for the doubled space, `X⁻` being `X` with the
negated form, and `W = B` for the one-dimensional Hermitian `B`-space, with `GU(W) = B^×`. Let
`I_v(s)` be the degenerate principal series of `U(X□_v)°`, the functions with
`F(pg) = |Nrd(a)|^{s+5/2} F(g)` for `p` in the Siegel parabolic with Levi component `a ∈ GL₃(B_v)`,
that is the normalized induction of `|Nrd(a)|^s`, since `δ_P(a)^{1/2} = |Nrd(a)|^{5/2}`; let
`a_v(s) = ζ_v(2s)ζ_v(2s−2)ζ_v(2s−4)`, `b_v(s) = ζ_v(2s+1)ζ_v(2s+3)ζ_v(2s+5)` and
`M_v*(s) = (b_v(s)/a_v(s)) M_v(s) : I_v(s) → I_v(−s)`; and let `R(W_v) ⊂ I_v(−3/2)` be the span of the
functions `g ↦ ω_v(g)φ(0)`, for `φ` in the Schwartz space of the Weil representation `ω_v` of the
dual pair `(U(X□_v), U(W_v))` (the doubling Schwartz map of gap:quaternionic-doubling-residue).
Prove that `M_v*(s)` is holomorphic for `Re s ≥ 0` with image `R(W_v)` at `s = 3/2`, that for each
`v` there exist a holomorphic section and vectors for which the local doubling integral `Z_v(s)` is
holomorphic and nonzero at `3/2`, and that for normalized unramified data the global doubling integral
is
`L^S(s+1/2, ad τ × ξ_E) ζ^S(s+3/2) ζ^S(s+1/2) ζ^S(s−1/2) / (ζ^S(2s+1) ζ^S(2s+3) ζ^S(2s+5))` times
`∏_{v∈S} Z_v(s)`, so that suitable data give a nonzero simple residue at `s = 3/2` (IP23, §9.5,
Lemma 9.7, p. 63; (9.3) and Lemma 9.8, pp. 63–64). No holomorphy for all data is asserted.

**Checks.**

- The quotient `b_v/a_v` at `s = 3/2` is `ζ_v(4)ζ_v(6)ζ_v(8)/(ζ_v(3)ζ_v(1)ζ_v(−1))`, finite for
  nonarchimedean `v`.
- At `s = 3/2` the global factor contains `ζ^S(s−1/2) = ζ^S(1)`, the source of the simple pole.
- The positive-range Rallis value formula of MetaplecticAutomorphicForms §6.13 is not used at this
  residue.
- The exponent `s + 5/2` already contains the half-modulus. The unipotent radical of the Siegel
  parabolic is a form of `⋀²` of a six-dimensional space, of dimension `15`, on which the Levi acts
  with determinant `det⁵`, so `δ_P(a) = |Nrd(a)|⁵`. Hence `M_v(s)` sends exponent `s + 5/2` to
  `−s + 5/2`, and the image at `s = 3/2` has exponent `1`; reading `|Nrd(a)|^{s+5/2}` as the inducing
  character of a normalized induction would give the exponent `s + 5 = 13/2` at `s = 3/2`.

*Needs:* §§1.6, 3.1; MetaplecticAutomorphicForms §§3.3c, 3.7, 6.10–6.11 and
gap:quaternionic-doubling-residue.

### 6.4 Nonvanishing of the backward lift

In the setting of §6.3, assume that the lift `Π = θ(τ)` of `τ` to `G` is nonzero and cuspidal. If `Π′` is
an irreducible unitary automorphic representation of `G` with `Π′_v ≃ Π_v` for almost all `v`, then the
backward lift `θ(Π̄′)` to `H_N^+` is nonzero (IP23, Lemma 9.6 and §9.5, pp. 61–64). *Proof route:*
factor the doubling integral (§6.3), choose local data with nonzero holomorphic local integrals, apply
the second-term Siegel–Weil identity at `s = 3/2` (gap:quaternionic-doubling-residue) and unfold the
residue into the inner product of two backward theta lifts.

**Checks.**

- Near equivalence is agreement at almost all places, not at one place.
- `θ(Π̄′)` uses the conjugated input; the unconjugated lift is the lift of `Π′^∨`.
- Anisotropy is used for convergence and to identify the residue; it holds when `d < n`, because a
  compact real localization excludes an `F`-split torus.

*Needs:* §6.3; MetaplecticAutomorphicForms §§5.6, 6.4, 6.12 and gap:quaternionic-doubling-residue;
AdelicAlgebraicGroups §3.4.

### 6.5 Near-equivalence rigidity of theta lifts

Under the hypotheses of §6.4, prove that every irreducible unitary automorphic `Π′` of `G` nearly
equivalent to `θ(τ)` is `θ(τ′)` for an irreducible automorphic representation `τ′` of `H_N^+` nearly
equivalent to `τ`; one takes `τ′` to be the complex conjugate of `θ(Π̄′)` (IP23, Proposition 9.5,
p. 61; §9.5.4, p. 64). The statement concerns these rank-three anisotropic lifts, not strong
multiplicity one for all of `G`.

**Checks.**

- The candidate is the conjugate of `θ(Π̄′)`, not `θ(Π̄′)` itself.
- Local Howe duality (MetaplecticAutomorphicForms §§3.7, 3.34) gives irreducibility of `θ(Π̄′)` and
  `θ(Π̄′)_v ≃ τ̄_v` at almost all `v`.
- The unramified parameters are recovered by MetaplecticAutomorphicForms §3.36:
  `θ(τ_v)` is the constituent of the induced representation from
  `(χ₁χ₂⁻¹ξ_E) ⊗ |·| ⊗ (χ₂|·|^{−1/2})∘N` for `τ_v` a constituent of `Ind(χ₁ ⊗ χ₂)`.

*Needs:* §6.4; MetaplecticAutomorphicForms §§3.7, 3.34, 3.36; GL2AutomorphicRepresentationsAndTransfer
§R16.4.4.

### Examples

For `F` real quadratic and `d = 1`, the rank-three space has signature `(4,2)` at the split place and
`(0,6)` at the other, so `U(X)` is anisotropic and every automorphic form on `G` is cuspidal; the
toric lift of §6.1 with `η` non-norm at the two ramified places of `B` is the `B^×` transfer of a
dihedral form of central character `ξ_E`.

### Dependencies

Layers 0–3; MetaplecticAutomorphicForms §§3.3, 3.3c, 3.7, 3.16, 3.23–3.28, 3.34, 3.36, 3.38, 5.6, 6.4,
6.10–6.15 and gap:unitary-stable-range, gap:quaternionic-shimizu-lift,
gap:quaternionic-doubling-residue; GL2AutomorphicRepresentationsAndTransfer §§R16.4.4, R17.3.1, R17.4.16;
AutomorphicLFunctionsAndLocalFactors §AL.3.6.3; AdelicAlgebraicGroups §3.4.

## Layer 7: simultaneous nonvanishing of restricted theta classes

The same finite data, character and auxiliary representation work for every archimedean sign. The
finite support-place argument puts the scalar theta form on the norm subgroup; an adelic translation
then makes its product with the toric lift nonzero before spectral projection.

### 7.1 Global theta data

In the distinct-algebra case of §0.4 choose a CM quadratic `E ⊂ B_i`, write `B_i = E ⊕ Ej_i`, and take
the spaces and groups of §2.8. Define the *global theta data* to consist of: `H = B^×`, the subgroups
`H_N^+ = {h : Nrd(h) ∈ N(𝔸_E^×)}` and `H_∞^+ = {h : Nrd(h_v) > 0 at every real v}`; at `v ∈ Σ` the
Schwartz form `φ′_{2,ℓ_v}` of §4.3 and at real `v ∉ Σ` the form `φ′_{ℓ_v}`, `ℓ_v = k_v − 2`, with a
pure-tensor finite Schwartz vector; and an irreducible unitary automorphic `τ` of `H_N^+` with central
character `ξ_E`, of antiholomorphic minimal type of weight `k_v + 1` at `Σ` and holomorphic type
outside `Σ` (IP23, §§10.1–10.4, pp. 65–68; §12.2.4, pp. 96–97). The exterior isometry group is
`F`-anisotropic because some real localization is `O(0,6)`, so its adelic quotient modulo the centre is
compact (AdelicAlgebraicGroups §3.4) and every automorphic form on it is cuspidal
(AutomorphicFormsOnReductiveGroups §4.2).

*The sign vectors.* For each `ε ∈ {±1}^{Σ_∞}` let
`f_i^ε = (⊗_{v∈Σ_∞} f_{i,v}^{ε_v}) ⊗ (⊗_{v finite} f_{i,v})` be a nonzero pure tensor in the transfer
`π_{B_i} = π_i` of §0.1, `i = 1, 2`, whose local factors are all nonzero, such that, for the circle
`E_v¹ ≃ ℂ¹ ⊂ B_{i,v}^×` given by `E ⊂ B_i`: at `v ∈ Σ` the factors `f_{1,v}^{ε_v}` and `f_{2,v}^{ε_v}`
have weights `ε_v k_v` and `−ε_v k_v`; at a real `v ∉ Σ` they have weights `ε_v(k_v − 2)` and
`−ε_v(k_v − 2)` (each such vector is unique up to a nonzero scalar); the finite factors `f_{i,v}` do
not depend on `ε`; and `f_{1,v} ⊠ f_{2,v}` is fixed by `K_v` for a compact open `K = ∏_v K_v` (IP23,
§10.5, (10.2)–(10.3), p. 70). Put `f^ε = f₁^ε ⊠ f₂^ε`, the *sign vectors*.

- At `Σ` the source type is the antiholomorphic discrete series of weight `−k_v − 1`; outside `Σ` the
  holomorphic one of weight `k_v + 1`.
- `H_N^+ ⊂ H_∞^+`, and the inclusion is strict in general.
- The total form degree is `2d` and the coefficient is the `ℚ(k)`-rational harmonic system of §5.4.

**Checks.**

- For real quadratic `F` and `d = 1`, the global form has degree two.
- For `d = 0` every archimedean factor is the compact Schwartz form.
- Positive real reduced norms do not imply membership in `N(𝔸_E^×)`: a finite place where `E` is
  inert and `Nrd(h_v)` has odd valuation excludes `h` from `H_N^+`.

*Needs:* §§0.1, 0.4, 2.8, 3.5, 4.3, 5.4; MetaplecticAutomorphicForms §§3.23, 3.24; AdelicAlgebraicGroups §3.4;
AutomorphicFormsOnReductiveGroups §4.2.

### 7.2 The theta cohomology class

For global theta data and a minimal-type vector `φ ∈ τ`, lifting the tensor-valued Schwartz form gives
a closed `2d`-form `θ(φ)` on the quaternionic exterior Shimura variety with the coefficient of §5.4.
The central transformation of the splitting, `s_v(zg) = ξ_{E,v}(z)^m s_v(g)` with `m = 3`
(MetaplecticAutomorphicForms §3.24; IP23, Proposition A.1, p. 101), cancels the central character
`ξ_E` of `τ`, so the form has trivial central character. Define the class `ξ_τ` as its cohomology class
(IP23, §10.4, pp. 68–69). It is linear in `φ` and in the Schwartz vector; MetaplecticAutomorphicForms
§5.6 is applied to `φ̄`.

- The theta integral has a closed tensor-valued representative.
- Every smooth finite adelic input defines the class at a sufficiently small level, compatibly with
  pullback.
- The class is linear in the Schwartz vector and in the automorphic vector.

**Checks.**

- A zero Schwartz or automorphic vector gives the zero class.
- For `d = 1` the representative has degree two.
- `ξ_E^3 = ξ_E` cancels the source central character `ξ_E`; the resulting class has trivial central
  character, not `ξ_E`.

*Needs:* §§4.3, 5.4, 7.1; MetaplecticAutomorphicForms §§3.24, 5.6.

### 7.3 Central projection and normalized descent

Restrict `ξ_τ` to `H̃_B`. For the centre `Z = {(z, α) : z² = N(α)}` use `p(z, α) = z⁻¹α ∈ E¹` and project
by `∫ ξ_τ(zg)(η∘p)(z) dz` over the compact quotient `Z(G̃)(𝔸)Z(F)∖Z(𝔸)` of volume one; multiply the
resulting form by `c_η` of §5.3. Put `G(𝔸)^+ = {g ∈ G(𝔸) : ν(g) ∈ N(𝔸_E^×)}`, the image of `H̃_B(𝔸)`
under the first projection, for `G` and `H̃_B` of §2.8. For `g ∈ G(𝔸)^+` choose `α_g` with
`N(α_g) = ν(g)` and evaluate at `(g, α_g)` times `η(α_g)`; this is independent of `α_g`. Descend by
the normalized trace of §0.3, with
the volumes of the levels taken for the fixed rational Haar measures of §0.3 on the effective groups
(the quotients by the closures of the rational points of the centres), extend by zero off
`G(F)G(𝔸)^+` and average over a compact open with volume one (IP23, §10.4, pp. 68–70; Remark 2.2,
p. 17).

- The projected form transforms under the centre by `(η∘p)⁻¹`.
- The product `ξ_η(g, α_g)η(α_g)` does not depend on `α_g`.
- Normalized trace and average are compatible with level change, by the degree formula of §0.3;
  traces go to the actual image, extended by zero.
- On cohomology the normalized trace and the average preserve `L`-structures: the volume ratio is
  in `ℚ_{>0}`, and averaging a `K′`-invariant class over `K ⊃ K′` with volume one is `1/[K : K′]`
  times the sum of its translates by `K/K′`.

**Checks.**

- For `η = 1` this is projection to central invariants.
- A `K`-invariant form is unchanged by averaging over `K` with volume one.
- Replacing the rational Haar measure on one effective group by another multiplies the descended
  form by a positive rational number; the irrational relative normalization of the negative control
  of §0.3 would multiply it by `√2`, harmless for the nonvanishing of this layer but not for the
  rational structure used in §10.3.
- On an adelic component without a norm lift the unextended formula is not evaluated; the value there
  is zero by extension.

*Needs:* §§0.3, 2.8, 5.3, 7.2; MetaplecticAutomorphicForms §6.15.

### 7.4 The restricted theta see-saw

Assume `d ≥ 1`. For the projected and descended form and the sign vectors `f^ε = f₁^ε ⊠ f₂^ε` of
§7.1, prove that pairing against their coefficient and differential factors equals the scalar theta
integral of IP23 Lemma 10.2, and that the compatible-splitting see-saw rewrites it as the
triple-product integral over `H_N^+` of `θ_{φ^ε}(f^ε)·θ_{φ₀}(η)·φ`, with the central quotients and
measures of IP23 §10.4 and absolute convergence from compactness and cuspidality (IP23, Lemma 10.2,
p. 71; (10.7), p. 72). In the see-saw the pair attached to `V = B₁ ⊗_E B₂` carries the splitting
induced from the exterior space (MetaplecticAutomorphicForms §§3.24, 3.28). Because `F` is totally
real, `E` is CM and `B₁, B₂` split at the real places of `Σ ≠ ∅`, MetaplecticAutomorphicForms §3.32a
identifies it with the Periods-I splitting of gap:quaternionic-shimizu-lift on the norm-image
group, so `θ_{φ^ε}(f^ε)` is the
restriction to `H_N^+` of the lift of §6.2 (IP23, §10.2, p. 66; Proposition A.14, p. 113).

**Checks.**

- All signs `ε` use the same finite Schwartz data.
- The see-saw is equation (10.7), p. 72; equation (10.8) is a later `K`-type identity.
- Fubini is applied only after convergence and matching central quotients are established.
- For `F = ℚ`, `Ram(B₁) = {∞, 2}`, `Ram(B₂) = {∞, 3}` and `E = ℚ(i)` (`d = 0`) no real place is split
  in both algebras, so §3.32a does not apply. The norm-one groups and the two scalar embeddings of
  MetaplecticAutomorphicForms §§3.30–3.31 reach only the elements `(g₁, g₂, h)` with `Nrd(g₁)` a
  norm from `E`, while the isometry group of `V`, over which the theta integral runs, contains
  `[x₁, x₂]` at the place `3` with `Nrd(x₁) = 3` and `Nrd(x₂) = 1/3`, and `3` is not a norm from the
  unramified quadratic extension `ℚ₃(i)`: a comparison on the norm subgroup alone does not identify
  the two lifts.

*Needs:* §§4.5, 4.6, 6.2, 7.1, 7.3; MetaplecticAutomorphicForms §§3.24, 3.28, 3.32a, 6.15 and
gap:quaternionic-shimizu-lift (the Periods-I splitting compared in §3.32a).

### 7.5 The simultaneous sign theta vectors

For each `ε ∈ {±1}^{Σ_∞}` take the archimedean Schwartz factor `(x₁ + ε_v ix₂)^{k_v} φ₀` above `Σ` and
`(x₁ + ε_v ix₂)^{k_v−2} φ₀` elsewhere (IP23, (10.4)). Prove that finite Schwartz data can be chosen once
so that, for the sign vectors `f^ε` of §7.1, the lift `θ_{φ^ε}(f^ε)` of §6.2 is nonzero for every
`ε`, lies in `π_B`, and has minimal weights `+k_v` at `Σ` and
`−k_v` elsewhere; its archimedean Whittaker coefficient is nonzero and independent of `ε` because the
exponents are even, so the `f^ε` can be rescaled to give one nonzero automorphic form (IP23, Lemma 10.3
and (10.9)–(10.12), pp. 73–76).

**Checks.**

- A different finite Schwartz function for each sign is not allowed.
- The archimedean exponents `k_v` and `k_v − 2` are even, so the sign `ε_v^{k_v}` is `+1`.
- At `k_v = 2` the factor outside `Σ` is the Gaussian itself.
- For `f^ε = 0` the lift is `0` for every Schwartz function: the nonvanishing uses the sign vectors
  of §7.1, which are nonzero.

*Needs:* §§4.5, 4.6, 6.2, 7.1; AutomorphicSpectralTheory §§0.25–0.26.

### 7.6 Moving theta support to the norm subgroup

Assume a finite place `v₀` at which `E/F` is ramified, `B₁` and `B₂` are split, and the level is
hyperspecial. Prove that the restriction to `H_N^+` of the common sign theta form of §7.5 is nonzero
after a translation by an element of the block group fixing the hyperspecial vectors: a unit at `v₀`
outside the local norm group exchanges the two norm-support cosets (IP23, Lemma 10.4, pp. 75–76).

**Checks.**

- The ramification of `E` at `v₀` is used: at an unramified place every unit is a norm.
- The hyperspecial condition at `v₀` keeps the finite vectors fixed by the translation.
- The two cosets are those of `F^×N(𝔸_E^×)` in `𝔸^×`, of index two.

*Needs:* §§2.5, 7.5; ClassFieldTheory §5.4 and Layer 8.

### 7.7 The auxiliary finite-order character

Prove that there is a character `η` of `𝔸_E^×/E^×` with `η|_{𝔸^×} = 1`, `η_v = 1` at every real place,
and `η_v` not factoring through the norm at every place where `B` ramifies; it has finite order (IP23,
Lemma 10.5, p. 76). *Proof route:* by Hilbert 90, `x ↦ x/σ(x)` identifies `E^×/F^×` with `E¹`; choose
characters `χ_v` of `E_v¹` with `χ_v² ≠ 1` at the ramified places, extend their product from the
compact image of `∏_{v∈S} E_v¹` to `𝔸_E¹/E¹` by the extension criterion of
GL2AutomorphicRepresentationsAndTransfer §R16.1.8, and put `η(x) = χ(x/σ(x))`. Continuity gives an open
subgroup of the finite ideles on which `η` is trivial, and finiteness of the resulting quotient gives
finite order.

- `η` is trivial on `𝔸^×` and on `E^×`.
- At every place ramified in `B`, `η_v` does not factor through `N_{E_v/F_v}`.
- The automorphic induction of `η` has central character `ξ_E`.

**Checks.**

- At every real place `η_v` is trivial.
- If `χ_v` has order two then `η_v|_{E_v¹} = χ_v²` is trivial and `η_v` factors through the norm; this
  choice is rejected.
- For `x ∈ 𝔸^×`, `x/σ(x) = 1` and `η(x) = 1`.

*Needs:* §7.1; GL2AutomorphicRepresentationsAndTransfer §R16.1.8; GlobalNumberFields Layer 9; Mathlib
`groupCohomology.H1ofAutOnUnitsUnique`.

### 7.8 The auxiliary toric theta vector

For `η` of §7.7, prove that there is finite Schwartz data `φ₀` with archimedean Gaussian factors,
`φ₀,v(0) = 1`, such that `θ_{φ₀}(η)` is nonzero on `H_N^+`, with real weights `+1` at `v ∈ Σ` and `−1`
elsewhere (IP23, Lemma 10.6 and (10.12), pp. 76–77).

**Checks.**

- At each real place the Gaussian value at zero is exactly one.
- The weights `±1` are those of the rank-one Gaussian under §4.3 with `m = 2`.
- By §6.1 the lift is the `B^×` transfer of `π(η)`, so it is nonzero as an automorphic representation;
  the content is a nonzero vector with the stated archimedean types.

*Needs:* §§4.2, 6.1, 7.7.

### 7.9 The minimal triple-product type

Prove that if the pointwise product `θ_{φ^ε}(f^ε)·θ_{φ₀}(η)` is nonzero, then at each real place it
generates the minimal discrete-series type of weight `k_v + 1`, holomorphic at `Σ` and antiholomorphic
outside `Σ`; its contragredient is the type required of `τ` in §7.1 (IP23, Lemma 10.7, p. 77).

**Checks.**

- At `Σ` the weights add: `k_v + 1`, not `k_v − 1`.
- Outside `Σ` the factors have weights `−k_v` (§7.5) and `−1` (§7.8), summing to `−(k_v + 1)`: the
  antiholomorphic type of weight `k_v + 1`.
- The lowering operator acts on functions as a derivation, so the product of two functions it kills,
  of weights `k_v` and `1`, is killed by it and has weight `k_v + 1`; by the `K`-type rays and the
  lowering formula `Y_c v_ℓ = (k − ℓ)v_{ℓ−2}/2` of AutomorphicFormsOnReductiveGroups §2.6, a nonzero
  such square-integrable vector generates a holomorphic discrete series of weight `k_v + 1`, of which
  it is the lowest weight vector, and outside `Σ`, with the raising operator, an antiholomorphic one,
  of which it is the highest weight vector. A product killed by neither operator, such as weights
  `k_v` and `−1`, would not determine the type.

*Needs:* §§7.5, 7.8; AutomorphicFormsOnReductiveGroups §2.6.

### 7.10 Simultaneous nonvanishing of the restriction

Assume `d ≥ 1`, let `f^ε` be the sign vectors of §7.1, and assume the place `v₀` of §7.6 exists.
Prove that there is one choice of `τ`, `φ`, `η` and Schwartz data for which the
descended theta class pairs nontrivially with every one of the `2^n` sign vectors `f^ε` (IP23,
Proposition 10.1, pp. 70–71; Lemma 10.8 and §10.9, pp. 77–78). *Proof route:* by §7.4 the pairing
is a triple-product integral over `H_N^+`; translate to a common connected real quotient; the two
nonzero real-analytic restrictions have nonzero product; project it on the compact quotient onto a
nonzero irreducible summand (AutomorphicSpectralTheory §4.7), take `τ` its contragredient and a
vector with nonzero period, and use §7.5 for all `ε` at once.

**Checks.**

- "For every sign there exist separate data" is weaker and is not this statement.
- For `F` real quadratic and `d = 1` there are `2² = 4` sign vectors, two signs at the split place and
  two at the compact place, and the statement gives four nonzero pairings for one class; when
  `k_v = 2` at the compact place both signs there give the weight `±(k_v − 2) = 0`, so the two vectors
  there agree up to a scalar and the four pairings are two up to scalars.
- The hypothesis at `v₀` is part of the statement; §10.2 shows that a suitable `E` exists.
- If one factor `f_{1,v}` were zero, every `f^ε` would be zero and every pairing `0` by linearity (§7.2):
  the sign vectors of §7.1 are required nonzero, with nonzero local factors.
- For `d = 0` the statement is not made: §7.4 identifies the two splittings of `B₁ ⊗_E B₂` through
  MetaplecticAutomorphicForms §3.32a, which needs a real place split in `B₁` and `B₂`; the end
  theorems for `d = 0` do not use this layer (§§10.7–10.8).

*Needs:* §§7.4, 7.5, 7.6, 7.9; MetaplecticAutomorphicForms §6.15; AutomorphicSpectralTheory §4.7.

### Examples

For `F` real quadratic, `Σ = {∞₁}` and `k = (2, 2)`: the archimedean factors are `(x₁ ± ix₂)²φ₀` at
`∞₁` and `φ₀` at `∞₂`; there are four sign vectors, and §7.10 gives one class pairing nontrivially with
all four.

### Dependencies

Layers 0–6; MetaplecticAutomorphicForms §§3.23, 3.24, 3.28, 3.32a, 5.6, 6.15 and
gap:quaternionic-shimizu-lift; AutomorphicSpectralTheory §§0.25–0.26, 4.7; AdelicAlgebraicGroups §3.4;
AutomorphicFormsOnReductiveGroups §§2.6, 4.2; ClassFieldTheory §5.4 and Layer 8;
GL2AutomorphicRepresentationsAndTransfer §R16.1.8; GlobalNumberFields Layer 9; Mathlib
`groupCohomology.H1ofAutOnUnitsUnique`.

## Layer 8: the unitary eigenspace and its Hodge type

The rational Hecke space contains every coefficient conjugate of the theta eigenspace. Degree selection
isolates the `q₁` contribution at each split place, and the coefficient-normalized Hodge calculation
proves actual type `(d,d)` rather than inferring it from relative cochain bidegrees.

In this layer `G = GU(V)` for the four-dimensional Hermitian `E`-space `V = B₁ ⊥ B₂`, with
`G_v ≃ GU(2,2)` at `v ∈ Σ` and `GU(4)` at real `v ∉ Σ`, `G′ = U(V)`, and `Π = θ(τ)` is the theta lift of
§7.10, transported to `G̃ = Res_{F/ℚ} G` and to the quaternionic exterior group by §2.8 (IP23, §11.3,
pp. 83–85).

### 8.1 The unramified parameter of the theta lift

Choose an irreducible unitary cuspidal `σ` of `GL₂(𝔸_F)` with central character `ξ_E` such that `τ` is
a constituent of the restriction of the `B^×` transfer of `σ` (gap:norm-subgroup-restriction), and let
`σ_E` be its base change to `GL₂(𝔸_E)` (GL2AutomorphicRepresentationsAndTransfer §R17.4.2), independent of
the choice. Prove that for almost all `v`, `Π′_v` (the restriction to `G′`) is the unramified constituent
of the induced representation from `η_v|·|_{E_v}^{1/2} ⊗ η_v|·|_{E_v}^{−1/2}`, where
`σ_{E,v} = Ind(η_v ⊗ η_v⁻¹)`; that is, `Π` has the formal parameter `ψ = σ_E ⊠ Sym¹` (IP23, proof of
Proposition 11.4, pp. 85–86, using Lemmas 6.1 and 9.4). Prove moreover that if `σ_E` is cuspidal it is
conjugate-orthogonal, in the sense that the partial Asai `L`-function `L^S(s, σ_E, As⁺)` has a pole at
`s = 1`, and that otherwise `σ_E = χ ⊞ χ⁻¹` for a character `χ` of `𝔸_E^×/E^×` trivial on `𝔸^×` with
`χ² ≠ 1` (IP23, (11.1) and Lemma 11.1, pp. 79–80). *Proof route:* at unramified places
`As⁺(BC(σ_v)) = Sym²σ_v ⊕ (∧²σ_v ⊗ ξ_{E,v})`, so `L^S(s, σ_E, As⁺) = L^S(s, Sym²σ) ζ_F^S(s)`; the
partial `L^S(s, Sym²σ)` is holomorphic and nonzero at `s = 1` by the adjoint lift and boundary
nonvanishing; in the dihedral case `σ` is the induction of `χ` with `χ^σ ≠ χ`.

**Checks.**

- The base change need not be cuspidal: for `σ = π(χ)` induced from `E` it is `χ ⊞ χ^σ`.
- `τ` itself is a representation of a subgroup and has no `GL₂` transfer; the parameter is read from `σ`.
- `σ` here has central character `ξ_E` and is distinct from the representation `π` of §0.1, which has
  trivial central character.

*Needs:* §§3.2, 6.5, 7.10; GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.4.2, R17.4.13,
R17.4.16 and gap:norm-subgroup-restriction; MetaplecticAutomorphicForms §3.36;
AutomorphicLFunctionsAndLocalFactors §AL.3.6.3 (Rankin–Selberg nonvanishing on the boundary).

### 8.2 The three cohomological modules of `U(2,2)`

For even `k ≥ 2` let `λ = (k/2 − 1, k/2 − 1, −k/2 + 1, −k/2 + 1)`. Prove that the θ-stable parabolics
`q₀, q₁, q₂` of `U(2,2)` attached to the Weyl representatives `1, (23), (13)(24)` give modules
`A_{q_i}(w_i⁻¹λ)` whose relative Lie algebra cohomology with the dual coefficient is one-dimensional in
`(4,0)` for `q₀`; one-, two- and one-dimensional in `(1,1), (2,2), (3,3)` for `q₁`; one-dimensional in
`(0,4)` for `q₂`; and zero in every other bidegree (IP23, §11.2, pp. 81–83; Proposition 11.2, p. 83). The
computation is the Hermitian bidegree formula of AutomorphicFormsOnReductiveGroups §5.4 applied to
each parabolic.

**Checks.**

- At `k = 2` the three cohomological supports remain distinct.
- For `q₁` the total dimension is `4 = 1 + 2 + 1`, the Poincaré polynomial of `ℙ¹ × ℙ¹`.
- Only `q₁` has cohomology in total degree two.

*Needs:* AutomorphicFormsOnReductiveGroups §§5.2, 5.4.

### 8.3 The negative-similitude involution

Prove that the real similitude `δ` exchanging the two signature blocks of `U(2,2)`, of multiplier `−1`,
interchanges `q₀` and `q₂` and preserves `q₁`; hence passing from the unitary group to the real
similitude group does not create another degree-two type (IP23, Lemma 11.3, p. 83).

**Checks.**

- `δ` exchanges the bidegrees `(4,0)` and `(0,4)`.
- The unique degree-two constituent remains `q₁`.
- `δ²` is a scalar, so `δ` acts on the set `{q₀, q₁, q₂}` by an involution.

*Needs:* §8.2; §5.1.

### 8.4 The rational theta Hecke space

Write `V_k` for the local system of §0.2 attached to the coefficient of §5.4 on the unitary Shimura
variety `Sh_K` of `G̃ = Res_{F/ℚ}GU(V)`, `𝕍_{k,ℓ}` for its `ℓ`-adic realization, and `Ṽ_ρ` for the
same coefficient on the quaternionic exterior variety `Sh_{G̃_B,K}` of `Res_{F/ℚ}GU_B(⋀²V)°`, the two
corresponding under §2.8. For an automorphic representation `Π′` and a finite set `S` of places, write
`[Π′^S]` for the subspace of a complex cohomology space on which the away-from-`S` Hecke algebra acts
through the eigencharacter of `Π′^S`, and `[Π′]` when `S` is understood. For `S` large and `K` small,
let `I` be the kernel of the away-from-`S` Hecke algebra acting on
`Π_f^K`. Define the theta Hecke space as the `ℚ(k)`-subspace
`H^{2d}(Sh_{G̃_B, K}, Ṽ_ρ)[I]` of the cohomology with the coefficient of §5.4, and prove that its
complexification is the sum over the distinct conjugates `Π^γ` of the eigenspaces
`H^{2d}(Sh, Ṽ_{ρ,ℂ})[Π^γ]`, each with the Matsushima description of §0.2 over representations nearly
equivalent to `Π^γ` (IP23, §4.4, pp. 24–25; §11.3, pp. 83–86; proof of Theorem 12.4, p. 99).

- After extension to `ℂ` the rational Hecke kernel decomposes into the distinct conjugate eigenspaces.
- Level pullbacks and normalized traces preserve the theta Hecke space.
- The class `ξ_τ` of §7.2 lies in its complexification, its away-from-`S` eigenvalues being those of
  `Π`.

**Checks.**

- If the Hecke eigencharacter of `Π` is rational, the conjugate orbit has size one.
- A single complex eigenspace with nonrational eigencharacter is not a `ℚ(k)`-subspace.
- A Hecke ideal with no matching eigencharacter gives the zero space.

*Needs:* §§0.2, 5.4, 7.2; ArithmeticLocallySymmetricSpaces gap:shimura-matsushima-comparison;
AutomorphicFormsOnReductiveGroups
§5.7; GL2AutomorphicRepresentationsAndTransfer §§R16.4.5, R17.3.7.

### 8.5 Degree selection in the theta eigenspace

Prove that `H^{2d}(Sh_K, V_k)[Π^S] = H^{d,d}(Sh_K, V_k)[Π^S]` in relative cochain bidegree: each
`v ∈ Σ` contributes degree two through `q₁` and each real place outside `Σ` degree zero (IP23,
Proposition 11.4 and (11.2), pp. 85–86). *Proof route* (IP23, Remark 11.5, p. 87): by §6.5 every `π`
with `π_v ≃ Π_v` for almost all `v` is a theta lift `θ(τ′)`; at `v ∈ Σ` the archimedean component is a
theta lift of `D_{k_v+1}` or of its dual (§3.5, read from MetaplecticAutomorphicForms §3.35, with
§8.3), hence one of `A_{q₀}, A_{q₁}, A_{q₂}`; each split place has degree at least two, so total
degree `2d` forces degree two, that is `q₁` in bidegree `(1,1)`, at every split place. This is a statement about relative
cochain bidegrees; the actual Hodge types are §8.7.

**Checks.**

- The middle-degree `q₁` cohomology in local degree four cannot enter total degree `2d`.
- For `d = 1` the eigenspace is `H^{1,1}` at the split place tensored with `H⁰` at the compact one.
- The route does not use a global classification of automorphic representations of `U(2,2)`-forms.

*Needs:* §§0.2, 3.5, 6.5, 8.2, 8.3, 8.4; MetaplecticAutomorphicForms §3.35; ArithmeticLocallySymmetricSpaces
gap:shimura-matsushima-comparison.

### 8.6 Hodge types of the coefficient-cohomology summands

For the compact unitary similitude Shimura varieties of this layer, the coefficient `ρ_{v,k}` of
trivial central character at `v ∈ Σ` and its restriction `ρ′_{v,k}` to `G′_v = U(2,2)`, prove that the
Hodge decomposition of §0.2 is compatible with the Matsushima decomposition, and that the part of
`H^{p,q}(𝔤′_v, K′_v; π′_v ⊗ ρ′_{v,k})` of fibre bidegree `(k′ − p, m + p − k′)` can be nonzero only if
the centre `Z = {t_α = (α, α⁻¹) : α ∈ U(1)} ⊂ U(2) × U(2)` of `K′_v` acts on the irreducible
representation `τ` of `U(2) × U(2)` of highest weight `w(Λ + ρ_G) − ρ_G` by the character
`τ_Z = λ_Z μ^{−k′}` for some Kostant representative `w` of length `p`. Here
`Λ = (k_v/2 − 1, k_v/2 − 1, −k_v/2 + 1, −k_v/2 + 1)` is the weight called `λ` in §8.2,
`ρ_G = (3/2, 1/2, −1/2, −3/2)` is the half-sum of the positive roots of `𝔤𝔩₄`, `μ(t_α) = α²` is the
action of `Z` on `𝔭⁺`, `λ_Z(t_α) = α^{2k_v−4}` is the highest character of `Z` in `ρ′_{v,k}`, and
`m = 2k_v − 4` is the total fibre weight in the classical normalization. The resulting Hodge type of the
summand is `(p, q) + (k′ − p, m + p − k′)` (the criterion as applied in IP23, proof of Proposition 11.6,
pp. 87–88). Kostant representatives are those of ShimuraData §3.10.

**Checks.**

- For `(p, q) = (1, 1)` and `w⁻¹ = (23)`, `w(Λ + ρ_G) − ρ_G = ½(k_v − 2, −k_v, k_v, −k_v + 2)` and
  `τ_Z(t_α) = α⁻² = λ_Z μ^{−(k_v−1)}(t_α)`, so `k′ = k_v − 1` and the type is `(k_v − 1, k_v − 1)`.
- For `(p, q) = (0, 4)` and `w = 1`, `τ_Z(t_α) = α^{2k_v−4}`, so `k′ = 0` and the type is `(0, 2k_v)`.
- A summand in cohomological degree `p + q` has total weight `p + q + m`: `2k_v − 2` for `(1,1)` and
  `2k_v + 2` for `(3,3)`.

*Needs:* §§0.2, 8.2; ShimuraData §§3.1, 3.10, 4.3; AutomorphicFormsOnReductiveGroups §5.4.

### 8.7 Coefficient and cochain Hodge weights

For the `U(2,2)` coefficient at even `k ≥ 2`, prove that the six Kostant contributions at cochain
positions `(0,4), (1,1), (2,2), (2,2), (3,3), (4,0)` have untwisted Hodge types
`(0, 2k), (k−1, k−1), (k, k), (k, k), (k+1, k+1), (2k, 0)`, and that after the unitary normalization
twist `(2−k, 2−k)` the cochain `(1,1)` term has type `(1,1)` for every `k` (IP23, Proposition 11.6,
pp. 87–90).

**Checks.**

- For `k = 4` the cochain `(1,1)` term has type `(3,3)` before the shift and `(1,1)` after it.
- The two middle rows are distinct cochain contributions of the same type `(k, k)`.
- After the shift the extreme rows have types `(2−k, k+2)` and `(k+2, 2−k)`, of total weight four.

*Needs:* §§8.2, 8.5, 8.6; Tau Ceti `TauCeti.Hodge.HodgeStructureOn.tateTwist`.

### 8.8 Purity of the theta Hecke space

Prove that `H^{2d}(Sh_K, V_k)[Π^S]` on the unitary Shimura variety, and its counterpart on the
quaternionic exterior variety, is purely of Hodge type `(d, d)`, that the same holds for every
coefficient conjugate, and hence that after twist `(d)` the whole `ℚ(k)`-rational theta Hecke space of
§8.4 has type `(0,0)` (IP23, Proposition 11.6 and Corollary 11.7, pp. 87–90; proof of Theorem 12.4,
p. 99).

**Checks.**

- Purity is proved on the whole rational Hecke space used in §10.6, not only on one complex eigenspace.
- Compact places contribute type `(0,0)` and each split place type `(1,1)`.
- For `d = 2` the space is of type `(2,2)`, so every rational vector of the twisted space is a Hodge
  class.

*Needs:* §§0.3, 8.4, 8.7; Tau Ceti `TauCeti.Hodge.HodgeStructureOn.tateTwist`.

### Examples

For `d = 1` and `k = 2` the theta eigenspace lies in `H²` of a four-dimensional unitary Shimura variety;
its `q₁` part in cochain bidegree `(1,1)` has Hodge type `(1,1)`, and the shift `(2−k, 2−k)` is trivial.

### Dependencies

Layers 0–7; AutomorphicFormsOnReductiveGroups §§5.2, 5.4, 5.7; ShimuraData §§3.1, 3.10, 4.3;
ArithmeticLocallySymmetricSpaces gap:shimura-matsushima-comparison; MetaplecticAutomorphicForms
§§3.35, 3.36;
GL2AutomorphicRepresentationsAndTransfer §§R16.4.5, R17.3.1, R17.3.7, R17.4.2, R17.4.13, R17.4.16 and
gap:norm-subgroup-restriction; AutomorphicLFunctionsAndLocalFactors §AL.3.6.3; Tau Ceti
`TauCeti.Hodge.HodgeStructureOn.tateTwist`.

## Layer 9: the conditional Galois calculation

The Kottwitz prediction is stated degree by degree, and only degree `2d` is used. Integer Tate twists
replace formal half-powers before any `ℓ`-adic object is introduced, and a geometric argument upgrades
trivial semisimplification to triviality.

### 9.1 The Kottwitz representation

Prove that the dual group of the unitary similitude group `G = GU_E(V)` of §8, a group over `F` with
`F`-valued multiplier, is `Ĝ = GL₄(ℂ) × ℂ^×` with `Γ_E` acting trivially and the nontrivial element of
`Gal(E/F)` acting by `θ̂(g, ν) = (θ₄(g), ν·det g)`, where `θ₄(g) = J₄ ᵗg⁻¹ J₄⁻¹` for the antidiagonal
`J₄` with entries `1, −1, 1, −1` from the top row down, the outer automorphism of `GL₄` fixing the
standard pinning; and that the dual group `Ĝ₀` of `G̃ = Res_{F/ℚ}G` is `Ĝ^{Σ_∞}`, one factor
`GL₄(ℂ) × ℂ^×` for each real place, with `Γ_ℚ` permuting the factors through its action on
`Σ_∞ = Γ_ℚ/Γ_F` and acting inside them through `θ̂` (IP23, §11.5, p. 91; `θ₄` is defined in §11.1,
p. 79). *Proof route:* over `E`, `(g, ν) ↦ (g|_{V ⊗_E E}, ν)` identifies `G_E` with `GL₄ × 𝔾_m`, the
component of `g` on `V ⊗_{E,σ} E` being `ν` times the adjoint inverse. Inner forms have the same based
Galois action (their actions differ by inner automorphisms, which fix the based root datum), so it may
be computed for the Hermitian form with antidiagonal Gram matrix `(δ_{i,5−j})`; there the nontrivial
element of `Gal(E/F)` acts on the characters `e₁, …, e₄, e₀ = ν` of the diagonal torus by
`e_i ↦ e₀ − e_{5−i}`, `e₀ ↦ e₀`, which preserves the upper triangular base, so on the dual torus
`X^*(T) ⊗ ℂ^×` it sends `(s₁, s₂, s₃, s₄; ν̂)` to `(s₄⁻¹, s₃⁻¹, s₂⁻¹, s₁⁻¹; ν̂·s₁s₂s₃s₄)`, the
restriction of `θ̂` (ReductiveGroupsPartII §RG2.5.1, *dual-based-root-datum*); the restriction of
scalars is ReductiveGroupsPartII §RG2.5.2, *dual-of-weil-restriction*. Define `r` as the contragredient
of `⋀²ℂ⁴` with `ν` acting by scalars, extended to the `L`-group by the unique automorphism `A` with
`r(θ̂(g)) ∘ A = A ∘ r(g)` fixing a highest weight vector; and for `Res_{F/ℚ}` define `r₀ = r^{⊗Σ}` on
`V₀ = V^{⊗d}`, extended to `Ĝ₀ ⋊ Γ_{F_Σ}` by permuting tensor factors with the prescribed local
intertwiners. `r₀` is the irreducible representation of extreme weight `−μ` for the Shimura cocharacter
`μ` (IP23, §11.5, pp. 91–93).

- The central coordinate `ν` acts on `V` by `ν⁻¹`.
- `Γ_{F_Σ}` permutes the factors indexed by `Σ`, with the local intertwiners `A`.
- The extreme weight is `−μ`.

**Checks.**

- For `d = 1`, `V₀ = V` has dimension six.
- For `d = 0`, `r₀` is the trivial line.
- Interchanging two one-dimensional extreme-weight factors acts by `+1`: the tensor factors are
  not graded and no Koszul sign enters.
- `r` is `(⋀²std ⊗ ν)^∨`, not `⋀²std`; on the centre `ν` they differ by `ν ↦ ν⁻¹`.
- The similitude coordinate is one per real place: for `F = ℚ(√2)` the dual group of `G̃` is
  `(GL₄(ℂ) × ℂ^×)²`, of dimension `34`, while the unitary similitude group over `ℚ` with rational
  multiplier, a subgroup of `G̃` of codimension one, has dual group `ℂ^× × GL₄(ℂ)²`, of dimension `33`.
- The factor `det g` in `θ̂` carries a positive sign. The conjugation sends the character `det` of
  `G_E` to `4ν − det`, which is the identity `N_{E/F}(det g) = ν(g)⁴` of §1.2; dually
  `θ̂(z·1₄, 1) = (z⁻¹·1₄, z⁴)`. The model `(θ₄(g), ν·det g⁻¹)`, also an involution, gives
  `(z⁻¹·1₄, z⁻⁴)`, that is `N(det g) = ν⁻⁴`, which fails for a scalar similitude `g = α` with
  `N(α) = 2` (`α = 1 + i` when `E = F(i)`): `N(det α) = N(α)⁴ = 16 = ν⁴`, while `ν⁻⁴ = 1/16`.

*Needs:* §5.1; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2; Mathlib `exteriorPower.map`.

### 9.2 The degree-`2d` Kottwitz hypothesis and its lowest line

For `ψ = (σ_E ⊠ Sym¹, 1)` of §8.1, Kottwitz's conjecture for the unitary similitude Shimura variety
predicts that the semisimplification of `H^i_et(Sh_{G̃,K} ⊗ ℚ̄, 𝕍_{k,ℓ})[Π^S]` is a subrepresentation of
copies of the `ℓ`-adic realization of the piece of weight `i − 4d` of `r₀ ∘ ψ₀ ⊗ |·|^{−2d}`, graded by the
diagonal torus of `SL₂` (IP23, §11.5, pp. 91–93). Prove that the lowest piece, of weight `−2d`, is
`(V^{−2})^{⊗d}` with `V^{−2} = |·|^{−1}`, so that its `ℓ`-adic realization is the character `ℚ_ℓ(−d)` of
`Γ_{F_Σ}` (IP23, §11.5, p. 93, the computation behind Proposition 11.9). *Proof route:* with
`W = W₁ ⊕ W₋₁`, `W_{±1} = ρ_E ⊗ |·|^{∓1/2}`, the lowest piece is `⋀²W₋₁ ⊗ |·|^{−2}`, which involves only the
determinant of the two-dimensional part; that determinant is the character attached by class field
theory (ClassFieldTheory Layer 11) to the central character of `σ_E`, which is `ξ_E ∘ N = 1`; the
normalization of `A` by the highest weight vector leaves no quadratic character on the extreme line
(§8.1 supplies the conjugate-orthogonal sign). Define the *degree-`2d` Kottwitz hypothesis* `K_{2d}(Π)`:
for every prime `ℓ`, the semisimplification of the `Γ_{F_Σ}`-representation on
`H^{2d}_et(Sh_{G̃,K} ⊗ ℚ̄, 𝕍_{k,ℓ})[Π^S]` is isomorphic to a subrepresentation of a finite sum of copies of
`ℚ_ℓ(−d)`. It is the degree-`2d` case of the prediction, and it says that the semisimplification of
`H^{2d}_et(…)[Π^S](d)` is trivial (IP23, Proposition 11.9, p. 90).

- In the notation of the proof, `V² = |·|^{−3}`, `V⁰ = |·|^{−2} ⊕ Sym²(ρ)|·|^{−2}` with `ρ` the
  two-dimensional parameter of `σ`, and `V^{−2} = |·|^{−1}`; only `V^{−2}` enters degree `2d`.
- `(V^{−2})^{⊗d} ⊗ |·|^d` is trivial, including its permutation action.
- Kottwitz's conjecture in every degree implies `K_{2d}(Π)`; only degree `2d` is used.

**Checks.**

- An alternating Euler-characteristic identity is not the hypothesis: `K_{2d}(Π)` is a statement about
  the representation in one degree.
- Without the twist `(d)` the prediction is `ℚ_ℓ(−d)`, not the trivial character.
- For `d = 1` the lowest line is one-dimensional inside the six-dimensional `V`.
- The determinant enters through `⋀²W₋₁`, so the half-integral twists `|·|^{1/2}` of the two basis
  vectors combine to the integral twist `|·|`.

*Needs:* §§8.1, 8.4, 9.1; ClassFieldTheory Layer 11; GlobalNumberFields Layer 10.

### 9.3 De Rham additive characters are unramified

Let `K` be a finite extension of `ℚ_ℓ` and `c : G_K → ℚ_ℓ` a continuous homomorphism. Prove that the
extension of `ℚ_ℓ` by `ℚ_ℓ` defined by `c` is de Rham if and only if `c` is unramified; equivalently,
for the Bloch–Kato subgroups of AnabelianGeometryAndNonabelianChabauty §4.6,
`H¹_g(K, ℚ_ℓ) = H¹_f(K, ℚ_ℓ) = Hom(K^×/𝒪_K^×, ℚ_ℓ)` under local reciprocity (IP23, Remark 11.10, p. 90). For a finite place `v ∤ ℓ` of a number field every continuous
`c : G_{k_v} → ℚ_ℓ` is unramified, since `𝒪_v^×` has no nonzero continuous `ℚ_ℓ`-valued homomorphism.
*Proof route:* a de Rham extension is Hodge–Tate, so the class of `c` dies in `H¹(G_K, ℂ_ℓ)`, which is
spanned by `log χ` (PadicPeriodRings §1.4); by Sen's theory the restriction of `c` to inertia then has
finite image, hence is zero.

**Checks.**

- The cyclotomic logarithm `log χ` is ramified and its extension is not de Rham: the hypothesis cannot
  be dropped.
- The unramified homomorphism `Frob ↦ 1` defines a crystalline, hence de Rham, extension.
- At `v ∤ ℓ` the statement is about all of `H¹`, not only `H¹_f`.

*Needs:* PadicPeriodRings §1.4; PadicHodgeTheory §§3.3, 4.4; SelmerIwasawaCohomology §§2.7, 4.9;
AnabelianGeometryAndNonabelianChabauty §4.6; ClassFieldTheory Layers 6–8.

### 9.4 Triviality of geometric unipotent extensions

Let `k` be a number field, `ℓ` a prime and `W` a finite-dimensional continuous `ℚ_ℓ`-representation
of `G_k`, unramified outside finitely many places and de Rham at the places above `ℓ`. Prove that if the
semisimplification of `W` is trivial then `W` is trivial (IP23, Remark 11.10, p. 90). *Proof route:* by
§9.3 a class in `H¹(k, ℚ_ℓ)` that is unramified almost everywhere and de Rham above `ℓ` is unramified
everywhere, so it factors through `𝔸_k^×/k^× k_∞^× 𝒪̂^×`, the finite class group; hence the global
subgroup `H¹_g(k, ℚ_ℓ)` of classes unramified almost everywhere and de Rham above `ℓ` is zero.
Induct on the length of `W`, using that subquotients of de Rham representations are de Rham
(PadicHodgeTheory §3.1 for `B = B_dR`).

**Checks.**

- Without the de Rham hypothesis the cyclotomic logarithm gives a nontrivial unipotent extension of
  `ℚ_ℓ` by `ℚ_ℓ`.
- For `k = ℚ` the class group is trivial and the argument is that `ℚ_ℓ`-valued characters of `G_ℚ` are
  ramified somewhere.
- The statement is false for `ℤ_ℓ`-lattices modulo `ℓ`: a nontrivial unramified extension of `𝔽_ℓ` by
  `𝔽_ℓ` exists when the class number is divisible by `ℓ`.

*Needs:* §9.3; ClassFieldTheory Layer 11; GlobalNumberFields Layers 2, 4; PadicHodgeTheory §§3.1,
3.3.

### 9.5 Conditional trivial Galois action

Assume `K_{2d}(Π)`. Prove that for every `ℓ` the full `Γ_{F_Σ}`-representation on
`H^{2d}_et(Sh_{G̃,K} ⊗ ℚ̄, 𝕍_{k,ℓ})[Π^S](d)` is trivial, and that the same holds on the quaternionic
exterior variety and for every coefficient-conjugate summand of §8.4 (IP23, Proposition 11.8 and
Remark 11.10, p. 90; proof of Theorem 12.4, p. 99). *Proof route:* the representation is a subquotient
of geometric cohomology, unramified almost everywhere and de Rham above `ℓ` (§0.2); apply §9.4, then
transport along the central-isogeny comparisons of §0.3.

**Checks.**

- Trivial semisimplification is not substituted for triviality of the representation.
- One hypothesis covers every `ℓ`; no prime-by-prime choice of data enters.
- The twist `(d)` is the integral Tate twist of §0.2.

*Needs:* §§0.2, 0.3, 8.4, 9.2, 9.4.

### Examples

For `d = 1`: `V² = ℚ_ℓ(−3)`, `V⁰ = ℚ_ℓ(−2) ⊕ Sym²(ρ)(−2)` and `V^{−2} = ℚ_ℓ(−1)` correspond to the
cohomology of the four-dimensional unitary variety in degrees `6, 4, 2` (IP23, p. 93), and `K_{2}(Π)`
predicts that `H²[Π^S](1)` has trivial semisimplification.

### Dependencies

Layers 0, 5, 8; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2;
ClassFieldTheory Layers 6–8, 11; GlobalNumberFields Layers 2, 4, 10; PadicPeriodRings §1.4;
PadicHodgeTheory §§3.1, 3.3, 4.4; SelmerIwasawaCohomology §§2.7, 4.9;
AnabelianGeometryAndNonabelianChabauty §4.6; Mathlib `exteriorPower.map`.

## Layer 10: rational descent and the main theorems

The restriction construction is compatible with every realization and depends bilinearly on a theta
class and a component parameter. Complex invertibility makes a determinant polynomial nonzero;
reciprocity puts the special component character in the invariant rational parameter space, where two
successive rational choices keep the determinant nonzero.

### 10.1 The auxiliary Hilbert representation

Prove that the representation `τ` produced by §7.10 comes from a cohomological cuspidal representation
of `GL₂(𝔸_F)` attached to a holomorphic Hilbert modular form of weights `k_v + 1` and odd algebraic norm
weight `w`, with finite central character `ξ_E`: after the unitary norm twist and Jacquet–Langlands
transfer to `B^×`, its restriction first to `H_∞^+` and then to `H_N^+` contains `τ`, antiholomorphic
above `Σ` and holomorphic outside `Σ` (IP23, §12.2.4, pp. 96–97; §10.4, p. 68). The algebraic weight
convention is GL2AutomorphicRepresentationsAndTransfer §R16.6.3, with `k_τ + 2m_τ = w`.

- The weights `k_v + 1` are odd and admit a common odd `w`.
- After unitary normalization a constituent of the restriction to `H_N^+` is the `τ` of §7.1.
- Coefficient conjugation permutes the weights and gives the conjugate auxiliary systems.

**Checks.**

- If `k_v = 2` the auxiliary weight is three.
- The norm twist changes the algebraic normalization `w` and leaves the unitary discrete-series signs
  unchanged.
- Restriction to positive real norms does not impose the finite idele norm condition; the two
  restrictions are distinct steps.

*Needs:* §7.10; GL2AutomorphicRepresentationsAndTransfer §§R16.4.5, R16.6.3, R17.3.1 and
gap:norm-subgroup-restriction.

### 10.2 The common CM field with a support place

For distinct `B₁, B₂`, prove that there are a finite place `v₀` outside the ramification of `B₁, B₂` and
any given finite set, and a CM quadratic `E/F` ramified at `v₀` and nonsplit at every finite place
ramified in either `B_i`; then `E` embeds in both `B_i`, and small levels can be chosen hyperspecial at
`v₀` while keeping the given finite vectors (IP23, §12.2.1, p. 94; Proposition 10.1, p. 70; proof of
Proposition 12.3, p. 98). *Proof route:* choose `E = F(√δ)` with `δ` negative at every real place, of
odd valuation at `v₀` and a nonsquare unit or uniformizer class at the ramified places, by weak
approximation. Then `E` embeds in `B_i` exactly when `2·ind(B_i ⊗_F E)` divides `2`, that is when `E`
splits `B_i` (EndoscopicTransferAndUnitaryTraceComparison §8.3, the field-embedding criterion).
`B_i ⊗_F E` splits exactly when it splits at every place `w` of `E` (ClassFieldTheory Layer 10,
`brLocalization_injective`, read on algebras through `TauCeti.brauerCohomologyEquiv`), and its
invariant at `w | v` is `[E_w : F_v]·inv_v(B_i)` (ClassFieldTheory Layer 5, `invMap_brRes`, with
`TauCeti.brauerCohomologyEquiv_baseChange`; at a real `v`, Layer 10, `infiniteInvMap` and
`infiniteInvMap_eq_zero_of_isComplex`), which is `0` unless `v` ramifies in `B_i` and splits in `E`.
So `E` embeds in `B_i` exactly when no place ramified in `B_i` splits in `E`, which the choice of `δ`
ensures at the finite places and `E` being CM at the real ones.

**Checks.**

- Ramification of `E` at `v₀` is compatible with split `B_i` there and with unramified hyperspecial
  vectors.
- `δ` negative at every real place makes `E` totally imaginary, hence CM.
- A place where `E` splits and `B_i` ramifies would prevent the embedding; the construction excludes it.
- The criterion in both directions, on `B = (−1, −1)_ℚ`, ramified at `{∞, 2}`: for `E = ℚ(√2)` the
  place `∞` splits, the invariant there stays `1·½ ≠ 0`, and indeed a pure quaternion squares to
  `−(a² + b² + c²) ≠ 2`; for `E = ℚ(i)` both `∞` and `2` are nonsplit, the invariants become
  `2·½ = 0`, and `E` embeds. For `B = M₂(ℚ)` every invariant is `0` and every quadratic field embeds.

*Needs:* §0.4; GlobalNumberFields Layer 1; EndoscopicTransferAndUnitaryTraceComparison §8.3;
ClassFieldTheory Layers 5 and 10 and §5.4; Tau Ceti `TauCeti.brauerCohomologyEquiv`,
`TauCeti.brauerCohomologyEquiv_baseChange`.

### 10.3 The realization-compatible restriction map

For a level on the exterior variety and a component parameter `c ∈ H⁰(Sh_{H̃_B}, ℚ)`, construct
`Res_c : H^{2d}(Sh_{G̃_B}, Ṽ)(d) → V₁ ⊗_L V₂(d) ≃ Hom_L(V₁, V₂)` as the composite of: pullback to the
block subgroup (§0.3); the rational harmonic coefficient projection (§5.4); multiplication by `c`; the
normalized central trace to the projective quaternionic block group, with the volumes of the levels
taken for the fixed rational Haar measures of §0.3 on the effective groups, and the level average
(§§0.3, 7.3); pullback from `G` to `B₁^× × B₂^×`; the `L`-rational `π₁ ⊠ π₂` projector; and
contraction with chosen nonzero vectors of the `L`-models of §0.5 (IP23, §§12.2.5–12.2.11,
pp. 97–98; proof of Theorem 12.4, p. 99). Prove that it is `ℚ(k)`-linear in the source and
`ℚ`-linear in `c`, with values in the `L`-structure, and that for `Gal(ℚ̄/F_Σ)`-invariant `c` it is a
morphism in every realization over `F_Σ`; the rationality of the Haar measures is what puts the
normalized trace, and so `Res_c`, in the `L`-structure (§0.3).

- For `c = c_η` its value on `ξ_τ(d)` is the correspondence constructed analytically in Layer 7.
- `(x, c) ↦ Res_c(x)` is bilinear over `ℚ(k)` after extending the parameter space.
- For invariant `c` the Betti map commutes with every `ℓ`-adic comparison and `Gal(ℚ̄/F_Σ)`-action.

**Checks.**

- For `c = 0` the correspondence is zero.
- In the equal-algebra case the diagonal gives the identity of `V₁` (§0.4).
- Trace to a component outside the image of `Sh_{H̃_B}` contributes zero; it is not an isomorphism
  induced by a surjective covering.
- With the identity correspondence and the projection of the negative control of §0.3 in place of
  the central trace, rational Haar measures give the matrix `I`, while the irrational relative
  normalization there gives `√2·I`, whose entries are not in `ℚ`; another pair of rational Haar
  measures gives `c·I` with `c ∈ ℚ_{>0}`, which changes neither the `L`-structure nor invertibility.

*Needs:* §§0.3, 0.5, 0.7, 5.3, 5.4, 7.3; GL2AutomorphicRepresentationsAndTransfer
gap:quaternionic-rational-model; MotivesAndAlgebraicCycles §§2.3, 7.15.

### 10.4 Invertibility of the theta correspondence

Assume `d ≥ 1` and `B₁ ≄ B₂`. Prove that there are auxiliary data, namely the CM field `E` and
place `v₀` of §10.2, the Hilbert representation of §10.1 with its constituent `τ`, a minimal-type
vector `φ ∈ τ` and the Schwartz data of §7.1, the character `η` of §7.7, and the levels and the
vectors of the `L`-models chosen in §10.3, for which `Res_{c_η}(ξ_τ(d)) : V₁ ⊗ ℂ → V₂ ⊗ ℂ` is an
isomorphism; in the sign bases of §0.6 it has a nonzero entry on each matching pair of lines and no
other entries, so its rank is `2^d` (IP23, Proposition 12.3, p. 98). *Proof route:* §10.2 supplies `E`
and `v₀`; Matsushima reduces to relative Lie algebra cohomology; §7.10 gives the nonzero pairings for
every sign; opposite-sign Poincaré duality makes the operator diagonal.

**Checks.**

- For `d = 1` both diagonal entries are nonzero.
- A single nonzero matrix coefficient would not give an isomorphism.
- The coefficient pairing and the restriction fix the individual signs: off-diagonal entries vanish by
  the `K′`-weights.

*Needs:* §§0.6, 7.10, 10.2, 10.3; ArithmeticLocallySymmetricSpaces gap:shimura-matsushima-comparison.

### 10.5 Galois-invariant component parameters

At a fixed level let `W_ℚ = H⁰(Sh_{H̃_B}, ℚ)^{Gal(ℚ̄/F_Σ)}` for the permutation action on components.
Prove that `c_η ∈ W_ℚ ⊗ ℚ(η)` for `η` of §7.7 (IP23, §4.3, pp. 23–24; proof of Theorem 12.4, p. 99,
with the invariant subspace in place of all rational component classes). *Proof route:* the torus
cocharacter of §5.2 factors through `j : Res_{F/ℚ}𝔾_m → T`, `j(s) = ([s, s], s)`, with reflex field
`F_Σ`; by reflex-norm functoriality (ShimuraVarieties §4.9) the finite reciprocity image lies in
`j(𝔸_{F,f}^×)`; since `η_T(j(s)) = η(s⁻¹) = 1`, reciprocity (§4.3) fixes `η_T`, and pullback along the
map of §5.2 (§8.5) is equivariant; invariants of a finite permutation representation commute with
extension of scalars.

**Checks.**

- The component action need not be trivial; only `c_η` is shown to be fixed.
- `W_ℚ` has the `ℚ`-basis of sums over Galois orbits of components, not individual component classes.
- For `η = 1`, `c_η = 1` lies in `W_ℚ`.

*Needs:* §§5.2, 5.3, 7.7; ShimuraVarieties §§4.2, 4.3, 4.9, 8.5, 8.6.

### 10.6 Rational determinant descent

Let `ℋ` be the theta Hecke space of §8.4, a `ℚ(k)`-space, and `W_ℚ` the space of §10.5, with the
finite data of §10.3 fixed, and assume `d ≥ 1`. Prove: the determinant of `Res_c(x)` in `L`-bases of
`V₁, V₂` is a polynomial with coefficients in `L` in the coordinates of `x ∈ ℋ` and `c ∈ W_ℚ`,
homogeneous of degree `2^d` in each set; §10.4 and `c_η ∈ W_ℚ ⊗ ℂ` give a complex point where it is
nonzero; hence there are `x ∈ ℋ` and `c ∈ W_ℚ` at which it is nonzero (IP23, proof of Theorem 12.4, p.
99). *Proof route:* expand the finitely many `L`-coefficients over a `ℚ(k)`-basis of their span and
choose a nonzero coordinate polynomial; `MvPolynomial.funext` over the infinite field `ℚ(k)` gives
`x`, leaving a nonzero polynomial in `c`; repeat with a `ℚ`-basis to choose `c`. The resulting tensor
`ξ₀ = Res_c(x)` has coefficients in `L`, is a Hodge class by §8.8, and is invertible.

**Checks.**

- Averaging cannot replace the determinant: the Galois average of the invertible `1 × 1` matrix `(i)`
  over `ℚ(i)/ℚ` is `0`.
- The argument needs only that `ℚ(k)` and `ℚ` are infinite; the determinant need not have rational
  coefficients.
- For `d = 1` and `Res_c(x) = diag(x₁c₁, x₂c₂)` the determinant `x₁x₂c₁c₂` is nonzero at
  `x = (1, 1)`, `c = (1, 1)`, while `x = (1, 0)` kills it for every `c`: the choice of `x` must leave a
  nonzero polynomial in `c`.

*Needs:* §§8.4, 8.8, 10.3, 10.4, 10.5; Mathlib `MvPolynomial.funext`.

### 10.7 Hodge classes for Jacquet–Langlands

For Jacquet–Langlands Hodge data, prove that there is a class `ξ₀ ∈ V₁ ⊗_L V₂(d)` of Hodge type `(0,0)`
whose correspondence operator (§0.7) is an isomorphism of `L`-Hodge structures `V₁ ≃ V₂` (IP23,
Theorem 12.4(i), pp. 98–99; Theorem 3.2(i), p. 20). The theorem is unconditional; it does not assert that
`ξ₀` is algebraic or absolutely Hodge. *Proof route:* the equal-algebra case is §0.4. For `d = 0` the
realizations are rank-one of type `(0,0)`, every nonzero `ξ₀ ∈ V₁ ⊗_L V₂` is a Hodge class, and through
the self-duality of §0.5 its operator is a nonzero `L`-linear map of rank-one spaces, hence a Hodge
isomorphism; Layers 6–7 are not used. For `d ≥ 1` use the Hodge part of §10.6 and §0.7. Layer 9 is
not used.

**Checks.**

- For `d = 0` the statement is an isomorphism of rank-one weight-zero realizations.
- The class has type `(0,0)` after the twist `(d)`; equal total weights alone would not suffice
  (§0.6).
- The class is `L`-rational: the only enlargement of coefficients is the `π₁ ⊠ π₂` projection, with
  `L ⊃ ℚ(k)`.

*Needs:* §§0.4, 0.5, 0.7, 10.6; GL2AutomorphicRepresentationsAndTransfer §§R17.3.6, R17.3.7 and
gap:quaternionic-rational-model (the `L`-models of §0.5); MotivesAndAlgebraicCycles §7.1.

### 10.8 Conditional Hodge–Tate correspondence

Assume `K_{2d}(Π)` (§9.2) for the theta lifts of the construction. Prove that `ξ₀` of §10.7 can be chosen
in `HT(V₁ ⊗_L V₂(d))` (MotivesAndAlgebraicCycles §7.15): a rational Hodge class whose image is
`Gal(ℚ̄/F_Σ)`-fixed in every `ℓ`-adic realization, so that the induced isomorphisms
`V₁ ⊗ ℚ_ℓ ≃ V₂ ⊗ ℚ_ℓ` are `Gal(ℚ̄/F_Σ)`-equivariant for all `ℓ` simultaneously (IP23, §12.1, pp. 93–94;
Theorem 12.4(ii), pp. 98–99; Theorem 3.2(ii), p. 20). `HT` is the compatible-realization notion, not
the local `p`-adic Hodge–Tate condition. *Proof route:* for `d = 0` the canonical models are the
constant ones over `F_Σ = ℚ` of the definite case of §0.2 (§0.1), so `Gal(ℚ̄/ℚ)` acts trivially on
every `ℓ`-adic realization and the class of §10.7 lies in `HT` without the hypothesis; for `d ≥ 1` the same rational data as §10.6 with
`c ∈ W_ℚ`, the realization-compatible map of §10.3 and the triviality of §9.5.

**Checks.**

- One class works for every `ℓ`; no `ℓ`-dependent choice of `ξ₀` is allowed.
- A class fixed for one `ℓ` only does not give equivariance at the others.
- Without `K_{2d}(Π)` the statement is not asserted.

*Needs:* §§0.1, 0.2, 0.5, 9.5, 10.3, 10.6, 10.7; GL2AutomorphicRepresentationsAndTransfer
gap:quaternionic-rational-model; MotivesAndAlgebraicCycles §7.15.

### 10.9 The rational weight-two correspondence

When every `k_v = 2` and `ℚ(π) = ℚ`, prove that the coefficient systems are constant and that the class
of §10.7 is a Hodge class
`ξ ∈ H^{2d}(X₁ × X₂, ℚ)_{π₁⊠π₂} = H^d(X₁, ℚ)_{π₁} ⊗ H^d(X₂, ℚ)_{π₂}` such that
`x ↦ p₂,*(ξ(d) ∪ p₁^* x)` is an isomorphism of `ℚ`-Hodge structures `H^d(X₁, ℚ)_{π₁} ≃ H^d(X₂, ℚ)_{π₂}`;
under `K_{2d}(Π)`, `ξ(d)` is `Gal(ℚ̄/F_Σ)`-invariant in every `ℓ`-adic realization and the induced maps
are `Gal(ℚ̄/F_Σ)`-isomorphisms (IP23, Theorem 1(i)–(ii) and (1.4)–(1.5), p. 5). Every subscript is the
multiplicity space of §0.2, so `H^d(X_i, ℚ)_{π_i}` is the realization `V_i` of §0.5, the product
decomposition is Künneth on multiplicity spaces (IP23, §12.2.10, p. 98), and the map is the operator of
§0.7. A class at finite level `K₁ × K₂` is obtained by evaluating `ξ` at chosen nonzero vectors of the
`ℚ`-models of `(π_{1,f})^{K₁}` and `(π_{2,f})^{K₂}`, as in §10.3; no identification of these two finite
factors, which belong to different groups, is asserted.

**Checks.**

- For real quadratic `F` and `d = 1`, the class lies in `H²(X₁ × X₂, ℚ)(1)` and acts on `H¹`.
- Every harmonic degree `ℓ_v = k_v − 2` is zero, so the Schwartz forms are the Kudla–Millson forms
  with trivial coefficients, with their constant: where `p > 0` the Funke–Millson form at `ℓ = 0` is
  `2^{q/2}` times the Kudla–Millson form (FM06, §5.2, p. 18), and §4.3 removes exactly that factor;
  where `p = 0` the form at `ℓ = 0` is the Gaussian `φ₀` (§4.3).
- At a finite place split in both algebras where `π_v` is unramified, the Iwahori-fixed and the
  maximal-compact-fixed vectors of `π_v` have dimensions `2` and `1`. With these local levels and
  one-dimensional fixed spaces elsewhere, for `d = 1` the full `π_i`-isotypic summands of `H¹` have
  dimensions `4` and `2`, while both multiplicity spaces have dimension `2`: the theorem is the
  isomorphism `2 ≃ 2`, and no isomorphism of the full summands is claimed.

*Needs:* §§0.2, 0.5, 0.7, 10.3, 10.7, 10.8; GL2AutomorphicRepresentationsAndTransfer
gap:quaternionic-rational-model (the `ℚ`-models of `π_{i,f}`); MotivesAndAlgebraicCycles §§2.2–2.3,
2.6–2.7.

### Examples

For `F` real quadratic, `d = 1`, parallel weight two and `ℚ(π) = ℚ`: `V₁, V₂` are rank-two `ℚ`-Hodge
structures of type `(1,0) + (0,1)`, `ℋ` is the `ℚ`-space `H²(Sh, ℚ)[I]` of type `(1,1)`, and §10.6 picks
`x ∈ ℋ` and an invariant component sum `c` with `det Res_c(x) ≠ 0` on the `2 × 2` matrix.

### Dependencies

Layers 0–9; MotivesAndAlgebraicCycles §§2.2–2.3, 2.6–2.7, 7.1, 7.15; ShimuraVarieties §§4.2, 4.3,
4.9, 8.5, 8.6; GL2AutomorphicRepresentationsAndTransfer §§R16.4.5, R16.6.3, R17.3.1, R17.3.6, R17.3.7
and gap:quaternionic-rational-model, gap:norm-subgroup-restriction; GlobalNumberFields Layer 1;
ClassFieldTheory Layers 5, 10 and §5.4; EndoscopicTransferAndUnitaryTraceComparison §8.3; Tau Ceti
`TauCeti.brauerCohomologyEquiv`, `TauCeti.brauerCohomologyEquiv_baseChange`;
ArithmeticLocallySymmetricSpaces gap:shimura-matsushima-comparison; Mathlib `MvPolynomial.funext`.

## Downstream consumers

The Hermitian exterior construction of Layers 1–2 and the operator `L` of `IsExteriorStar` are general
inputs for any treatment of `U(2,2)`-type exceptional isomorphisms and quaternionic theta pairs. The
realization targets §§0.2–0.3 serve roadmaps on the cohomology of compact Shimura varieties with
coefficients; the Hodge-type criterion of §8.6 and the local statement of §9.3 serve the same
directions. The end theorems §§10.7–10.9 are the input for questions about algebraicity of the
Jacquet–Langlands class and period relations between quaternionic forms.

## Worked examples

**The normalized Hodge calculation.** The six Kostant contributions of §8.7, in the classical and the
unitary normalization:

| Relative cochain position | Geometric type, fibre weight `2k−4` | Type after shift `(2−k, 2−k)` |
| --- | --- | --- |
| `(0,4)` | `(0, 2k)` | `(2−k, k+2)` |
| `(1,1)` | `(k−1, k−1)` | `(1,1)` |
| `(2,2)`, first | `(k, k)` | `(2,2)` |
| `(2,2)`, second | `(k, k)` | `(2,2)` |
| `(3,3)` | `(k+1, k+1)` | `(3,3)` |
| `(4,0)` | `(2k, 0)` | `(k+2, 2−k)` |

For `k = 4` the degree-two term is `(3,3)` before the shift and `(1,1)` after it, which excludes
identifying cochain indices with Hodge types before the coefficient shift. In total degree `2d` each
`v ∈ Σ` has local degree at least two, so exactly two, and compact places have degree zero; every
coefficient-conjugate summand of §8.4 is of type `(d,d)`.

**Component reciprocity.** At a fixed level the Galois action on components is a finite permutation
action, so `W_ℚ` has the basis of orbit sums and `W_ℚ ⊗ ℚ(η)` is the invariant subspace of
`H⁰ ⊗ ℚ(η)`. The torus cocharacter factors through `j(s) = ([s, s], s)`, the reciprocity image lies in
`j(𝔸_{F,f}^×)`, and `η_T(j(s)) = 1`; so `c_η` is fixed although other component functions can move.

**Rational descent.** With bases, `Res_c(x)` is a `2^d × 2^d` matrix with `L`-entries bilinear in the
coordinates of `x` and `c`; its determinant is nonzero at the complex point `(ξ_τ, c_η)`. Choosing `x`
over `ℚ(k)` and then `c` over `ℚ` by polynomial nonvanishing keeps it nonzero; averaging an invertible
matrix would not.

## References

- [FM06] Jens Funke and John Millson, *Cycles with local coefficients for orthogonal groups and
  vector-valued Siegel modular forms*, American Journal of Mathematics 128 (2006), 899–948,
  [arXiv:math/0408050](https://arxiv.org/abs/math/0408050). Locators are to arXiv version 1; IP23
  cites §§5.1 and 6.2 and Theorems 5.6–5.7 of the published version, and arXiv version 1 carries the
  same items under the same numbers.
- [IP23] Atsushi Ichino and Kartik Prasanna, *Hodge classes and the Jacquet–Langlands
  correspondence*, Forum of Mathematics, Pi 11 (2023), e22, pp. 1–135,
  [doi:10.1017/fmp.2023.20](https://doi.org/10.1017/fmp.2023.20). Locators are to the printed pages
  of the published, open-access version; the arXiv version 1806.10563v2 has different page numbers.
  Where its printed text and the statements here differ, or it leaves a choice, the statements
  read it as follows; a section with a page number is IP23's, a parenthesized one is this roadmap's.
  - §2.1, p. 14: an `L`-Hodge structure is read as a rational Hodge structure with `L`-action, since
    complex conjugation does not preserve a nonreal embedding of `L`; in the application `L` is totally
    real.
  - §2.2.2, p. 16: the relative Lie algebra cohomology in Matsushima's formula is read relative to the
    stabilizer `K_h` of `h`, which contains `Z(ℝ)`; dividing `G(ℝ)` only by a maximal compact subgroup
    and the `ℚ`-split central torus gives a different space as soon as `Z_s ≠ 1` (§0.2, Checks).
  - Remark 2.2, p. 17: the volume factor of the normalized pushforward is read in the effective groups
    `G(𝔸_f)/Z(ℚ)⁻`; with Haar measures on `G(𝔸_f)` itself it depends on the levels as soon as `Z(ℚ)` is
    not discrete in `Z(𝔸_f)`, which is the case for `Res_{F/ℚ}B^×` whenever `[F : ℚ] ≥ 2` (§0.3). The
    remark leaves the choice of measures free; for `f_*` to be a morphism of rational structures the
    measures are read as rational ones, giving compact opens rational volumes, as in Wal85, §I.2,
    p. 124, since an arbitrary relative normalization multiplies `f_*` by an arbitrary positive real
    number (§0.3).
  - §3.2, p. 19: the multiplicity realization is concentrated in degree `d`; the page prints `2d`.
  - §3.2, p. 19: the model of `π_{B,f}` over `L` itself rests on the trivial central character, through
    the division-place case of Wal85, §II.1, pp. 147–148 (§0.5).
  - The rotated diagram, p. 22: the rank-one group on the quaternionic side is `U_B` (§2.5).
  - Proposition 5.6, p. 31: the kernel `{±1}` is read as the group of `F`-points; the scheme-theoretic
    kernel is `Res_{E/F}μ₂` (§1.7).
  - §4.3, p. 24: the component set is not identified with the torus Shimura variety; only the morphism to
    the torus datum and pullback of its functions are used (§§5.2–5.3), since the derived group is not
    simply connected.
  - §4.3, p. 24: the character is the full idele-class character `η` of `𝔸_E^×/E^×𝔸^×`, evaluated on
    general ideles (§5.3).
  - Proposition A.1(i), p. 101: both denominator values of the cocycle quotient use the local section
    `s_v` (§7.2).
  - Proof of Proposition 11.6, p. 88: the `(1,1)` row has untwisted type `(k−1, k−1)`; the displayed pair
    lacks a closing delimiter.
  - Proof of Theorem 12.4, p. 99: the component parameter is taken in the Galois-invariant subspace
    `W_ℚ` (§10.5), since reciprocity can permute components.
  - Proposition 8.2, p. 55: with the negative-coordinate signs of (8.2) and the pairing of §8.2,
    pp. 49–50 (§4.1), on the negative definite space, the two factors `(−1)^ℓ` cancel, and the
    contraction is `(x₁ + εix₂)^ℓ φ₀` (§4.6); the printed extra factor `(−1)^ℓ` equals `1` for the even
    `ℓ` of the application.
  - §10.2, p. 66, uses the compatibility of the splittings for `B₁ ⊗_E B₂` for every `Σ`, while
    Proposition A.14, p. 113, assumes a real place split in both algebras; the see-saw step is used
    here for `d ≥ 1` (§7.4), and the case `d = 0` of the end theorems is proved directly (§§10.7–10.8).
- [Mil17] J. S. Milne, *Introduction to Shimura varieties*, in Harmonic analysis, the trace formula,
  and Shimura varieties, Clay Math. Proc. 4 (2005), 265–378; revised 2017,
  [jmilne.org/math/xnotes/svi.pdf](https://www.jmilne.org/math/xnotes/svi.pdf). The revision keeps the
  numbering of the published version; page numbers are those of the revision.
- [Wal85] Jean-Loup Waldspurger, *Quelques propriétés arithmétiques de certaines formes automorphes
  sur GL(2)*, Compositio Mathematica 54 (1985), 121–171,
  [numdam CM_1985__54_2_121_0](http://www.numdam.org/item/CM_1985__54_2_121_0/). Page numbers are
  the printed ones.
