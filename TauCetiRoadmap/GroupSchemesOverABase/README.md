# Roadmap: group schemes over a base

**Summary.** Build the relative theory of group schemes of SGA 3 that lies under the reductive
theory: diagonalizable groups, groups of multiplicative type and tori over an arbitrary base
scheme, their rigidity and density of torsion, Hom schemes and centralizers; the structure of a
group of finite type over a field and the ranks it defines along the fibres of a smooth group
scheme; and, on the relative reductive groups of ReductiveGroups Layer 8, the line bundles of the
flag scheme `G/B⁻` with its Picard group, the Steinberg map and the Grothendieck–Springer space.
The carriers are Mathlib's group objects `Grp (Over S)` with base change
`(Over.pullback f).mapGrp`, and Tau Ceti's `TauCeti.DiagonalizableGroup.groupScheme`. The end
theorems are: for a smooth group scheme over any base, the identity component is an open
subgroup scheme, smooth and quasi-compact with connected fibres; over a connected base,
`Hom(D_S(M), D_S(N)) = Hom(N, M)`, and `D_S(M)` is smooth iff the order of the torsion of `M` is
invertible on `S`; every group of multiplicative type of finite type is étale-locally
diagonalizable, and isotrivial over a connected, locally noetherian, normal base, while a torus
of rank two over the nodal curve is not; homomorphisms between groups of multiplicative type
lift uniquely along thickenings and are determined by one fibre over a connected base and by
their restrictions to torsion; Chevalley's theorem over a perfect field and the affinization over
any field; for `G` smooth with connected fibres, the specialization inequalities of the abelian
rank, the reductive rank plus the abelian rank, and the semisimple dimension (lower), and of the
nilpotent and unipotent ranks (upper); for `G` split reductive over a locally noetherian, normal,
connected base, `Pic(S) ⊕ ℤ^Δ ≅ Pic(G/B⁻)`; for `G` split reductive with simply connected
derived group, the Steinberg map `G → T/W`, smooth exactly on the regular locus, with a section
when `G` is moreover semisimple; and, over a regular noetherian connected base and for positive
semisimple rank, the absence of a resolution of `G` that is an isomorphism over `G^reg`, with
exceptional locus of codimension `≥ 2` in every fibre and smooth composite to `T/W`.

## Scope and ownership

**Owned here.** Over an arbitrary base `S`: base change of group schemes and the identity
component of a smooth group scheme (Layer 0); diagonalizable groups `D_S(M)` for finitely
generated `M` (Layer 1); groups of multiplicative type of finite type, tori, character and
cocharacter sheaves and isotriviality (Layer 2); rigidity, density of torsion, Hom schemes out of
groups of multiplicative type and centralizers and normalizers of such subgroups in smooth affine
groups (Layer 3); over a field, quotients by closed subgroups, Chevalley's theorem for every
smooth connected group over a perfect field together with its comparison with the commutative
case of NeronModelsAndSemistableAbelianVarieties 2.3, the affinization and the rank invariants
(Layer 4); the rank functions of a smooth group scheme over a base, maximal tori of smooth affine
group schemes and the specialization inequalities (Layer 5); the line bundles `𝓛(λ)` on `G/B⁻`
over a base and the Picard groups of `G/B⁻` and `G` (Layer 6); the Steinberg map, the regular
locus, the Steinberg cross-section, the universal centralizer, the Grothendieck–Springer space
and the Picard groups of `G̃`, `G` and `G^reg` (Layer 7).

**Left to other roadmaps.**

- ReductiveGroups Layer 8, bullet *Relative reductive groups over an affine Noetherian base*,
  owns the relative reductive theory: the reductive and semisimple predicates on scheme group
  objects and their invariance, the relative centre and derived subgroup, central isogenies and
  the simply connected and adjoint forms, the smooth scheme of maximal tori and the smooth
  projective scheme of Borel subgroups `Bor(G)`, the root-space decomposition and the root datum
  as étale locally constant sheaves, étale-local splitting, the classification of pinned split
  models over connected bases, the automorphism sheaf, the `Isom(G₀, G)` torsor and the
  classification of étale forms in nonabelian `H¹`. Its first bullet owns the field
  classification. This roadmap states none of these and builds Layers 6–7 on them.
- ReductiveGroups 9B owns the pinned split reductive groups `𝒢_R` over `ℤ` for every reduced root
  datum, their base change, the root subgroup maps `x_α` and the pinned isomorphism theorem.
- SchemeAndStackFoundations owns reflexive sheaves and Hartogs extension (§0.6), Noetherian
  approximation (§0.9), quotient predicates (§1.17), the carrier `NonabelianH1` of torsor
  classes (§2.3), the big-site sheaves `𝔾_m` and `μ_n` (§2.9), Hilbert 90 (§2.11) and Picard
  groups of schemes (§3.4).
- ModularCurves 0B owns finite locally free group schemes and their Cartier duality, 0C finite
  quotients and torsors, 0E effective descent.
- AlgebraicModuliForArithmeticGeometry §7.9 owns the identity-component subfunctor of a group
  algebraic space over a locally Noetherian base; 0.2 compares with it.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4 owns finite locally free groups of
  multiplicative type and their rigidity; 2.1 and 3.1 compare with it.
- InverseGaloisAndArithmeticFundamentalGroups IG.0.3 owns the finite monodromy of locally constant
  sheaves of free `ℤ`-modules on a normal base, and IG.0.4 the Noohi groups and the pro-étale
  fundamental group; 2.5 and 2.6 use them.
- AbelianSchemesAndArithmeticModuli owns abelian schemes and their Tate modules (5.3, 5.5).
- SchubertGeometry S3 owns the associated lines `L(λ)` on `G/B⁻` over a field with their tensor,
  dual, base-change and ampleness laws, and S7.1 the divisor of the normalized extremal section;
  EquivariantIntersectionTheory 1.1 owns `G`-linearised invertible sheaves and `Pic^G`, and 1.3
  the exact sequence `0 → X*(G) → Pic^G(X) → Pic(X)`. Layer 6 is the extension over a base.

**Out of scope.** Groups of multiplicative type that are not of finite type (pro-objects such as
`D(ℚ)`), pseudo-reductive groups, abelian schemes, Néron models, parahoric group schemes, and
group algebraic spaces beyond the comparison of 0.2.

## Conventions

1. **Group schemes.** A group scheme over `S : Scheme.{u}` is an object of Mathlib's
   `Grp (Over S)`, for the cartesian monoidal structure of `Over S`. The structure morphism of
   `G` is `G.X.hom`, and every property of `G` over `S` is Mathlib's morphism class on
   `G.X.hom`: `IsAffineHom`, `Smooth`, `Etale`, `Flat`, `LocallyOfFinitePresentation`,
   `QuasiCompact`, `IsSeparated`. Witness: `D_S(ℤ/6)` is affine and flat over every `S` and
   smooth exactly over `S[1/6]` (1.3, Checks).
2. **Base change.** `baseChange f G` for `f : S' ⟶ S` is `(Over.pullback f).mapGrp.obj G`.
   Geometric points are morphisms `Spec Ω ⟶ S` with `Ω` algebraically closed; an invariant of a
   geometric fibre that is unchanged under extension of algebraically closed fields is a function
   of the image point `s ∈ S`. Witness: the fibre of `D_ℤ(ℤ/2)` at the prime `3` is two reduced
   points and at `2` one non-reduced point (1.1, Checks).
3. **Characters and contravariance.** For a finitely generated abelian group `M`,
   `D_S(M) = Spec_S O_S[M]`, and `φ : N →+ M` gives `D(φ) : D_S(M) ⟶ D_S(N)`. `𝔾_{m,S} = D_S(ℤ)`
   and `μ_{n,S} = D_S(ℤ/n)`. `X*(H)` is the sheaf of homomorphisms `H → 𝔾_m` and
   `X_*(H) = Hom(𝔾_m, H)`. Witness: for `φ = n · id` on `ℤ`, `D(φ)` is `t ↦ tⁿ` on `𝔾_m`, with
   kernel `μ_n` (1.4, Checks).
4. **Topologies.** An fppf cover is a jointly surjective family of flat morphisms locally of finite
   presentation; an étale cover a jointly surjective family of étale morphisms. Witness: the
   Kummer cover `𝔾_m → 𝔾_m`, `t ↦ t²`, is an fppf cover over `ℤ` and an étale cover only over
   `ℤ[1/2]` (2.2, Checks).
5. **Flags and line bundles.** For a split maximal torus `T` and a positive system `Φ⁺`, `B⁺ ⊇ T`
   has roots `Φ⁺` and its opposite `B⁻` has roots `−Φ⁺`; flags are `G/B⁻`, as in SchubertGeometry
   (Conventions) and Jantzen (II.1.8). For `λ ∈ X*(T)`, `𝓛(λ) = G ×^{B⁻} λ` is the sheaf of
   functions with `f(gb) = λ(b)⁻¹ f(g)` for `b ∈ B⁻`, `G`-linearised by `(g·f)(x) = f(g⁻¹x)`; its
   fibre character at `eB⁻` is `λ` and its degree on the root curve `C_α = P_α⁻/B⁻ ≅ ℙ¹` is
   `⟨λ, α^∨⟩`. These are SchubertGeometry's conventions. Witness: `𝓛(ϖ) = O(1)` on `SL₂/B⁻ = ℙ¹`
   (6.1, Checks).
6. **Root data and root subgroups.** Root data are Mathlib's `RootPairing` over `ℤ`, with
   `X*(T)` and `X_*(T)` finitely generated and the root system reduced; `P` is the weight lattice
   of the simply connected cover of the derived group, and `X*(T_der) ⊆ P`. Root subgroups are
   ReductiveGroups 9B's `x_α`; in `SL₂`, `x_α(t) = [[1, t], [0, 1]]` and
   `x_{−α}(t) = [[1, 0], [t, 1]]`. Witness: `x_α(1) x_{−α}(−1) x_α(1) = [[0, 1], [−1, 0]]`
   (7.4, Checks).
7. **Generality.** The base is an arbitrary scheme unless a target names a hypothesis. Groups of
   multiplicative type are of finite type over the base. In Layers 6–7, `G` is split reductive in
   the sense of ReductiveGroups Layer 8, the base change to `S` of a 9B model `𝒢_R`, and `Bor(G)`
   is the base change of Layer 8's scheme of Borel subgroups of `𝒢_R` over `Spec ℤ`. Witness: for
   a split torus `G = T`, `Bor(G) = S` (6.1, Checks).

## Exact supplier contracts

**From Mathlib** (at the pinned revision).

- Group objects: `Grp`, `Grp.mk`, `Grp.forget`, `GrpObj`, `MonObj`, `Hom.monoid`,
  `Functor.mapGrp`, `Over.pullback`, `KernelFork`, `IsLimit`, `AlgebraicGeometry.hopfSpec`.
- Schemes: `Scheme.Hom.fiber`, `Scheme.fromSpecResidueField`, `Scheme.toSpecΓ`,
  `Scheme.residueField`, `specULiftZIsTerminal`, `IsLocallyNoetherian`, `Scheme.Opens`, and the
  morphism classes `Smooth`, `Etale`, `Flat`, `IsFinite`, `Surjective`, `IsOpenImmersion`,
  `IsClosedImmersion`, `IsAffineHom`, `QuasiCompact`, `LocallyOfFiniteType`,
  `LocallyOfFinitePresentation`, `IsSeparated`.
- Algebra: `AddGroup.FG`, `AddCommGroup.torsion`, `Module.Free`, `QuotientAddGroup.mk'`,
  `AddMonoidHom.toMultiplicative`, `AlgHom.equalizer`, `Polynomial.aeval`, `RingHom.FiniteType`,
  `IsIntegrallyClosed`, `PerfectField`, `RootPairing`.

**From Tau Ceti** (at the pinned revision).

- `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Scheme/Basic.lean`:
  `TauCeti.DiagonalizableGroup.groupScheme` and `TauCeti.DiagonalizableGroup.groupSchemeMap`, over
  `Spec R`, for `TauCeti.FGCommGrpCat` (1.1).
- `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/Constant.lean`:
  `TauCeti.DiagonalizableGroup.cartierDualIso` (1.5).
- `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`:
  `TauCeti.AlgebraicGeometry.AbelianVariety` (4.2).
- Over a field: `TauCeti.multiplicativeTypeCommHopfAlgProperty` and
  `TauCeti.torusCommHopfAlgProperty` (2.1, 2.4), `TauCeti.HopfIdeal.IsMaximalTorus` (4.4).

**From ReductiveGroups.** Layer 8, bullet *Relative reductive groups over an affine Noetherian
base*: the reductive predicate, the scheme of Borel subgroups `Bor(G)` with its functor of
points, central isogenies and the simply connected cover (Layers 6–7). 9B: the models `𝒢_R`,
their base change, pinnings and root subgroups `x_α` (Layers 6–7).

**From SchemeAndStackFoundations.** §0.6 (7.7), §0.9 (5.3), §1.17 (4.1), §2.3 `NonabelianH1`
(1.6), §2.9 (1.4, 2.3), §2.11 (1.6), §3.4 (6.3, 7.7).

**From ModularCurves.** 0B (1.5), 0C (7.1), 0E (2.3, 6.1).

**From AlgebraicModuliForArithmeticGeometry.** §7.9, the identity-component subfunctor (0.2).

**From FiniteFlatGroupsAndIntegralPadicHodgeTheory.** R07.1.4 (2.1, 3.1).

**From InverseGaloisAndArithmeticFundamentalGroups.** IG.0.3 (2.5) and IG.0.4 (2.6).

**From NeronModelsAndSemistableAbelianVarieties.** 2.3, the Chevalley decomposition of a smooth
connected commutative group over a perfect field (4.2).

**From AbelianSchemesAndArithmeticModuli.** Abelian schemes and the prime-to-characteristic Tate
module (5.3, 5.5).

**From SchubertGeometry.** S3, the lines `L(λ)` over a field (6.1); S7.1, the divisor of the
normalized extremal section (6.2).

**From EquivariantIntersectionTheory.** 1.1, `G`-linearised invertible sheaves and `Pic^G`
(6.1); 1.3, the sequence `0 → X*(G) → Pic^G(X) → Pic(X)` for `G` connected (6.2).

## How to read the build

Layer 0 fixes base change and the identity component. Layers 1–3 are one lane on it: Layer 1
builds `D_S(M)` from Tau Ceti's group schemes over `Spec ℤ`, Layer 2 defines groups of
multiplicative type and tori and proves quasi-isotriviality and isotriviality, Layer 3 proves
rigidity, density of torsion and the representability of Hom schemes and centralizers. Layer 4
works over a field with Tau Ceti's field theory and abelian varieties, in parallel with
Layers 1–3, and delivers quotients, Chevalley's theorem, the affinization and the rank
invariants. Layer 5 needs Layers 3 and 4 and delivers the rank functions on the base and their
specialization. Layers 6 and 7 need, beyond these, ReductiveGroups Layer 8 and 9B: Layer 6
delivers the line bundles on `G/B⁻` over a base and the Picard groups, Layer 7 the Steinberg map
and its consequences, using Layer 6's Picard groups in 7.7–7.8. The hardest targets are 5.3,
6.3, 7.4 and 7.6.

## Layer 0: carriers over a base

### 0.1 Base change

Define `baseChange f : Grp (Over S) ⥤ Grp (Over S')` for `f : S' ⟶ S` as
`(Over.pullback f).mapGrp`. Construct the natural isomorphisms `baseChange (𝟙 S) ≅ 𝟭` and
`baseChange (g ≫ f) ≅ baseChange f ⋙ baseChange g` as monoidal isomorphisms, with their
coherence, and the comparison with Hopf algebras: for `R → R'`,
`baseChange (Spec.map _) (hopfSpec R H) ≅ hopfSpec R' (R' ⊗[R] H)`.
*Needs:* Mathlib `Functor.mapGrp`, `Over.pullback`, `AlgebraicGeometry.hopfSpec`.

**Checks.**

- Base change along `𝟙 S` is isomorphic to the identity, not equal to it: the pullback along
  the identity is a chosen pullback, which is why the unit isomorphism is data.
- Base change of `D_ℤ(ℤ/2)` along `Spec 𝔽₂ ⟶ Spec ℤ` is `Spec 𝔽₂[t]/(t − 1)²`, a non-reduced
  group: base change does not preserve reducedness.
- For `S' = ∅`, every base change is the terminal group over `∅`, so `baseChange` is not
  faithful in general.

### 0.2 The identity component over a base

For `G` smooth over `S`, prove `exists_identityComponent`: there is an open subgroup scheme
`G⁰ ⊆ G`, smooth and quasi-compact over `S`, with connected fibres (SGA 3, Exp. VI_B, 3.9 and
3.10, which need smoothness only along the unit section). It is unique, since its fibre at `s`
is an open connected subgroup of the fibre of `G` at `s`, and its formation commutes with base
change. Over a locally Noetherian base, `G⁰` represents the identity-component subfunctor of
AlgebraicModuliForArithmeticGeometry §7.9 applied to `G` as a group algebraic space. *Needs:*
0.1; AlgebraicModuliForArithmeticGeometry §7.9; Mathlib `Scheme.Hom.fiber`, `IsOpenImmersion`,
`Smooth`.

**Checks.**

- `𝔾_{m,S}` has connected fibres, and `G⁰ = G`.
- For the constant groups `(ℤ/2)_S` and `ℤ_S`, `G⁰` is the unit section, open in `G`.
- `μ₂` over `ℤ` is not smooth, and 0.2 does not apply: its fibre at `2` is connected, its fibre
  over `ℚ` has two points, and the union of the fibrewise identity components is not open.

### Examples

- `GL_{n,S}` and `𝔾_{a,S}` are smooth with connected fibres: `G⁰ = G`.
- For `G = 𝔾_m ⋊ ℤ/2` over `ℤ[1/2]`, with `ℤ/2` acting by inversion, `G⁰ = 𝔾_m`.

### Dependencies

Mathlib's group objects, pullbacks and morphism classes; AlgebraicModuliForArithmeticGeometry
§7.9 for the comparison of 0.2.

## Layer 1: diagonalizable groups over a base

### 1.1 Construction

Define `diagonalizable S M` for `M` finitely generated (`AddGroup.FG M`) as the base change along
`S ⟶ Spec ℤ` (`specULiftZIsTerminal`) of Tau Ceti's `TauCeti.DiagonalizableGroup.groupScheme`
over `ULift ℤ` at `Multiplicative M`, and `diagonalizableMap S φ : D_S(M) ⟶ D_S(N)` for
`φ : N →+ M` as the base change of `TauCeti.DiagonalizableGroup.groupSchemeMap`. Prove that
`D_S(M)` is commutative, affine and faithfully flat, of finite presentation, with fibre `D(M)`
over every point, and that over `Spec R` it is isomorphic to Tau Ceti's group scheme over `R`
(SGA 3, Exp. VIII, 2.1 a), b)). *Needs:* 0.1; Tau Ceti
`TauCeti.DiagonalizableGroup.groupScheme`, `TauCeti.DiagonalizableGroup.groupSchemeMap`.

**Checks.**

- `D_S(0)` is the trivial group `S` (SGA 3, Exp. VIII, 2.1 d)).
- `D_S(ℤ)` has coordinate ring `O_S[t, t⁻¹]` with `t` group-like: it is `𝔾_m`, not `𝔾_a`.
- `D_S(ℤ/n)` has coordinate ring `O_S[t]/(tⁿ − 1)`, of rank `n` over `S`.
- The fibre of `D_ℤ(ℤ/2)` at `3` is `Spec 𝔽₃[t]/(t² − 1)`, two reduced points, and at `2` it is
  `Spec 𝔽₂[t]/(t − 1)²`, one non-reduced point.

### 1.2 Homomorphisms

Prove `bijective_diagonalizableMap`: for `S` connected (hence nonempty), `φ ↦ D(φ)` is a
bijection from `N →+ M` onto the homomorphisms `D_S(M) ⟶ D_S(N)` (SGA 3, Exp. VIII, 1.6). For
general `S`, homomorphisms are the locally constant functions `S → Hom(N, M)`, and
`Hom_{S-gr}(D_S(M), D_S(N))` is represented by the constant group `Hom(N, M)_S` (SGA 3,
Exp. VIII, 1.5). *Needs:* 1.1.

**Checks.**

- `End(𝔾_{m,S}) = ℤ` for `S` connected: `t ↦ tⁿ`.
- Over `S = Spec(k × k)`, `End(𝔾_m) = ℤ²`: connectedness is needed for the bijection.
- Over `S = ∅` there is exactly one homomorphism and `N →+ M` may have many: nonemptiness, part of
  `ConnectedSpace`, is needed.

### 1.3 Smoothness

Prove `smooth_diagonalizable_iff`: `D_S(M)` is smooth over `S` iff the order of the torsion
subgroup of `M` is invertible on `S`; and `etale_diagonalizable_iff`: for `S` nonempty, it is
étale iff moreover `M` is finite (SGA 3, Exp. VIII, 2.1 c), e)). Route: `M ≅ ℤ^r ⊕ M_tor`, so
`D(M) = 𝔾_m^r × D(M_tor)`, and `O[M_tor]` is étale iff `|M_tor|` is invertible. *Needs:* 1.1.

**Checks.**

- `μ_{p,𝔽_p}` is not smooth: `𝔽_p[t]/(t^p − 1) = 𝔽_p[t]/(t − 1)^p` is not reduced.
- `𝔾_m = D(ℤ)` is smooth over every base and étale over none, `ℤ` being infinite.
- `D_S(ℤ/6)` is étale exactly over `S[1/6]`, and smooth there only.

### 1.4 Exactness

For an injective `φ : N →+ M`, prove `flat_surjective_diagonalizableMap` (`D(φ)` is faithfully
flat) and `isKernel_diagonalizableMap` (its kernel is `D_S(M ⧸ φ.range)`, embedded by the
quotient map), so that a short exact sequence `0 → M′ → M → M″ → 0` gives
`1 → D(M″) → D(M) → D(M′) → 1`, exact as fppf sheaves (SGA 3, Exp. VIII, 3.1 and 3.2 a)).
Identify `D_S(ℤ)` and `D_S(ℤ/n)` with the big-site sheaves `𝔾_m` and `μ_n` of
SchemeAndStackFoundations §2.9. *Needs:* 1.1; SchemeAndStackFoundations §2.9.

**Checks.**

- `φ = n · id` on `ℤ`: `D(φ)` is `t ↦ tⁿ`, faithfully flat, with kernel `μ_n`, and it is not
  étale over a base where `n` is not invertible.
- `φ : 0 → ℤ`: `D(φ)` is `𝔾_m → S`, faithfully flat with kernel `𝔾_m`.
- Injectivity is needed: for `φ : ℤ → 0`, `D(φ)` is the unit section `S → 𝔾_m`, not flat.

### 1.5 Cartier duality

For `M` finite, `D_S(M)` is the Cartier dual of the constant group `M` over `S` in the sense of
ModularCurves 0B; over `Spec R` this is Tau Ceti's `TauCeti.DiagonalizableGroup.cartierDualIso`,
and over `S` its base change. *Needs:* 1.1; ModularCurves 0B; Tau Ceti
`TauCeti.DiagonalizableGroup.cartierDualIso`.

**Checks.**

- `M = ℤ/n`: the dual of `(ℤ/n)_S` is `μ_n`, without invertibility of `n`.
- `M = 0`: the dual of the trivial group is trivial.
- `M = ℤ/2 × ℤ/2`: the dual is `μ₂ × μ₂`, compatible with products.

### 1.6 Torsors

For `M = ℤ^r ⊕ ⨁ᵢ ℤ/nᵢ`, the torsor classes `NonabelianH1` of the big fppf site of `S` with
coefficients `D_S(M)` (SchemeAndStackFoundations §2.3) are `Pic(S)^r × ∏ᵢ H¹_fppf(S, μ_{nᵢ})`, by
1.4 and Hilbert 90 (SchemeAndStackFoundations §2.11). *Needs:* 1.4; SchemeAndStackFoundations
§2.3, §2.11.

**Checks.**

- Over a field `k`, `H¹_fppf(k, μ_n) = k^×/k^{×n}` (Kummer), also for `n` divisible by the
  characteristic.
- Over a local ring, every `𝔾_m`-torsor is trivial: `Pic` of a local scheme is `0`.
- Over `Spec ℤ`, `H¹(ℤ, μ₂) = {±1}`, from `Pic(ℤ) = 0` and the units `{±1}`.

### Examples

- `D_S(ℤ²) = 𝔾_m²`, and `D(φ)` for `φ = [[1, 1], [0, 1]]` is an automorphism of `𝔾_m²` of
  infinite order, the gluing datum of 2.6.
- `D_ℤ(ℤ/4) → D_ℤ(ℤ/2)`, induced by `ℤ/2 ↪ ℤ/4`, is `t ↦ t²` from `μ₄` to `μ₂`, with kernel `μ₂`.

### Dependencies

Layer 0; Tau Ceti's diagonalizable group schemes and Cartier duality; ModularCurves 0B;
SchemeAndStackFoundations §2.3, §2.9, §2.11.

## Layer 2: groups of multiplicative type and tori

### 2.1 Definitions

Define `IsDiagonalizable G` (`G ≅ D_S(M)` for a finitely generated `M`), `IsMultiplicativeType G`
(diagonalizable after base change to the members of an fppf cover) and `IsTorus G` (the same with
`M` free). SGA 3, Exp. IX, 1.1, uses fpqc covers; for groups of finite type the two agree, both
being étale-local by 2.2. Over a field these are Tau Ceti's
`TauCeti.multiplicativeTypeCommHopfAlgProperty` and `TauCeti.torusCommHopfAlgProperty`
(comparison lemmas through `hopfSpec`). A finite locally free group of multiplicative type in the
sense of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4 is of multiplicative type here, and
conversely a finite group of multiplicative type is of that kind. *Needs:* 1.1;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4; Tau Ceti
`TauCeti.multiplicativeTypeCommHopfAlgProperty`, `TauCeti.torusCommHopfAlgProperty`.

**Checks.**

- `μ_p` over `𝔽_p` is of multiplicative type and not a torus; `𝔾_a` is neither, its fibre having
  no nontrivial character.
- The norm-one torus `Spec ℝ[x, y]/(x² + y² − 1)` is a torus over `ℝ`, split by `ℂ`, and is not
  diagonalizable: its only character over `ℝ` is trivial.
- `IsTorus` with `M = 0` is the trivial group, so the trivial group is a torus of rank `0`.

### 2.2 Quasi-isotriviality

Prove `IsMultiplicativeType.exists_etale_cover`: a group of multiplicative type is
étale-locally diagonalizable (SGA 3, Exp. X, 4.5). *Needs:* 2.1, 1.3.

**Checks.**

- `μ_n` over `ℤ` is already diagonalizable: the cover is the identity.
- The norm-one torus over `ℝ` is split by the étale cover `Spec ℂ → Spec ℝ`.
- The Kummer cover `t ↦ t²` of `𝔾_m` is fppf, not étale, over `𝔽₂`: 2.2 produces étale covers,
  finer than the fppf covers of the definition.

### 2.3 The character sheaf and the anti-equivalence

`X*(H)`, the sheaf of homomorphisms `H → 𝔾_m` on the big étale site (SchemeAndStackFoundations
§2.9), is étale-locally a constant finitely generated group, a twisted constant group in the
sense of SGA 3, Exp. X, 5.1. Prove that `H ↦ X*(H)` is an anti-equivalence between groups of
multiplicative type over `S` and such sheaves, compatible with base change, with inverse
`F ↦ D_S(F)` built by étale descent (ModularCurves 0E) (SGA 3, Exp. X, 5.6 and 5.9). For `S`
connected, `H` is diagonalizable iff `X*(H)` is constant. *Needs:* 2.2, 1.2;
SchemeAndStackFoundations §2.9; ModularCurves 0E.

**Checks.**

- `X*(μ_n) = (ℤ/n)_S` and `X*(𝔾_m^r) = ℤ^r_S`.
- For the norm-one torus over `ℝ`, `X*` is `ℤ` with complex conjugation acting by `−1`.
- Over `Spec(k × k)`, the group equal to `𝔾_m` on one point and `𝔾_m²` on the other has a
  locally constant, non-constant character sheaf, and is not diagonalizable.

### 2.4 Galois description over a field

Over a field `k`, `X*(H)` is the continuous `Gal(k^s/k)`-module of Tau Ceti's
`MultiplicativeType/GaloisModule.lean`, and 2.3 restricts to the anti-equivalence between groups
of multiplicative type over `k` and finitely generated discrete Galois modules (SGA 3, Exp. X,
1.2). *Needs:* 2.3; Tau Ceti `TauCeti.multiplicativeTypeCommHopfAlgProperty`.

**Checks.**

- `𝔾_m` corresponds to `ℤ` with trivial action.
- `μ_n` over `ℚ` corresponds to `ℤ/n` with `Gal(ℚ̄/ℚ)` acting through the cyclotomic character.
- The norm-one torus over `ℝ` corresponds to `ℤ` with the generator of `Gal(ℂ/ℝ)` acting by `−1`.

### 2.5 Isotriviality

Define `IsIsotrivial H`: there is a finite étale surjective `S′ → S` over which the character
sheaf `X*(H)` becomes constant; by 2.3 this says that `H_{S′} ≅ D_{S′}(M)` for one finitely
generated `M`, the form `Suggested.lean` states (SGA 3, Exp. IX, 1.1, and Exp. X, 5.7 (iii)). For
`S` connected with a geometric point `ξ`, isotrivial groups correspond to finitely generated
`π₁(S, ξ)`-modules with open stabilisers (SGA 3, Exp. X, 1.2): `X*(H)` is a representation of
`π₁^ét`. *Theorem* `IsMultiplicativeType.isotrivial`: if `S` is connected, locally noetherian and
normal, every group of multiplicative type over `S` is isotrivial (SGA 3, Exp. X, 5.16, which
allows geometrically unibranch bases). Route: the free quotient of `X*(H)` has finite monodromy
and is trivialised by a connected finite étale cover (InverseGaloisAndArithmeticFundamentalGroups
IG.0.3), and the torsion of `X*(H)` is finite étale. Connectedness cannot be dropped from the
global statement, since `M` is a single group (2.3, Checks); the componentwise form holds without
it: for `S` locally noetherian and normal, the restriction of `H` to every connected open and
closed subscheme is isotrivial (`IsMultiplicativeType.isotrivial_component`). *Needs:* 2.3;
InverseGaloisAndArithmeticFundamentalGroups IG.0.3.

**Checks.**

- Over a field every group of multiplicative type is isotrivial, split by a finite separable
  extension (SGA 3, Exp. X, 1.4).
- Over `Spec(k × k)` the group of 2.3, Checks, is not isotrivial although each restriction to a
  point is split.
- Normality is needed: the torus of 2.6 over the nodal curve is not isotrivial.

### 2.6 A torus that is not isotrivial

Define `nodalCurve k`, the spectrum of `{f ∈ k[t] | f(0) = f(1)}`: the affine line with `0` and
`1` identified. Gluing `𝔾_m²` over `𝔸¹` along the points `0` and `1` by the automorphism of
`ℤ²` with matrix `[[1, 1], [0, 1]]` gives a torus of rank two whose character sheaf is the
locally constant sheaf of IG.0.3, Checks, with infinite monodromy `⟨[[1, 1], [0, 1]]⟩ ≅ ℤ`. Prove
`exists_torus_not_isotrivial`: it is a torus and no finite étale surjective base change makes it
diagonalizable (SGA 3, Exp. X, 1.6, built there from the connected étale `ℤ`-torsor over the
curve). Its character sheaf is a continuous representation of the Noohi group `π₁^proét` of the
nodal curve, through its quotient `ℤ`, and of no finite quotient of `π₁^ét`
(InverseGaloisAndArithmeticFundamentalGroups IG.0.4). *Needs:* 2.1, 2.5;
InverseGaloisAndArithmeticFundamentalGroups IG.0.4.

**Checks.**

- The pullback of the torus to the cycle of `n` copies of `𝔸¹`, a connected finite étale cover of
  degree `n`, has monodromy `[[1, n], [0, 1]] ≠ 1`, so it is not split there.
- Over the infinite chain of copies of `𝔸¹`, the connected étale `ℤ`-torsor, the torus is split.
- With the identity matrix instead, the gluing gives `𝔾_m²`, which is split.

### 2.7 Cocharacters, subtori, quotients

For a torus `T`, `X_*(T)` is the dual of `X*(T)`, and tori correspond to locally constant sheaves
of free modules of finite rank. Subgroups of multiplicative type of `H` correspond to quotient
sheaves of `X*(H)`, and the quotient of `H` by such a subgroup is of multiplicative type with
character sheaf the kernel (1.4, 2.3). `Hᵗᵒʳ = D(X*(H)/torsion)` is the largest subtorus, and
`H/Hᵗᵒʳ` is finite of multiplicative type with character sheaf the torsion of `X*(H)`.
*Needs:* 2.3, 1.4.

**Checks.**

- `H = 𝔾_m × μ₂`: `Hᵗᵒʳ = 𝔾_m` and `H/Hᵗᵒʳ = μ₂`.
- `X_*(𝔾_m) = ℤ`, generated by the identity.
- For `μ_n`, `Hᵗᵒʳ` is trivial and `H/Hᵗᵒʳ = μ_n`.

### Examples

- The kernel of the norm `R_{ℤ[i,1/2]/ℤ[1/2]} 𝔾_m → 𝔾_m` is a torus over `ℤ[1/2]` with fibre over
  `ℝ` the norm-one torus, isotrivial, split by `ℤ[i, 1/2]`.
- `μ_n` over `ℤ` is diagonalizable, of multiplicative type and not a torus for `n ≥ 2`.

### Dependencies

Layer 1; ModularCurves 0E; SchemeAndStackFoundations §2.9;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4; InverseGaloisAndArithmeticFundamentalGroups
IG.0.3 and IG.0.4; Tau Ceti's field theory of multiplicative type.

## Layer 3: rigidity, density of torsion, Hom schemes, centralizers

### 3.1 Infinitesimal rigidity

Prove `bijective_baseChange_map_of_thickening`: along a surjective closed immersion `S₀ ⟶ S`,
base change is bijective on homomorphisms between groups of multiplicative type (SGA 3, Exp. X,
2.1). For `H` of multiplicative type and `G` smooth over an affine `S` with `S₀` defined by a
nilpotent ideal, every homomorphism `H₀ → G₀` lifts to `H → G`, and two lifts are conjugate by a
section of `G` reducing to the unit (SGA 3, Exp. IX, 3.3 and 3.6). For `H` and `H′` finite
locally free of multiplicative type, the unique lift is the one of
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4. *Needs:* 2.1;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4.

**Checks.**

- Over `S = Spec k[ε]/(ε²)`, `End(𝔾_m) = ℤ = End(𝔾_{m,k})`: no infinitesimal deformations.
- `𝔾_a` is not rigid: over `k[ε]/(ε²)`, `t ↦ (1 + ε)t` is an endomorphism reducing to the
  identity and different from it, so the hypothesis of multiplicative type is needed.
- The bijection fails for a closed immersion that is not surjective: `Spec k → 𝔸¹_k` at `0`.

### 3.2 Rigidity along a connected base

Prove `hom_eq_of_eq_fibre`: for `S` connected and `H, H′` of multiplicative type, two
homomorphisms `H → H′` that agree on the fibre at one point are equal (SGA 3, Exp. IX, 5.1 and
5.3: the locus where they agree is open and closed). *Needs:* 2.1.

**Checks.**

- `t ↦ t` and `t ↦ t⁻¹` on `𝔾_m` over `Spec ℤ` differ on every fibre.
- Over `Spec(k × k)`, the identity on one point and `t ↦ t⁻¹` on the other agree on one fibre with
  the identity and are not equal to it: connectedness is needed.
- The subtori `t ↦ diag(t, 1)` and `t ↦ g_a diag(t, 1) g_a⁻¹` of `GL₂` over `𝔸¹ = Spec k[a]`,
  with `g_a = [[1, a], [0, 1]]`, agree at `a = 0` and differ: the target must be of
  multiplicative type.

### 3.3 Density of torsion

For `H` of multiplicative type, the family of subgroups `H[n]`, `n > 0`, is schematically dense in
`H` (SGA 3, Exp. IX, 4.7). Prove `eq_of_eq_on_torsion`: two `S`-morphisms from `H` to a separated
`S`-scheme that agree on every `H[n]` (the pullback of the unit section along `x ↦ xⁿ`) are equal;
in particular homomorphisms out of `H` are determined by their restrictions to the `H[n]` (SGA 3,
Exp. IX, 4.8). *Needs:* 2.1, 1.4.

**Checks.**

- For `𝔾_m` over a field, the union of the `μ_n` is infinite, hence dense in the irreducible
  curve `𝔾_m`.
- For `𝔾_a` in characteristic `0` every `𝔾_a[n]` is the unit section, not dense: the hypothesis
  of multiplicative type is needed.
- For `H = μ_n` the family contains `H` itself (`H[n] = H`).

### 3.4 Hom schemes

For `H` of multiplicative type and `G` smooth affine over `S`, `Hom_{S-gr}(H, G)` is represented
by a smooth separated `S`-scheme (SGA 3, Exp. XI, 4.2); for `G` of multiplicative type it is a
twisted constant group of type `Hom(X*(G), X*(H))`, étale and separated (SGA 3, Exp. X, 5.8).
*Needs:* 0.1, 2.3.

**Checks.**

- `Hom(𝔾_m, 𝔾_m) = ℤ_S`, étale over `S`.
- `Hom(μ_n, 𝔾_m) = (ℤ/n)_S`, also over a base where `n` is not invertible.
- `Hom(𝔾_m, GL₂)` over a field has infinitely many components, one for each conjugacy class of
  cocharacters, and is not of finite type.

### 3.5 Centralizers and normalizers

For `H ⊆ G` of multiplicative type in `G` smooth affine, `Z_G(H)` and `N_G(H)` are represented by
closed smooth subgroup schemes, `Z_G(H)` is open and closed in `N_G(H)`, and `N_G(H)/Z_G(H)` is
represented by an étale separated `S`-group (SGA 3, Exp. XI, 5.3, 5.3 bis and 5.9). *Needs:* 3.4.

**Checks.**

- `Z_{GL₂}(diagonal torus)` is the diagonal torus, with `N/Z = ℤ/2`.
- `Z_{GL₂}(μ₂ embedded as ±1)` is `GL₂`: a central subgroup.
- For `μ_p` inside `SL_p` as the centre over `𝔽_p`, `Z = SL_p` is smooth although `μ_p` is not.

### Examples

- Over any `S`, an endomorphism `t ↦ t^a` of `𝔾_m` restricts to `ζ ↦ ζ^a` on `μ_n`, which fixes
  `a` modulo `n` for every `n`, hence `a`.
- The homomorphisms `𝔾_m → 𝔾_m²` over a connected base are `t ↦ (t^a, t^b)`, the points of
  `Hom = ℤ²_S`.

### Dependencies

Layers 1–2; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4 for the comparison of 3.1.

## Layer 4: smooth groups over a field and their ranks

Here `k` is a field and `G` a group scheme of finite type over `k`.

### 4.1 Quotients

For a closed subgroup scheme `H ⊆ G`, the fppf quotient sheaf `G/H` is represented by a scheme of
finite type over `k`, `G → G/H` is faithfully flat, and `G/H` is quasi-projective; for `H` normal
it is a group scheme (SGA 3, Exp. VI_A, 3.2; Demazure–Gabriel, III, §3, 5.4; over an Artin base,
Grothendieck, FGA III, Théorème 7.2). It satisfies the quotient predicates of
SchemeAndStackFoundations §1.17. *Needs:* SchemeAndStackFoundations §1.17.

**Checks.**

- `GL_n/B` is the flag variety, projective of dimension `n(n − 1)/2`.
- `𝔾_m/μ_n ≅ 𝔾_m` by `t ↦ tⁿ`, also in characteristic dividing `n`, where the map is not étale.
- `G/G = Spec k` and `G/{e} = G`.

### 4.2 Chevalley's theorem

Prove `chevalley`: for `k` perfect and `G` smooth connected, there is a smooth connected affine
normal subgroup `L`, the kernel of a faithfully flat homomorphism from `G` to an abelian variety
(Conrad, *A modern proof of Chevalley's theorem*, Thm. 1.1); `L` is unique and its formation
commutes with extension of perfect fields. For `G` commutative this is the decomposition of
NeronModelsAndSemistableAbelianVarieties 2.3, which this target compares with. *Needs:* 4.1;
Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; NeronModelsAndSemistableAbelianVarieties 2.3.

**Checks.**

- For an abelian variety `L = 1`; for `G` affine `L = G`.
- For `G = A × 𝔾_m`, `L = 𝔾_m`.
- For `G = A × 𝔾_m`, the subgroup `A[2] × 𝔾_m` is affine and normal with quotient the abelian
  variety `A/A[2]`, but not connected: connectedness of `L` is what makes it unique.

### 4.3 Affinization

Prove `affinization`: `O(G)` is a finitely generated `k`-algebra and `G → Spec O(G)` is
faithfully flat; its kernel `Gᵃⁿᵗ` is the smallest normal subgroup with affine quotient, and
`O(Gᵃⁿᵗ) = k` (Demazure–Gabriel, III, §3, 8.2). Write `G_affq = Spec O(G)`. *Needs:* 4.1.

**Checks.**

- For `G` affine, `G_affq = G`; for an abelian variety, `G_affq = Spec k`.
- For `G = A × 𝔾_m`, `G_affq = 𝔾_m`.
- In characteristic `0`, a non-split extension `G` of an abelian variety `A` by `𝔾_a` has
  `G_affq = 1` while `L = 𝔾_a` (the class in `H¹(A, O_A)` is nonzero): affinization and
  Chevalley subgroup differ.

### 4.4 Rank invariants

For `G` smooth connected over an algebraically closed `Ω`, with Chevalley subgroup `L`, a maximal
torus `T ⊆ L` and the radical `R(L)`, define the abelian rank `ρ_ab = dim G − dim L`, the
reductive rank `ρ_r = dim T`, the nilpotent rank `ρ_n = dim Z_G(T)` (the Cartan subgroups), the
unipotent rank `ρ_u = ρ_n − ρ_r − ρ_ab` and the semisimple dimension `d_s = dim L/R(L)`, as in
SGA 3, Exp. X, 8.7. Prove that they do not depend on `T` (conjugacy of maximal tori in `L`) and
are unchanged under extension of `Ω`, so that they are functions of a point. For `G` affine,
`ρ_ab = 0` and these are the invariants of SGA 3, Exp. XII, 1.5. *Needs:* 4.2; Tau Ceti
`TauCeti.HopfIdeal.IsMaximalTorus`.

**Checks.**

- An elliptic curve has `ρ_ab = ρ_n = 1` and `ρ_r = ρ_u = d_s = 0`.
- `𝔾_m` has `ρ_r = ρ_n = 1`, `ρ_u = 0`; `𝔾_a` has `ρ_r = 0`, `ρ_n = ρ_u = 1`.
- `GL_n` has `ρ_r = ρ_n = n`, `ρ_u = 0` and `d_s = n² − 1`.

### Examples

- `A × GL_n` has `ρ_ab = dim A`, `ρ_r = n`, `ρ_n = dim A + n` and `d_s = n² − 1`.
- The Borel subgroup `B ⊂ GL₂` has `ρ_r = ρ_n = 2`, `ρ_u = 0` and `d_s = 0`.

### Dependencies

Tau Ceti's field theory and abelian varieties; SchemeAndStackFoundations §1.17;
NeronModelsAndSemistableAbelianVarieties 2.3 for the comparison of 4.2.

## Layer 5: smooth group schemes over a base

Here `G` is smooth, separated and of finite presentation over `S`, with connected fibres.

### 5.1 Rank functions

Each invariant of 4.4 defines a function `S → ℕ` through geometric fibres. *Needs:* 4.4, 0.1.

**Checks.**

- For `𝔾_{m,S}` every function is constant.
- For `G^(λ)` (5.4, Checks) over `ℤ_p` with `λ = p`, `ρ_r` is `1` at the generic point and `0` at
  the closed point.
- For an abelian scheme, `ρ_ab = ρ_n` is the relative dimension and `ρ_r = ρ_u = d_s = 0`.

### 5.2 Maximal tori over a base

A subtorus `T ⊆ G` is maximal if every geometric fibre `T_x` is a maximal torus of `G_x`. For `G`
affine: `G` has a maximal torus étale-locally on `S` iff `ρ_r` is locally constant (SGA 3,
Exp. XII, 1.7 b)); the functor of maximal tori is then represented by a smooth separated
`S`-scheme of finite type (SGA 3, Exp. XII, 1.10); two maximal tori are conjugate étale-locally,
and `T ↦ Z_G(T)` is a bijection onto the Cartan subgroups (SGA 3, Exp. XII, 7.1). *Needs:* 5.1,
2.1, 3.5.

**Checks.**

- The diagonal torus of `GL_{n,S}` is maximal.
- `G^(p)` over `ℤ_p` has no maximal torus: `ρ_r` is not locally constant.
- For `G = T` a torus, `T` is its own unique maximal torus and the scheme of maximal tori is `S`.

### 5.3 Specialization inequalities

For `s` a specialization of `s′`: `ρ_ab(s) ≤ ρ_ab(s′)`, `ρ_r(s) + ρ_ab(s) ≤ ρ_r(s′) + ρ_ab(s′)`,
`d_s(s) ≤ d_s(s′)`, `ρ_n(s) ≥ ρ_n(s′)` and `ρ_u(s) ≥ ρ_u(s′)` (SGA 3, Exp. X, Remarques 8.7,
stated there without proof for a discrete valuation ring, and equivalently as semicontinuity);
since the fibre dimension is locally constant, `dim L(s) ≥ dim L(s′)` follows. Route: reduce to
`S` locally noetherian by Noetherian approximation (SchemeAndStackFoundations §0.9), then to
the spectrum of a discrete valuation ring dominating the specialization (EGA II, 7.1.9); prolong
the torsion of a split maximal torus of the special fibre to finite étale subgroups (3.3) and
take their centralizers (3.5); the abelian rank uses the prime-to-characteristic Tate module of
the abelian quotient (AbelianSchemesAndArithmeticModuli). *Needs:* 5.1, 5.2, 3.3, 3.5;
SchemeAndStackFoundations §0.9; AbelianSchemesAndArithmeticModuli.

**Checks.**

- `G^(p)` over `ℤ_p`: `ρ_r` drops from `1` to `0` and `ρ_u` rises from `0` to `1`.
- The smooth locus of a Weierstrass model with split multiplicative reduction has `ρ_ab` dropping
  from `1` to `0` and `ρ_r` rising from `0` to `1`: `ρ_r` alone is not semicontinuous, only
  `ρ_r + ρ_ab` is.
- An Iwahori group scheme of `SL₂` over `ℤ_p` has `d_s = 3` generically and `d_s = 0` on the
  special fibre, which is solvable.

### 5.4 Semicontinuity in the affine case

For `G` affine, `ρ_r` is lower semicontinuous and `ρ_n` and `ρ_u = ρ_n − ρ_r` upper
semicontinuous on `S` (SGA 3, Exp. XII, 1.7 a)). *Needs:* 5.1, 5.2.

**Checks.**

- `G^(λ) = Spec_S O_S[t, (1 + λt)⁻¹]` with law `t₁ + t₂ + λ t₁ t₂`, for `λ ∈ Γ(S, O_S)`, is smooth
  affine commutative with connected fibres, `𝔾_m` over `D(λ)` (by `t ↦ 1 + λt`) and `𝔾_a` over
  `V(λ)`: `ρ_r` is `1` on `D(λ)` and `0` on `V(λ)`, lower semicontinuous.
- `𝔾_m × 𝔾_a` over any base has constant `ρ_r = 1` and `ρ_u = 1`.
- The example of 5.3, Checks, with an elliptic curve, shows that affineness is needed for `ρ_r`.

### 5.5 The affine quotient along specialization

Let `A` be an abelian scheme over `ℤ_p`, `ω` a basis vector of the free module `H¹(A, O_A)`, and
`G` the extension of `A` by `𝔾_a` of class `p·ω`. Then `G` is smooth with connected fibres,
`(G_η)_affq = 1` at the generic point and `(G_s)_affq ≅ 𝔾_a` at the closed point, while
`dim L = 1` at both: the affinization is not constant along specialization. *Needs:* 4.3;
AbelianSchemesAndArithmeticModuli.

**Checks.**

- With class `ω` instead of `p·ω`, `(G_s)_affq = 1` as well.
- With class `0`, `G = A × 𝔾_a` and `G_affq = 𝔾_a` on both fibres.
- In both fibres `ρ_ab = dim A`, so the jump is invisible to the ranks of 4.4.

### Examples

- `GL_{n,S}` has constant ranks; its scheme of maximal tori is `GL_n/N(T)`.
- The identity component of the Néron model of an elliptic curve with split multiplicative
  reduction is the example of 5.3, Checks.

### Dependencies

Layers 3–4; SchemeAndStackFoundations §0.9; AbelianSchemesAndArithmeticModuli.

## Layer 6: line bundles and Picard groups of the flag scheme

Here `(G, T)` is split reductive over `S` as in Convention 7, with positive system `Φ⁺`, simple
roots `Δ` and `B⁻ ⊇ T`.

### 6.1 Line bundles over a base

For `λ ∈ X*(T)`, construct `𝓛(λ)` on `G/B⁻ = Bor(G)` over `S` by descent along `G → G/B⁻`
(ModularCurves 0E), with its `G`-linearisation in the sense of EquivariantIntersectionTheory 1.1:
`𝓛(λ + μ) ≅ 𝓛(λ) ⊗ 𝓛(μ)`, `𝓛(−λ) ≅ 𝓛(λ)^∨`, compatibility with base change on `S`, and, for
`χ ∈ X*(G)`, `𝓛(χ|_T)` is trivial as a line bundle with linearisation twisted by `χ`. Over a field
these are SchubertGeometry S3's lines `L(λ)` with their linearisation and fibre character, and
their laws there are consumed, not reproved. Over `S`, `𝓛(λ)` is relatively ample iff it is ample
on every fibre, that is iff `⟨λ, α^∨⟩ > 0` for every `α ∈ Δ` (SchubertGeometry S3.1; Jantzen,
II.4.4). Translation by a representative `n₀` of `w₀` gives `G/B⁺ ≅ G/B⁻`, `gB⁺ ↦ g n₀⁻¹ B⁻`,
which pulls `𝓛(μ)` back to the `B⁺`-line of character `w₀μ`: the comparison with sources whose
flags are `G/B⁺`. *Needs:* ReductiveGroups Layer 8 (`Bor(G)`), 9B; ModularCurves 0E;
EquivariantIntersectionTheory 1.1; SchubertGeometry S3.

**Checks.**

- For `SL₂`, `G/B⁻ = ℙ¹_S`, `𝓛(ϖ) = O(1)`, and under the translation the `B⁺`-line of
  character `−ϖ = w₀ϖ` is `O(1)` on `SL₂/B⁺`.
- For a split torus `G = T`, `G/B⁻ = S` and every `𝓛(λ)` is `O_S` with linearisation `λ`.
- `𝓛(0) = O` with the trivial linearisation, and `𝓛(−ϖ) = O(−1)` on `ℙ¹` is not ample.

### 6.2 Picard groups over a field

For `G` connected split reductive over a field: `0 → X*(G) → X*(T) → Pic(G/B⁻) → Pic(G) → 0`
is exact, with `X*(T) → Pic(G/B⁻)` the map `λ ↦ 𝓛(λ)` followed by forgetting the linearisation
(Popov 1974, §4; Sansuc 1981, §6). The kernel `X*(G)` is EquivariantIntersectionTheory 1.3 for
`X = G/B⁻`, which is normal with `k[X]^* = k^*`. Let `D_α` be the closure of `B⁺ s_α B⁻/B⁻`; the
complement of the big cell `U⁺B⁻/B⁻` is `⋃_α D_α`. Translated by `n₀`, `D_α` is the Schubert
divisor `X(w₀ s_α)`, and the divisor of the normalized extremal section of `L(λ)`, `λ` dominant,
is `Σ_α ⟨λ, α^∨⟩ X(w₀ s_α)` (SchubertGeometry S7.1 at `w = w₀`), so `O(D_α)` is the line of the
fundamental weight `ϖ_α`, read on the simply connected cover of the derived group, whose flag
variety is `G/B⁻`. Hence `Pic(G/B⁻) ≅ ℤ^Δ ≅ P`, `𝓛(λ) ↦ (⟨λ, α^∨⟩)_α`, and
`Pic(G) ≅ P/X*(T_der)` is finite, zero iff the derived group is simply connected. *Needs:* 6.1;
EquivariantIntersectionTheory 1.3; SchubertGeometry S7.1; ReductiveGroups Layer 8 (simply
connected cover).

**Checks.**

- `Pic(SL₂) = 0` and `Pic(PGL₂) = ℤ/2`, the weight lattice `ℤϖ` modulo the root lattice `2ℤϖ`.
- For `GL_n`, `Pic(G/B⁻) ≅ ℤ^{n−1}` and `Pic(GL_n) = 0`; the kernel is `X*(GL_n) = ℤ det`.
- For a torus, `Pic(G/B⁻) = Pic(Spec k) = 0` and `X*(G) = X*(T)`.

### 6.3 The Picard group of `G/B⁻` over a base

For `S` locally noetherian, normal and connected, `Pic(S) ⊕ ℤ^Δ → Pic(G/B⁻)`,
`(M, (n_α)) ↦ π*M ⊗ O(Σ n_α D_α)`, is an isomorphism. Route: the big cell `U⁺ ≅ U⁺B⁻/B⁻` is an
affine space over `S`, whose Picard group is `Pic(S)` for `S` normal; its complement is `⋃ D_α`,
with the `D_α` relative effective Cartier divisors with irreducible fibres. With 6.1,
`λ ↦ 𝓛(λ)` induces `X*(T)/X*(G) ≅ X*(T_der) ↪ P ≅ ℤ^Δ`. *Needs:* 6.1, 6.2;
SchemeAndStackFoundations §3.4.

**Checks.**

- `S = Spec k`: this is 6.2.
- For `SL₂`, `Pic(ℙ¹_S) = Pic(S) ⊕ ℤ`, with `D_α` the section `∞`.
- For `GL₂`, `𝓛(det|_T)` maps to `0 ∈ ℤ^Δ` and `O(D_α)` to `1`: `X*(G)` is in the kernel of
  `λ ↦ 𝓛(λ)`.

### Examples

- `G = GL₃`: `Pic(G/B⁻) = ℤ²`, generated by the pullbacks of `O(1)` from `ℙ²` and its dual.
- `G = 𝔾_m^r`: `Δ = ∅` and `Pic(G/B⁻) = Pic(S)`.

### Dependencies

ReductiveGroups Layer 8 and 9B; ModularCurves 0E; SchubertGeometry S3 and S7.1;
EquivariantIntersectionTheory 1.1 and 1.3; SchemeAndStackFoundations §3.4.

## Layer 7: the Steinberg map and the Grothendieck–Springer space

Here `(G, T)` is split reductive over `S` as in Convention 7, with derived group simply connected
and `W` its Weyl group. 7.4 and 7.5 assume moreover that `G` is semisimple.

### 7.1 The quotient `T/W`

`T/W = Spec_S (O_T)^W`, the quotient by the finite constant group `W` (ModularCurves 0C). Since
`ℤ[X*(T)]^W` is a polynomial ring over `ℤ[X*(G)]` on the orbit sums of the fundamental weights
lifted to `X*(T)` (Bourbaki, Lie VI, §3, no. 4, Thm. 1, for `ℤ[P]^W`), `T/W` is smooth over `S`
and its formation commutes with base change. *Needs:* ModularCurves 0C; ReductiveGroups 9B.

**Checks.**

- `SL₂`: `ℤ[t, t⁻¹]^W = ℤ[t + t⁻¹]` and `T/W = 𝔸¹`.
- `GL_n`: `T/W = 𝔸^{n−1} × 𝔾_m`, by the elementary symmetric functions, the last one invertible.
- A torus: `W = 1` and `T/W = T`.

### 7.2 The Steinberg map

Restriction `O(G)^G → O(T)^W` is an isomorphism over `ℤ`. Over an algebraically closed field this
is Steinberg 1965, Theorem 6.1 (b), for `G` semisimple simply connected; for `G` reductive with
simply connected derived group, reduce through the central isogeny `G_der × Z⁰ → G`, whose kernel
`μ = G_der ∩ Z⁰` is finite diagonalizable, taking `μ`-invariants, which is exact. Over `ℤ`,
injectivity holds since the conjugates of `T` are dense in `G_ℚ` and `ℤ[G]` is torsion free;
surjectivity: an `f ∈ ℤ[T]^W` is the restriction of some `F ∈ ℚ[G]^G`, and `F` is regular on the
regular semisimple locus over `ℤ`, open and fibrewise dense, hence regular in codimension one
on the smooth `G_ℤ`, hence in `ℤ[G]`. Define the Steinberg map `G → T/W` over `S` as the base
change of this map over `ℤ` (Convention 7). Prove that it is the unique `G`-invariant morphism
restricting to the quotient map on `T`: the conjugates of the regular semisimple locus of `T`
form an open subscheme dense in every fibre, hence schematically dense in the flat `G`. *Needs:*
7.1; ReductiveGroups 9B, Layer 8 (central isogenies).

**Checks.**

- `SL₂`: the Steinberg map is the trace.
- `GL_n`: it is the map to the coefficients of the characteristic polynomial, with last
  coordinate `det` in `𝔾_m`.
- A torus: it is the identity of `T`.

### 7.3 Regular locus

Define the regular locus `G^reg` as the open subscheme of points `g` of geometric fibres with
`dim Z_{G_x}(g) = rank`. Its complement has codimension `3` in every geometric fibre of positive
semisimple rank (Steinberg 1965, Theorem 1.3 and its remark for reductive groups), the
restriction of the Steinberg map to it is smooth and surjective, and the Steinberg map is smooth
exactly on `G^reg` (Steinberg 1965, Theorem 8.1; Slodowy 1980, ch. 3). *Needs:* 7.2.

**Checks.**

- `SL₂`: `G^reg` is the complement of `{±1}`, of codimension `3`.
- `GL_n`: `g` is regular iff its minimal polynomial is its characteristic polynomial.
- A torus: `G^reg = G` and the Steinberg map is an isomorphism.

### 7.4 Steinberg cross-section

Let `G` be moreover semisimple, hence simply connected, of rank `r`. With the pinning of
ReductiveGroups 9B, an ordering `α₁, …, α_r` of the simple roots and
`nᵢ = x_{αᵢ}(1) x_{−αᵢ}(−1) x_{αᵢ}(1) ∈ N_G(T)` lifting the simple reflections, let
`κ : 𝔸^r_S → G`, `(c₁, …, c_r) ↦ ∏ᵢ x_{αᵢ}(cᵢ) nᵢ`, with image `C = U_{α₁} n₁ ⋯ U_{α_r} n_r`.
`T/W ≅ 𝔸^r_S` by the fundamental characters (7.1), and the Steinberg map composed with `κ` is an
isomorphism `𝔸^r_S → T/W`. Hence `κ` is a closed immersion (it has a retraction and `G` is
separated), `C ⊆ G^reg`, and `κ` composed with the inverse of that isomorphism is a section
`T/W → G^reg` of the Steinberg map, the Steinberg section. Over an algebraically closed field
this is Steinberg 1965, Theorems 1.4, 7.1 and 7.9, and a geometric point of `G` is regular iff it
is conjugate to a point of `C` (Theorem 8.1). Over `S` both sides are flat and of finite
presentation, so the fibrewise isomorphism criterion (EGA IV₄, 17.9.5; Conrad, Lemma B.3.1)
gives the isomorphism. *Needs:* 7.1, 7.2, 7.3; ReductiveGroups 9B.

**Checks.**

- `SL₂`: `n = [[0, 1], [−1, 0]]`, `κ(c) = [[−c, 1], [−1, 0]]`, so `C = {[[t, 1], [−1, 0]]}`, and
  the trace of `κ(c)` is `−c`, an isomorphism `𝔸¹ → 𝔸¹`.
- The product is not a section with a central torus: for `SL₂ × 𝔾_m`, whose derived group is
  simply connected, `C` has dimension `1` and lies in `SL₂ × {1}`, while `T/W = 𝔸¹ × 𝔾_m`.
- `GL_n` lies outside 7.4; its companion-matrix section of the characteristic-polynomial map,
  with image in the regular elements, is a direct computation, not this product formula.

### 7.5 Universal centralizer

For `G` as in 7.4 and `σ` the Steinberg section, let `a : G × (T/W) → G^reg`,
`(g, c) ↦ g σ(c) g⁻¹`, and let the universal centralizer `J ⊆ G × (T/W)` be the closed subgroup
scheme over `T/W` of pairs with `g σ(c) g⁻¹ = σ(c)`, with its scheme structure as this equalizer.
Then `a` is surjective (Steinberg 1965, Theorem 8.1), its fibre over a geometric point `x` is a
torsor under the scheme-theoretic centralizer `Z_{G_x}(x)`, of dimension `r`, and
`J = (G × T/W) ×_{a, G^reg, σ} (T/W)`. The following are equivalent: `a` is smooth; `J → T/W` is
smooth; the scheme-theoretic centralizer of every regular geometric point of every fibre is
smooth (flatness of `a` from miracle flatness on fibres and the fibrewise flatness criterion,
EGA IV₃, 11.3.10). *Theorem:* if `S` is a `ℚ`-scheme these hold, every group scheme of finite
type over a field of characteristic `0` being smooth (Cartier). *Needs:* 7.4.

**Checks.**

- In characteristic `2`, the regular unipotent `u = [[1, 1], [0, 1]] ∈ SL₂` has centralizer
  `{[[a, b], [0, a]] : a² = 1}`, with coordinate ring `k[a, b]/((a − 1)²)`, not reduced: over
  `𝔽₂`, and over `ℤ`, `a` and `J → T/W` are not smooth.
- Over `ℚ`, the fibre of `J` at a rational `c ≠ ±2` is a maximal torus of `SL₂`, split iff
  `c² − 4` is a square.
- At `c = 2` over `ℚ`, `σ(2)` is regular unipotent and the fibre of `J` is `μ₂ × 𝔾_a`, smooth of
  dimension `1`.

### 7.6 The Grothendieck–Springer space

`G̃ ⊆ G × Bor(G)` is the closed subscheme of pairs `(g, B)` with `g ∈ B`. It is smooth over `S`,
`G̃ → Bor(G)` is a fibration with fibre `B`, and `π : G̃ → G` is projective. For `B ∈ Bor(G)`
with unipotent radical `U`, conjugating `B` to `B⁻` gives `B/U ≅ B⁻/U⁻ ≅ T`, independently of the
conjugating element, and `G̃ → T` sends `(g, B)` to the image of `g`. The square `G̃ → T → T/W`,
`G̃ → G → T/W` commutes, and the induced `G̃ → G ×_{T/W} T` is projective and birational and an
isomorphism over `G^reg`; `π` itself is of degree `|W|` over the regular semisimple locus.
`G̃ → T` is smooth: `G̃` is a simultaneous resolution of the Steinberg map after base change along
`T → T/W` (Slodowy 1980, ch. 4). The isomorphism over `G^reg` is proved over `ℤ` and base
changed: there the map to `G^reg ×_{T/W} T` is proper and quasi-finite (a regular element lies in
finitely many Borel subgroups, Steinberg 1965, Theorem 1.1), birational, and its target is smooth
over `T` by 7.3, hence normal, so Zariski's main theorem applies. *Needs:* 7.3; ReductiveGroups
Layer 8 (`Bor(G)`).

**Checks.**

- `SL₂`, at a regular semisimple `x` with eigenvalues `t ≠ t⁻¹`: the fibre of `G ×_{T/W} T` is the
  two points `t, t⁻¹`, and `x` lies in the two Borel subgroups fixing its eigenlines.
- `SL₂`, at a regular unipotent `u ≠ 1`: `t ↦ t + t⁻¹` has fibre `Spec k[t]/(t − 1)²` over `2`,
  and `u` lies in one Borel subgroup; the fibre of `G̃` over `u` is that length-two scheme.
- `SL₂`, over `±1`, which are not regular, the fibre of `G̃` is `ℙ¹`.

### 7.7 Picard groups of `G̃`, `G` and `G^reg`

For `S` regular noetherian and connected: `Pic(G) → Pic(G^reg)` is an isomorphism (Hartogs
extension, SchemeAndStackFoundations §0.6, codimension `≥ 2`), and
`0 → Pic(S) → Pic(G) → Pic(G_η) → 0` is exact with `G_η` the generic fibre, so
`Pic(G)/Pic(S) ≅ P/X*(T_der)` is finite by 6.2. Pullback along `G̃ → Bor(G)` is an isomorphism
`Pic(G/B⁻) → Pic(G̃)`, and a line bundle on `Bor(G)` is relatively ample iff its pullback to `G̃`
is `π`-ample. *Needs:* 6.2, 6.3, 7.3, 7.6; SchemeAndStackFoundations §0.6, §3.4.

**Checks.**

- `SL₂` over a field: `Pic(G) = Pic(G^reg) = 0` and `Pic(G̃) = ℤ`.
- `S = Spec ℤ`: `Pic(S) = 0`, and `Pic(G) = P/X*(T_der) = 0` since the derived group is simply
  connected.
- `G̃ → T × Bor(G)` is a bundle of affine spaces `U`, so `Pic(G̃) = Pic(Bor(G))` for split `T`.

### 7.8 No resolution without base change

For `S` regular noetherian and connected and `G` of positive semisimple rank, there is no regular
scheme `X̃` with a projective morphism `p : X̃ → G` that is an isomorphism over `G^reg`, whose
exceptional locus has codimension `≥ 2` in every fibre over `S`, and whose composite with the
Steinberg map is smooth. Proof: by 7.7, `Pic(X̃) = Pic(G^reg)` is finite modulo `Pic(S)`, so a
power of a `p`-ample bundle is pulled back from `S`, `p` is quasi-finite, hence finite and
birational onto the normal `G`, hence an isomorphism; but the Steinberg map is not smooth at the
identity section (7.3). *Needs:* 7.3, 7.7.

**Checks.**

- `G̃ → G` is not a counterexample: its exceptional locus over `±1 ∈ SL₂` is a `ℙ¹` and its
  composite with the trace is not smooth; only after base change to `T` is it a resolution.
- For a torus (semisimple rank `0`), `G` itself is such an `X̃`: the hypothesis is needed.
- For `SL₂`, the trace is not smooth at `±1`, where its differential vanishes.

### Examples

- `SL₂` over `ℤ`: `T/W = 𝔸¹`, the trace, `C = {[[t, 1], [−1, 0]]}`, and `G̃` resolving the trace
  after `t ↦ t + t⁻¹`.
- `GL_n` over a field: the characteristic polynomial and its companion-matrix section.

### Dependencies

Layer 6; ReductiveGroups Layer 8 and 9B; ModularCurves 0C; SchemeAndStackFoundations §0.6, §3.4.

## Downstream consumers

- FlagVarieties (Scope) names this roadmap for the relative scheme `Bor(G)`; that scheme is
  ReductiveGroups Layer 8's, and this roadmap's share is the line bundles on it and its Picard
  group (Layer 6).
- NeronModelsAndSemistableAbelianVarieties names 4.2 as the owner of Chevalley's theorem for
  noncommutative groups and of its comparison with its own 2.3, and consumes nothing from it.
- EquivariantIntersectionTheory names this roadmap's line bundles `𝓛(λ)` on `G/B⁻` (6.1) as
  linearised invertible sheaves in the sense of its 1.1.

## References

- M. Demazure, A. Grothendieck et al., *Schémas en groupes* (SGA 3), LNM 151–153 (1970);
  re-edition by P. Gille and P. Polo, Documents Mathématiques 7 and 8, SMF (2011): Exp. VI_A 3.2;
  Exp. VI_B 3.9, 3.10; Exp. VIII 1.5, 1.6, 2.1, 3.1, 3.2; Exp. IX 1.1, 3.3, 3.6, 4.7, 4.8, 5.1,
  5.3; Exp. X 1.2, 1.4, 1.6, 2.1, 4.5, 5.1, 5.6–5.9, 5.16, 8.7; Exp. XI 4.2, 5.3, 5.3 bis, 5.9;
  Exp. XII 1.5, 1.7, 1.10, 7.1.
- B. Conrad, « A modern proof of Chevalley's theorem on algebraic groups », *J. Ramanujan Math.
  Soc.* 17 (2002), 1–18, Thm. 1.1.
- B. Conrad, « Reductive group schemes », in *Autour des schémas en groupes* I, Panoramas et
  Synthèses 42–43, SMF (2014), Lemma B.3.1.
- M. Demazure, P. Gabriel, *Groupes algébriques* I, Masson (1970), III, §3, 5.4 and 8.2.
- A. Grothendieck, « Techniques de construction et théorèmes d'existence en géométrie
  algébrique III : préschémas quotients », Séminaire Bourbaki 6 (1960/61), exp. 212, 99–118,
  Théorème 7.2. Numdam SB_1960-1961__6__99_0.
- A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique* II and IV, Publ. Math. IHÉS 8,
  24, 28, 32 (1961–1967): II 7.1.9; IV 11.3.10, 17.9.5.
- R. Steinberg, « Regular elements of semisimple algebraic groups », *Publ. Math. IHÉS* 25
  (1965), 49–80, Theorems 1.1, 1.3, 1.4, 6.1, 7.1, 7.9 and 8.1. Numdam PMIHES_1965__25__49_0.
- P. Slodowy, *Simple singularities and simple algebraic groups*, LNM 815, Springer (1980),
  ch. 3–4.
- J. C. Jantzen, *Representations of algebraic groups*, 2nd ed., AMS (2003), II.1.8, II.4.4.
- N. Bourbaki, *Groupes et algèbres de Lie*, ch. VI, §3, no. 4, Thm. 1.
- V. L. Popov, « Picard groups of homogeneous spaces of linear algebraic groups and
  one-dimensional homogeneous vector bundles », *Math. USSR Izv.* 8 (1974), 301–327, §4.
- J.-J. Sansuc, « Groupe de Brauer et arithmétique des groupes algébriques linéaires sur un corps
  de nombres », *J. reine angew. Math.* 327 (1981), 12–80, §6.
