# Roadmap: equivariant intersection theory and Picard groups of quotient stacks

**Summary.** Build the Chow groups of quotient stacks `[X/G]` in the sense of Edidin and Graham,
and with them the Picard groups of quotient stacks, starting from graded rings. Layer 0 is
commutative algebra in Mathlib's vocabulary: a `𝔾_m`-action on `Spec A` is a `ℤ`-grading of `A`,
the shifts `A(d)` are classified up to graded isomorphism by the degrees of the homogeneous units,
and when `Spec A` is connected every grading of the free module `A` is a shift. Layer 1 constructs
`G`-linearised invertible sheaves on a scheme with a group action, as the general producer that the
flag-variety roadmaps consume, and proves `Pic [X/G] ≅ Pic^G(X)` on the quotient stacks of
SchemeAndStackFoundations. Layer 2 constructs equivariant Chow groups by Totaro's approximation,
under the Edidin–Graham hypothesis that makes the mixed spaces schemes, with their operations and
the localisation sequence, and proves `Pic [X/G] ≅ A¹_G(X)` for `X` smooth. Layer 3 computes the
classical examples over a field: weighted affine spaces minus an invariant divisor, `M_{1,1}`, the
stacks of smooth hyperelliptic curves of Arsie–Vistoli, the hyperelliptic Weierstrass stacks of
Edidin–Hu, and `[M_{0,n}/𝔖ₙ₋₁]` for every `n ≥ 3` in characteristic `0`.

## Layers

| Layer | Title | Content |
| --- | --- | --- |
| [0](#layer-0-graded-rings-and-homogeneous-units) | Graded rings and homogeneous units | degrees of homogeneous units, shift classes, homogeneous generators on a connected spectrum, the `ℤ`-grading of `A_f`, weighted polynomial rings, the generic discriminant |
| [1](#layer-1-linearised-invertible-sheaves-and-the-picard-group-of-a-quotient-stack) | Linearised invertible sheaves | the groupoid of `G`-linearised invertible sheaves, `Pic^G(X)`, the graded description over `Spec A`, the exact sequences with `H¹(G, O(X)^*)` and characters, `Pic [X/G] ≅ Pic^G(X)`, change of group, slices |
| [2](#layer-2-equivariant-chow-groups) | Equivariant Chow groups | Totaro approximation under the Edidin–Graham hypothesis, `A^G_*(X)`, pushforward, pullback, Chern classes, localisation, `A^*_{𝔾_m}`, `A^*_{GL_n}`, `A^*_{μ_n}`, `Pic^G(X) ≅ A¹_G(X)` |
| [3](#layer-3-computations) | Computations | weighted affine spaces minus a divisor, `M_{1,1}` over a field, hyperelliptic curves, hyperelliptic Weierstrass points, `[M_{0,n}/𝔖ₙ₋₁]` |

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
| Graded algebras, their affine charts and localisation comparisons | AlgebraicVectorBundles, [L2A on main](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4d14cbd5ba21a1804ca78c9989b9ea485bcfad08/TauCetiRoadmap/AlgebraicVectorBundles/README.md#L306-L327), reorganised as [§6.1 in #1221](https://github.com/TauCetiProject/TauCetiRoadmap/blob/8e1c3f293b133cc48166247e28987526f46675fa/TauCetiRoadmap/AlgebraicVectorBundles/README.md#L398-L410); [#898](https://github.com/TauCetiProject/TauCetiRoadmap/pull/898) makes relative Proj consume it | Layer 0 uses Mathlib's `GradedAlgebra` and `HomogeneousLocalization` and that roadmap's affine graded-ring interface; it defines no graded quasi-coherent carrier. Its own addition is the `ℤ`-grading of `A_f` in all degrees, negative ones included (0.3), which the nonnegatively graded interface does not supply after inversion; 0.3 proves the comparison with that interface on the nonnegative part. |
| Quotient stacks, torsors, quasi-coherent modules on stacks, Picard groups of schemes, Chow groups of schemes and their operations, equivariant modules for a discrete group | [SchemeAndStackFoundations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4d14cbd5ba21a1804ca78c9989b9ea485bcfad08/TauCetiRoadmap/SchemeAndStackFoundations/README.md): §1.15 (torsors, `𝔾_m`), §1.21 (`actionQuotient G X`, `actionQuotient.torsorEquiv`), §1.22 (`Stacks.QCoh`, `QCoh.presentationEquiv`), §2.23 (`EquivariantModules X Γ act`), §3.4 (`LineBundleClass`), §§5.1–5.6 (`ChowGroup κ X k` and its operations) | Layer 1 constructs the equivariant theory on those objects: linearised sheaves are descent data for `X → [X/G]` through `QCoh.presentationEquiv`, `Pic [X/G]` is the group of isomorphism classes of invertible objects of `Stacks.QCoh [X/G]`, and for a finite constant group the linearised sheaves are the invertible objects of `EquivariantModules`. No second quotient-stack, line-bundle or Chow carrier is introduced. |
| `G`-linearised invertible sheaves on homogeneous spaces | [SchubertGeometry #1224, S3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f356f08f27f03da7c92341afd0ee485bb93934ca/TauCetiRoadmap/SchubertGeometry/README.md#L107-L142) (`G/B⁻`, `G/P⁻`); GroupSchemesOverABase (#1522), GS7.4–GS7.5 (`𝓛(λ)` on `G/B`, `X*(G) → X*(T) → Pic(G/B)`) | Layer 1 is the general producer, for an arbitrary scheme with an action: the groupoid with its actual equivariant isomorphisms and scalar automorphisms, tensor, dual, pullback, base change, the forgetful map to `LineBundleClass`, associated lines `G ×^H χ` and the fibre equivalence on `G/H` (1.4), and the comparison of two linearisations of one line by a character (1.3). Those roadmaps consume it for their flag varieties and keep the root-theoretic statements (dominance, ampleness, Schubert divisors). |

It also consumes:

- *Group schemes over a field and their representations* (`𝔾_m`, `GL_n`, `μ_n`, the affine group
  `𝔾_a ⋊ 𝔾_m`), with the group-scheme layer that SchemeAndStackFoundations §1.15 cites.
- *Moduli stacks of curves* `M_{1,1}` and `M_{0,n}`: SchemeAndStackFoundations (the moduli stack of
  stable pointed curves). Layer 3 proves the presentations as quotient stacks it uses.

Out of scope: equivariant cohomology of topological spaces, equivariant K-theory, Chow groups of
stacks that are not global quotients (Kresch), and equivariant Chow groups of actions whose mixed
spaces are only algebraic spaces, which would need Chow groups of algebraic spaces at
SchemeAndStackFoundations.

## Conventions

1. In 1.1, 1.2 and 1.4, `S` is a scheme and `G` a flat group scheme of finite presentation over
   `S`, and a closed subgroup `H ⊆ G` is flat of finite presentation with `G → G/H` an fppf
   `H`-torsor. In 1.3 and in Layers 2 and 3, `S = Spec k` for a field `k`, schemes are separated and
   of finite type over `k`, and groups are smooth affine group schemes of finite type over `k`. In
   particular `μ_n` is used only when `n` is invertible in `k`.
2. A `𝔾_m`-action `t · x` on `X = Spec A` is the same as a `ℤ`-grading `A = ⊕_d A_d`, with
   `A_d = {a : a(t · x) = t^d a(x)}`, that is, the coaction `A → A[t, t⁻¹]` sends `a ∈ A_d` to
   `a t^d`. A weighted polynomial ring `k[x_i]` with weights `w_i` is Mathlib's `MvPolynomial`
   with `weightedHomogeneousSubmodule k w`.
3. A graded `A`-module `M` has shifts `M(d)_n = M_{n + d}`. For a character `χ^d : t ↦ t^d`, `O(χ^d)`
   is the trivial line bundle `X × 𝔸¹` with `t · (x, v) = (t · x, t^d v)`; its graded module of
   sections is `A(d)`. The class of `O(χ^d)` is called the class of the character `χ^d`.
4. Chow groups are graded by dimension, `A^G_i(X)`, and for `X` smooth of pure dimension `n` by
   codimension, `A^i_G(X) = A^G_{n−i}(X)`. The equivariant Chow ring of a point is
   `A^*_G = A^*_G(Spec k)`.
5. (Edidin–Graham hypothesis.) In Layers 2 and 3, every `G`-scheme `X` is quasi-projective over
   `k` with a `G`-linearised ample invertible sheaf. This is hypothesis (1) of Edidin–Graham 1998,
   §2.1; it holds for every quasi-affine `G`-scheme, whose structure sheaf with its trivial
   linearisation is ample, hence for every example of Layer 3.

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

**Checks.** For a nonzero ring with the trivial grading, the group is `⊥`: a unit is nonzero, and
`𝒜 d = 0` for `d ≠ 0`. For the zero ring it is `⊤`. For the Laurent ring `k[t, t⁻¹]` with `t` of
degree `1`, it is `⊤`. For `k[t, t⁻¹]` with `t` of degree `2`, it is `2ℤ`.

### 0.2 Homogeneous generators on a connected spectrum

Prove `exists_isUnit_mem_of_connected`: if `A` has no idempotents other than `0` and `1` (that is,
`Spec A` is connected), every grading `ℳ` of the `A`-module `A` compatible with `𝒜` has a
homogeneous generator, a unit `u ∈ ℳ c` for some `c`. Proof: write `1 = Σ_e m_e` with
`m_e ∈ ℳ e`, and `u(t) = Σ_e m_e t^e ∈ A[t, t⁻¹]`. Compatibility gives `m_e t^e = ρ(m_e) u(t)`
for each `e`, where `ρ(a) = Σ_d a_d t^d`; dividing by `t^e` and summing, `u` is a unit of
`A[t, t⁻¹]`, with `u(1) = 1`. Over a domain the units of a Laurent ring are the monomials with
unit coefficient, so for each prime `p` exactly one coefficient of `u` lies outside `p`; the open
sets `D(m_e)` are therefore disjoint and cover `Spec A`, and connectedness leaves one of them,
`D(m_c) = Spec A`, so `m_c` is a unit. The Laurent-unit lemma over a domain and the idempotent
characterisation of connectedness are the Mathlib inputs.

Hence, when `Spec A` is connected, `ShiftClassGroup 𝒜` classifies all gradings of the free
module `A` up to graded isomorphism (with 0.1). This covers every domain, in particular the
weighted polynomial rings and their localisations of 0.4 and 0.5.

**Checks.** `A = k × k` with the trivial grading: the grading `ℳ 0 = k × 0`, `ℳ 1 = 0 × k` has no
homogeneous generator and is not a shift `A(d)`; the gradings of `A` up to isomorphism form `ℤ²`
(one degree on each factor), while `ShiftClassGroup 𝒜 = ℤ`. The hypothesis of 0.2 fails, as it
must.

### 0.3 Localisation at a homogeneous element

For `f ∈ 𝒜 e`, define `awayGrading 𝒜 hf : ℤ → Submodule R (Localization.Away f)`, with
`a / fⁿ` of degree `deg a − n e`, and prove `awayGrading_isInternal`, so that it is a grading.
Give the `GradedAlgebra` instance, the compatibility of `algebraMap A A_f` with the gradings, and
the identification of the degree-zero part with Mathlib's `HomogeneousLocalization.Away 𝒜 f`.
When `𝒜` is concentrated in degrees `≥ 0`, prove that the degree-`≥ 0` part of `awayGrading`
and its degree-zero part agree with the localisation comparison of the affine graded-ring
interface of AlgebraicVectorBundles (L2A, §6.1 in #1221) applied to `Spec A`; the negative
degrees are the extension made here.

### 0.4 Weighted polynomial rings

Let `k` be a field and `w : σ → ℤ` positive weights on a finite type `σ`. Prove
`homogeneousUnitDegrees_weighted`: the units of `k[σ]` are the nonzero constants, so the group is
`⊥`. For `f` weighted homogeneous of weight `e > 0` and prime, prove
`homogeneousUnitDegrees_away_prime`: the units of `k[σ]_f` are the `c fᵐ`, `c ∈ kˣ`, `m ∈ ℤ`, so the
group is `eℤ` and `ShiftClassGroup ≅ ℤ/e`. For `f` a product of distinct primes `f_j` of
weights `e_j`, the group is generated by the `e_j`. These rings are domains, so by 0.2 the shift
classes are all the gradings of the free module of rank one.

### 0.5 The generic discriminant

Define `genericDepressed k m = Xᵐ + a₂ Xᵐ⁻² + ⋯ + aₘ` over `k[a₂, …, aₘ]`, the weights
`depressedWeight m` (`aⱼ` of weight `j`), and `depressedDiscr k m`, its discriminant in Mathlib's
`Polynomial.discr`. Prove `depressedDiscr_mem` (weight `m (m − 1)`), `depressedDiscr_prime` (prime
in characteristic `0`, for `m ≥ 2`), and `homogeneousUnitDegrees_depressed`: the group is
`m (m − 1) ℤ`.

**Checks.** `m = 2`: the discriminant is `−4 a₂`, of weight `2`. `m = 3`: it is
`−4 a₂³ − 27 a₃²`, of weight `6`, and the group is `6ℤ`.

## Layer 1: linearised invertible sheaves and the Picard group of a quotient stack

### 1.1 The groupoid of linearised invertible sheaves

For `G` acting on an `S`-scheme `X` by `a : G × X → X`, define a `G`-linearisation of an invertible
sheaf `L` on `X` as an isomorphism `φ : a^* L ≅ pr₂^* L` satisfying the cocycle condition on
`G × G × X` and the unit condition, and the groupoid `LinearizedLine G X` whose morphisms are the
isomorphisms of invertible sheaves compatible with the linearisations; its automorphisms of `O_X`
with the trivial linearisation are the invariant units `Γ(X, O_X)^{*G}`, which the groupoid keeps.
Construct tensor product, dual and the trivial object, pullback along `G`-equivariant morphisms,
base change along `S' → S`, the forgetful functor to invertible sheaves, and the group
`Pic^G(X)` of isomorphism classes, with the forgetful homomorphism `Pic^G(X) → LineBundleClass X`
(SchemeAndStackFoundations §3.4). For a finite constant group, identify `LinearizedLine G X` with
the invertible objects of `EquivariantModules X G act` (SchemeAndStackFoundations §2.23).

### 1.2 `𝔾_m` on an affine scheme

For `G = 𝔾_m` and `X = Spec A`, with the grading of Convention 2, prove that a linearisation of
`O_X` is the same as a grading of the `A`-module `A` compatible with `𝒜`, that `O(χ^d)`
corresponds to `A(d)`, and that `d ↦ [O(χ^d)]` induces an injection
`ShiftClassGroup 𝒜 ↪ ker(Pic^{𝔾_m}(Spec A) → Pic(A))` (0.1). When `Spec A` is connected it is an
isomorphism (0.2); in general it is not (0.2, Checks). In particular, if `Spec A` is connected and
`Pic(A) = 0`, then `Pic^{𝔾_m}(Spec A) ≅ ShiftClassGroup 𝒜`.

### 1.3 The exact sequences

Over a field: prove the exact sequence `0 → H¹(G, k[X]^*) → Pic^G(X) → Pic(X)^G` for `G` finite
constant, the first map sending a cocycle of `G` in the units to `O_X` with that linearisation;
and, for `G` connected and `X` a normal variety with `k[X]^* = k^*`, the exact sequence
`0 → X^*(G) → Pic^G(X) → Pic(X)`, a character `χ` giving `O(χ)`: two linearisations of the same
invertible sheaf differ by a unique character (Knop–Kraft–Luna–Vust).

### 1.4 Picard groups of quotient stacks, change of group, slices

Prove `Pic [X/G] ≅ Pic^G(X)`, where `Pic [X/G]` is the group of isomorphism classes of invertible
objects of `Stacks.QCoh [X/G]`: by `QCoh.presentationEquiv` for `[X/G] = actionQuotient G X`,
quasi-coherent modules on `[X/G]` are quasi-coherent modules on `X` with descent data along the
`G`-torsor `X → [X/G]` (SchemeAndStackFoundations §§1.15, 1.21, 1.22), and invertible ones are
the linearised invertible sheaves. Prove the change of group: for `H ⊆ G` closed and
`X = G ×^H Y`, `[X/G] ≅ [Y/H]` and `LinearizedLine G X ≃ LinearizedLine H Y`. For `Y` a point
this is the fibre equivalence on `G/H`: the groupoid of `G`-linearised invertible sheaves on `G/H`
is equivalent to the groupoid of invertible `O_S`-modules with an `H`-action, by the fibre along
the base section and the associated line `G ×^H χ`, with unit and counit, compatible with tensor,
dual, the trivial object and base change; over a field, `Pic^G(G/H) ≅ X^*(H)`. Prove the slice reduction: for `G = U ⋊ T` with `U`
unipotent acting freely with a section `Y ⊆ X` stable under `T` and meeting each `U`-orbit once,
`[X/G] ≅ [Y/T]`.

## Layer 2: equivariant Chow groups

Throughout, Conventions 1 and 5 hold: `k` a field, `G` smooth affine, `X` quasi-projective with a
`G`-linearised ample invertible sheaf. Every mixed space below is then a quasi-projective scheme,
to which the Chow groups of SchemeAndStackFoundations Layer 5 apply.

### 2.1 Totaro's approximation

For `G` of dimension `g`, a representation `V` of dimension `l` and an invariant open `U ⊆ V` on
which `G` acts freely, with a quasi-projective principal-bundle quotient `U → U/G` and complement of
codimension `> n − i`, the mixed space `X ×^G U` is a quasi-projective scheme and
`X × U → X ×^G U` is a principal `G`-bundle (Edidin–Graham 1998, appendix, under hypothesis (1)).
Define `A^G_i(X) = A_{i + l − g}(X ×^G U)` and prove that it does not depend on `(V, U)` (Edidin–
Graham 1998, Definition-Proposition 1, Bogomolov's double fibration). Prove that such `(V, U)`
exist for every `i` (Edidin–Graham 1998, appendix, after Totaro).

### 2.2 Operations

For `G`-schemes and `G`-morphisms satisfying Convention 5: proper pushforward, flat pullback, the
localisation sequence `A^G_i(Z) → A^G_i(X) → A^G_i(X ∖ Z) → 0` for an invariant closed `Z`,
equivariant Chern classes of equivariant vector bundles, intersection products for `X` smooth, and
homotopy invariance for equivariant vector bundles, all deduced from SchemeAndStackFoundations
§§5.2–5.6 applied to the mixed spaces of 2.1, which inherit Convention 5 (invariant closed and open
subschemes, and equivariant vector bundles, of a quasi-projective `X` with a linearised ample sheaf
are again of that kind).

### 2.3 Classifying spaces

Prove `A^*_{𝔾_m} ≅ ℤ[t]`, `t = c₁(O(χ))`, `A^*_{𝔾_m^r} ≅ ℤ[t₁, …, t_r]`,
`A^*_{GL_n} ≅ ℤ[c₁, …, c_n]`, and, for `n` invertible in `k`, `A^*_{μ_n} ≅ ℤ[t]/(n t)` (Edidin–Graham;
Totaro).

### 2.4 The Picard group

For `X` smooth, prove that `c₁ : Pic^G(X) → A¹_G(X)` is an isomorphism (Edidin–Graham 1998,
Proposition 18, as cited by Arsie–Vistoli in the proof of their Theorem 5.1). With 1.4,
`Pic [X/G] ≅ A¹_G(X)`.

**Checks.** For `𝔾_m` acting on `𝔸ⁿ ∖ 0` with all weights `1`, `A^*_{𝔾_m}(𝔸ⁿ ∖ 0) ≅ ℤ[t]/(tⁿ)`, the
Chow ring of `ℙⁿ⁻¹`, so `Pic = ℤ` for `n ≥ 2`; for `n` invertible in `k` and `μ_n ⊆ 𝔾_m`,
`A¹_{μ_n} = ℤ/n`.

## Layer 3: computations

All computations are over a field `k`, under Conventions 1 and 5; each subsection states its
characteristic.

### 3.1 Weighted affine space minus an invariant divisor

For `𝔾_m` acting on `𝔸ⁿ` with positive weights and `D = {f = 0}` an integral invariant divisor of
weight `e`, prove `Pic [(𝔸ⁿ ∖ D)/𝔾_m] ≅ ℤ/e`, generated by the class of `χ`, by the localisation
sequence of 2.2 (the class of `[D]` is `e t`) and `A^1_{𝔾_m}(𝔸ⁿ) = ℤ t`. Check it against
0.4 through 1.2: `k[σ]_f` is a factorial domain, so `Pic(k[σ]_f) = 0` and
`Pic^{𝔾_m} ≅ ShiftClassGroup ≅ ℤ/e`, with `[O(χ^d)] ↦ d mod e` in both descriptions.

### 3.2 `M_{1,1}`

Over a field `k` of characteristic not `2` or `3`, prove
`M_{1,1} ≅ [(𝔸² ∖ {Δ = 0})/𝔾_m]` with weights `4, 6` (`y² = x³ + a x + b`, `Δ = −16(4a³ + 27b²)`,
irreducible of weight `12`), and, by 3.1, `Pic M_{1,1} ≅ ℤ/12`, generated by the Hodge bundle.
This is Mumford 1965 and the case `S = Spec k` of Fulton–Olsson 2010, Theorem 1.1, which gives
`ℤ/12 × Pic(𝔸¹_S) ≅ Pic(M_{1,1,S})` when `S` is reduced or a `ℤ[1/2]`-scheme; here
`Pic(𝔸¹_k) = 0`.

### 3.3 Hyperelliptic curves and Weierstrass points

Over a field of characteristic not dividing `4(g + 1)`, prove the presentation of the stack of
smooth hyperelliptic curves of genus `g ≥ 2` as `[A_sm(1, 2g + 2)/(GL₂/μ_{g+1})]`, the binary forms
of degree `2g + 2` with nonzero discriminant (Arsie–Vistoli, Corollaries 4.2 and 4.7), and its
Picard group, cyclic of order `4g + 2` for `g` even and `8g + 4` for `g` odd (Arsie–Vistoli,
Theorem 5.1, with `n = 1`, `r = 2`, `d = g + 1`). Prove Edidin–Hu, Theorem 1.3:
`A^*([M_{0,2g+2}/𝔖_{2g+1}]) ≅ ℤ[l]/(2g(2g+1) l)` for `g ≥ 2`, over an algebraically closed field
of characteristic not dividing `2g + 2`.

### 3.4 `[M_{0,n}/𝔖ₙ₋₁]` for every `n ≥ 3`

Over a field of characteristic `0`, for `n ≥ 3` and `m = n − 1`, prove the following.

1. `[M_{0,n}/𝔖ₙ₋₁] ≅ [U/Aff]`, with `U` the monic squarefree polynomials of degree `m` and
   `Aff = 𝔾_a ⋊ 𝔾_m` acting on `𝔸¹` by `x ↦ a x + b` and on `U` through the roots, by fixing the
   `n`-th point at `∞` (change of group of 1.4, `Aff` the stabiliser of `∞` in `PGL₂`).
2. `[U/Aff] ≅ [U₀/𝔾_m]` by the slice reduction of 1.4, `U₀ ⊆ U` the polynomials with roots of sum
   zero: `U₀ = Spec k[a₂, …, aₘ]_Δ` with `aⱼ` of weight `j` under `x ↦ t x` (Convention 2) and
   `Δ = depressedDiscr k m`.
3. By 0.5 and 3.1, `Pic [M_{0,n}/𝔖ₙ₋₁] ≅ ℤ/m(m − 1) = ℤ/(n − 1)(n − 2)`, `[O(χ^d)] ↦ d`.
4. The tangent line `T_∞` at the `n`-th point: `Aff` fixes `∞` and acts on `T_∞ℙ¹` by the
   derivative `a⁻¹` (in the coordinate `1/x`), so on `[U₀/𝔾_m]` it is `O(χ⁻¹)`, of class `−1`,
   a generator. The tangent line at each of the other points is `O(χ)` (the derivative is `a`),
   and their tensor product over the `m` points, on which `𝔖ₙ₋₁` acts by permuting the factors, is
   `O(χ^m)`; the tensor product of the tangent lines at all `n` points is `O(χ^{m−1})`, of order
   `m(m − 1) / gcd(m(m − 1), m − 1) = m = n − 1`.

For `n = 2g + 2` this agrees with Edidin–Hu, Theorem 1.3 (3.3), over an algebraically closed
field of characteristic `0`, since `2g(2g + 1) = (n − 1)(n − 2)`. The route is the one of the
MathOverflow answer cited below, which is not refereed; the theorem rests on items 1 to 4.

**Checks.** `n = 3`: `ℤ/2`, and `[M_{0,3}/𝔖₂] = B(ℤ/2)`. `n = 4`: `ℤ/6`; the pullback along the
`μ₂`-gerbe `M_{1,1} → [M_{0,4}/𝔖₃]` is injective with image of index `2` in `Pic M_{1,1} = ℤ/12`
(3.2). `n = 5`: `ℤ/12`. `n = 6`: `ℤ/20`.

## References

- D. Edidin, W. Graham, « Equivariant intersection theory », *Invent. Math.* 131 (1998), no. 3,
  595–644 (appendix by A. Vistoli). Zbl 0940.14003; arXiv:alg-geom/9603008.
- B. Totaro, « The Chow ring of a classifying space », in *Algebraic K-theory* (Seattle, 1997),
  Proc. Sympos. Pure Math. 67, AMS (1999), 249–281. Zbl 0967.14005.
- A. Vistoli, « The Chow ring of `M₂` », appendix to Edidin–Graham, *Invent. Math.* 131 (1998).
- F. Knop, H. Kraft, D. Luna, T. Vust, « Local properties of algebraic group actions », in
  *Algebraische Transformationsgruppen und Invariantentheorie*, DMV Sem. 13, Birkhäuser (1989),
  63–75. Zbl 0722.14032.
- D. Mumford, « Picard groups of moduli problems », in *Arithmetical Algebraic Geometry*
  (Purdue, 1963), Harper & Row (1965), 33–81. Zbl 0187.42801.
- W. Fulton, M. Olsson, « The Picard group of `M_{1,1}` », *Algebra Number Theory* 4 (2010), no. 1,
  87–104, Theorem 1.1. Zbl 1198.14010; arXiv:0704.2214.
- A. Arsie, A. Vistoli, « Stacks of cyclic covers of projective spaces », *Compos. Math.* 140
  (2004), no. 3, 647–666, Corollaries 4.2 and 4.7, Theorem 5.1. Zbl 1169.14301; arXiv:math/0301008.
- D. Edidin, Z. Hu, « The integral Chow rings of the stacks of hyperelliptic Weierstrass
  points », *Michigan Math. J.* (2025), arXiv:2208.00556, Theorem 1.3.
- Answer by M. Hua to « Order of the tangent line bundle at a marked point on
  `M_{0,n}/𝔖ₙ₋₁` », *MathOverflow*, October 2026, https://mathoverflow.net/a/516350 (the slice
  route of 3.4; not refereed).
