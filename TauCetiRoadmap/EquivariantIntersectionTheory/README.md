# Roadmap: equivariant intersection theory and Picard groups of quotient stacks

**Summary.** Build the Chow groups of quotient stacks `[X/G]` in the sense of Edidin and Graham,
and with them the Picard groups of quotient stacks, starting from graded rings. Layer 0 is
commutative algebra in Mathlib's vocabulary: a `𝔾_m`-action on `Spec A` is a `ℤ`-grading of `A`,
the shifts `A(d)` are classified up to graded isomorphism by the degrees of the homogeneous units,
and when `Spec A` is connected every grading of the free module `A` is a shift. Layer 1 constructs
`G`-linearised invertible sheaves on a scheme with an action of a flat group scheme of finite
presentation, as the general producer for every action, and proves `Pic [X/G] ≅ Pic^G(X)` on the
quotient stacks of SchemeAndStackFoundations. Layer 2 constructs equivariant Chow groups by
Totaro's approximation, for `G` smooth affine over a field and `X` quasi-projective with a
`G`-linearised ample invertible sheaf, with their operations and the localisation sequence, and
proves `Pic [X/G] ≅ A¹_G(X)` for `X` smooth. Layer 3 computes the classical examples over a
field: weighted affine spaces minus an integral invariant divisor (`ℤ/e`), `M_{1,1}` in
characteristic not `2` or `3` (`ℤ/12`), the stacks of smooth hyperelliptic curves of Arsie–Vistoli
in characteristic not dividing `4(g + 1)`, and `Pic [M_{0,n}/𝔖ₙ₋₁] ≅ ℤ/(n − 1)(n − 2)` for every
`n ≥ 3` in characteristic `0`, which for `n = 2g + 2` is the Picard group of the stack of
hyperelliptic Weierstrass points.

## Scope and ownership

This roadmap owns: the degree group of homogeneous units of a `ℤ`-graded ring, the shift classes,
and the `ℤ`-grading of a localisation at a homogeneous element; the groupoid of `G`-linearised
invertible sheaves on a scheme with an action of a flat group scheme, the equivariant Picard group
and its comparison with the Picard group of the quotient stack; equivariant Chow groups of schemes
with an action of a smooth affine group over a field, their operations, and the comparison with the
equivariant Picard group; and the computations of Layer 3.

Boundaries with the shared owners:

| Material | Owner | Boundary |
| --- | --- | --- |
| Graded algebras, their affine charts and localisation comparisons | AlgebraicVectorBundles L2A; StableReduction's relative Proj consumes it | Layer 0 uses Mathlib's `GradedAlgebra` and `HomogeneousLocalization` and that roadmap's affine graded-ring interface; it defines no graded quasi-coherent carrier. Its own addition is the `ℤ`-grading of `A_f` in all degrees, negative ones included (0.3), which the nonnegatively graded interface does not supply after inversion; 0.3 proves the comparison with that interface on the nonnegative part. |
| Group spaces and their actions, quotient stacks, torsors, quasi-coherent modules on stacks, Picard groups of schemes, Chow groups of schemes and their operations, equivariant modules for a discrete group, moduli stacks of pointed curves | SchemeAndStackFoundations §§1.13, 1.15, 1.21, 1.22, 2.23, 3.4, 4.15, 5.1–5.6 | Layer 1 constructs the equivariant theory on those objects: linearised sheaves are descent data for `X → [X/G]` through `QCoh.presentationEquiv`, `Pic [X/G]` is the group of isomorphism classes of invertible objects of `Stacks.QCoh [X/G]`, and for a finite constant group the linearised sheaves are the invertible objects of `EquivariantModules`. No second quotient-stack, line-bundle or Chow carrier is introduced. |
| `G`-linearised invertible sheaves on flag varieties | SchubertGeometry S3 (`G/B⁻`, `G/P⁻`) | SchubertGeometry S3 builds the `G/B⁻` case itself, with its root-theoretic statements (dominance, ampleness, Schubert divisors); 1.4 restricted to `G/B⁻` agrees with it. Layer 1 is the producer for an arbitrary scheme with an action: the groupoid with its equivariant isomorphisms and scalar automorphisms, tensor, dual, pullback, base change, the forgetful map to `LineBundleClass`, associated lines `G ×^H χ` and the fibre equivalence on `G/H` (1.4), and the comparison of two linearisations of one line by a character (1.3). |

Out of scope: equivariant cohomology of topological spaces, equivariant K-theory, Chow groups of
stacks that are not global quotients (Kresch), equivariant Chow groups of actions whose mixed
spaces are only algebraic spaces, which would need Chow groups of algebraic spaces at
SchemeAndStackFoundations, and the Chow ring of `[M_{0,2g+2}/𝔖_{2g+1}]` beyond degree one
(Edidin–Hu, Theorem 1.3), which no layer computes.

## Conventions

1. In 1.1, 1.2 and 1.4, `S` is a scheme and `G` a flat group scheme of finite presentation over
   `S`, and a closed subgroup `H ⊆ G` is flat of finite presentation with `G → G/H` an fppf
   `H`-torsor. In 1.3 and in Layers 2 and 3, `S = Spec k` for a field `k`, schemes are separated and
   of finite type over `k`, and groups are smooth affine group schemes of finite type over `k`. In
   particular `μ_n` is used only when `n` is invertible in `k`. Witness: over `𝔽₂`, `μ₂` is flat
   but not smooth, so `Bμ₂` over `𝔽₂` falls under Layer 1 and not under Layer 2.
2. A `𝔾_m`-action `t · x` on `X = Spec A` is the same as a `ℤ`-grading `A = ⊕_d A_d`, with
   `A_d = {a : a(t · x) = t^d a(x)}`, that is, the coaction `A → A[t, t⁻¹]` sends `a ∈ A_d` to
   `a t^d`. A weighted polynomial ring `k[x_i]` with weights `w_i` is Mathlib's `MvPolynomial`
   with `weightedHomogeneousSubmodule k w`. Witness: for `t · x = t² x` on `𝔸¹`, the coordinate
   `x` has degree `2`, and `x²` degree `4`.
3. A graded `A`-module `M` has shifts `M(d)_n = M_{n + d}`. For a character `χ^d : t ↦ t^d`,
   `O(χ^d)` is the trivial line bundle `X × 𝔸¹` with `t · (x, v) = (t · x, t^d v)`; its graded
   module of sections is `A(d)`. The class of `O(χ^d)` is called the class of the character `χ^d`.
   Witness: `A(1)_n = A_{n+1}`, so the generator `1` of `A(1)` lies in degree `−1`, and for
   `A = k[x]` with `x` of degree `1`, `x ∈ A(1)_0`.
4. Chow groups are graded by dimension, `A^G_i(X)`, and for `X` smooth of pure dimension `n` by
   codimension, `A^i_G(X) = A^G_{n−i}(X)`. The equivariant Chow ring of a point is
   `A^*_G = A^*_G(Spec k)`. Witness: for `G = 𝔾_m` acting on a point, `A^G_i(Spec k) = ℤ` for
   every `i ≤ 0` and `0` for `i > 0` (2.1, Checks), so `A^i_{𝔾_m} = ℤ` for every `i ≥ 0`.
5. (Edidin–Graham hypothesis.) In Layers 2 and 3, every `G`-scheme `X` is quasi-projective over
   `k` with a `G`-linearised ample invertible sheaf. This is hypothesis (1) of Edidin–Graham 1998,
   §2.1; it holds for every quasi-affine `G`-scheme, whose structure sheaf with its trivial
   linearisation is ample, hence for every example of Layer 3. Witness: `𝔸ⁿ ∖ 0` is quasi-affine
   and, for `n ≥ 2`, not affine, and satisfies it with `O`.

## Exact supplier contracts

**From Mathlib** (at the pinned revision).

- Graded rings: `GradedAlgebra`, `DirectSum.Decomposition`, `DirectSum.IsInternal`,
  `SetLike.GradedSMul`, `HomogeneousLocalization.Away`, `Localization.Away`,
  `IsLocalization.mk'`, `Submodule.span`, `Submodule.map`, `LinearMap.mulLeft`,
  `AddSubgroup.closure`, `AddSubgroup.zmultiples`.
- Polynomials: `MvPolynomial`, `MvPolynomial.weightedHomogeneousSubmodule`, `Polynomial.discr`,
  `Polynomial.isUnit_iff` (the units of `R[t]` over a domain are the constant units),
  `LaurentPolynomial`, `LaurentPolynomial.C`, `LaurentPolynomial.T`,
  `LaurentPolynomial.isUnit_T`.
- Spectra: `PrimeSpectrum.basicOpen`, `PrimeSpectrum.isClopen_iff` (a clopen subset of
  `Spec A` is `D(e)` for an idempotent `e`), `IsIdempotentElem`.
- Affine group schemes: `CommHopfAlgCat` and `AlgebraicGeometry.hopfSpec`, for `𝔾_m`, `GL_n`,
  `μ_n` and `Aff = 𝔾_a ⋊ 𝔾_m` as group objects over `Spec k`.

**From Tau Ceti** (at the pinned revision).

- `TauCeti.AlgebraicGeometry.LineBundleClass` (`TauCeti/AlgebraicGeometry/LineBundle/Class.lean`):
  the Picard group of a scheme, target of the forgetful map of 1.1.

**From AlgebraicVectorBundles.** L2A, the affine graded-ring interface of graded quasi-coherent
algebras with its localisation comparison (0.3).

**From SchemeAndStackFoundations.** §1.13, `GroupSpace S`, `GroupSpace.ofGroupScheme` and the
actions `Action G X` (1.1); §1.15, torsors and `Gm S` (1.4); §1.21, `actionQuotient G X` and
`actionQuotient.torsorEquiv` (1.4); §1.22, `Stacks.QCoh` and `QCoh.presentationEquiv` (1.4);
§2.23, `EquivariantModules X Γ act` (1.1); §3.4, Picard groups and the divisor class comparison
(1.1, 2.4); §4.15, `StableCurves.Mbar` with its open substack `Mbar.smooth` of smooth curves, for
`M_{1,1}` and `M_{0,n}` (3.2–3.4); §5.1, `ChowGroup κ X k`, and §§5.2–5.6, proper pushforward,
flat pullback, the localisation sequence, the first Chern class `Chow.c1`, projective bundles and
Chern classes, Gysin maps and intersection products (Layer 2).

## How to read the build

Layer 0 is commutative algebra on Mathlib alone, with the affine graded-ring interface of
AlgebraicVectorBundles L2A for one comparison in 0.3; it delivers the shift classification, the
grading of `A_f`, and the graded computations that Layer 3 reads off (0.4, 0.5). Layer 1 needs
group-space actions, quotient stacks and quasi-coherent modules on stacks from
SchemeAndStackFoundations, and delivers `Pic^G(X)`, its graded description over `Spec A` (1.2)
and `Pic [X/G] ≅ Pic^G(X)` with change of group and slices (1.4). Layer 2 needs the Chow groups of
SchemeAndStackFoundations Layer 5 and delivers equivariant Chow groups with `Pic^G(X) ≅ A¹_G(X)`
(2.4). Layer 3 combines the three: 3.1 is the model computation, by the localisation sequence and
by the graded description; 3.2–3.4 reduce moduli stacks to it by presentations as quotient stacks,
change of group and slices.

## Layer 0: graded rings and homogeneous units

### 0.1 Degrees of homogeneous units and shift classes

For a `ℤ`-graded `R`-algebra `(A, 𝒜)` (Mathlib's `GradedAlgebra 𝒜`, `𝒜 : ℤ → Submodule R A`),
define `homogeneousUnitDegrees 𝒜 : AddSubgroup ℤ`, generated by the degrees of the units of `A`
lying in some `𝒜 d`, and `ShiftClassGroup 𝒜 = ℤ ⧸ homogeneousUnitDegrees 𝒜`. Prove
`mem_homogeneousUnitDegrees_iff`: the inverse of a homogeneous unit is homogeneous of the opposite
degree, so a degree is in the group iff it is the degree of a homogeneous unit.

Shift classification, for modules with a homogeneous generator: a graded `A`-module that is free of
rank one on a homogeneous generator of degree `c` is isomorphic to `A(−c)`, and `A(d) ≅ A(e)` as
graded modules iff `d − e ∈ homogeneousUnitDegrees 𝒜`. In the form of `Suggested.lean`, a second
grading `ℳ` of `A` compatible with `𝒜` (`SetLike.GradedSMul 𝒜 ℳ`, `DirectSum.Decomposition ℳ`)
with a unit `u ∈ ℳ c` satisfies `ℳ n = u · 𝒜 (n − c)` for every `n`
(`eq_map_mulLeft_of_isUnit_mem`). So `ShiftClassGroup 𝒜` classifies the shifts `A(d)` up to graded
isomorphism, with the group law of the tensor product. It is not, in general, the group of all
gradings of the free module `A`; 0.2 gives the hypothesis under which it is.
*Needs:* Mathlib `GradedAlgebra`, `DirectSum.Decomposition`, `SetLike.GradedSMul`,
`AddSubgroup.closure`, `LinearMap.mulLeft`, `Submodule.map`.

**Checks.**

- For a nonzero ring with the trivial grading, the group is `⊥`: a unit is nonzero, and `𝒜 d = 0`
  for `d ≠ 0`; so `ShiftClassGroup 𝒜 = ℤ`, and the shifts `A(d)` are pairwise non-isomorphic.
- For the zero ring the group is `⊤`, since `0 = 1` is a unit lying in every `𝒜 d`.
- For the Laurent ring `k[t, t⁻¹]` with `t` of degree `1`, it is `⊤`; with `t` of degree `2`, it
  is `2ℤ`, and `ShiftClassGroup 𝒜 = ℤ/2`: the shifts `A(0)` and `A(1)` are not isomorphic.

### 0.2 Homogeneous generators on a connected spectrum

Prove `isUnit_laurentPolynomial_iff`: over a domain `R`, a Laurent polynomial `u ∈ R[t, t⁻¹]` is a
unit iff `u = c tⁿ` with `c` a unit of `R` and `n ∈ ℤ`. Route: if `u v = 1`, choose `N, M` with
`p = t^N u` and `q = t^M v` in `R[t]`, so that `p q = t^{N+M}`; since `t` is prime in `R[t]`,
write `p = t^i p₀` and `q = t^j q₀` with `t` dividing neither `p₀` nor `q₀`; then
`p₀ q₀ = t^{N+M−i−j}` forces `N + M = i + j` and `p₀ q₀ = 1`, and `Polynomial.isUnit_iff` makes
`p₀` a constant unit, so `u = p₀ t^{i−N}`. The converse is `LaurentPolynomial.isUnit_T`.

Prove `exists_isUnit_mem_of_connected`: if `A` has no idempotents other than `0` and `1` (that is,
`Spec A` is connected), every grading `ℳ` of the `A`-module `A` compatible with `𝒜` has a
homogeneous generator, a unit `u ∈ ℳ c` for some `c`. Proof: write `1 = Σ_e m_e` with
`m_e ∈ ℳ e`, and `u(t) = Σ_e m_e t^e ∈ A[t, t⁻¹]`. Compatibility gives `m_e t^e = ρ(m_e) u(t)`
for each `e`, where `ρ(a) = Σ_d a_d t^d`; dividing by `t^e` and summing, `u` is a unit of
`A[t, t⁻¹]`, with `u(1) = 1`. For each prime `p`, the image of `u` is a unit of `(A/p)[t, t⁻¹]`,
so by `isUnit_laurentPolynomial_iff` over the domain `A/p` exactly one coefficient of `u` lies
outside `p`. The finitely many open sets `D(m_e)` are therefore disjoint and cover `Spec A`, so
each is clopen, hence `D(e′)` for an idempotent `e′` by `PrimeSpectrum.isClopen_iff`; as `e′` is
`0` or `1` and `A ≠ 0` (the zero ring is trivial), one of them is `D(m_c) = Spec A`, so `m_c` is
a unit.

Hence, when `Spec A` is connected, `ShiftClassGroup 𝒜` classifies all gradings of the free
module `A` up to graded isomorphism (with 0.1). This covers every domain, in particular the
weighted polynomial rings and their localisations of 0.4 and 0.5.
*Needs:* 0.1; Mathlib `LaurentPolynomial`, `LaurentPolynomial.isUnit_T`, `Polynomial.isUnit_iff`,
`PrimeSpectrum.isClopen_iff`, `PrimeSpectrum.basicOpen`, `IsIdempotentElem`.

**Checks.**

- `A = k × k` with the trivial grading: the grading `ℳ 0 = k × 0`, `ℳ 1 = 0 × k` has no
  homogeneous generator and is not a shift `A(d)`; the gradings of `A` up to isomorphism form `ℤ²`
  (one degree on each factor), while `ShiftClassGroup 𝒜 = ℤ`. The hypothesis of 0.2 fails, as it
  must.
- `A = k[t, t⁻¹]` with `t` of degree `1` and `ℳ n = 𝒜 (n + 1)`: the generator is `1 ∈ ℳ (−1)`,
  and since `ShiftClassGroup 𝒜 = 0` (0.1, Checks), `ℳ ≅ 𝒜`.
- The Laurent lemma needs a domain: over `R = k[ε]/(ε²)`, `1 + ε t` is a unit of `R[t, t⁻¹]`, with
  inverse `1 − ε t`, and is not a monomial. The proof applies it only to the domains `A/p`.

### 0.3 Localisation at a homogeneous element

For `f ∈ 𝒜 e`, define `awayGrading 𝒜 hf : ℤ → Submodule R (Localization.Away f)`, with
`a / fⁿ` of degree `deg a − n e`, and prove `awayGrading_isInternal`, so that it is a grading.
Give the `GradedAlgebra` instance, the compatibility of `algebraMap A A_f` with the gradings, and
the identification of the degree-zero part with Mathlib's `HomogeneousLocalization.Away 𝒜 f`.
When `𝒜` is concentrated in degrees `≥ 0`, prove that the degree-`≥ 0` part of `awayGrading`
and its degree-zero part agree with the localisation comparison of the affine graded-ring
interface of AlgebraicVectorBundles L2A applied to `Spec A`; the negative degrees are the
extension made here. *Needs:* Mathlib `Localization.Away`, `IsLocalization.mk'`,
`Submodule.span`, `DirectSum.IsInternal`, `HomogeneousLocalization.Away`; AlgebraicVectorBundles
L2A.

**Checks.**

- `k[t]` with `t` of degree `1` and `f = t` (`e = 1`): `t⁻¹ = 1 / t` lies in degree `−1`, so
  `awayGrading` is the grading of `k[t, t⁻¹]` with `t` of degree `1`, negative degrees included;
  a grading supported in degrees `≥ 0` would miss `t⁻¹`.
- `f = 1` (`e = 0`): `A_1 = A`, `a / 1ⁿ` has degree `deg a`, and `awayGrading` gives `𝒜` back.
- `f = 0`, which lies in every `𝒜 e`: `A_0` is the zero ring, every `awayGrading 𝒜 hf d` is the
  whole of it, and `homogeneousUnitDegrees` of it is `⊤` (0.1, Checks).

### 0.4 Weighted polynomial rings

Let `k` be a field, `σ` a type and `w : σ → ℤ` any weights. Prove
`homogeneousUnitDegrees_weighted`: the units of `k[σ]` are the nonzero constants, of degree `0`,
so the group is `⊥`. For `f` prime and weighted homogeneous of weight `e`, prove
`homogeneousUnitDegrees_away_prime`: `k[σ]` is factorial, so the units of `k[σ]_f` are the `c fᵐ`,
`c ∈ kˣ`, `m ∈ ℤ`, of degree `m e`, and the group is `eℤ`. For `f` a product of distinct weighted
homogeneous primes `f_j` of weights `e_j`, the group is generated by the `e_j`. These rings are
domains, so by 0.2 the shift classes are all the gradings of the free module of rank one. The
geometric setting of 3.1 is that of positive weights on a finite `σ` with `e > 0`, where
`ShiftClassGroup ≅ ℤ/e`; the statements need neither. *Needs:* 0.1, 0.2, 0.3; Mathlib
`MvPolynomial`, `MvPolynomial.weightedHomogeneousSubmodule`, `AddSubgroup.zmultiples`.

**Checks.**

- `k[x]` with `x` of weight `1`: the group is `⊥`; with `x` of weight `0` it is still `⊥`, since
  the units are the constants, so no positivity is needed for `homogeneousUnitDegrees_weighted`.
- `f = x` in `k[x]`: with `x` of weight `1`, `k[x]_x = k[x, x⁻¹]` and the group is `ℤ`; with `x`
  of weight `2`, it is `2ℤ` and `ShiftClassGroup = ℤ/2`.
- Primality is needed: `f = x²` in `k[x]`, `x` of weight `1`, has `e = 2`, but `k[x]_{x²}` contains
  the unit `x = x³/x²` of degree `1`, so the group is `ℤ`, not `2ℤ`.
- `f = x y` in `k[x, y]` with weights `2, 3`: the units `c xᵃ yᵇ` have degrees `2a + 3b`, so the
  group is `ℤ`, generated by `2` and `3`.

### 0.5 The generic discriminant

Define `genericDepressed k m = Xᵐ + a₂ Xᵐ⁻² + ⋯ + aₘ` over `k[a₂, …, aₘ]`, the weights
`depressedWeight m` (`aⱼ` of weight `j`), and `depressedDiscr k m`, its discriminant in Mathlib's
`Polynomial.discr`. Prove `depressedDiscr_mem` (weight `m (m − 1)`, for `m ≥ 2`) and
`depressedDiscr_prime` (prime in characteristic `0`, for `m ≥ 2`). By 0.4, the homogeneous unit
degrees of `k[a₂, …, aₘ]_Δ`, `Δ = depressedDiscr k m`, are then `m (m − 1) ℤ` in characteristic
`0`. *Needs:* 0.4; Mathlib `Polynomial.discr`, `MvPolynomial.weightedHomogeneousSubmodule`.

**Checks.**

- `m = 2`: the discriminant is `−4 a₂`, of weight `2`, prime in characteristic `0`, and the group
  is `2ℤ`.
- `m = 3`: it is `−4 a₂³ − 27 a₃²`, of weight `6`, and the group is `6ℤ`.
- The characteristic hypothesis is needed: in characteristic `3`, for `m = 3`, the discriminant is
  `−a₂³`, not prime; in characteristic `2`, for `m = 2`, it is `0`.

### Examples

- `k[t, t⁻¹]` with `t` of degree `d ≥ 1`: `ShiftClassGroup = ℤ/d`, the graded ring of `𝔾_m`
  acting on itself by `s · x = s^d x`.
- For `k` of characteristic not `2` or `3`, `k[a, b]_Δ` with `a, b` of weights `4, 6` and
  `Δ = 4a³ + 27b²`, prime of weight `12`: `ShiftClassGroup = ℤ/12`, the graded input of 3.2.

### Dependencies

Mathlib, and AlgebraicVectorBundles L2A for the comparison of 0.3. Within the layer,
0.1 → 0.2 → 0.4 → 0.5, and 0.3 → 0.4.

## Layer 1: linearised invertible sheaves and the Picard group of a quotient stack

### 1.1 The groupoid of linearised invertible sheaves

For `G` acting on an `S`-scheme `X` by `a : G × X → X` (an action of SchemeAndStackFoundations
§1.13), define a `G`-linearisation of an invertible sheaf `L` on `X` as an isomorphism
`φ : a^* L ≅ pr₂^* L` satisfying the cocycle condition on `G × G × X` and the unit condition
(Mumford–Fogarty–Kirwan 1994, Chapter 1, §3), and the groupoid of `G`-linearised invertible
sheaves, whose morphisms are the isomorphisms of invertible sheaves compatible with the
linearisations; its automorphisms of `O_X` with the trivial linearisation are the invariant units
`Γ(X, O_X)^{*G}`, which the groupoid keeps. Construct tensor product, dual and the trivial object,
pullback along `G`-equivariant morphisms, base change along `S' → S`, the forgetful functor to
invertible sheaves, and the group `Pic^G(X)` of isomorphism classes, with the forgetful
homomorphism `Pic^G(X) → LineBundleClass X` (SchemeAndStackFoundations §3.4). For a finite
constant group, identify the groupoid with the invertible objects of `EquivariantModules X G act`
(SchemeAndStackFoundations §2.23). *Needs:* SchemeAndStackFoundations §§1.13, 2.23, 3.4; Tau Ceti
`TauCeti.AlgebraicGeometry.LineBundleClass`; Mathlib `CommHopfAlgCat`, `AlgebraicGeometry.hopfSpec`.

**Checks.**

- For `G` trivial, a linearisation is the identity, the groupoid is that of invertible sheaves,
  and `Pic^G(X) = Pic(X)`.
- For `G = 𝔾_m` acting trivially on `Spec k`, the automorphisms of `O` are `k^*`, and
  `Pic^{𝔾_m}(Spec k) = X^*(𝔾_m) = ℤ`, by `O(χ^d) ↦ d`, while `Pic(Spec k) = 0`: `Pic^G(X)` is not
  the group of invariant classes `Pic(X)^G`.
- For `G = ℤ/2` acting trivially on `Spec k` with `2` invertible in `k`,
  `Pic^G(Spec k) = Hom(ℤ/2, k^*) = {±1}`, of order `2`; for `k` of characteristic `2` it is
  trivial.

### 1.2 `𝔾_m` on an affine scheme

For `G = 𝔾_m` and `X = Spec A`, with the grading of Convention 2, prove that a linearisation of
`O_X` is the same as a grading of the `A`-module `A` compatible with `𝒜`, that `O(χ^d)`
corresponds to `A(d)`, and that `d ↦ [O(χ^d)]` induces an injection
`ShiftClassGroup 𝒜 ↪ ker(Pic^{𝔾_m}(Spec A) → Pic(A))` (0.1). When `Spec A` is connected it is an
isomorphism (0.2); in general it is not (0.2, Checks). In particular, if `Spec A` is connected and
`Pic(A) = 0`, then `Pic^{𝔾_m}(Spec A) ≅ ShiftClassGroup 𝒜`. *Needs:* 0.1, 0.2; 1.1.

**Checks.**

- `A = k` with the trivial grading: `ShiftClassGroup = ℤ = X^*(𝔾_m) = Pic^{𝔾_m}(Spec k)`
  (1.1, Checks).
- `A = k[t, t⁻¹]` with `t` of degree `1`, that is `𝔾_m` acting on itself by translation:
  `ShiftClassGroup = 0`, the Picard group of `[𝔾_m/𝔾_m] = Spec k`.
- `A = k × k` with the trivial grading: the injection `ℤ ↪ ℤ²`, `d ↦ (d, d)`, is not surjective.

### 1.3 The exact sequences

Over a field: prove the exact sequence `0 → H¹(G, k[X]^*) → Pic^G(X) → Pic(X)^G` for `G` finite
constant, the first map sending a cocycle of `G` in the units to `O_X` with that linearisation;
and, for `G` connected and `X` a normal variety with `k[X]^* = k^*`, the exact sequence
`0 → X^*(G) → Pic^G(X) → Pic(X)`, a character `χ` giving `O(χ)`: two linearisations of the same
invertible sheaf differ by a unique character (Knop–Kraft–Luna–Vust, Lemma 2.2 and
Proposition 2.3). For `G` connected and `X` only reduced, Brion 2015, Proposition 2.10, extends
the second sequence to `O(X)^* → Ĝ(X) → Pic^G(X) → Pic(X) → Pic(G × X)/pr₂^* Pic(X)`, with `Ĝ`
the character group of `G` viewed as an étale sheaf. *Needs:* 1.1, 1.2.

**Checks.**

- `G = ℤ/2` acting trivially on `Spec k`, `2` invertible: `H¹(G, k^*) = {±1} = Pic^G(Spec k)`,
  and `Pic(Spec k) = 0`.
- `G = 𝔾_m` on `Spec k`: `X^*(𝔾_m) = ℤ ≅ Pic^{𝔾_m}(Spec k)`, and `Pic(Spec k) = 0`.
- The hypothesis `k[X]^* = k^*` is needed: for `𝔾_m` acting on `X = 𝔾_m` by translation,
  `k[X]^* = k^* t^ℤ` and `Pic^{𝔾_m}(𝔾_m) = 0` (1.2, Checks), so `X^*(𝔾_m) = ℤ → Pic^G(X)` is not
  injective: the section `x ↦ (x, x)` is an equivariant trivialisation of `O(χ)`.

### 1.4 Picard groups of quotient stacks, change of group, slices

Prove `Pic [X/G] ≅ Pic^G(X)`, where `Pic [X/G]` is the group of isomorphism classes of invertible
objects of `Stacks.QCoh [X/G]`: by `QCoh.presentationEquiv` for `[X/G] = actionQuotient G X`,
quasi-coherent modules on `[X/G]` are quasi-coherent modules on `X` with descent data along the
`G`-torsor `X → [X/G]` (SchemeAndStackFoundations §§1.15, 1.21, 1.22), and invertible ones are
the linearised invertible sheaves. Prove the change of group: for `H ⊆ G` closed and
`X = G ×^H Y`, `[X/G] ≅ [Y/H]` and the groupoids of `G`-linearised invertible sheaves on `X` and
of `H`-linearised invertible sheaves on `Y` are equivalent. For `Y` a point this is the fibre
equivalence on `G/H`: the groupoid of `G`-linearised invertible sheaves on `G/H` is equivalent to
the groupoid of invertible `O_S`-modules with an `H`-action, by the fibre along the base section
and the associated line `G ×^H χ`, with unit and counit, compatible with tensor, dual, the
trivial object and base change; over a field, `Pic^G(G/H) ≅ X^*(H)`. Prove the slice reduction:
for `G = U ⋊ T` with `U` unipotent, and `Y ⊆ X` a closed subscheme stable under `T` such that the
action map `U × Y → X` is an isomorphism, `[X/G] ≅ [Y/T]`. *Needs:* 1.1; SchemeAndStackFoundations
§§1.15, 1.21, 1.22.

**Checks.**

- `G` trivial: `[X/1] = X` and `Pic [X/1] = Pic(X)`.
- `X = Spec k`, `G = H = 𝔾_m`: `Pic B𝔾_m = X^*(𝔾_m) = ℤ`; for `G = 𝔾_m` acting on itself by
  translation and `H = 1`, `[𝔾_m/𝔾_m] = Spec k` and `Pic = 0`, as in 1.2.
- Slice: `Aff = 𝔾_a ⋊ 𝔾_m` acting on `𝔸¹` by `x ↦ a x + b`, with `Y = {0}`: `𝔾_a × {0} → 𝔸¹`,
  `b ↦ b`, is an isomorphism, so `[𝔸¹/Aff] ≅ B𝔾_m`, with `Pic = ℤ`.
- The slice hypothesis is an isomorphism, not a bijection on points: over `𝔽_p`, for `𝔾_a`
  acting on `𝔸¹` by `x ↦ x + b^p` and `Y = {0}`, `Y` meets each orbit once, but `b ↦ b^p` is not
  an isomorphism, and `[𝔸¹/𝔾_a]` is `Bα_p`, not `Y`.

### Examples

- `Pic^{𝔾_m}(𝔸¹) = Pic [𝔸¹/𝔾_m] = ℤ` for the weight-one action, by 1.2 with `A = k[x]`
  (connected, `Pic = 0`, homogeneous units the constants) and 1.4.
- `Pic [𝔸¹/Aff] = ℤ` by the slice of 1.4, generated by the character `a`.

### Dependencies

Layer 0; SchemeAndStackFoundations §§1.13, 1.15, 1.21, 1.22, 2.23, 3.4; Tau Ceti
`TauCeti.AlgebraicGeometry.LineBundleClass`; Mathlib `CommHopfAlgCat`, `AlgebraicGeometry.hopfSpec`.
Within the layer, 1.1 → 1.2 → 1.3 and 1.1 → 1.4.

## Layer 2: equivariant Chow groups

Throughout, Conventions 1 and 5 hold: `k` a field, `G` smooth affine, `X` quasi-projective with a
`G`-linearised ample invertible sheaf. Every mixed space below is then a quasi-projective scheme,
to which the Chow groups of SchemeAndStackFoundations Layer 5 apply. Locators in Edidin–Graham
1998 follow the numbering of its arXiv text, except where marked "published numbering".

### 2.1 Totaro's approximation

For `G` of dimension `g`, a representation `V` of dimension `l` and an invariant open `U ⊆ V` on
which `G` acts freely, with a quasi-projective principal-bundle quotient `U → U/G` and complement of
codimension `> n − i`, the mixed space `X ×^G U` is a quasi-projective scheme and
`X × U → X ×^G U` is a principal `G`-bundle (Edidin–Graham 1998, Proposition 22, hypothesis (1)).
Define `A^G_i(X) = A_{i + l − g}(X ×^G U)` and prove that it does not depend on `(V, U)`
(Edidin–Graham 1998, Definition-Proposition 1, by Bogomolov's double fibration; for `X` a point,
Totaro 1999, Theorem 1.1 and Definition 1.2). Prove that such `(V, U)` exist for every `i`
(Edidin–Graham 1998, Lemma 12). *Needs:* 1.1; SchemeAndStackFoundations §§5.1, 5.2; Mathlib
`CommHopfAlgCat`.

**Checks.**

- `G` trivial: `V = 0`, `U = Spec k`, and `A^G_i(X) = A_i(X)`.
- `G = 𝔾_m`, `V = 𝔸^l` with all weights `1`, `U = V ∖ 0`, `U/G = ℙ^{l−1}`:
  `A^G_i(Spec k) = A_{i+l−1}(ℙ^{l−1})`, which is `ℤ` for `1 − l ≤ i ≤ 0` and `0` for `i > 0`;
  equivariant Chow groups are nonzero in negative degrees.
- Independence, for `G = 𝔾_m` on a point and `i = −1`: with `l = 2`, `A_0(ℙ¹) = ℤ`; with `l = 3`,
  `A_1(ℙ²) = ℤ`, the same group, as Definition-Proposition 1 requires.
- A free action with a quotient gives the Chow groups of the quotient: for `𝔾_m` acting on
  `𝔸² ∖ 0` with weights `1`, the mixed space is a vector bundle minus a closed subset of high
  codimension over `ℙ¹`, so `A^*_{𝔾_m}(𝔸² ∖ 0) = A^*(ℙ¹)` (Edidin–Graham 1998, Proposition 4).

### 2.2 Operations

For `G`-schemes and `G`-morphisms satisfying Convention 5: proper pushforward, flat pullback, the
localisation sequence `A^G_i(Z) → A^G_i(X) → A^G_i(X ∖ Z) → 0` for an invariant closed `Z`,
equivariant Chern classes of equivariant vector bundles, intersection products for `X` smooth, and
homotopy invariance for equivariant vector bundles and affine bundles, all deduced from
SchemeAndStackFoundations §§5.2–5.6 applied to the mixed spaces of 2.1, which inherit Convention 5
(invariant closed and open subschemes, and equivariant vector bundles, of a quasi-projective `X`
with a linearised ample sheaf are again of that kind). Prove invariance under change of
presentation: if `[X/G] ≅ [Y/H]` with `X` and `Y` smooth, then `A^*_G(X) ≅ A^*_H(Y)` as graded
rings, graded by codimension, by the double fibration of Edidin–Graham 1998, Proposition 9.
*Needs:* 2.1; 1.4; SchemeAndStackFoundations §§5.2–5.6.

**Checks.**

- Localisation for `𝔾_m` acting on `𝔸¹` with weight `1` and `Z = {0}`: `A^*_{𝔾_m}(𝔸¹) = ℤ[t]` by
  homotopy invariance, the image of `A^*_{𝔾_m}(Z)` is the ideal `(t)`, and
  `A^*_{𝔾_m}(𝔸¹ ∖ 0) = ℤ`, the Chow ring of the point `[(𝔸¹ ∖ 0)/𝔾_m]`.
- The sequence is not exact on the left: for `G` trivial, `X = ℙ¹` and `Z` two points,
  `A_0(Z) = ℤ² → A_0(ℙ¹) = ℤ` is not injective.
- Change of presentation: `[𝔾_m/𝔾_m] = [Spec k/1]`, so `A^*_{𝔾_m}(𝔾_m) = A^*(Spec k) = ℤ`, in
  codimension `0`; in the dimension grading the two sides differ by the shift
  `dim 𝔾_m − dim Spec k = 1`, which is why the comparison is stated by codimension.

### 2.3 Classifying spaces

Prove `A^*_{𝔾_m} ≅ ℤ[t]`, `t = c₁(O(χ))`, `A^*_{𝔾_m^r} ≅ ℤ[t₁, …, t_r]`,
`A^*_{GL_n} ≅ ℤ[c₁, …, c_n]`, and, for `n` invertible in `k`, `A^*_{μ_n} ≅ ℤ[t]/(n t)`. These are
this roadmap's own computations, by the following route. For `𝔾_m^r`, the approximations
`(𝔸^l ∖ 0)^r` with quotient `(ℙ^{l−1})^r` (Edidin–Graham 1998, §2.2, Example) and the projective
bundle formula. For `GL_n`, with `T ⊆ B` the diagonal torus and a Borel subgroup, the flag variety
`Fl = GL_n/B` satisfies `[Fl/GL_n] ≅ [Spec k/B]`, so `A^*_{GL_n}(Fl) = A^*_B = A^*_T` by change of
presentation and homotopy invariance along the affine bundle with fibre `B/T` (2.2); `Fl` is an
iterated projective bundle, and the projective bundle formula gives
`A^*_{GL_n}(Fl) = A^*_{GL_n} ⊗_{ℤ[c₁, …, c_n]} ℤ[t₁, …, t_n]`, with `c_i` the elementary symmetric
functions and `c_i ↦ c_i(V)` for the standard representation `V`; as `ℤ[t₁, …, t_n] = A^*_T` is
free over `ℤ[c₁, …, c_n]`, faithful flatness gives `A^*_{GL_n} = ℤ[c₁, …, c_n]`. For `μ_n`,
`[Spec k/μ_n] ≅ [(𝔸¹ ∖ 0)/𝔾_m]` with weight `n` (2.2), and in the localisation sequence of
`{0} ⊆ 𝔸¹` the image of `A^*_{𝔾_m}({0})` is the ideal `(n t)`, since the coordinate has degree
`n`. *Needs:* 2.1, 2.2; SchemeAndStackFoundations §5.4.

**Checks.**

- `c₁(O(χ^d)) = d t` in `A¹_{𝔾_m}`, by additivity of `c₁`; for `d = 0` it is `0`.
- `μ₁` is trivial, and `ℤ[t]/(1 · t) = ℤ` is the Chow ring of a point.
- `GL_1 = 𝔾_m`: `ℤ[c₁] = ℤ[t]`; the truncation by `l = 2` gives `A^*(ℙ¹) = ℤ[t]/(t²)`, which agrees
  with `ℤ[t]` in degrees `< 2` only, as the codimension condition of 2.1 requires.

### 2.4 The Picard group

For `X` smooth, prove that `c₁ : Pic^G(X) → A¹_G(X)` is an isomorphism (Edidin–Graham 1998,
Proposition 18, published numbering; used by Arsie–Vistoli in the proof of their Theorem 5.1).
With 1.4, `Pic [X/G] ≅ A¹_G(X)`. *Needs:* 1.1, 1.4; 2.1, 2.2; SchemeAndStackFoundations §§3.4, 5.3.

**Checks.**

- For `𝔾_m` acting on `𝔸ⁿ ∖ 0` with all weights `1`, `A^*_{𝔾_m}(𝔸ⁿ ∖ 0) ≅ ℤ[t]/(tⁿ)`, the Chow
  ring of `ℙⁿ⁻¹`, so `Pic = ℤ` for `n ≥ 2`.
- For `n` invertible in `k` and `μ_n ⊆ 𝔾_m`, `A¹_{μ_n} = ℤ/n = Hom(μ_n, 𝔾_m) = Pic Bμ_n`.
- `G` trivial: `Pic(X) ≅ A¹(X) = A_{dim X − 1}(X)` for `X` smooth, the divisor class comparison of
  SchemeAndStackFoundations §§3.4, 5.1.

### Examples

- `A^*_{𝔾_m} = ℤ[t]` and `A^*_{μ_n} = ℤ[t]/(n t)`, with `Pic B𝔾_m = ℤ` and `Pic Bμ_n = ℤ/n`.
- `A^*_{GL_2} = ℤ[c₁, c₂]`, with `c₁ = t₁ + t₂` and `c₂ = t₁ t₂` in `A^*_{𝔾_m²}`.

### Dependencies

Layer 1 (1.1, 1.4); SchemeAndStackFoundations §§3.4, 5.1–5.6; Mathlib `CommHopfAlgCat`. Within the
layer, 2.1 → 2.2 → 2.3 and 2.2 → 2.4.

## Layer 3: computations

All computations are over a field `k`, under Conventions 1 and 5; each subsection states its
characteristic.

### 3.1 Weighted affine space minus an invariant divisor

For `𝔾_m` acting on `𝔸ⁿ` with positive weights and `D = {f = 0}` an integral invariant divisor of
weight `e`, prove `Pic [(𝔸ⁿ ∖ D)/𝔾_m] ≅ ℤ/e`, generated by the class of `χ`, by the localisation
sequence of 2.2 (the class of `[D]` is `e t`) and `A^1_{𝔾_m}(𝔸ⁿ) = ℤ t`. Check it against
0.4 through 1.2: `k[σ]_f` is a factorial domain, so `Pic(k[σ]_f) = 0` and
`Pic^{𝔾_m} ≅ ShiftClassGroup ≅ ℤ/e`, with `[O(χ^d)] ↦ d mod e` in both descriptions.
*Needs:* 0.4, 1.2, 1.4; 2.2, 2.3, 2.4.

**Checks.**

- `n = 1`, weight `1`, `f = x`: `ℤ/1 = 0`, and `[(𝔸¹ ∖ 0)/𝔾_m] = Spec k`.
- `n = 1`, weight `2`, `f = x`: `ℤ/2`, and for `2` invertible `[(𝔸¹ ∖ 0)/𝔾_m] = Bμ₂`, with
  `Pic = ℤ/2` (2.4, Checks).
- `n = 2`, weights `1, 1`, `f = x`: `ℤ/1 = 0`, and `[(𝔸² ∖ {x = 0})/𝔾_m] ≅ 𝔸¹` by `y/x`. The
  divisor must be integral: `{x² = 0}` has weight `2` but the same complement, with `Pic = 0`
  (0.4, Checks).

### 3.2 `M_{1,1}`

Over a field `k` of characteristic not `2` or `3`, prove
`M_{1,1} ≅ [(𝔸² ∖ {Δ = 0})/𝔾_m]` with weights `4, 6` (`y² = x³ + a x + b`, `Δ = −16(4a³ + 27b²)`,
irreducible of weight `12`), and, by 3.1, `Pic M_{1,1} ≅ ℤ/12`, generated by the Hodge bundle.
This is Mumford 1965 and the case `S = Spec k` of Fulton–Olsson 2010, Theorem 1.1, which gives
`ℤ/12 × Pic(𝔸¹_S) ≅ Pic(M_{1,1,S})` when `S` is reduced or a `ℤ[1/2]`-scheme; here
`Pic(𝔸¹_k) = 0`. *Needs:* 3.1; 1.4; SchemeAndStackFoundations §4.15.

**Checks.**

- The weights: `a ↦ t⁴ a`, `b ↦ t⁶ b` make `4a³` and `27b²` both of weight `12`, so `Δ` is
  homogeneous of weight `12`.
- The stabiliser of a generic `(a, b)` is `μ₂` (`t = −1`, the automorphism `(x, y) ↦ (x, −y)`),
  which acts on the fibre of `O(χ)` by `−1`, so `O(χ)` is nontrivial on `M_{1,1}`, while `Δ` is a
  nowhere-vanishing section of weight `12`.
- The characteristic restriction concerns the route: in characteristic `2` or `3` not every
  elliptic curve has the form `y² = x³ + a x + b`, while Fulton–Olsson's `ℤ/12` holds over every
  field.

### 3.3 Hyperelliptic curves and Weierstrass points

Over a field of characteristic not dividing `4(g + 1)`, prove the presentation of the stack of
smooth hyperelliptic curves of genus `g ≥ 2` as `[A_sm(1, 2g + 2)/(GL₂/μ_{g+1})]`, the binary forms
of degree `2g + 2` with nonzero discriminant (Arsie–Vistoli, Corollaries 4.2 and 4.7), and its
Picard group, cyclic of order `4g + 2` for `g` even and `8g + 4` for `g` odd (Arsie–Vistoli,
Theorem 5.1, with `n = 1`, `r = 2`, `d = g + 1`). In characteristic `0`, prove
`Pic [M_{0,2g+2}/𝔖_{2g+1}] ≅ ℤ/2g(2g + 1)`, by 3.4 with `n = 2g + 2`. This is the degree-one part
of Edidin–Hu, Theorem 1.3, `A^*([M_{0,2g+2}/𝔖_{2g+1}]) ≅ ℤ[l]/(2g(2g + 1) l)`, which holds over
an algebraically closed field of characteristic not dividing `2g + 2`; the agreement is a
comparison, not a target. *Needs:* 2.2, 2.4; 1.4; 3.4; SchemeAndStackFoundations §4.15.

**Checks.**

- `g = 2`: the order is `4g + 2 = 10`, and `2g(2g + 1) = 20 = (n − 1)(n − 2)` for `n = 6`.
- `g = 3`: the order is `8g + 4 = 28`, twice `4g + 2 = 14`, and `2g(2g + 1) = 42` for `n = 8`.
- The characteristic hypothesis of Arsie–Vistoli excludes `2` for every `g`, and `3` for `g = 2`,
  since then `4(g + 1) = 12`.

### 3.4 `[M_{0,n}/𝔖ₙ₋₁]` for every `n ≥ 3`

Over a field of characteristic `0`, for `n ≥ 3` and `m = n − 1`, prove the following.

1. `[M_{0,n}/𝔖ₙ₋₁] ≅ [U/Aff]`, with `U` the monic squarefree polynomials of degree `m` and
   `Aff = 𝔾_a ⋊ 𝔾_m` acting on `𝔸¹` by `x ↦ a x + b` and on `U` through the roots, by fixing the
   `n`-th point at `∞` (change of group of 1.4, `Aff` the stabiliser of `∞` in `PGL₂`).
2. `[U/Aff] ≅ [U₀/𝔾_m]` by the slice reduction of 1.4, `U₀ ⊆ U` the polynomials with roots of sum
   zero: `𝔾_a × U₀ → U`, translation by `b`, is an isomorphism, whose inverse translates by the
   mean of the roots, which needs `m` invertible in `k`. Here `U₀ = Spec k[a₂, …, aₘ]_Δ` with `aⱼ`
   of weight `j` under `x ↦ t x` (Convention 2) and `Δ = depressedDiscr k m`.
3. By 0.5 and 3.1, `Pic [M_{0,n}/𝔖ₙ₋₁] ≅ ℤ/m(m − 1) = ℤ/(n − 1)(n − 2)`, `[O(χ^d)] ↦ d`.
4. The tangent line `T_∞` at the `n`-th point: `Aff` fixes `∞` and acts on `T_∞ℙ¹` by the
   derivative `a⁻¹` (in the coordinate `1/x`), so on `[U₀/𝔾_m]` it is `O(χ⁻¹)`, of class `−1`,
   a generator. The other `m` points are the roots `r_1, …, r_m` of the polynomial, which are not
   ordered, so a tangent line at a single root is not defined on `[U/Aff]`; their tensor product
   `⊗_i T_{r_i}ℙ¹` is, since `𝔖ₙ₋₁` permutes the factors. `Aff` acts on each `T_{r_i}ℙ¹` by the
   derivative `a`, so on the fibre `⊗_i T_{r_i}ℙ¹` by `a^m`, and this line bundle is `O(χ^m)`;
   its tensor product with `T_∞` is `O(χ^{m−1})`, of order
   `m(m − 1) / gcd(m(m − 1), m − 1) = m = n − 1`.

*Needs:* 0.5; 1.4; 3.1; SchemeAndStackFoundations §4.15.

**Checks.**

- `n = 3`: `ℤ/2`, and `[M_{0,3}/𝔖₂] = B(ℤ/2)`, with `Pic = Hom(ℤ/2, k^*) = ℤ/2`.
- `n = 4`: `ℤ/6`; the pullback along the `μ₂`-gerbe `M_{1,1} → [M_{0,4}/𝔖₃]` is injective with
  image of index `2` in `Pic M_{1,1} = ℤ/12` (3.2).
- `n = 5`: `ℤ/12`. `n = 6`: `ℤ/20`, the case `g = 2` of 3.3.
- Item 4 at `n = 3`: `m = 2`, and `O(χ^{m−1}) = O(χ)` has order `2 = n − 1`, a generator of `ℤ/2`.

### Examples

- `Pic M_{1,1} = ℤ/12` (3.2) and `Pic [M_{0,4}/𝔖₃] = ℤ/6` (3.4), compared by the `μ₂`-gerbe.
- `Pic [M_{0,6}/𝔖₅] = ℤ/20`, the Picard group of the stack of hyperelliptic Weierstrass points of
  genus `2` (3.3).

### Dependencies

Layers 0–2; SchemeAndStackFoundations §4.15. Within the layer, 3.1 → 3.2 and 3.1 → 3.4 → 3.3.

## Downstream consumers

No roadmap on main cites this one. GroupSchemesOverABase 6.1 cites 1.1 as the owner of
`G`-linearised invertible sheaves and `Pic^G`, for the linearisation of its line bundles `𝓛(λ)`
on `G/B⁻`.

## References

- D. Edidin, W. Graham, « Equivariant intersection theory », *Invent. Math.* 131 (1998), no. 3,
  595–644 (appendix by A. Vistoli). Zbl 0940.14003; arXiv:alg-geom/9603008. Locators follow the
  arXiv numbering (§2.1, hypothesis (1); §2.2, Example; Definition-Proposition 1; Propositions 4,
  9 and 22; Lemma 12), except Proposition 18, in the published numbering.
- B. Totaro, « The Chow ring of a classifying space », in *Algebraic K-theory* (Seattle, 1997),
  Proc. Sympos. Pure Math. 67, AMS (1999), 249–281, Theorem 1.1 and Definition 1.2.
  Zbl 0967.14005; arXiv:math/9802097.
- A. Vistoli, « The Chow ring of `M₂` », appendix to Edidin–Graham, *Invent. Math.* 131 (1998).
- F. Knop, H. Kraft, D. Luna, T. Vust, « Local properties of algebraic group actions », in
  *Algebraische Transformationsgruppen und Invariantentheorie*, DMV Sem. 13, Birkhäuser (1989),
  63–75, Lemma 2.2 and Proposition 2.3. Zbl 0722.14032.
- D. Mumford, J. Fogarty, F. Kirwan, *Geometric Invariant Theory*, 3rd ed., Ergeb. Math.
  Grenzgeb. (2) 34, Springer (1994), Chapter 1, §3. doi:10.1007/978-3-642-57916-5.
- M. Brion, « On linearization of line bundles », *J. Math. Sci. Univ. Tokyo* 22 (2015), no. 1,
  113–147, Proposition 2.10. Zbl 1342.14012; arXiv:1312.6267.
- D. Mumford, « Picard groups of moduli problems », in *Arithmetical Algebraic Geometry*
  (Purdue, 1963), Harper & Row (1965), 33–81. Zbl 0187.42801.
- W. Fulton, M. Olsson, « The Picard group of `M_{1,1}` », *Algebra Number Theory* 4 (2010), no. 1,
  87–104, Theorem 1.1. Zbl 1198.14010; arXiv:0704.2214.
- A. Arsie, A. Vistoli, « Stacks of cyclic covers of projective spaces », *Compos. Math.* 140
  (2004), no. 3, 647–666, Corollaries 4.2 and 4.7, Theorem 5.1. Zbl 1169.14301; arXiv:math/0301008.
- D. Edidin, Z. Hu, « The integral Chow rings of the stacks of hyperelliptic Weierstrass
  points », *Michigan Math. J.* (2025), arXiv:2208.00556, Theorem 1.3.
