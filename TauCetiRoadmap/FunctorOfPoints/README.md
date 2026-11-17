# Roadmap: the functor of points

**Summary.** Make Tau Ceti a comfortable place to do algebraic geometry in functor-of-points
language without building a second theory of schemes. Mathlib's `AlgebraicGeometry.Scheme`
(a locally ringed space locally isomorphic to a prime spectrum) stays the only carrier of a
scheme. This roadmap adds functorial definitions on `(CommAlgCat R)ᵒᵖ` (Zariski and fpqc
topologies on affine test objects, open and closed subfunctors, local representability,
tangent spaces via dual numbers, infinitesimal and valuative lifting, moduli functors,
modules over a functor), and pairs every one of them with a comparison theorem that
identifies it with the corresponding Mathlib or Tau Ceti notion. The front door is a single
citable equivalence: schemes over `Spec R` are the locally representable Zariski sheaves on
`(CommAlgCat R)ᵒᵖ`.

## Scope and ownership

**This roadmap owns** the affine-test-object interface to scheme theory:

- the Zariski and fpqc topologies on `(CommAlgCat R)ᵒᵖ`, induced along Mathlib's `algSpec`,
  with their standard covering families (Layer 0); the fppf topology there is Tau Ceti's
  `TauCeti.CommAlgCat.fppfTopology` and is consumed;
- the type-valued points functor of a scheme over `Spec R` on `(CommAlgCat R)ᵒᵖ`, its
  full faithfulness, and its comparison with Tau Ceti's fppf `pointsSheaf` (Layer 0);
- open and closed subfunctors `D(I)`, `V(I)` and their dictionary with Mathlib's open
  subschemes, open immersions, ideal sheaves and closed immersions (Layer 1);
- the predicate *locally representable* and the equivalence of categories between schemes
  over `Spec R` and locally representable Zariski sheaves, with its absolute case
  `R = ℤ` (Layer 2);
- the tangent space `T_x F` of a functor via `A[ε]`, the tangent-bundle functor and its
  representing scheme, and the points form of formal smoothness, unramifiedness and
  étaleness (Layer 3);
- the points form of Mathlib's valuative criteria, and the discrete-valuation-ring
  refinement for morphisms of finite type over a locally Noetherian base (Layer 4);
- affine space, projective space and Grassmannians as functors on `(CommAlgCat R)ᵒᵖ`, with
  their Zariski-sheaf property, chart subfunctors and comparison with their representing
  schemes; the Weil restriction functor of a presheaf along a finite locally free algebra and
  its action on open and closed subfunctors (Layer 5);
- modules over a functor (compatible families of `A`-modules indexed by points), their
  comparison with quasi-coherent sheaves, their fpqc invariance in presheaf form, and the
  equivalence between quasi-coherent algebras over a functor and affine morphisms to it
  (Layer 6).

**Owned elsewhere and consumed here.** Each object below has one owner; this roadmap states
comparisons to it and never a second carrier.

- *Schemes, morphism classes, open and closed immersions, ideal sheaves, the big Zariski,
  étale, fppf and fpqc topologies on `Scheme`, `LocalRepresentability.isRepresentable`,
  valuative criteria, sheaves of modules, `tildeEquiv`, `comonadicExtendScalars`, descent
  data and `Pseudofunctor.IsStack`, the Grassmannian functor `Module.Grassmannian.functor`*:
  Mathlib (supplier contracts below).
- *Quasi-coherent sheaves `QuasicoherentSheaf X`, the pseudofunctor `Descent.qcohPseudofunctor`
  and the module pseudofunctor, affine and
  fpqc effective descent of affine morphisms, first-order thickenings, the Grassmannian scheme `Module.Grassmannian.scheme`,
  the affine Weil restriction `TauCeti.Algebra.WeilRestriction`, the closed Weil restriction
  `IdealSheafData.weilRestriction`, relative spectra and symmetric algebras, sheaves of
  differentials, the fppf affine site and `pointsSheaf`, the Hopf-algebra points functors*:
  Tau Ceti (supplier contracts below).
- *fpqc descent of quasi-coherent modules on schemes as a stack (`qcoh_fpqc_descent`),
  `smooth_iff_formallySmooth`, `etale_iff_formallyEtale`, the torsor of infinitesimal lifts,
  algebraic spaces and stacks, the big-site sheaves `𝔾_a`, `𝔾_m`, `μ_n`, deformation
  functors and Schlessinger's theorem, Hilbert and Quot schemes and the relative Grassmannian
  over a Noetherian base*: [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md)
  §§1.1, 1.3–1.22, 2.9, 4.1–4.6, 4.14.
- *Projective bundles `P(E)` with the quotient convention, `rankOneGrassmannComparison`,
  coherent Grassmannians and Plücker embeddings, relative Hom and Weil restriction over a
  general base*:
  [AlgebraicModuliForArithmeticGeometry](../AlgebraicModuliForArithmeticGeometry/README.md)
  §§1.1, 1.3, 3.4.
- *The relative Grassmannian of a finite locally free module and Weil restriction along finite
  locally free sources*: [ModularCurves](../ModularCurves/README.md) §§0F–0G.
- *Locally free sheaves, rank, determinant*:
  [AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md) Layers L0A–L1B.

**Cross-references, not dependencies.**
[ReductiveGroups](../ReductiveGroups/README.md) keeps three synchronized models of an affine
group (Hopf algebras, group objects over `Spec k`, the functor of points) and owns the Lie
algebra of an affine group scheme (its Layer 2) and the comodule description of
representations (its Layer 1). This roadmap's Layer 3 supplies the tangent space of an
arbitrary functor and arbitrary scheme; the identification of `T_e G` with the counit-derivation
Lie algebra stays in ReductiveGroups Layer 2. Nothing here depends on ReductiveGroups, and
ReductiveGroups needs nothing from here. Where both mention `𝔾_a`, `𝔾_m`, `μ_p` the checks
must agree.

**Outside this roadmap.** Algebraic spaces, stacks and their quasi-coherent modules
(SchemeAndStackFoundations Layer 1); formal schemes and formal moduli; derived and spectral
functors of points; representability theorems of Artin type; representability of Hilbert and
Quot functors (SchemeAndStackFoundations §4.14). The generic layer of this roadmap (a site with
a class of open subfunctors and a locally representable full subcategory) is instantiated for commutative semirings in the sense of Toën–Vaquié, "Au-dessous de
Spec ℤ"; that is the subject of the SemiringSchemes roadmap and is not a target here.

## Conventions

**Design principles.**

1. **Mathlib's `Scheme` is the ground truth.** No functorial definition replaces a Mathlib
   or Tau Ceti carrier. A functor-of-points object is either a presheaf or sheaf on
   `(CommAlgCat R)ᵒᵖ` that is *compared to* a scheme, or a predicate on such a presheaf that
   is *proved equivalent* to a Mathlib predicate on its representing scheme.
2. **Every functorial definition comes with a comparison theorem**, stated in the same file or
   the next one, in both directions where that makes sense: from the scheme side
   (`X ↦ pointsFunctor X`) and from the functor side (a representing scheme together with an
   isomorphism of functors). A definition without its comparison theorem is not a complete
   contribution.
3. **Work over a base ring `R` throughout.** Test objects are `CommAlgCat.{u} R`, with
   `R : Type u` a commutative ring. Schemes over `R` are objects of
   `Over (Spec (CommRingCat.of R))`, which is the codomain of Mathlib's `algSpec`. The absolute
   case is `R = ℤ`, reached through the equivalences of Layer 2.4; no absolute statement is
   proved separately when it is the case `R = ℤ` of a relative one.
4. **Universes.** Rings, algebras and schemes live in one universe `u`. Presheaves are
   `(CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u`: the points `Spec A ⟶ X` of a scheme `X : Scheme.{u}` form
   a `Type u`. Tau Ceti's `TauCeti.CommAlgCat.pointsSheaf` lifts its values to `Type (u + 1)`
   to meet fppf quotient sheaves; the comparison `pointsFunctor X ⋙ uliftFunctor ≅
   (pointsSheaf X).obj` is a Layer 0 target, and no other universe lift is introduced. The
   site `(CommAlgCat.{u} R)ᵒᵖ` is large; constructions that need small index categories (Kan
   extensions, sheafification) are either avoided by explicit formulas (the extension from
   affines to all schemes uses the small poset of affine opens of a scheme) or stated with
   the cardinality hypotheses Mathlib requires. Contributors must not change universes to
   make an instance fire.
Presheaf notation is on the affine site `Aff_R := (CommAlgCat R)ᵒᵖ`: a
   presheaf has type `Aff_Rᵒᵖ ⥤ Type u`. Thus its evaluation at the algebra `A` is
   `F.obj (op (op A))`, and an algebra map `φ` acts by `F.map φ.op.op`.
5. **Pinned sign and direction conventions.** `A[ε]` is Mathlib's `DualNumber A`, and
   `π_A : A[ε] → A` is `TrivSqZeroExt.fstHom` (`ε ↦ 0`). `ℙⁿ` uses the *quotient* convention:
   an `A`-point is a surjection `Aⁿ⁺¹ ↠ L` onto a projective `A`-module of rank one, up to
   isomorphism of `L`; equivalently a direct summand `N ⊆ Aⁿ⁺¹` with projective rank-one
   quotient, which is Mathlib's `Module.Grassmannian` with `k = 1`. This agrees with
   AlgebraicModuliForArithmeticGeometry §1.1 and Mathlib's `G(k, M; R)`
   (quotients of rank `k`).
6. **Use Mathlib's vocabulary.** Subfunctors are `CategoryTheory.Subfunctor` (or monomorphisms
   of presheaves where the API is better); representability is `Functor.RepresentableBy` and
   `Functor.IsRepresentable`; relative representability is `Functor.relativelyRepresentable`
   and `MorphismProperty.presheaf`; sheaves are `Sheaf J (Type u)`.

**Naming.** New declarations go in namespace `TauCeti.CommAlgCat` for site-level material,
`TauCeti.FunctorOfPoints` for predicates on presheaves, and in the namespace of the compared
Mathlib object for comparison theorems (for example `AlgebraicGeometry.IsOpenImmersion.…`).
Files go under `TauCeti/AlgebraicGeometry/FunctorOfPoints/`.

## Supplier interfaces and ownership

The existing interfaces used by the Lean prototype are Mathlib's `algSpec`, `yoneda`,
`GrothendieckTopology`, `Sheaf`, `Subfunctor`, `Functor.IsRepresentable`, scheme open
immersions and affine-space points, together with Tau Ceti's
`TauCeti.CommAlgCat.fppfTopology` and `pointsSheaf`
(`TauCeti/Algebra/Category/CommAlgCat/Fppf.lean`). The latter is a sheaf valued in
`Type (u + 1)`; its underlying presheaf is the restriction of the Yoneda presheaf of a
scheme, followed by `uliftFunctor`.

For the later comparisons consume Tau Ceti's quasi-coherent sheaves and their affine
identification (`AlgebraicGeometry/Modules/Quasicoherent/{Basic,Affine}.lean`), module
gluing, Grassmannian points, relative spectra, and sheaves of differentials. The formal
smoothness and formal étaleness of scheme morphisms are supplied by
[SchemeAndStackFoundations §4.1](../SchemeAndStackFoundations/README.md);
use its predicates and comparison theorems wherever these are not already in Tau Ceti.
They are not prerequisites to the affine-site foundation.

The ordinary module families of Layer 6 are distinct from derived quasi-coherent complexes
on space-valued or animated prestacks. The latter are covered by
[the QuasicoherentSheavesOnPrestacks proposal](https://github.com/TauCetiProject/TauCetiRoadmap/pull/2450),
which is a scope reference, not a dependency of this roadmap. Scheme-level fpqc descent
has the single owner SchemeAndStackFoundations §1.1; §6.4 transports that result rather
than requesting a second independent proof.

## How to read the build

Layer 0 (sites and points) precedes everything. Layer 1 (subfunctors) precedes Layer 2 (the
front door). Layers 3, 4 and 5 depend on Layers 0–2 and are independent of each other.
Layer 6 depends on Layers 0–2 and, for §6.6, on §3.1b's relative-spectrum interface. Within
each layer the numbered sections are in build order. Difficulty is marked
**[easy]** (a few hundred lines, direct from the supplier API), **[medium]** (requires a
gluing or descent argument), **[hard]** (a multi-file development).

## Layer 0: affine test sites and the points functor

### 0.1 The Zariski and fpqc topologies on `(CommAlgCat R)ᵒᵖ` **[easy]**

Define, exactly as Tau Ceti's `fppfTopology`,

```lean
noncomputable def TauCeti.CommAlgCat.zariskiTopology (R : Type u) [CommRing R] :
    GrothendieckTopology (CommAlgCat.{u} R)ᵒᵖ :=
  (algSpec (CommRingCat.of R)).inducedTopology
    (Scheme.zariskiTopology.over (Spec (CommRingCat.of R)))

noncomputable def TauCeti.CommAlgCat.fpqcTopology (R : Type u) [CommRing R] :
    GrothendieckTopology (CommAlgCat.{u} R)ᵒᵖ :=
  (algSpec (CommRingCat.of R)).inducedTopology
    (Scheme.fpqcTopology.over (Spec (CommRingCat.of R)))
```

with `zariskiTopology_def`, `fpqcTopology_def`, `Subcanonical` instances, `isContinuous_algSpec`
and `isCoverDense_algSpec` for both (the cover-density proof is the one in `Fppf.lean`, which
only uses Zariski covers). Prove the comparison
`zariskiTopology R ≤ fppfTopology R ≤ fpqcTopology R`.

Prove the **standard covers**:

- `generate_away_mem_zariskiTopology`: for `A : CommAlgCat R` and a finite family
  `f : ι → A` with `Ideal.span (Set.range f) = ⊤`, the sieve generated by the localizations
  `A ⟶ A_{f i}` covers `A`; and every Zariski covering sieve of `A` contains such a family
  (`exists_away_of_mem_zariskiTopology`).
- `generate_faithfullyFlat_mem_fpqcTopology`: for a finite family `A ⟶ B i` of flat maps with
  `A ⟶ ∏ B i` faithfully flat, the generated sieve covers; and every fpqc covering sieve of `A`
  contains such a family.

A presheaf `F` on `(CommAlgCat R)ᵒᵖ` is a Zariski sheaf iff it sends finite products to
products and is a sheaf for every standard cover (`isSheaf_zariskiTopology_iff`); it is an fpqc
sheaf iff it is a Zariski sheaf and `F(A) → F(B) ⇉ F(B ⊗_A B)` is an equalizer for every
faithfully flat `A → B` (`isSheaf_fpqcTopology_iff`; [Stacks 03O1](https://stacks.math.columbia.edu/tag/03O1)
for the scheme form).
*Needs:* Mathlib `inducedTopology`, `Scheme.zariskiTopology`, `Scheme.fpqcTopology`,
`algSpec.fullyFaithful`; Tau Ceti `Fppf.lean`.

**Checks.**
- `R × R` is Zariski-covered by its two factors, which are its localizations at the
  idempotents `(1, 0)` and `(0, 1)`.
- The zero algebra is covered by the empty family.
- `ℤ → ℚ` is flat but not faithfully flat, so `{ℤ → ℚ}` is not an fpqc cover; nor is
  `{ℤ → ℚ, ℤ → ℤ_p}`, whose spectra miss every prime other than `p` and `0`; while
  `{ℤ → ℤ[1/p], ℤ → ℤ_(p)}` is an fpqc cover that is not a Zariski cover.

### 0.2 The points functor **[easy]**

```lean
noncomputable def TauCeti.CommAlgCat.pointsFunctor :
    Over (Spec (CommRingCat.of R)) ⥤ ((CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u) :=
  yoneda ⋙ (Functor.whiskeringLeft _ _ _).obj (algSpec (CommRingCat.of R)).op
```

`(pointsFunctor X).obj (op (op A))` is `algSpec A ⟶ X`, the morphisms `Spec A ⟶ X` over `Spec R`.
Prove: `pointsFunctor_obj_isSheaf` for `zariskiTopology`, `fppfTopology`, `fpqcTopology`
(from subcanonicity of Mathlib's topologies and `isContinuous_algSpec`);
`pointsFunctorUliftIso : pointsFunctor X ⋙ uliftFunctor ≅ (pointsSheaf X).obj`;
`pointsFunctor_full`, `pointsFunctor_faithful` (a morphism of schemes over `Spec R` is
determined by, and can be glued from, its restrictions to affine opens; Mathlib
`Scheme.Cover`, `Scheme.Hom.ext` on covers); `pointsFunctor_preservesLimits` (limits in
`Over (Spec R)` go to pointwise limits). For `X = algSpec B`, `pointsFunctor (algSpec B) ≅
yoneda.obj (op B)` naturally in `B`, so `(pointsFunctor (algSpec B)).obj (op (op A)) ≃ (B →ₐ[R] A)`
(`pointsFunctorAlgSpecIso`, `pointsFunctorAlgSpecEquiv`). For a commutative Hopf algebra `H`,
compose with `HopfAlgebra.pointsPresheaf` to identify the type-valued points of `Spec H` with
the carrier of Tau Ceti's convolution points (`pointsFunctorHopfIso`).

*Needs:* §0.1; Mathlib `algSpec`, `Over`, `yoneda`; Tau Ceti `pointsSheaf`,
`HopfAlgebra.pointsPresheaf`.

**Checks.**
- `(pointsFunctor (𝔸(Fin n; Spec R))).obj (op (op A)) ≃ (Fin n → A)` naturally (Mathlib
  `AffineSpace.homOverEquiv`).
- The empty scheme has no points over any nonzero `A`, and one point over the zero algebra.
- For `X = Spec R ⊔ Spec R`, `X(A)` is the set of idempotents of `A`, not a two-element set:
  if `R` has no nontrivial idempotents, `X(R × R)` has four elements.

### 0.3 Restriction to affines is an equivalence of sheaf categories **[medium]**

Let `ι_R := algSpec (CommRingCat.of R)`. Prove

```lean
noncomputable def TauCeti.CommAlgCat.zariskiSheafEquiv (R : Type u) [CommRing R] :
    Sheaf (Scheme.zariskiTopology.over (Spec (CommRingCat.of R))) (Type u) ≌
      Sheaf (zariskiTopology R) (Type u)
```

whose functor is restriction along `ι_R` (Mathlib's `Functor.sheafPushforwardContinuous`)
and whose inverse sends `F` to `X ↦ lim_{U ∈ X.affineOpens} F(Γ(X, U))`, the limit taken over the
small poset of affine opens of `X`. State the same for `fpqcTopology` and `fppfTopology`
(`fpqcSheafEquiv`, `fppfSheafEquiv`). If Mathlib's `Functor.IsDenseSubsite.sheafEquiv` applies
at these universes, use it and record the hypotheses it needed; if it does not, the explicit
inverse above is the construction. Prove that `zariskiSheafEquiv.functor` applied to the
Yoneda sheaf of `X` is `pointsFunctor X` (`zariskiSheafEquiv_yoneda`).
*Needs:* §§0.1–0.2; Mathlib `Functor.sheafPushforwardContinuous`, `Scheme.affineOpens`.

**Checks.**
- The equivalence sends the terminal sheaf to the terminal sheaf.
- For `X` non-quasi-compact (an infinite disjoint union of `Spec R`), the limit formula is an
  infinite product and agrees with `X ⟶ X'` computed in `Scheme`.

## Layer 1: open and closed subfunctors

Fix a presheaf `F : (CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u` and a subfunctor `G : Subfunctor F`.
For `A`, an ideal `I ⊆ A`, and `φ : A ⟶ B`, write `φ_* I` for the ideal of `B` generated by
`φ(I)`.

### 1.1 The affine subfunctors `V(I)` and `D(I)` **[easy]**

```lean
def TauCeti.FunctorOfPoints.closedSubfunctor (A : CommAlgCat.{u} R) (I : Ideal A) :
    Subfunctor (yoneda.obj (op A)) -- B ↦ {φ : A ⟶ B | ∀ a ∈ I, φ a = 0}
def TauCeti.FunctorOfPoints.openSubfunctor (A : CommAlgCat.{u} R) (I : Ideal A) :
    Subfunctor (yoneda.obj (op A)) -- B ↦ {φ : A ⟶ B | Ideal.map φ I = ⊤}
```

stated on `(CommAlgCat R)ᵒᵖ` through `yoneda.obj (op A)`. Prove:

- `closedSubfunctor_iso`: `V(I)` is represented by `A ⧸ I`, and under `pointsFunctorAlgSpecIso`
  its inclusion is `pointsFunctor` of `Spec (A ⧸ I) ⟶ Spec A`, a closed immersion
  (`IsClosedImmersion.spec_of_surjective`).
- `openSubfunctor_eq_pointsFunctor_opens`: `D(I)` is the subfunctor of points factoring through
  the open subscheme `(PrimeSpectrum.zeroLocus I)ᶜ` of `Spec A`. For `I = (f)` it is represented
  by `A_f`.
- Lattice laws: `V(I) ⊓ V(J) = V(I ⊔ J)`; the presheaf union `V(I) ∪ V(J)` is contained in
  `V(I ⊓ J) ⊆ V(I * J)` and is in general not closed, even after Zariski sheafification, and
  the join of `V(I)` and `V(J)` among closed subfunctors is `V(I ⊓ J)`; `D(I) ⊓ D(J) = D(I * J)`, `D(I ⊔ J)` is the Zariski-sheaf union of
  `D(I)` and `D(J)`, `D(⊤) = ⊤`, `V(⊤) = ⊥` on nonzero `B`, `D(I) = D(J)` iff
  `I.radical = J.radical` (`openSubfunctor_eq_iff`), whereas `V(I) = V(J)` iff `I = J`
  (`closedSubfunctor_eq_iff`).
- Base change: for `ψ : A ⟶ A'`, the pullback of `V(I)` (resp. `D(I)`) along
  `yoneda.map ψ.op` is `V(ψ_* I)` (resp. `D(ψ_* I)`).

*Needs:* Mathlib `Ideal.map`, `PrimeSpectrum.zeroLocus`, `IsClosedImmersion.spec_of_surjective`,
`Scheme.Opens`.

**Checks.**
- On `k[x, y]`, the quotient point `k[x,y] → k[x,y]/(xy)` lies in `V(xy)` but in neither
  `V(x)` nor `V(y)`, and not Zariski-locally either: after localizing at the origin neither
  `x` nor `y` becomes zero. The join among closed subfunctors is the scheme-theoretic union; the pointwise union need not be closed.
- `D(x) = D(x²)` but `V(x) ≠ V(x²)` on `k[x]`: open subfunctors see radicals, closed ones do
  not.
- `D(I)` for `I = (2, x) ⊆ ℤ[x]` is not representable (the complement of a closed point of a
  two-dimensional regular scheme is not affine), but is covered by `D(2)` and `D(x)`.

### 1.2 Open and closed subfunctors of a general functor **[easy]**

```lean
def TauCeti.FunctorOfPoints.IsOpenSubfunctor {F : (CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u}
    (G : Subfunctor F) : Prop :=
  ∀ (A : CommAlgCat.{u} R) (x : F.obj (op (op A))), ∃ I : Ideal A,
    ∀ (B : CommAlgCat.{u} R) (φ : A ⟶ B), F.map φ.op.op x ∈ G.obj (op (op B)) ↔ Ideal.map φ.hom.toRingHom I = ⊤
def TauCeti.FunctorOfPoints.IsClosedSubfunctor … -- same with `∀ a ∈ I, φ a = 0`
```

(Demazure–Gabriel I.1.3.6, I.2.4.1; Jantzen I.1.7, I.1.12). Prove
`isOpenSubfunctor_iff`: `G` is open iff its inclusion satisfies the presheaf form of
`IsOpenImmersion` after every pullback along `yoneda.obj (op A) ⟶ F` (the pullback is
`D(I)`); the same for closed and `IsClosedImmersion`. Prove stability under pullback, finite
intersection and composition, that an open subfunctor of an open subfunctor is open, and that
for a Zariski sheaf `F` the Zariski-sheaf union of open subfunctors is open.
*Needs:* §1.1; Mathlib `MorphismProperty.presheaf`, `Functor.relativelyRepresentable`.

**Checks.**
- The subfunctor `A ↦ Aˣ` of `A ↦ A` is open (`I = (t)` at the universal point); the subfunctor
  `A ↦ {0}` is closed; the subfunctor `A ↦ nilradical A` is neither (it is not of the form
  `V(I)` or `D(I)` at the universal point `t`).
- For `F` the points functor of `Spec R ⊔ Spec R`, the two component subfunctors are open and closed; over disconnected test algebras their union is interpreted locally.

### 1.3 The dictionary with Mathlib immersions **[medium]**

For `X : Over (Spec R)`:

- `opensEquivOpenSubfunctor : X.left.Opens ≃o {G : Subfunctor (pointsFunctor X) // IsOpenSubfunctor G}`,
  `U ↦ (x ↦ x factors through U)`. The order isomorphism sends unions to Zariski-sheaf unions.
- `idealSheafEquivClosedSubfunctor : X.left.IdealSheafData ≃o
  {G : Subfunctor (pointsFunctor X) // IsClosedSubfunctor G}ᵒᵈ`,
  `I ↦ (x ↦ x factors through I.subschemeι)`.
- `IsOpenImmersion.iff_pointsFunctor`: for `f : Y ⟶ X` over `Spec R`, `f` is an open immersion
  iff `pointsFunctor.map f` is componentwise injective with image an open subfunctor; the same for
  `IsClosedImmersion` and closed subfunctors. In an isomorphism formulation, the composite
  of the isomorphism with the subfunctor inclusion must equal `pointsFunctor.map f`;
  an abstract isomorphism of its source with a subfunctor is insufficient.
- **Open covers.** A family `U : ι → X.left.Opens` covers `X` iff the corresponding open
  subfunctors are *Zariski-jointly surjective*: for every `x ∈ X(A)` there is a standard
  cover `A ⟶ A_{f j}` such that each restriction of `x` lies in some `U i`
  (`iSup_eq_top_iff_jointlySurjective`). Over a field-valued point this is pointwise
  surjectivity; over a general `A` it is not (check below).

*Needs:* §§1.1–1.2; Mathlib `Scheme.Opens`, `IdealSheafData`, `IsOpenImmersion`,
`IsClosedImmersion`; Tau Ceti `IsoLocus`, `Immersion` (`Morphisms/`).

**Checks.**
- `ℙ¹` is covered by the charts `U₀, U₁` (§5.3). For `A = k[x]`, the `A`-point given by the
  quotient `A² ↠ A`, `e₀ ↦ x`, `e₁ ↦ 1 − x` lies in neither `U₀(A)` nor `U₁(A)`, since neither
  `x` nor `1 − x` is a unit; its restrictions to `A_x` and `A_{1−x}`, which cover `A`, lie in
  `U₀` and `U₁`. Pointwise surjectivity on `A`-points fails; Zariski-local surjectivity holds.
- The closed subfunctor of `𝔸¹` given by `V(t²)` is not reduced and differs from `V(t)`;
  the dictionary is with ideal sheaves, not closed subsets.

## Layer 2: the front door

### 2.1 Locally representable functors **[easy]**

```lean
/-- `F` is a Zariski sheaf with an open cover by representable subfunctors. -/
structure TauCeti.FunctorOfPoints.IsLocallyRepresentable
    (F : (CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u) : Prop where
  isSheaf : Presheaf.IsSheaf (CommAlgCat.zariskiTopology R) F
  exists_cover : ∃ (ι : Type u) (U : ι → Subfunctor F),
    (∀ i, IsOpenSubfunctor (U i)) ∧ (∀ i, (U i).toFunctor.IsRepresentable) ∧
      JointlySurjectiveZariski U
```

with `JointlySurjectiveZariski` the condition of §1.3, defined once and shared. The
representable pieces are affine schemes over `R` (represented by `R`-algebras); this is
Demazure–Gabriel I.1.3.11 and Eisenbud–Harris Theorem VI-14. Define the full subcategory

```lean
abbrev TauCeti.FunctorOfPoints.LocallyRepresentable (R : Type u) [CommRing R] :=
  ObjectProperty.FullSubcategory fun F : Sheaf (CommAlgCat.zariskiTopology R) (Type u) =>
    IsLocallyRepresentable F.obj
```

### 2.2 Schemes are locally representable functors **[medium]**

```lean
noncomputable def TauCeti.FunctorOfPoints.schemeEquiv (R : Type u) [CommRing R] :
    Over (Spec (CommRingCat.of R)) ≌ LocallyRepresentable R
```

whose functor is `pointsFunctor` (with §0.2's sheaf property) and whose inverse assigns a
representing scheme. Proof: full faithfulness is §0.2. Essential surjectivity: transport `F`
along `zariskiSheafEquiv.inverse` (§0.3) to a Zariski sheaf on `Over (Spec R)`, push forward
along `Over.forget` to `Scheme`, check that the open representable subfunctors give
morphisms satisfying `IsOpenImmersion.presheaf` (§1.2) that are jointly locally surjective
(§1.3), and apply `Scheme.LocalRepresentability.isRepresentable`. Record
`schemeEquiv_functor_obj`, `schemeEquiv_inverse_obj_iso`, and the characterization
`isLocallyRepresentable_iff : IsLocallyRepresentable F ↔ ∃ X, Nonempty (pointsFunctor X ≅ F)`.
*Needs:* §§0.2–0.3, 1.2–1.3; Mathlib `LocalRepresentability.isRepresentable`.

### 2.3 Closure properties **[medium]**

Prove, each as a theorem on `IsLocallyRepresentable` together with the comparison of the
representing schemes: fibre products (`IsLocallyRepresentable.pullback`, with
`schemeEquiv` preserving pullbacks); open and closed subfunctors of locally representable
functors are locally representable and correspond to open and closed subschemes; Zariski
gluing (a Zariski sheaf with an open cover by locally representable subfunctors is locally
representable); disjoint unions; base change along `R → R'` (`IsLocallyRepresentable.baseChange`,
restriction along `CommAlgCat R' ⥤ CommAlgCat R`, compared with Mathlib's pullback along
`Spec R' → Spec R`). Prove `isLocallyRepresentable_of_isRepresentable` for affine schemes
and `IsLocallyRepresentable.affine_iff`: `F` is representable iff its representing scheme is
affine.

**Checks.**
- The Zariski sheaf `A ↦ {idempotents of A}` is representable by `Spec R ⊔ Spec R`.
- The presheaf quotient `A ↦ Aˣ / μ₂(A)` maps injectively to `𝔾_m` by squaring,
  with image the square units. The unit `2` over `ℚ` is not in that image, but is in it
  after the finite faithfully flat extension `ℚ → ℚ(√2)`; the local preimages give
  matching quotient classes that do not descend. Its fppf sheafification is `𝔾_m`. Quotients must be sheafified in the topology in which they are formed.
- The functor `A ↦ {projective rank-one A-modules}/≅` is a Zariski sheaf of sets only after
  sheafification, and that sheafification is the terminal sheaf.

### 2.4 The absolute case and `CommRingCat` **[easy]**

Prove `CommAlgCat.intEquiv : CommAlgCat.{u} ℤ ≌ CommRingCat.{u}` (every ring is uniquely a
`ℤ`-algebra; build it if Mathlib has none) and `overSpecIntEquiv : Over (Spec (CommRingCat.of ℤ)) ≌ Scheme.{u}`
from `specZIsTerminal` (build it if Mathlib has no `Over` equivalence for a terminal object).
Transport the Zariski topology to `CommRingCat.{u}ᵒᵖ` and state the absolute front door

```lean
noncomputable def TauCeti.FunctorOfPoints.schemeEquivAbsolute :
    Scheme.{u} ≌ LocallyRepresentableAbsolute
```

with `LocallyRepresentableAbsolute` the full subcategory of Zariski sheaves on
`CommRingCat.{u}ᵒᵖ` that are locally representable, defined by transport and not by a second
copy of §2.1.

### 2.5 Comparison with presheaves on all schemes **[easy]**

Tau Ceti's algebraic spaces are presheaves on `Scheme.{u}` (`SchemePresheaf`). Prove that
restriction along `Scheme.Spec` composed with §2.4 sends `yoneda.obj X` to the absolute points
functor of `X`, and that a Zariski sheaf `F` on `Scheme.{u}` is representable iff its
restriction to affine test objects is locally representable. This is the statement that
lets results proved on `(CommRingCat)ᵒᵖ` be read on `SchemePresheaf`.

## Layer 3: the infinitesimal side

### 3.1 Tangent spaces via dual numbers **[medium]**

For a presheaf `F`, `A : CommAlgCat R` and `x : F(A)`, define

```lean
def TauCeti.FunctorOfPoints.tangentSpace (F : (CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u)
    {A : CommAlgCat.{u} R} (x : F.obj (op (op A))) : Type u :=
  {v : F.obj (op (op (CommAlgCat.of R (DualNumber A)))) // F.map (fstHom A).op.op v = x}
```

and the differential `tangentMap (α : F ⟶ G) x : tangentSpace F x → tangentSpace G (α.app _ x)`
with functoriality. Prove:

- **Affine case.** For `F = yoneda.obj (op B)`, `x : B →ₐ[R] A`,
  `tangentSpace F x ≃ Derivation R B A` with `A` a `B`-module through `x`
  (`tangentSpaceCorepresentableEquiv`); hence ≃ `(Ω[B⁄R] →ₗ[B] A)` by Mathlib's
  `KaehlerDifferential` universal property. Use the equivalence to define the `A`-module
  structure in the affine case.
- **Intrinsic module structure.** For a Zariski sheaf `F` that sends the square
  `A[ε₁, ε₂] = A[ε] ×_A A[ε]` (with `ε₁ε₂ = 0`) to a pullback (`IsInfinitesimallyLinear F`),
  define addition via `A[ε₁,ε₂] → A[ε], εᵢ ↦ ε` and scalar action via `ε ↦ aε`; prove these give
  an `A`-module, functorial in `x`. Prove every locally representable `F` is infinitesimally
  linear (via §2.2 and the affine case: `Spec (A[ε] ×_A A[ε])` is the pushout of
  `Spec A[ε] ← Spec A → Spec A[ε]` in schemes, an instance of pushouts along thickenings).
  Prove the two module structures agree on representables.
- **Scheme case.** For `X : Over (Spec R)` and `x : Spec A ⟶ X` over `R`,
  `tangentSpace (pointsFunctor X) x ≃ₗ[A] (x^* Ω_{X/R}) ⟶ 𝒪` on `Spec A`, i.e.
  `Hom_A(Γ(Spec A, x^* Ω_{X/R}), A)` (`tangentSpaceEquivDifferentials`), using Tau Ceti's
  sheaf of differentials and `tildeEquiv`.
- **Zariski tangent space.** For `k` a field, `X` locally of finite type over `k` and a rational
  point `x`, `tangentSpace (pointsFunctor X) x ≃ₗ[k] Module.Dual k (CotangentSpace (X.presheaf.stalk x))`
  (`tangentSpaceEquivZariski`; Eisenbud–Harris VI.1, Stacks Section 33.16 for the scheme
  form; use the scheme statement of that section).

**Checks.**
- `T_0 𝔸¹_k = k`, `T_1 𝔾_m = k`, and `T_1 μ_p = k` over `𝔽_p` while `μ_p(k) = {1}` for a
  reduced `k`; this must agree with ReductiveGroups Layer 2's checks.
- At the origin of the cusp `V(y² − x³)`, the tangent space is `k²`, bigger than the dimension.
- For `x` an `A`-point of `𝔸ⁿ`, `T_x = Aⁿ` with the obvious module structure.
- `T_x` of a closed subfunctor `V(I) ⊆ 𝔸ⁿ` at `x` is the kernel of the Jacobian of generators
  of `I` evaluated at `x`.

### 3.1b The tangent-bundle functor **[medium]**

Define `tangentFunctor F : A ↦ F(A[ε])` over `F` via `π_A`. Prove that for `X` over `Spec R`,
`tangentFunctor (pointsFunctor X) ≅ pointsFunctor (T X)` over `pointsFunctor X`, where
`T X = Spec_X Sym(Ω_{X/R})` is Tau Ceti's relative spectrum of the symmetric algebra of the
sheaf of differentials (`tangentBundleIso`). For `X = 𝔸ⁿ_R`, `T X ≅ 𝔸²ⁿ_R`.
*Needs:* §3.1; Tau Ceti `RelativeSpec/SymmetricAlgebra/`, `Modules/Differentials/`.

### 3.2 Infinitesimal lifting in points form **[easy]**

For `f : X ⟶ Y` over `Spec R`, write `f_{A,I} : X(A) → X(A/I) ×_{Y(A/I)} Y(A)` for an ideal
`I ⊆ A`. Prove

```lean
theorem TauCeti.AlgebraicGeometry.formallySmooth_iff_points (f : X ⟶ Y) :
    FormallySmooth f.left ↔ ∀ (A : CommAlgCat.{u} R) (I : Ideal A), I ^ 2 = ⊥ →
      Function.Surjective (liftingMap f A I)
```

and the same with `Function.Injective` for Mathlib's `FormallyUnramified`, and
`Function.Bijective` for the formal étaleness of SchemeAndStackFoundations §4.1 (`formallyUnramified_iff_points`,
`formallyEtale_iff_points`). The square-zero ideal may be replaced by any nilpotent ideal
(`formallySmooth_iff_points_nilpotent`, by induction on the nilpotency index). For `X = Spec B`,
`Y = Spec R` these reduce to Mathlib's `Algebra.FormallySmooth`, `Algebra.FormallyUnramified`,
`Algebra.FormallyEtale` (`formallySmooth_specMap_iff_points`). Combining with
SchemeAndStackFoundations §4.1's `smooth_iff_formallySmooth` and `etale_iff_formallyEtale`,
state `smooth_iff_points` and `etale_iff_points` for `f` locally of finite presentation.
Also state the definitions on presheaves (`FunctorOfPoints.IsFormallySmooth F`, etc.) and their
comparison theorems. Proof: The classes of SchemeAndStackFoundations §4.1 quantify over first-order thickenings `T ⟶ T'`
with `T'` affine; by `IsFirstOrderThickening.SpecMap_iff` these are `Spec (A/I) ⟶ Spec A` with
`I² = 0`. For Mathlib's `FormallyUnramified`, whose definition is affine-local, use the
infinitesimal criterion `FormallyUnramified.hom_ext` / `of_hom_ext` named in its docstring.
*Needs:* §0.2; SchemeAndStackFoundations §4.1; Tau Ceti `Morphisms/Thickening.lean`; Mathlib
`FormallyUnramified`; SchemeAndStackFoundations §4.1 for the smooth and étale corollaries.

**Checks.**
- `𝔸ⁿ_R → Spec R` is formally smooth: lifting `n` coordinates through `A → A/I`.
- `Spec k → 𝔸¹_k` (origin) is formally unramified, not formally smooth: the `k[ε]`-point
  `t ↦ ε` of `𝔸¹` over the origin mod `ε` does not lift.
- `Spec k[t]/(t²) → Spec k` fails injectivity at `A = k[ε]`: `t ↦ 0` and `t ↦ ε` agree mod `ε`.
- `μ₂ → Spec 𝔽₂` is not formally smooth: with `A = 𝔽₂[u]/(u⁴)` and `I = (u²)`, so
  `I² = 0`, the point `1 + u` of `μ₂(A/I)` has no lift, since every lift `1 + u + cu² + du³`
  squares to `1 + u² ≠ 1` in `A`.

## Layer 4: valuative criteria in points form

### 4.1 The lifting map **[easy]**

For `f : X ⟶ Y` in `Over (Spec R)`, a valuation ring `V` that is an `R`-algebra and its
fraction field `K`, define `valuativeMap f V K : X(V) → X(K) ×_{Y(K)} Y(V)`. Prove

```lean
theorem ValuativeCriterion.Existence.iff_points (f : X ⟶ Y) :
    ValuativeCriterion.Existence f.left ↔
      ∀ (V : Type u) [CommRing V] [IsDomain V] [ValuationRing V] [Algebra R V]
        (K : Type u) [Field K] [Algebra V K] [IsFractionRing V K] …,
        Function.Surjective (valuativeMap f V K)
```

and the `Uniqueness`/`Function.Injective` and `ValuativeCriterion`/`Function.Bijective`
versions. The `R`-algebra structure on `V` in a `ValuativeCommSq` is induced by the map
`Spec V ⟶ Y ⟶ Spec R`; state and use this as a lemma. Corollaries: the points form of
`UniversallyClosed.eq_valuativeCriterion` (01KF), `IsSeparated.eq_valuativeCriterion` (01KZ,
01L0) and `IsProper.eq_valuativeCriterion` (0BX5), each under Mathlib's hypotheses.
*Needs:* §0.2; Mathlib `ValuativeCriterion.lean`; Tau Ceti `ValuativeCommSq.hasLift_of_specMap_comp`.

### 4.2 Discrete valuation rings suffice over a Noetherian base **[hard]**

For `f` of finite type, `Y` locally Noetherian, `f` quasi-separated: `f` is universally closed
iff `valuativeMap f V K` is surjective for every discrete valuation ring `V` (EGA II,
Théorème 7.3.8; [Stacks, Section 32.15](https://stacks.math.columbia.edu/tag/0CM1)); likewise for separatedness with injectivity, and properness. The proof reduces to
Mathlib's criterion through the existence of a dominating discrete valuation ring for a
specialization of points of a Noetherian scheme (Stacks 00PH for the algebra).
*Needs:* §4.1; Mathlib `ValuationRing`, `IsDiscreteValuationRing`, Noetherian dimension theory.

**Checks.**
- `𝔸¹_ℤ → Spec ℤ` fails existence at `V = ℤ_(p)`, `K = ℚ`, the `ℚ`-point `1/p`.
- `ℙ¹` satisfies existence: `[a : b]` with `a, b ∈ K` rescales to coprime `V`-coordinates.
- The line with doubled origin fails uniqueness at `k[[t]] ⊂ k((t))`.

## Layer 5: moduli-flavoured representability

Each section defines the functor on `(CommAlgCat R)ᵒᵖ`, proves it is a Zariski sheaf, exhibits
an open cover by representable subfunctors (so §2.2 applies), and compares the resulting scheme
with the one already in Mathlib or Tau Ceti.

### 5.1 Affine space **[easy]**

`affineSpaceFunctor n : A ↦ (n → A)`; `affineSpaceFunctorIso :
pointsFunctor (𝔸(n; Spec R)) ≅ affineSpaceFunctor n` from Mathlib's `AffineSpace.homOverEquiv`.
The coordinate hyperplanes and their complements are the closed and open subfunctors
`V(Tᵢ)`, `D(Tᵢ)`.

### 5.2 Grassmannians **[medium]**

Use Mathlib's `Module.Grassmannian.functor R M k` (rank-`k` projective quotients of `A ⊗[R] M`)
for `M` a finitely generated `R`-module. Prove that it is a Zariski sheaf
(`Module.Grassmannian.isSheaf_functor`; the gluing content is Tau Ceti's
`exists_map_eq_of_isLocalized_span`); that each standard chart of Tau Ceti's
`Module.Grassmannian.scheme` (indexed by a choice of `k` elements of `M` whose images span the
quotient) has as its locus an open subfunctor, of the form `D(det)` at the universal point,
represented by the chart algebra (`chartLocus_isOpenSubfunctor`, `chartLocus_isRepresentable`); that the chart loci are
Zariski-jointly surjective (`iSup_chartLocus_tmul_eq_top`); hence
`Module.Grassmannian.isLocallyRepresentable`. Prove that `schemeEquiv.inverse` of it is
isomorphic over `Spec R` to Tau Ceti's `Module.Grassmannian.scheme R M k`, compatibly with
`schemeHomEquiv` (`grassmannianSchemeIso`). For a local ring `A` and `M = Rⁿ`, give the
explicit description of `G(k, Aⁿ; A)` as `k × n` matrices of full rank modulo `GL_k(A)` acting
on the left (`grassmannian_local_equiv`). Relative Grassmannians of locally free sheaves are
ModularCurves §0G and SchemeAndStackFoundations §4.14; coherent Grassmannians and Plücker
are AlgebraicModuliForArithmeticGeometry §1.3.

### 5.3 Projective space **[medium]**

Define `projectiveSpaceFunctor R n := Module.Grassmannian.functor R (Fin (n + 1) → R) 1`, pinned
to the quotient convention. Prove:

- the description of `A`-points as surjections `Aⁿ⁺¹ ↠ L` onto projective rank-one modules up
  to isomorphism of `L`, and as `A`-submodules `N ⊆ Aⁿ⁺¹` that are direct summands with
  rank-one quotient (`projectiveSpace_points_equiv_quotient`);
- for `A` local, `ℙⁿ(A) ≃ {v : Fin (n+1) → A | v unimodular} / Aˣ`
  (`projectiveSpace_local_equiv`); for `A` a field, the usual lines;
- the standard opens `Uᵢ = {e_i ↦ generator of L}` are open subfunctors represented by `𝔸ⁿ`
  (`projectiveSpace_chart_iso`), Zariski-jointly surjective, so `ℙⁿ_R` is locally
  representable, and its scheme is `Module.Grassmannian.scheme R (Fin (n+1) → R) 1`;
- the comparison with Mathlib's `Proj` of `MvPolynomial (Fin (n+1)) R` with its standard
  grading is AlgebraicModuliForArithmeticGeometry §1.1 (`projectiveBundle` with `E = 𝒪ⁿ⁺¹`
  and `rankOneGrassmannComparison`); state here the composite isomorphism
  `projectiveSpaceProjIso : schemeEquiv.inverse (ℙⁿ_R) ≅ Proj (MvPolynomial (Fin (n+1)) R)` over
  `Spec R` as a corollary of that comparison, together with the statement that it carries `Uᵢ`
  to `D₊(Xᵢ)`;
- the valuative criterion in points form for `ℙⁿ_R → Spec R` (via Layer 4 and the local
  description), giving a points-level proof of properness to compare with
  `Module.Grassmannian.isProper_toSpec`.

**Checks.**
- `ℙ⁰ = Spec R`; `ℙⁿ(0) = {∗}`.
- Over `A = ℤ[√−5]`, the ideal `(2, 1 + √−5)` is a non-free projective rank-one module that is
  a quotient of `A²`; the corresponding `A`-point of `ℙ¹` is not given by a unimodular vector,
  so the local description cannot be used for non-local `A`.
- `ℙ¹(k[ε]) ⊃` the fibre over `[1 : 0]` is `T_{[1:0]} ℙ¹ ≅ k`, matching §3.1.

### 5.4 Weil restriction of functors **[medium]**

For `B` a finite projective `A`-algebra (`A`, `B` commutative `R`-algebras with `B` over `A`)
and `F` a presheaf on the affine site `(CommAlgCat B)ᵒᵖ`, define
`weilRestriction B F : (CommAlgCat A)ᵒᵖᵒᵖ ⥤ Type u`, `T ↦ F(B ⊗_A T)`. Prove:
it preserves Zariski and fpqc sheaves; for `F = yoneda.obj (op C)` it is represented by Tau
Ceti's `TauCeti.Algebra.WeilRestriction A B C` (`weilRestrictionCorepresentableIso`, from
`homEquiv`); it sends closed subfunctors to closed subfunctors, compared with
`Scheme.IdealSheafData.weilRestriction` and `weilRestriction_le_ker_iff`; it sends open
subfunctors to open subfunctors (the complement of the image of a closed set under the finite
map `Spec (B ⊗_A T) → Spec T`). Representability of the Weil restriction of a scheme in
general (quasi-projective or "every finite set of points in a fibre lies in an affine open",
Bosch–Lütkebohmert–Raynaud 7.6/4) is AlgebraicModuliForArithmeticGeometry §3.4 and is not
restated here.

### 5.5 Hilbert and Quot functors **[not a target here]**

The functors `Quot_{E/X/S}` and `Hilb_{X/S}` and their representability are
SchemeAndStackFoundations §4.14 and AlgebraicModuliForArithmeticGeometry Layer 2. This
roadmap's only obligation is that their restrictions to affine test objects are the
presheaves on `(CommAlgCat R)ᵒᵖ` given by the same formulas, which follows from §0.3 and needs
no separate statement.

## Layer 6: modules, quasi-coherent sheaves and descent

This layer is Demazure–Gabriel I.2.5 and Jantzen I.2.8–I.2.11 in Mathlib's language: a
quasi-coherent module on a functor `F` is a rule assigning an `A`-module to each `A`-point,
compatible with base change. The scheme-level theory (Tau Ceti's `QuasicoherentSheaf`,
`qcohPseudofunctor`, its fpqc prestack property, and SchemeAndStackFoundations §1.1's stack
property) is consumed and compared, not rebuilt.

### 6.1 Modules over a functor **[medium]**

```lean
structure TauCeti.FunctorOfPoints.Module (F : (CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u) where
  obj : ∀ {A : CommAlgCat.{u} R}, F.obj (op (op A)) → ModuleCat.{u} A
  baseChange : ∀ {A B : CommAlgCat.{u} R} (φ : A ⟶ B) (x : F.obj (op (op A))),
    (ModuleCat.extendScalars φ.hom.toRingHom).obj (obj x) ≅ obj (F.map φ.op.op x)
  baseChange_id : …   -- along `𝟙 A`, the unitor of `extendScalars`
  baseChange_comp : … -- along `φ ≫ ψ`, the cocycle with `extendScalars` composition
```

with morphisms the families of `A`-linear maps commuting with `baseChange`. Pin this concrete
form as the carrier. Prove `moduleEquivStrongTrans`: it is equivalent to the category of strong
transformations from `F` (viewed as a pseudofunctor to discrete categories) to Mathlib's
`CommRingCat.moduleCatExtendScalarsPseudofunctor` restricted to `CommAlgCat R`, equivalently
to cartesian sections of the associated fibred category; Mathlib's bicategorical API is then
available. Supply: `Module.structureSheaf F` (`obj x = A`); pullback
`Module.pullback (α : F ⟶ G) : Module G ⥤ Module F` (precomposition), with `pullbackId`,
`pullbackComp`; the additive structure with pointwise cokernels (extension of scalars is
right exact; kernels are not pointwise, and abelianness of `Module F` for locally
representable `F` is a consequence of §6.3, not a pointwise construction); symmetric
monoidal structure via pointwise tensor products; the presheaf of global sections
`Γ(F, M) := lim_x M_x`.

### 6.2 The affine case **[easy]**

`moduleCorepresentableEquiv (B : CommAlgCat R) : Module (yoneda.obj (op B)) ≌ ModuleCat B`,
evaluation at the universal point `𝟙 B`, with inverse `N ↦ (x ↦ A ⊗_{B,x} N)`. Monoidal and
compatible with pullback along `B → B'` (extension of scalars).

### 6.3 Comparison with quasi-coherent sheaves **[hard]**

For `X : Over (Spec R)`, construct

```lean
noncomputable def TauCeti.FunctorOfPoints.moduleEquivQuasicoherent (X : Over (Spec (CommRingCat.of R))) :
    Module (pointsFunctor X) ≌ TauCeti.AlgebraicGeometry.QuasicoherentSheaf X.left
```

Inverse direction: `E ↦ (x ↦ Γ(Spec A, x^* E))`, with
`baseChange` from `tildeEquivFunctorCompPullbackIso` and `QuasicoherentSheaf.pullbackComp`.
Forward direction: restrict to the affine opens of `X` (each an `A`-point), apply §6.2 there
to get `tilde` modules, and glue with Tau Ceti's `Modules/Gluing.lean`. Prove compatibility
with pullback along morphisms of schemes, with tensor products, and with `𝒪`, and
`moduleEquivQuasicoherent_bigPresheaf`: the affine restriction of the big-site module
construction of SchemeAndStackFoundations §2.9 recovers the presheaf of §6.1.
Construct the natural comparison as part of this target, using that supplier once.
No big-site module API absent from the pin is assumed to exist in Tau Ceti. Equivalently (and this is a check, not a second target),
`Module (pointsFunctor X)` is the category of *cartesian* objects of
`SheafOfModules (bigRingCatSheaf X)` restricted to affines, matching SchemeAndStackFoundations
§2.9's `bigSheaf_fullyFaithful`.
*Needs:* §§0.2, 6.1–6.2; Mathlib `tildeEquiv`; Tau Ceti `QuasicoherentSheaf`,
`Modules/Quasicoherent/Affine.lean`, `Modules/Gluing.lean`;
SchemeAndStackFoundations §2.9 for the big-site comparison.

### 6.4 fpqc invariance: descent in presheaf form **[hard]**

Prove `Module.isEquivalence_pullback_of_isLocallyBijective`: if `α : F ⟶ G` becomes an
isomorphism after fpqc sheafification (equivalently: `α` is fpqc-locally surjective and
fpqc-locally injective in the sense of Mathlib's `Presheaf.IsLocallySurjective` and
`IsLocallyInjective` for `fpqcTopology R`), then `Module.pullback α` is an equivalence.
The affine input is: for faithfully flat `A → B`, `ModuleCat A` is equivalent to descent data
on `ModuleCat B` relative to `B ⇉ B ⊗_A B` (Mathlib's `comonadicExtendScalars` together with
`DescentDataAsCoalgebra.coalgebraEquivalence`; transport along Tau Ceti's affine
quasi-coherent equivalence identifies this with descent on `Spec`). Consequences, each stated:

- `Module.sheafification`: `Module F ≌ Module (F^♯)` for `F^♯` the Zariski, fppf or fpqc
  sheafification (where it exists at these universes; otherwise state the theorem for a given
  locally bijective `α`, which is what applications need);
- `moduleCatExtendScalarsPseudofunctor_isStack`: Mathlib's
  `CommRingCat.moduleCatExtendScalarsPseudofunctor`, restricted to `CommAlgCat R`, is a stack
  for `fpqcTopology R` (the TODO in Mathlib's `ModuleCat/Descent.lean` docstring, here in the
  form needed on affine test objects);
- `qcoh_fpqc_descent_iff`: via §6.3 and §0.3, the presheaf statement above is equivalent to
  SchemeAndStackFoundations §1.1's `qcoh_fpqc_descent` on schemes over `Spec R`. Use SchemeAndStackFoundations §1.1 as the supplier of scheme-level descent and
  prove the presheaf formulation by transport through §§0.3 and 6.3; there is one
  proof of descent and a one-way dependency.

**Checks.**
- For `ℝ → ℂ`, a `ℂ`-vector space with a semilinear involution descends to a real form; the
  descent datum is the involution (compare Tau Ceti `ModuleCat/RealDescent.lean`).
- For the fpqc cover `ℤ → ℤ[1/2] × ℤ_(2)`, descent data live over
  `ℤ[1/2] ⊗ ℤ_(2) = ℚ`; the modules `ℤ` and `2ℤ` have isomorphic restrictions and
  compatible descent data, and the isomorphism `ℤ ≅ 2ℤ` descends.
- `ℤ → ℚ` is flat but not faithfully flat; `ℤ/2` and `0` have the same restriction, so the
  pullback functor is not faithful.

### 6.5 Vector bundles and line bundles **[medium]**

`Module.IsFiniteLocallyFree M :≡ ∀ x, Module.Finite A (M x) ∧ Module.Projective A (M x)`, a
pointwise condition. Prove that under §6.3 it is Mathlib's `SheafOfModules.IsLocallyFree` with
finite rank as used by AlgebraicVectorBundles (`isFiniteLocallyFree_iff`); that rank is
locally constant; that invertible objects of `Module F` are the pointwise rank-one projective
families; and that, for `X` a scheme, the group of isomorphism classes of invertible objects is
Tau Ceti's `LineBundleClass` group (comparison only). The tautological quotient on `ℙⁿ`
(§5.3) is the module `x ↦ L_x`; record it and its comparison with `𝒪(1)` from
AlgebraicModuliForArithmeticGeometry §1.1.

### 6.6 Quasi-coherent algebras and affine morphisms **[hard]**

Commutative algebra objects of `Module F` are *quasi-coherent algebras over `F`*. Define
`IsAffineHom (α : G ⟶ F)`: every pullback along `yoneda.obj (op A) ⟶ F` is representable.
Prove `relativeSpecEquiv : (CommMon (Module F))ᵒᵖ ≌ {α : Over F // IsAffineHom α}` (relative
spectrum of a functor, `x ↦ Spec (𝒜_x)` glued over points), its compatibility with pullback,
and for `F = pointsFunctor X` its comparison with Tau Ceti's
`CategoryTheory.CommMon.relativeSpec` and `TauCeti.AlgebraicGeometry.relativeSpec`.
Corollary (fpqc descent of affine morphisms in presheaf form, from §6.4): affine morphisms to
`F` depend only on the fpqc sheafification of `F`; compare with Tau Ceti's
`TauCeti.DescentDatum.exists_isAffineHom_baseChange_hom_isIso_of_quasiCompact` and
`TauCeti.Algebra.DescentDatum.baseChangeEquiv`. Closed subfunctors (§1.2) are the affine
morphisms whose algebra is a quotient of `𝒪`; record this case.

**Checks.**
- For `F = ∗` (the terminal presheaf over `R`), `Module F ≌ ModuleCat R` and affine morphisms
  to `F` are affine schemes over `R`.
- For `F = pointsFunctor ℙ¹`, the module `x ↦ L_x` is not isomorphic to `𝒪` (no global
  generator), but becomes so on each chart.
- Over `ℙ¹_R` with universal quotient `L` (§6.5), the relative spectrum of `Sym(L)` has as
  `A`-points a point `R² ⊗ A ↠ L_x` together with a linear form `L_x → A`; composing gives a
  map to `𝔸²_R`, and this map is the blow-up of `𝔸²_R` at the origin (an isomorphism away from
  the zero section).

## Downstream consumers

ReductiveGroups and ReductiveGroupsPartII (functor-of-points phrasing of group schemes;
they do not depend on this roadmap), FlagVarieties and SchubertGeometry (Grassmannian and flag
functors), AlgebraicModuliForArithmeticGeometry (Weil restriction and projective bundles,
which may use §§5.3–5.4 and §6.5 as their affine interface), ModularCurves (moduli problems
on `(CommAlgCat R)ᵒᵖ`), and the SemiringSchemes roadmap (as the ring-theoretic model for the
semiring version of Layers 0–2).

## References

- M. Demazure and P. Gabriel, *Groupes algébriques, Tome I*, Masson / North-Holland (1970),
  Chapitre I (§1: functors, open and closed subfunctors, local representability, I.1.3.11;
  §2: schemes, quasi-coherent modules on functors, I.2.5; §4: infinitesimal theory).
- J. C. Jantzen, *Representations of Algebraic Groups*, 2nd ed., AMS (2003), Part I,
  Chapter 1 (§§1.1–1.13: `k`-functors, open and closed subfunctors, schemes as functors) and
  Chapter 2 (§§2.8–2.11: modules over a `k`-functor and their comparison with quasi-coherent
  sheaves).
- D. Eisenbud and J. Harris, *The Geometry of Schemes*, GTM 197, Springer (2000), Chapter VI
  (VI.1: the functor of points, open subfunctors and Theorem VI-14; VI.1.3 tangent spaces via
  `k[ε]`; VI.2: Grassmannians, Hilbert schemes).
- J. S. Milne, *Algebraic Groups*, Cambridge University Press (2017), Chapter 1 and
  Appendix A (functors of points of affine schemes, Yoneda, faithfully flat descent).
- N. P. Strickland, *Formal schemes and formal groups*, in *Homotopy invariant algebraic
  structures*, Contemp. Math. 239 (1999), §§2–4 (schemes as functors, open and closed
  subfunctors, modules over functors).
- B. Toën and M. Vaquié, *Au-dessous de Spec ℤ*, J. K-Theory 3 (2009) (relative schemes over
  a symmetric monoidal category; cited only for the out-of-scope semiring extension).
- A. Grothendieck, *EGA II*, Publ. Math. IHÉS 8 (1961), §7.3 (valuative criteria, 7.3.8).
- S. Bosch, W. Lütkebohmert, M. Raynaud, *Néron Models*, Springer (1990), §7.6 (Weil
  restriction).
- The Stacks Project: Tag 01JJ (representability from an open cover, the source of Mathlib's
  `LocalRepresentability`), 01BG (pullback of modules is a pseudofunctor), 023T (descent of
  quasi-coherent modules), 03O1 (fpqc sheaf criterion; cited for the scheme statement), 0GN7
  (big-site modules), 01KE, 01KF, 01KZ, 01L0, 0BX5 (valuative criteria, as tagged in Mathlib),
  02H0, 02HG (formally smooth and formally étale morphisms), 089R (Grassmannian).
