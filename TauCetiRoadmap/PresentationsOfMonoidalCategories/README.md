# Roadmap: presentations of monoidal categories

**Summary.** A linear monoidal category whose objects are finite direct sums of simple objects `S_a`, with
`End(S_a)` the base ring, is determined up to linear monoidal equivalence by finite data: fusion
multiplicities `N_{ab}^c` and F-matrices `F^{abc}_d`. Its braidings are determined in the same way
by R-matrices `R^{ab}_c`, and its pivotal structures by one unit scalar per simple object. Mathlib
has the target structures (`MonoidalCategory`, `BraidedCategory`, `RigidCategory`) and generic
constructors (`MonoidalCategory.ofTensorHom`, `Monoidal.induced`, `Monoidal.transport`). Tau Ceti
has finite semisimple categories, fusion coefficients and pivotal structures, from the
[pivotal and spherical categories roadmap](../PivotalSpherical/README.md). Neither has a
constructor from matrix data or a way to extract such data. This roadmap builds:

- the constructor;
- the extraction, with a reconstruction theorem;
- the gauge action and the classification of models and their autoequivalences;
- braidings, rigidity, and pivotal and spherical structures, all in terms of the data.

Suggested home: `TauCeti/CategoryTheory/Monoidal/FSymbols/`. Topic: `math.QA`.

## Scope and ownership

- **Semisimple with finitely many simples, split.** `ι` is a `Fintype`, and each simple has
  `End(S_a) = R`.
  - Excluded: non-semisimple tensor categories, for example representations of a `p`-group in
    characteristic `p`. "Skeletal data" for these is deliberately out of scope: Hom spaces between
    indecomposables are not encoded by multiplicities, so the data below has no analogue.
  - Excluded: infinitely many simples.
  - Excluded: non-split simples, whose endomorphism ring is a division algebra larger than the base
    field, as in fusion categories over `ℝ` with quaternionic or complex simples.
- **Base ring.** Every layer works over a commutative ring `R`, nontrivial wherever multiplicities
  are read off as ranks. Noncommutative rings are excluded, because `End(𝟙)` of a monoidal category
  is commutative and equals `R` here. The ring generality is what reducing a presentation modulo a
  prime needs. Only the comparison with
  [PivotalSpherical](../PivotalSpherical/README.md)'s abelian, field-based definitions (Layer 2)
  needs a field.
- **Fusion-category infrastructure is not built here.** [PivotalSpherical](../PivotalSpherical/README.md)
  owns finite semisimple categories, simple classes, fusion coefficients, the Grothendieck ring,
  pivotal and spherical structures, `Vec^ω_G`, and dual bases for split simple families over a
  commutative ring. It deliberately has no bundled fusion-category
  class, and neither does this roadmap. The models here instantiate its definitions (Layers 2, 3
  and 6).

## Conventions

Write `u : ι` for the unit index. A **fusion basis** is a choice of bases `φ^{ab→c}_i`,
`i : Fin N_{ab}^c`, of `Hom(S_a ⊗ S_b, S_c)`. The direction is fusion (`a ⊗ b → c`), not splitting.
Normalization: `φ^{ua→a}_0 = λ_a` and `φ^{au→a}_0 = ρ_a`, through a fixed `𝟙_ C ≅ S_u`.
`ψ^{ab→c}_i : S_c ⟶ S_a ⊗ S_b` is the dual family, with `ψ_i ≫ φ_j = δ_{ij} • 𝟙`.

- **Index types.** `Left a b c d := Σ e, Fin N_{ab}^e × Fin N_{ec}^d` and
  `Right a b c d := Σ f, Fin N_{bc}^f × Fin N_{af}^d`. The left basis of `Hom((a⊗b)⊗c, d)` is
  `L_{(e,i,j)} = (φ^{ab→e}_i ▷ c) ≫ φ^{ec→d}_j`. The right basis of `Hom(a⊗(b⊗c), d)` is
  `R_{(f,k,l)} = (a ◁ φ^{bc→f}_k) ≫ φ^{af→d}_l`.
- **F.** `F^{abc}_d : Matrix (Left a b c d) (Right a b c d) R` ([EGNO] §4.9, (4.12)–(4.13), p. 77;
  [Kitaev] §E.1, eq. (177), p. 68) is defined by
  `L_x = Σ_y F^{abc}_d[x,y] • ((α_ a b c).hom ≫ R_y)`. Without the associator suppressed this reads
  `φ^{ZW→T}_j ∘ (φ^{XY→Z}_i ⊗ 1) = Σ_{Z',k,l} F[(X,Y,W,T)][(Z,i,j),(Z',k,l)] φ^{XZ'→T}_l ∘ (1 ⊗ φ^{YW→Z'}_k) ∘ α`.
  `F̄^{abc}_d` is the inverse matrix, with rows `Right` and columns `Left`.
- **Composite rule.** The symbol `M(s)` of a structure isomorphism `s` is defined by
  `source basis = M(s) · (s ≫ target basis)`. Then `M(s₁ ≫ s₂) = M(s₁) M(s₂)`, and whiskering by an
  identity acts as the identity on the untouched indices. The equations below are this rule applied
  to Mathlib's `MonoidalCategory.pentagon`, `BraidedCategory.hexagon_forward` and
  `BraidedCategory.hexagon_reverse`.
- **Pentagon** ([Kitaev] Fig. 17a, p. 69). For all objects `A B C D E` and indices
  `i₁ : N_{AB}^p`, `i₂ : N_{pC}^q`,
  `i₃ : N_{qD}^E`, `k : N_{CD}^r`, `m : N_{Br}^s`, `n : N_{As}^E`:
  `Σ_{l : N_{pr}^E} F^{pCD}_E[(q,i₂,i₃),(r,k,l)] · F^{ABr}_E[(p,i₁,l),(s,m,n)]`
  `= Σ_{t, x : N_{BC}^t, y : N_{At}^q, z : N_{tD}^s} F^{ABC}_q[(p,i₁,i₂),(t,x,y)] · F^{AtD}_E[(q,y,i₃),(s,z,n)] · F^{BCD}_s[(t,x,z),(r,k,m)]`.
  The left side is `α_{AB,C,D} ≫ α_{A,B,CD}`, and the right side is
  `(α_{A,B,C} ▷ D) ≫ α_{A,BC,D} ≫ (A ◁ α_{B,C,D})`.
- **Unit.** `N_{ua}^b = N_{au}^b = if a = b then 1 else 0`, and (triangle)
  `F^{auc}_d[(a,0,j),(c,0,l)] = if j = l then 1 else 0`. These are the only unit conditions imposed.
- **R.** `R^{ab}_c : Matrix (Fin N_{ab}^c) (Fin N_{ba}^c) R` is defined by
  `φ^{ab→c}_i = Σ_j R^{ab}_c[i,j] • ((β_ a b).hom ≫ φ^{ba→c}_j)`. This is the same direction as `F`.
- **Hexagons** ([Kitaev] §E.3, Fig. 20, p. 81).
  - `hexagon_forward`: for `(e,i,j) : Left a b c d`, `n : N_{ca}^g` and `o : N_{bg}^d`,
    `Σ_{f,k,l,m} F^{abc}_d[(e,i,j),(f,k,l)] R^{af}_d[l,m] F^{bca}_d[(f,k,m),(g,n,o)] = Σ_{p,q} R^{ab}_e[i,p] F^{bac}_d[(e,p,j),(g,q,o)] R^{ac}_g[q,n]`.
  - `hexagon_reverse`: for `(f,k,l) : Right a b c d`, `n : N_{ca}^g` and `o : N_{gb}^d`,
    `Σ_{e,i,j,m} F̄^{abc}_d[(f,k,l),(e,i,j)] R^{ec}_d[j,m] F̄^{cab}_d[(e,i,m),(g,n,o)] = Σ_{p,q} R^{bc}_f[k,p] F̄^{acb}_d[(f,p,l),(g,q,o)] R^{ac}_g[q,n]`.
- **Gauge** ([Kitaev] §E.6, p. 89). A normalized gauge `g` is a family of units `g^{ab}_c` of
  `Matrix (Fin N_{ab}^c) (Fin N_{ab}^c) R` with `g^{ua}_a = g^{au}_a = 1`. It acts on bases by
  `φ'_i = Σ_{i'} g^{ab}_c[i,i'] φ_{i'}`, so that `F' = G_L · F · G_R⁻¹` and
  `R'^{ab}_c = g^{ab}_c R^{ab}_c (g^{ba}_c)⁻¹`, where
  - `G_L[(e,i,j),(e,i',j')] = g^{ab}_e[i,i'] g^{ec}_d[j,j']`;
  - `G_R[(f,k,l),(f,k',l')] = g^{bc}_f[k,k'] g^{af}_d[l,l']`;
  - both are zero off the diagonal in `e` and in `f`.
- **Duality scalars.** For `ā` with `N_{āa}^u = N_{aā}^u = 1`, put
  `s_a := F̄^{aāa}_a[(u,0,0),(u,0,0)]`, which equals `F^{āaā}_ā[(u,0,0),(u,0,0)]`. The standard
  pairing exhibiting `S_ā` as the right dual of `S_a` is `ε_a = φ^{āa→u}_0` and
  `η_a = s_a⁻¹ • ψ^{aā→u}_0`.
- **Rotation.** `Ρ^{abc} : Matrix (Fin N_{ab}^c) (Fin N_{bc̄}^ā) R` is defined by
  `Ρ^{abc}[i,m] = s_ā⁻¹ Σ_{k : N_{āc}^b} F̄^{āab}_b[(c,i,k),(u,0,0)] · F̄^{ācc̄}_ā[(u,0,0),(b,k,m)]`.
  It is the matrix of
  `φ ↦ λ⁻¹ ≫ (η_ā ▷ (b ⊗ c̄)) ≫ (ā ◁ φ ▷ c̄) ≫ (ā ◁ ε_c̄) ≫ ρ` (associators suppressed), in the
  sense `φ_i ↦ Σ_m Ρ[i,m] φ^{bc̄→ā}_m`.
- **Double dual.** `D^{ab}_c := (s_ā s_b̄ s_c)/(s_a s_b s_c̄) · Ρ^{abc} Ρ^{bc̄ā} Ρ^{c̄ab̄}`. This is the
  matrix of `φ ↦ φᘁᘁ` on `Hom(a⊗b, c)`, with `(a⊗b)ᘁ = b̄⊗ā` paired by Mathlib's `ExactPairing.tensor`.

**Checks.** These fix the duality conventions.

- `ι = ℤ/2` with `N_{ab}^c = [a + b = c]` and `F^{111}_1 = ω ∈ {1, −1}`, all other entries `1`:
  `s_1 = ω`, `Ρ^{110} = Ρ^{101} = Ρ^{011} = 1`, `D^{11}_0 = 1`; the pivotal condition gives
  `t_1 = ±1`, and `leftDim (simple 1) = rightDim (simple 1) = ω t_1`, so both pivotal
  structures are spherical.
- `D^{aā}_u = 1` for every `a`, so the pivotal condition at `(a, ā, u)` is `t_a t_ā = 1`.
- Fibonacci (`ι = {1, τ}`, `N_{ττ}^1 = N_{ττ}^τ = 1`, unitary gauge over `ℚ(√5)`) has
  `s_τ = φ⁻¹`; its Galois conjugate, Yang–Lee, has `s_τ = −φ`. When `ā = a`, `s_a` is gauge
  invariant.
- Under the rescaling `φ^{āa→u} ↦ x_a φ^{āa→u}`, `φ^{aā→u} ↦ y_a φ^{aā→u}`, one has
  `s_a ↦ (x_a / y_a) s_a` and `D^{ab}_c ↦ (x_c y_a y_b)/(x_a x_b y_c) · D^{ab}_c`.

## Exact supplier contracts

### From Mathlib


- **Mathlib, structures and constructors:** `MonoidalCategory.ofTensorHom`, `Monoidal.induced`,
  `Monoidal.transport`, `BraidedCategory` (`hexagon_forward`, `hexagon_reverse`),
  `BraidedCategory.ofFaithful`, `Functor.Monoidal`, `Functor.Braided`, `Equivalence.IsMonoidal`.
- **Mathlib, linear structure:** `Preadditive`, `Linear`, `Functor.Linear`, `MonoidalPreadditive`,
  `MonoidalLinear`, `HasFiniteBiproducts`.
- **Mathlib, matrices and duals:** `CategoryTheory.Mat R` (morphisms `X ⟶ Y` are `Matrix X Y R`,
  with `f ≫ g = f * g`), `HomOrthogonal`, `HomOrthogonal.matrixDecomposition`, `ExactPairing`,
  `RigidCategory`, `rigidCategoryOfEquivalence`.
- **Mathlib, rigid structure:** `ExactPairing.tensor`, the exact pairing of `X₁ ⊗ X₂` with
  `Y₂ ⊗ Y₁`.

### From Tau Ceti

- From [PivotalSpherical](../PivotalSpherical/README.md), implemented:
  - semisimplicity and fusion coefficients: `TauCeti.IsFiniteSemisimpleCategory`,
    `TauCeti.SimpleClasses`, `TauCeti.fusionCoeff`, `TauCeti.SplitK0` with its ring structure;
  - pivotal structures and traces: `TauCeti.PivotalCategory`, `pivotalExactPairing`,
    `leftDim`, `rightDim`, `TauCeti.SphericalCategory`, `sphericalCategory_iff_leftDim_eq_rightDim`;
  - the torsor of pivotal structures over `Aut (LaxMonoidalFunctor.of (𝟭 C))`.
- `TauCeti.ExactPairing.biproduct` (`TauCeti/CategoryTheory/Monoidal/Rigid/Biproduct.lean`):
  exact pairings of finite biproducts, in a monoidal preadditive category.

### From PivotalSpherical, as targets

- Layer 3.3, *Split simple families*: the hypothesis `IsSplitSimpleFamily R S`, and for it the
  freeness of the Hom modules into and out of each member, the perfect composition pairing, dual
  bases `b.homDual`, and the completeness relation.
- Layer 8.1, `Vec^ω_G`: `VecTwisted R G ω` for a normalized 3-cocycle `ω` with values in `Rˣ`.

## How to read the build

Each layer has numbered subsections `k.n`, one per target group, in dependency order, each with
its *Needs:* clause, followed by worked Examples and the layer's Dependencies. `Suggested.lean`
gives the data of Layer 0 real bodies, with the equations above written out index by index, and
states extraction (2.2).

## Layer 0: the data

### 0.1 Fusion rules, F-symbols and R-symbols

- `TauCeti.FusionRules ι`: `unit`, `N : ι → ι → ι → ℕ`, and the unit laws.
- `TauCeti.FSymbols R N`: `F`, `Finv`, `F * Finv = 1`, `Finv * F = 1`, `pentagon`, `triangle`, with
  `ext`: two `FSymbols` with equal `F` are equal.
- `TauCeti.RSymbols P`: `R`, `Rinv`, the inverse laws, and the two hexagons, again with `ext` on `R`.

*Needs:* Mathlib `Matrix`.

### 0.2 Relabeling and base change

`FSymbols.reindex (σ : ι ≃ ι')` along `N`- and unit-preserving bijections, and base change
`FSymbols.map (f : R →+* S)`, for both structures. *Needs:* 0.1.

### 0.3 Consequences of invertibility

For nontrivial `R`: `N` is associative, `Σ_e N_{ab}^e N_{ec}^d = Σ_f N_{bc}^f N_{af}^d`, and
`N_{ab}^c = N_{ba}^c` when `RSymbols` exist. *Needs:* 0.1; Mathlib `Matrix.square_of_invertible`.

### Examples

- Over the zero ring every `FusionRules ι` carries exactly one `FSymbols` and one `RSymbols`,
  since every matrix identity holds there. On `ι = {u, x}`, the rules `x ⊗ x = u` and
  `x ⊗ x = u + x` both carry data over `0`, and both models have all Homs zero, so they are
  equivalent although no `σ` matches their `N`. This is the negative control for the
  `[Nontrivial R]` hypotheses of Layers 1 to 3.
- `ι = ℤ/2`, `N_{ab}^c = [a + b = c]`: `F^{111}_1 = ±1` (all other entries `1`) are the two
  F-symbols over `ℤ`. The hexagons at `a = b = c = 1` reduce to `(R^{11}_0)² = F^{111}_1`, so
  `F^{111}_1 = 1` has the two R-symbols `R^{11}_0 = ±1` over `ℤ`, and `F^{111}_1 = −1` has none
  over `ℤ` and two, `R^{11}_0 = ±i`, over `ℤ[i]`.
- The triangle forces `F^{ubc}_d = F^{abu}_d = 1` on the unit-indexed blocks (derived in 1.3).

### Dependencies

Mathlib `Matrix` only.

## Layer 1: the constructed category

### 1.1 The model

`FSymbols.Model P` has objects `ι → FintypeCat`, a finite basis set in each grade, and morphisms the
grade-wise morphisms of `Mat R`. It is `Preadditive` and `Linear R`, has finite biproducts, and is
essentially small. `Model.simple a` has a one-point basis in grade `a` and is empty elsewhere.
*Needs:* 0.1; Mathlib `CategoryTheory.Mat R`.

### 1.2 The monoidal structure

Tensor product `(X ⊗ Y)_c = Σ a b, X_a × Y_b × Fin N_{ab}^c`. `(α_ X Y Z).inv` at grade `d` has
entry `F^{abc}_d[(e,i,j),(f,k,l)]` from `(x, (y,z,k), l)` to `((x,y,i), z, j)`, and zero elsewhere;
`.hom` is built from `Finv` in the same way. **Main theorem:** `MonoidalCategory (Model P)` via
`MonoidalCategory.ofTensorHom`, with `MonoidalPreadditive` and `MonoidalLinear R`. *Needs:* 1.1;
Mathlib `MonoidalCategory.ofTensorHom`.

### 1.3 Standard bases, base change and the Grothendieck ring

The standard bases satisfy the composite rule, and `F^{ubc}_d = F^{abu}_d = 1` (the derived unit
triangles, [EGNO] Prop. 2.2.4, p. 24). `FSymbols.map f` induces an additive monoidal functor
`Model P ⥤ Model (P.map f)`. For nontrivial `R`, `SplitK0 (Model P)` is ring-isomorphic to
`ι →₀ ℤ` with structure constants `N`; over the zero ring it is `0`. *Needs:* 1.2, 0.2; Tau Ceti
`TauCeti.SplitK0`.

### Examples

- `End (Model.simple a) = R` and `Hom (Model.simple a) (Model.simple b) = 0` for `a ≠ b`.
- `Model.simple u ⊗ X ≅ X` naturally, with `λ` the identity matrix in the standard bases.
- For `ι = ℤ/2` and `F^{111}_1 = −1`, `(α_ s s s).inv` on `s = Model.simple 1` is `−1`, so
  `Model P` is the `R`-linear form of `Vec^ω_{ℤ/2}` with the nontrivial cocycle, restricted to
  objects free of finite rank in each degree.

### Dependencies

Layer 0; Mathlib `CategoryTheory.Mat R`, `MonoidalCategory.ofTensorHom`, `HasFiniteBiproducts`;
Tau Ceti `TauCeti.SplitK0`.

## Layer 2: extraction and reconstruction

### 2.1 Split simple families

The hypothesis on `S : ι → C` throughout is PivotalSpherical's `IsSplitSimpleFamily R S`: each
`S a` has endomorphisms `R`, `HomOrthogonal S`, and every object is a finite biproduct of members.
Its freeness, perfect-pairing, dual-basis and completeness results apply verbatim. `Model P` with
`Model.simple` satisfies it. *Needs:* 1.1; PivotalSpherical 3.3.

### 2.2 Extraction

Take `C` monoidal with `MonoidalPreadditive` and `MonoidalLinear R`, together with
`IsSplitSimpleFamily R S`, an isomorphism `e : 𝟙_ C ≅ S u` and a fusion basis normalized through
`e`. For nontrivial `R`, put `N_{ab}^c = Module.finrank R (S a ⊗ S b ⟶ S c)`. Then the left and
right families are bases, and there is exactly one `FSymbols R N` whose `F` expresses the left
family in the right family across the associator. *Needs:* 2.1.

### 2.3 Reconstruction and round trip

An `R`-linear monoidal equivalence `Model (extract C) ≌ C` sending `Model.simple a` to `S a`. For
nontrivial `R`, extracting from `Model P` with its standard basis returns `P`. *Needs:* 2.2, 1.2;
Mathlib `HomOrthogonal.matrixDecomposition`, `Monoidal.induced`.

### 2.4 Comparison with the abelian definitions

These need a field because PivotalSpherical's definitions are stated for abelian categories, and
`Model P` is not abelian over `ℤ` (`2 : simple u ⟶ simple u` is mono and epi but not an
isomorphism).

- For `[Abelian C]` and `S` injective on isomorphism classes, `IsSplitSimpleFamily k S` holds iff
  `IsFiniteSemisimpleCategory C`, `S` represents `SimpleClasses C` bijectively, and every simple has
  `finrank k End = 1`.
- `Model P` is abelian and finite semisimple, with `SimpleClasses (Model P) ≃ ι` and
  `fusionCoeff k = N`.

*Needs:* 2.1, 2.2; Tau Ceti `TauCeti.IsFiniteSemisimpleCategory`, `TauCeti.SimpleClasses`,
`TauCeti.fusionCoeff`.

### Examples

- The real two-dimensional rotation representation of `C₃` in `FDRep ℝ C₃` fails the scalar
  hypothesis, since its endomorphisms are `ℂ`.
- Over `ℤ`, `Model P` satisfies `IsSplitSimpleFamily ℤ Model.simple` but is not abelian.
- For `FDRep ℂ A₄` with its simples, extraction gives `N_{33}^3 = 2`.
- Over the zero ring with `ι = {u}`, `Module.finrank 0 (simple u ⊗ simple u ⟶ simple u) = 0` while
  `N_{uu}^u = 1`, which is why 2.2 and 2.3 carry `[Nontrivial R]`.

### Dependencies

Layers 0 and 1; PivotalSpherical Layer 3.3; Mathlib `HomOrthogonal.matrixDecomposition`,
`Monoidal.induced`.

## Layer 3: gauge equivalence and classification

### 3.1 The gauge group

The relabelings and normalized gauges form a group (a semidirect product) acting on
`FSymbols R N`, preserving the axioms. `Model P ≌ Model (g • P)` `R`-linearly and monoidally: the
identity on objects, with tensorator `g`. Changing the fusion basis by `g` changes the extracted
data by `g`. *Needs:* 1.2, 2.2.

### 3.2 Classification

For nontrivial `R`, `Model P` and `Model Q` are related by an `R`-linear monoidal equivalence iff
`Q = g • P.reindex σ`. The equivalence sends each simple to a simple: an object of a model whose
endomorphisms are `R` is isomorphic to exactly one `Model.simple`, and this defines `σ`. Linearity
is essential: the Fibonacci and Yang–Lee data over `ℚ(√5)` are Galois conjugate, related by a
semilinear monoidal equivalence but not gauge equivalent. *Needs:* 3.1, 2.3.

### 3.3 Automorphisms and autoequivalences

`Aut (LaxMonoidalFunctor.of (𝟭 (Model P)))` is isomorphic to
`{η : ι → Rˣ | η_c = η_a η_b whenever N_{ab}^c ≠ 0}`. Let `Stab P` be the stabilizer of `P` in the
gauge group, and for `η : ι → Rˣ` with `η_u = 1` let `(∂η)^{ab}_c = η_a η_b η_c⁻¹ • 1`. Then
`(σ, g) ↦` (relabel by `σ`, tensorator `g`) is a surjective group homomorphism onto the group of
`R`-linear monoidal autoequivalences of `Model P` up to monoidal natural isomorphism. For nontrivial
`R` its kernel is `{(id, ∂η)}`: these gauges come from natural automorphisms of the identity
functor and act trivially. Other gauges fixing `P` give nontrivial autoequivalences; for
`Vec^ω_G` they are the 2-cocycles. *Needs:* 3.2.

### 3.4 Comparison with `Vec^ω_G`

([EGNO] Ex. 2.3.8, p. 28; Prop. 2.6.1, p. 33.) For a finite group `G`, a commutative ring `R` and
a normalized 3-cocycle `ω : G → G → G → Rˣ`, take `N_{gh}^l = [gh = l]` and
`F^{ghl}_{ghl} = ω(g,h,l)⁻¹`. The resulting model is `R`-linearly monoidally equivalent to the full
subcategory of free objects of PivotalSpherical's `VecTwisted R G ω`, whose associator acts on
`(δ_g ⊗ δ_h) ⊗ δ_l` by `ω(g,h,l)`; over a field that subcategory is all of `VecTwisted`.
Cohomologous cocycles are gauge equivalent. *Needs:* 3.1; PivotalSpherical 8.1.

### Examples

- The zero-ring control of Layer 0: over `R = 0` the classification fails.
- Over `R = k × k`, an object of a model with `End = R` is still a single `Model.simple`, since
  `rank End = Σ n_a² = 1`.
- Fibonacci and Yang–Lee over `ℚ(√5)` have `s_τ = φ⁻¹` and `s_τ = −φ`. Since `s_τ` is gauge
  invariant, they are not gauge equivalent.
- For `ι = ℤ/2` with `F = 1` over `ℤ`, the gauge with `g^{11}_0 = −1` fixes `P` and is not of the
  form `∂η` (which has `(∂η)^{11}_0 = η_1² = 1`), so it gives a nontrivial autoequivalence.

### Dependencies

Layers 1 and 2; PivotalSpherical Layer 8.1.

## Layer 4: braidings

### 4.1 Braidings from R-symbols

**Main theorem:** `RSymbols P` gives `BraidedCategory (Model P)`, where `(β_ X Y).inv` at grade `c`
has entry `R^{ab}_c[i,j]` from `(y,x,j)` to `(x,y,i)`. *Needs:* 1.2; Mathlib `BraidedCategory`.

### 4.2 Extraction of R-symbols

A braiding on `C` as in 2.2 gives exactly one `RSymbols` of the extracted `P`, expressing each
fusion basis in the braided one; reconstruction is braided, and `R^{au}_a = R^{ua}_a = 1` is
derived. *Needs:* 4.1, 2.3.

### 4.3 Gauge and classification

`Model P ≌ Model (g • P)` is braided. The classification and autoequivalence statements of Layer 3
hold for braided `R`-linear equivalences with `(P, R)` in place of `P`; the kernel is again
`{(id, ∂η)}`. *Needs:* 4.1, 3.3.

### Examples

- For `ι = ℤ/2` and `F = 1`, the two R-symbols `R^{11}_0 = ±1` give the symmetric categories of
  `ℤ/2`-graded and of super modules over the base ring that are free of finite rank in each degree.
- For `F^{111}_1 = −1` over `ℤ[i]`, `R^{11}_0 = ±i` give the two semion braidings, which are not
  symmetric: `(R^{11}_0)² = −1`.
- `R^{au}_a = R^{ua}_a = 1` for every `RSymbols`.

### Dependencies

Layers 1 and 3; 4.2 also needs Layer 2; Mathlib `BraidedCategory`.

## Layer 5: rigidity

### 5.1 The criterion

Suppose `N_{āa}^u = N_{aā}^u = 1`. `ExactPairing (simple a) (simple ā)` exists in `Model P` iff
`s_a` is a unit, and then `(ε_a, η_a)` from the conventions is such a pairing: its zigzag scalars
are `s_a` before the rescaling of `η_a`. *Needs:* 1.2.

### 5.2 Rigidity

`RigidCategory (Model P)`, given an involution `a ↦ ā` satisfying the criterion, by
`TauCeti.ExactPairing.biproduct` applied to the standard pairings of the simples. The right dual of
each simple is chosen to be the standard pairing. *Needs:* 5.1; Tau Ceti
`TauCeti.ExactPairing.biproduct`.

### 5.3 The converse

`C` as in 2.2 is rigid iff its extracted data admits such an involution. Over a field this is the
uniqueness of duals of simples ([EGNO] Prop. 4.8.1, p. 76); the ring statement is this roadmap's
own. *Needs:* 5.2, 2.3.

### Examples

- For `ι = ℤ/2`, `ā = a` and `s_1 = (F^{111}_1)⁻¹ = F^{111}_1 = ±1`, so both F-symbols give rigid
  models over `ℤ`.
- Over the zero ring every model is rigid, and `s_a = 0` is a unit there.
- `ExactPairing (simple a) (simple ā)` with `ε' = x ε_a`, `η' = y ψ` closes iff `x y s_a = 1`.

### Dependencies

Layer 1; 5.3 also needs Layer 2; Tau Ceti `TauCeti.ExactPairing.biproduct`.

## Layer 6: pivotal and spherical structures

Take `Model P` rigid as in Layer 5, so that `(simple a)ᘁᘁ = simple a` and a pivotal isomorphism has
components `j_a = t_a • 𝟙` with `t_a ∈ Rˣ`.

### 6.1 Pivotal structures

([EGNO] Def. 4.7.7, p. 74.) `TauCeti.PivotalCategory (Model P)` structures correspond bijectively
to families `t : ι → Rˣ` with `t_a t_b • D^{ab}_c = t_c • 1` whenever `N_{ab}^c ≠ 0`. The
condition is monoidality of `j` on the basis morphisms `φ^{ab→c}_i`; `t_u = 1` and `t_a t_ā = 1`
follow from it; the action of `Aut (LaxMonoidalFunctor.of (𝟭 (Model P)))` from 3.3 is
`t ↦ η t`. *Needs:* 5.2, 3.3; Tau Ceti `TauCeti.PivotalCategory`,
`TauCeti.PivotalCategory.instTorsor`.

### 6.2 Dimensions

`leftDim (simple a) = (t_a s_ā)⁻¹` and `rightDim (simple a) = t_a s_a⁻¹`. On a general object the
dimensions are the corresponding sums over its basis. *Needs:* 6.1; Tau Ceti `TauCeti.leftDim`,
`TauCeti.rightDim`, `TauCeti.leftDim_biproduct`.

### 6.3 Spherical structures

([EGNO] Def. 4.7.14, p. 75.) `TauCeti.SphericalCategory (Model P)` iff `t_a² = s_a / s_ā` for
every `a`, over any nontrivial `R`. Over an algebraically closed field this agrees with
`TauCeti.sphericalCategory_iff_leftDim_eq_rightDim`. *Needs:* 6.2; Tau Ceti
`TauCeti.SphericalCategory`.

### Examples

The duality-convention Checks of the Conventions section, and:

- For `FDRep ℂ A₄` and for Yetter–Drinfeld modules over `S₃` with the canonical vector-space
  pivotal structure, the extracted `t_a` satisfy the pivotal condition, and both dimensions equal
  the vector-space dimension.
- Twisting a pivotal structure by `η ∈ Aut_⊗(𝟭)` multiplies `leftDim (simple a)` by `η_a⁻¹` and
  `rightDim (simple a)` by `η_a`, so their product is unchanged.

### Dependencies

Layers 3 and 5; Tau Ceti `TauCeti.PivotalCategory`, `TauCeti.leftDim`, `TauCeti.rightDim`,
`TauCeti.SphericalCategory`.

## Downstream consumers

- The proposed Ocneanu rigidity roadmap: Layers 1, 6, 7 and 8 there use `FSymbols`, `RSymbols`,
  `FSymbols.map`, `Model P`, the gauge group of 3.1 and the rigidity criterion of 5.1.

## References

- [EGNO] P. Etingof, S. Gelaki, D. Nikshych, V. Ostrik, *Tensor Categories*, AMS Mathematical
  Surveys and Monographs 205 (2015).
- [Kitaev] A. Kitaev, *Anyons in an exactly solved model and beyond*, Ann. Physics 321 (2006),
  Appendix E (arXiv:cond-mat/0506438v3).
