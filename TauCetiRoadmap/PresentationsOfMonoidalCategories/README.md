# Roadmap: presentations of monoidal categories

A linear monoidal category whose objects are finite direct sums of simple objects `S_a`, with
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

## Scope

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
  pivotal and spherical structures, and `Vec^ω_G`. It deliberately has no bundled fusion-category
  class, and neither does this roadmap. The models here instantiate its definitions (Layers 2, 3
  and 6).

## Conventions (pinned)

Write `u : ι` for the unit index. A **fusion basis** is a choice of bases `φ^{ab→c}_i`,
`i : Fin N_{ab}^c`, of `Hom(S_a ⊗ S_b, S_c)`. The direction is fusion (`a ⊗ b → c`), not splitting.
Normalization: `φ^{ua→a}_0 = λ_a` and `φ^{au→a}_0 = ρ_a`, through a fixed `𝟙_ C ≅ S_u`.
`ψ^{ab→c}_i : S_c ⟶ S_a ⊗ S_b` is the dual family, with `ψ_i ≫ φ_j = δ_{ij} • 𝟙`.

- **Index types.** `Left a b c d := Σ e, Fin N_{ab}^e × Fin N_{ec}^d` and
  `Right a b c d := Σ f, Fin N_{bc}^f × Fin N_{af}^d`. The left basis of `Hom((a⊗b)⊗c, d)` is
  `L_{(e,i,j)} = (φ^{ab→e}_i ▷ c) ≫ φ^{ec→d}_j`. The right basis of `Hom(a⊗(b⊗c), d)` is
  `R_{(f,k,l)} = (a ◁ φ^{bc→f}_k) ≫ φ^{af→d}_l`.
- **F.** `F^{abc}_d : Matrix (Left a b c d) (Right a b c d) R` is defined by
  `L_x = Σ_y F^{abc}_d[x,y] • ((α_ a b c).hom ≫ R_y)`. Without the associator suppressed this reads
  `φ^{ZW→T}_j ∘ (φ^{XY→Z}_i ⊗ 1) = Σ_{Z',k,l} F[(X,Y,W,T)][(Z,i,j),(Z',k,l)] φ^{XZ'→T}_l ∘ (1 ⊗ φ^{YW→Z'}_k) ∘ α`.
  `F̄^{abc}_d` is the inverse matrix, with rows `Right` and columns `Left`.
- **Composite rule.** The symbol `M(s)` of a structure isomorphism `s` is defined by
  `source basis = M(s) · (s ≫ target basis)`. Then `M(s₁ ≫ s₂) = M(s₁) M(s₂)`, and whiskering by an
  identity acts as the identity on the untouched indices. The equations below are this rule applied
  to Mathlib's `MonoidalCategory.pentagon`, `BraidedCategory.hexagon_forward` and
  `BraidedCategory.hexagon_reverse`.
- **Pentagon.** For all objects `A B C D E` and indices `i₁ : N_{AB}^p`, `i₂ : N_{pC}^q`,
  `i₃ : N_{qD}^E`, `k : N_{CD}^r`, `m : N_{Br}^s`, `n : N_{As}^E`:
  `Σ_{l : N_{pr}^E} F^{pCD}_E[(q,i₂,i₃),(r,k,l)] · F^{ABr}_E[(p,i₁,l),(s,m,n)]`
  `= Σ_{t, x : N_{BC}^t, y : N_{At}^q, z : N_{tD}^s} F^{ABC}_q[(p,i₁,i₂),(t,x,y)] · F^{AtD}_E[(q,y,i₃),(s,z,n)] · F^{BCD}_s[(t,x,z),(r,k,m)]`.
  The left side is `α_{AB,C,D} ≫ α_{A,B,CD}`, and the right side is
  `(α_{A,B,C} ▷ D) ≫ α_{A,BC,D} ≫ (A ◁ α_{B,C,D})`.
- **Unit.** `N_{ua}^b = N_{au}^b = if a = b then 1 else 0`, and (triangle)
  `F^{auc}_d[(a,0,j),(c,0,l)] = if j = l then 1 else 0`. These are the only unit conditions imposed.
- **R.** `R^{ab}_c : Matrix (Fin N_{ab}^c) (Fin N_{ba}^c) R` is defined by
  `φ^{ab→c}_i = Σ_j R^{ab}_c[i,j] • ((β_ a b).hom ≫ φ^{ba→c}_j)`. This is the same direction as `F`.
- **Hexagons.**
  - `hexagon_forward`: for `(e,i,j) : Left a b c d`, `n : N_{ca}^g` and `o : N_{bg}^d`,
    `Σ_{f,k,l,m} F^{abc}_d[(e,i,j),(f,k,l)] R^{af}_d[l,m] F^{bca}_d[(f,k,m),(g,n,o)] = Σ_{p,q} R^{ab}_e[i,p] F^{bac}_d[(e,p,j),(g,q,o)] R^{ac}_g[q,n]`.
  - `hexagon_reverse`: for `(f,k,l) : Right a b c d`, `n : N_{ca}^g` and `o : N_{gb}^d`,
    `Σ_{e,i,j,m} F̄^{abc}_d[(f,k,l),(e,i,j)] R^{ec}_d[j,m] F̄^{cab}_d[(e,i,m),(g,n,o)] = Σ_{p,q} R^{bc}_f[k,p] F̄^{acb}_d[(f,p,l),(g,q,o)] R^{ac}_g[q,n]`.
- **Gauge.** A normalized gauge `g` is a family of units `g^{ab}_c` of
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
  matrix of `φ ↦ φᘁᘁ` on `Hom(a⊗b, c)`, with `(a⊗b)ᘁ = b̄⊗ā` paired by `ExactPairing.tensorOf`.

## What Mathlib and Tau Ceti already have (consume)

- **Mathlib, structures and constructors:** `MonoidalCategory.ofTensorHom`, `Monoidal.induced`,
  `Monoidal.transport`, `BraidedCategory` (`hexagon_forward`, `hexagon_reverse`),
  `BraidedCategory.ofFaithful`, `Functor.Monoidal`, `Functor.Braided`, `Equivalence.IsMonoidal`.
- **Mathlib, linear structure:** `Preadditive`, `Linear`, `Functor.Linear`, `MonoidalPreadditive`,
  `MonoidalLinear`, `HasFiniteBiproducts`.
- **Mathlib, matrices and duals:** `CategoryTheory.Mat R` (morphisms `X ⟶ Y` are `Matrix X Y R`,
  with `f ≫ g = f * g`), `HomOrthogonal`, `HomOrthogonal.matrixDecomposition`, `ExactPairing`,
  `RigidCategory`, `rigidCategoryOfEquivalence`.
- **Tau Ceti, from [PivotalSpherical](../PivotalSpherical/README.md):**
  - semisimplicity and fusion coefficients: `TauCeti.IsFiniteSemisimpleCategory`,
    `TauCeti.SimpleClasses`, `TauCeti.fusionCoeff`, `TauCeti.SplitK0` with its ring structure;
  - dual bases over a field: `homDual`, `sum_sum_homDual_comp_eq_id`;
  - pivotal structures and traces: `TauCeti.PivotalCategory`, `pivotalExactPairing`,
    `leftDim`, `rightDim`, `TauCeti.SphericalCategory`;
  - the torsor of pivotal structures over `Aut (LaxMonoidalFunctor.of (𝟭 C))`;
  - `TauCeti.VecTwisted k G c`, built from `TauCeti.TwistedGradedObject`.

## The build, in layers

### Layer 0: the data

- `TauCeti.FusionRules ι`: `unit`, `N : ι → ι → ι → ℕ`, and the unit laws.
- `TauCeti.FSymbols R N`: `F`, `Finv`, `F * Finv = 1`, `Finv * F = 1`, `pentagon`, `triangle`.
  - `ext`: two `FSymbols` with equal `F` are equal.
- `TauCeti.RSymbols P`: `R`, `Rinv`, the inverse laws, and the two hexagons, again with `ext`
  on `R`.
- Relabeling `FSymbols.reindex (σ : ι ≃ ι')` along `N`- and unit-preserving bijections, and base
  change `FSymbols.map (f : R →+* S)`, for both structures.
- For nontrivial `R`, two consequences of invertibility:
  - `N` is associative: `Σ_e N_{ab}^e N_{ec}^d = Σ_f N_{bc}^f N_{af}^d`;
  - `N_{ab}^c = N_{ba}^c` when `RSymbols` exist.

### Layer 1: the constructed category

- **The model.** `FSymbols.Model P` has objects `ι → FintypeCat`, a finite basis set in each
  grade, and morphisms the grade-wise morphisms of `Mat R`.
  - It is `Preadditive` and `Linear R`, has finite biproducts, and is essentially small.
  - `Model.simple a` has a one-point basis in grade `a` and is empty elsewhere.
- **Tensor product:** `(X ⊗ Y)_c = Σ a b, X_a × Y_b × Fin N_{ab}^c`.
  - `(α_ X Y Z).inv` at grade `d` has entry `F^{abc}_d[(e,i,j),(f,k,l)]` from `(x, (y,z,k), l)` to
    `((x,y,i), z, j)`, and zero elsewhere.
  - `.hom` is built from `Finv` in the same way.
- **Main theorem:** `MonoidalCategory (Model P)` via `MonoidalCategory.ofTensorHom`, together with
  `MonoidalPreadditive` and `MonoidalLinear R`.
- The standard bases satisfy the composite rule, and `F^{ubc}_d = F^{abu}_d = 1`.
- `FSymbols.map f` induces an additive monoidal functor `Model P ⥤ Model (P.map f)`.
- `SplitK0 (Model P)` is ring-isomorphic to `ι →₀ ℤ` with structure constants `N`.

### Layer 2: extraction and reconstruction

- `TauCeti.IsSplitSimpleBasis R S`, for nontrivial `R` and `S : ι → C` in an `R`-linear category
  with finite biproducts, holds when:
  - `r ↦ r • 𝟙 (S a)` is a bijection `R ≃ (S a ⟶ S a)` for each `a`;
  - `HomOrthogonal S`;
  - every object is isomorphic to `⨁ (S ∘ f)` for some finite `f`.
- **API** (the ring analogues of PivotalSpherical's `homDual` results):
  - `Hom(X, S_c)` and `Hom(S_c, X)` are free of finite rank;
  - composition `Hom(S_c, X) × Hom(X, S_c) → End(S_c) = R` is a perfect pairing, because under
    `X ≅ ⨁ (S ∘ f)` it becomes the dot product on `R^{f⁻¹(c)}`;
  - dual bases satisfy `Σ_{c,i} φ_i ≫ ψ_i = 𝟙_X`.
  - `Model P` with `Model.simple` satisfies `IsSplitSimpleBasis`.
- **Extraction.** Take `C` monoidal with `MonoidalPreadditive` and `MonoidalLinear R`, together
  with `IsSplitSimpleBasis R S`, an isomorphism `𝟙_ C ≅ S u` and a normalized fusion basis. Put
  `N_{ab}^c = Module.finrank R (S a ⊗ S b ⟶ S c)`. Then:
  - the left and right families are bases;
  - the `F` they define is an `FSymbols R N`.
- **Reconstruction:** an `R`-linear monoidal equivalence `Model (extract C) ≌ C` sending
  `Model.simple a` to `S a`.
- **Round trip:** extracting from `Model P` with its standard basis returns `P`.
- **Comparison with PivotalSpherical (over a field `k`):** these need a field because those
  definitions are stated for abelian categories, and `Model P` is not abelian over `ℤ`
  (`2 : simple u ⟶ simple u` is mono and epi but not an isomorphism).
  - For `[Abelian C]`, `IsSplitSimpleBasis k S` holds iff all of:
    - `IsFiniteSemisimpleCategory C`;
    - `S` represents `SimpleClasses C` bijectively;
    - every simple has `finrank k End = 1`.
  - `Model P` is abelian and finite semisimple, with `SimpleClasses (Model P) ≃ ι` and
    `fusionCoeff k = N`.

### Layer 3: gauge equivalence and classification

- **The gauge group.** The relabelings and normalized gauges form a group (a semidirect product)
  acting on `FSymbols R N`, preserving the axioms.
- **Gauge equivalence.** `Model P ≌ Model (g • P)` `R`-linearly and monoidally: the identity on
  objects, with tensorator `g`. Changing the fusion basis by `g` changes the extracted data by `g`.
- **Classification:** `Model P` and `Model Q` are related by an `R`-linear monoidal equivalence iff
  `Q = g • P.reindex σ`.
  - The equivalence sends each simple to a simple. Over a nontrivial ring, an object of a model
    whose endomorphisms are `R` is isomorphic to exactly one `Model.simple`, and this defines `σ`.
  - Linearity is essential: the Fibonacci and Yang-Lee data over `ℚ(√5)` are Galois conjugate. They
    are related by a semilinear monoidal equivalence but are not gauge equivalent.
- **Monoidal automorphisms of the identity:** `Aut (LaxMonoidalFunctor.of (𝟭 (Model P)))` is
  isomorphic to `{η : ι → Rˣ | η_c = η_a η_b whenever N_{ab}^c ≠ 0}`.
- **Autoequivalences:** let `Stab P` be the stabilizer of `P` in the gauge group, and for
  `η : ι → Rˣ` with `η_u = 1` let `(∂η)^{ab}_c = η_a η_b η_c⁻¹ • 1`. Then `(σ, g) ↦` (relabel by
  `σ`, tensorator `g`) is a surjective group homomorphism onto the group of `R`-linear monoidal
  autoequivalences of `Model P` up to monoidal natural isomorphism.
  - Its kernel is `{(id, ∂η)}`. These gauges come from natural automorphisms of the identity
    functor, and they act trivially.
  - Other gauges fixing `P` give nontrivial autoequivalences: for `Vec^ω_G` they are the
    2-cocycles.
- **Comparison with `Vec^ω_G`.** For a finite group `G` and a field `k`, take
  `N_{gh}^l = [gh = l]` and `F^{ghl}_{ghl} = ω(g,h,l)⁻¹`. The resulting model is `k`-linearly
  monoidally equivalent to `TauCeti.VecTwisted k G c`, whose associator acts on
  `(δ_g ⊗ δ_h) ⊗ δ_l` by `ω(g,h,l)`. Cohomologous cocycles are gauge equivalent.

### Layer 4: braidings

- **Main theorem:** `RSymbols P` gives `BraidedCategory (Model P)`, where `(β_ X Y).inv` at grade
  `c` has entry `R^{ab}_c[i,j]` from `(y,x,j)` to `(x,y,i)`.
- **Converse:** a braiding on `C` in Layer 2 gives `RSymbols (extract C)`, and reconstruction is
  braided. `R^{au}_a = R^{ua}_a = 1` is derived.
- **Gauge:** `Model P ≌ Model (g • P)` is braided. The classification and autoequivalence
  statements of Layer 3 hold for braided `R`-linear equivalences with `(P, R)` in place of `P`;
  the kernel is again `{(id, ∂η)}`.

### Layer 5: rigidity

- **Duals of biproducts:** in a monoidal preadditive category, a finite biproduct of objects with
  right (left) duals has a right (left) dual.
- **Criterion:** suppose `N_{āa}^u = N_{aā}^u = 1`.
  - `ExactPairing (simple a) (simple ā)` exists in `Model P` iff `s_a` is a unit.
  - Then `(ε_a, η_a)` from the conventions is such a pairing: its zigzag scalars are `s_a` before
    the rescaling of `η_a`.
- **Rigidity:** `RigidCategory (Model P)`, given an involution `a ↦ ā` satisfying the criterion.
  The right dual of each simple is chosen to be the standard pairing.
- **Converse:** `C` in Layer 2 is rigid iff its extracted data admits such an involution.

### Layer 6: pivotal and spherical structures

Take `Model P` rigid as in Layer 5, so that `(simple a)ᘁᘁ = simple a` and a pivotal isomorphism
has components `j_a = t_a • 𝟙` with `t_a ∈ Rˣ`.

- **Pivotal structures:** `TauCeti.PivotalCategory (Model P)` structures correspond bijectively to
  families `t : ι → Rˣ` with `t_a t_b • D^{ab}_c = t_c • 1` whenever `N_{ab}^c ≠ 0`.
  - The condition is monoidality of `j` on the basis morphisms `φ^{ab→c}_i`.
  - `t_u = 1` and `t_a t_ā = 1` follow from it.
  - The action of `Aut (LaxMonoidalFunctor.of (𝟭 (Model P)))` from Layer 3 is `t ↦ η t`.
- **Dimensions:** `leftDim (simple a) = (t_a s_ā)⁻¹` and `rightDim (simple a) = t_a s_a⁻¹`.
  On a general object, the dimensions are the corresponding sums over its basis.
- **Spherical:** `TauCeti.SphericalCategory (Model P)` iff `t_a² = s_a / s_ā` for every `a`, over
  any nontrivial `R`. Over an algebraically closed field this agrees with
  `sphericalCategory_iff_leftDim_eq_rightDim`.

## Ordering

- Layers 0 and 1 come first. The composite rule and the pentagon reduction are the core.
- Layer 2 needs Layer 1. Layer 3 needs Layers 1 and 2.
- Layer 4 runs alongside Layers 2 and 3.
- Layer 5 needs Layer 1. Layer 6 needs Layers 3 and 5.

## References

- P. Etingof, S. Gelaki, D. Nikshych, V. Ostrik, *Tensor Categories*, AMS Mathematical Surveys and
  Monographs 205 (2015).
- A. Kitaev, *Anyons in an exactly solved model and beyond*, Ann. Physics 321 (2006), Appendix E.
- P. Bonderson, *Non-Abelian anyons and interferometry*, PhD thesis, Caltech (2007).
- G. M. Kelly, *On MacLane's conditions for coherence of natural associativities, commutativities,
  etc.*, J. Algebra 1 (1964).
- A. Joyal, R. Street, *Braided tensor categories*, Adv. Math. 102 (1993).
