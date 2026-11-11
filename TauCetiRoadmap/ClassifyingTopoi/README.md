# Roadmap: classifying topoi of geometric theories

**Summary.** Build geometric logic and its classifying topoi on Mathlib's carriers: first-order
languages `L : FirstOrder.Language.{u₁, u₂}` with Mathlib's terms and structures, geometric formulas
`GeometricFormula.{w} L n` (atomic formulas, finite conjunctions, disjunctions indexed by a type in
`Type w`, existential quantification), geometric theories as sets of sequents, and `L`-structures
`CatStructure L E` in a category `E` with finite products, interpreted in Mathlib's subobject
lattices. Classifying topoi are small sites `C : Type u` with `J : GrothendieckTopology C` and a
model `U` of the theory in `Sheaf J (Type u)`, through which every model of the theory in every
sheaf topos `Sheaf K (Type u)` of a small site `(D, K)` is the image of `U` under a left exact left
adjoint, fully faithfully on homomorphisms. The end theorems are: geometric formulas are preserved
by homomorphisms of structures and translate into Tau Ceti's infinitary formulas with the same
satisfaction, the categorical semantics in `Type u` is the set-theoretic one, and left exact left
adjoints between sheaf topoi map models to models (Layer 1); the models of a Horn theory are the
filtering functors on its classifying category of Horn formulas, and in every sheaf topos a
geometric formula is a `u`-small disjunction of existential quantifications of Horn formulas; every
geometric theory over a language `L : FirstOrder.Language.{u₁, u₂}` has a classifying site in `Type
(max u₁ u₂ u)`; two classifying sites of one theory have equivalent sheaf topoi by an equivalence
carrying one generic model to the other, and in a classifying topos every subobject of a power of
the generic model is the interpretation of a geometric formula; for a site `(C, J)` classifying
`T`, every quotient `T ⊆ T'` is classified by `(C, J')` for a topology `J ≤ J'`, and every `J' ≥ J`
classifies a quotient of `T`, in both cases with the sheafified generic model; and Morita
equivalence of theories (Layer 2);
Horn theories are of presheaf type; the topos of functors from finite sets to sets classifies
objects, with the inclusion as generic object; for a group `G` the topos of right `G`-sets
classifies `G`-torsors, with `G` acting on itself on the left as generic torsor, and the theories of
`G`- and `H`-torsors are Morita-equivalent exactly when `G ≃* H`; simplicial sets classify
intervals, with `Δ[1]` as generic interval; a theory is of presheaf type exactly when every
geometric formula is covered by `T`-irreducible formulae, which are the formulae presenting finitely
presentable set-models; such a theory is classified by the functors on its finitely presentable
set-models, and every topology on the opposite of those models gives the quotient whose set-models
are the homogeneous ones, the finitely presentable ones being the irreducible objects of that
topology (Layer 3); a commutative ring
finitely presentable in `CommRingCat` is finitely presented, and presheaves on the opposite of
finitely presented commutative rings classify commutative rings, with the forgetful functor and its
pointwise operations as generic ring; that functor is a sheaf for the Zariski topology, the case of
Tau Ceti's sheaf property of `Scheme.Γ` on `Spec ℤ`; and the Zariski topos classifies local rings,
with the sheafified generic ring as generic local ring (Layer 4).

Suggested home: `TauCeti/ModelTheory/Geometric/` for Layer 1 and
`TauCeti/CategoryTheory/Topos/Classifying/` for Layers 2–4.

## Scope and ownership

**Owned here.** Geometric logic over a single-sorted first-order language (formulas, sequents,
theories, their set-theoretic and categorical semantics, homomorphisms of structures and the inverse
image of a structure along a functor preserving finite products, Layer 1); the classifying category
of a Horn theory, the normal form of geometric formulas, classifying sites and their universal
property, the existence and uniqueness of classifying topoi, the correspondence between quotient
theories and finer topologies on a classifying site, and Morita equivalence of geometric theories
(Layer 2); theories of presheaf type, the presheaf type of Horn theories, the classifying topoi
of objects, of `G`-torsors and of intervals, the `T`-irreducible formulae with the finitely
presentable set-models they present, and the quotients of a theory of presheaf type given by
topologies on its finitely presentable models (Layer 3); the classifying topoi of commutative rings
and of local rings, and the Zariski topology on the opposite of finitely presented rings (Layer 4).
A search of the roadmaps on main, of the open pull requests and of the maintainers' packages for
classifying topoi, geometric theories, geometric logic, Diaconescu's theorem, flat functors, the
theory of objects, the object classifier, syntactic sites and Morita equivalence of theories finds
no other owner: GrothendieckTopoi (Scope and ownership, Out of scope) and
LocallyPresentableCategories (Scope and ownership, Left to other roadmaps) both exclude classifying
topoi of geometric theories, and the only other mention, AdicSpacesPartIV, uses the classifying
topos of a profinite Galois group as an example. The Morita equivalence of DGAInfinity,
HilbertModules and GrothendieckEulerForms is a different notion, for dg categories, C*-algebras and
rings.

**Left to GrothendieckTopoi.** Grothendieck topoi and the predicate `IsGrothendieckTopos`, with
`Sheaf J (Type u)` as the standard instance and every topos equivalent to one (GrothendieckTopoi
1.1); geometric morphisms, their 2-cells and the equivalence between 2-cells and transformations of
inverse images (GrothendieckTopoi 2.1–2.2); Diaconescu's theorem, `IsFiltering` and
`nonempty_geometricMorphism_equiv_isFiltering` (GrothendieckTopoi 2.5); subtopoi, and the
correspondence between subtopoi of `Sheaf J (Type u)` and topologies `J' ≥ J` (GrothendieckTopoi
4.1–4.2); points of a topos (GrothendieckTopoi 6.1); essential points and Roos's theorem on presheaf
topoi (GrothendieckTopoi 6.5); irreducible objects of a topos, rigid topologies and the criterion
`Sheaf J (Type u)` presheaf topos if and only if `J` rigid (GrothendieckTopoi 6.6). This roadmap
writes the universal property of a classifying topos with inverse images, the left exact left
adjoints `Sheaf J (Type u) ⥤ Sheaf K (Type u)`, which GrothendieckTopoi 2.1 identifies with
geometric morphisms; it restates none of those statements.

**Supplied by Tau Ceti and Mathlib.** The global sections functor `Scheme.Γ` is a sheaf for every
subcanonical topology on schemes (Tau Ceti `CategoryTheory.GrothendieckTopology.isSheaf_Γ`,
`TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean`), in particular for Mathlib's
`Scheme.zariskiTopology` (`Scheme.subcanonical_zariskiTopology`). On the big fpqc site over `S` its
additive group is Tau Ceti's `AlgebraicGeometry.Scheme.Ga`. The forgetful functor of 4.2 is its
restriction to the `Spec A` with `A` finitely presented (`Scheme.ΓSpecIso`). This roadmap owns only
the Zariski topology on `FPRing.{u}ᵒᵖ` and the restriction.

**Left to LocallyPresentableCategories.** Gabriel–Ulmer duality and the categories of models of
small categories with finite limits (LocallyPresentableCategories 3.1–3.4), essentially algebraic
theories (3.5) and finitely accessible categories as `Ind A` (1.5). The category of set-models of a
theory of presheaf type is `Ind` of the opposite of a small classifying site, an instance of
LocallyPresentableCategories 1.5 that 3.5 (a′) uses and the Examples of Layer 3 record; this
roadmap defines only the category `SetModel T` of the set-models of one theory, in 3.5, to state
finite presentability and presentation by a formula.

**Supplied by Tau Ceti.** The syntax and set-theoretic semantics of `L_{∞ω}`,
`FirstOrder.Language.BoundedFormulaInf` (`TauCeti/ModelTheory/Infinitary/Syntax`) and
`FirstOrder.Language.BoundedFormulaInf.Realize` (`Infinitary/Semantics`), into which 1.2
translates geometric formulas. A positive syntax is kept here because Tau Ceti's `⊓` and `ex` are
defined through implication and negation, which inverse images do not preserve, and because its
disjunctions all branch over the one carrier of the formula, while each disjunction of a geometric
formula has an index type of its own.

**Supplied by Mathlib and consumed by name.** First-order languages, terms, structures and their
homomorphisms (`Mathlib.ModelTheory`), the language of rings and its term operations, Grothendieck
topologies with their complete lattice, sheaves, sheafification, sheaves for the trivial topology
as presheaves, subobjects with pullback, images and existential quantification, the skeleton of
finite sets, the simplex category and `SingleObj`, and finitely presented rings with the finite
presentability of their objects in `CommRingCat`.

**Out of scope.** Many-sorted theories (every theory here has one sort; the many-sorted
statements are the same with families of carriers); proof systems for geometric logic and the
completeness theorems for models in Grothendieck topoi and, for coherent theories, in sets; the
étale topos as the classifying topos of strictly local rings and the classifying topoi of fields
(Hakim 1972); the weak homotopy type of the classifying topos of a group or a category
(Moerdijk 1995), which is not the topological classifying space of ClassifyingSpaces;
classifying topoi of profinite groups with their continuous actions (the étale topos of a field);
and the representation of a topos by a localic groupoid (Joyal–Tierney 1984).

## Conventions

1. **Sizes.** A site is `C : Type u` with `[SmallCategory C]`, and its topos is
   `Sheaf J (Type u)`, as in GrothendieckTopoi Convention 1. Disjunctions are indexed by types in
   `Type w`; semantics in a sheaf topos uses `w = u`, the size of its coproducts
   (`HasCoproducts.{u}`). The existence theorems 2.3 and 3.1 take a language
   `L : FirstOrder.Language.{u₁, u₂}` in any universes and `T : GeometricTheory.{max u₁ u₂ u} L`,
   and give a site in `Type (max u₁ u₂ u)`: the languages of rings and of intervals and the empty
   language are in `FirstOrder.Language.{0, 0}`, and the theorems apply to them at every `u`.
   Witnesses: `GeometricFormula.bot` is the disjunction over `PEmpty`, and in `Type u` its
   interpretation is the image of the map out of the initial object, the empty subset (1.3,
   Checks); `exists_isClassifyingSite.{0, 0, 1}` gives `intervalTheory.{1}` a classifying site in
   `Type 1`, which a statement for `L : FirstOrder.Language.{u, u}` would not.
2. **Contexts and the bound variable.** A formula in context `n` has free variables `Fin n`;
   `GeometricFormula.ex` binds the last variable of `Fin (n + 1)`: its realization extends the
   assignment by `Fin.snoc`, and its interpretation is the image along the projection
   `Pi.lift fun i => Pi.π _ i.castSucc`, which forgets the last coordinate. Witness: over the
   language of rings, in context `Fin 1`, `ex (equal (var 0) (var 1 * var 1))` says that `x₀` is
   a square; in `ℤ` it holds at `4` and fails at `2`. Binding the first variable would read
   `∃ x₀, x₀ = x₁ * x₁`, true at every assignment.
3. **Relations as images.** `CatStructure.relMap R` is an object over `Aᵏ`, and the relation is
   its image (`imageSubobject`); no monomorphism is required, so structures are built without
   proving one. Witness: in `Type u`, for a `0`-ary relation the maps `Bool ⟶ PUnit` and
   `𝟙 PUnit` have the same image `⊤`, so they define the same relation; `PEmpty ⟶ PUnit` defines
   `⊥`.
4. **Inverse images, covariantly.** The universal property of 2.1 is written with left exact left
   adjoints `F : Sheaf J (Type u) ⥤ Sheaf K (Type u)` and natural transformations `F ⟶ G`, which
   correspond covariantly to homomorphisms of the image models. Under GrothendieckTopoi 2.1–2.2,
   `F` is the inverse image of a geometric morphism `f : Sh(D, K) → Sh(C, J)`, and `F ⟶ G` is a
   2-cell `g ⟶ f` (GrothendieckTopoi Convention 4): models of `T` in `Sh(D, K)` form the
   opposite of the category of geometric morphisms into the classifying topos. Witness: for
   `T = torsorTheory G` and the one-point site, the endomorphisms of the generic torsor's image
   under the canonical point form a group isomorphic to `G` (right multiplications), and so do the
   2-cells from the canonical point of `B G` to itself (GrothendieckTopoi 2.2, Checks), compared
   across the equivalence of Convention 5.
5. **The action of `G`.** In `SingleObj G` composition is `f ≫ g = g * f` (Mathlib). The generic
   torsor is the representable presheaf `yoneda.obj star`, whose presheaf structure is
   precomposition (`G` acting on the right), and `g` acts by postcomposition, `x ↦ x ≫ g = g * x`
   (on the left). Witness: `(g * h) · x = x ≫ (g * h) = (x ≫ h) ≫ g = g · (h · x)`, the axiom of
   a left action; postcomposition with `g` is natural, precomposition is not when `G` is not
   abelian. The presheaves on `SingleObj G` are right `G`-sets, while GrothendieckTopoi's `B G` is
   `Action (Type u) G`, left `G`-sets; the two are equivalent by letting `g` act through `g⁻¹`
   (`g · x = x · g⁻¹`, so `(g * h) · x = x · h⁻¹ · g⁻¹ = g · (h · x)`), with the same underlying
   sets and the same equivariant maps, so the equivalence carries evaluation at the object of
   `AsSmall.{u} (SingleObj G)` to the forgetful functor, the inverse image of the canonical
   point.
6. **Simplices.** `δ i : ⦋0⦌ ⟶ ⦋1⦌` skips the vertex `i` and `σ i : ⦋2⦌ ⟶ ⦋1⦌` repeats it, so the
   constant `0` of the generic interval is `δ 1` (the vertex `0`), the constant `1` is `δ 0`, and
   `≤` is the image of `(σ 0, σ 1) : Δ[2] ⟶ Δ[1] × Δ[1]`. Witness: `σ 0` sends `0, 1, 2` to
   `0, 0, 1` and `σ 1` sends them to `0, 1, 1`, so `σ 0 ≤ σ 1` pointwise, and at the vertex `1`
   of `Δ[2]` the pair is `(0, 1)`: the constants satisfy `0 ≤ 1`.

## Exact supplier contracts

**From Mathlib** (at the pins).

- Model theory: `FirstOrder.Language`, `FirstOrder.Language.Term` with `Term.var`, `Term.func`,
  `Term.realize`, `Term.relabel` and `Term.subst`, `FirstOrder.Language.Structure` with
  `Structure.funMap` and `Structure.RelMap`, `FirstOrder.Language.Hom` (`M →[L] N`),
  `FirstOrder.Language.Functions.apply₁`, `FirstOrder.Language.empty`, `FirstOrder.Language.ring`
  with its `Zero`, `One`, `Add`, `Mul` and `Neg` instances on terms and
  `FirstOrder.Ring.compatibleRingOfRing` (`ModelTheory/Algebra/Ring/Basic`).
- Subobjects and limits: `Subobject` with its `⊓` and `⊤`, `Subobject.pullback`,
  `Subobject.exists`, `imageSubobject`, `equalizerSubobject` (`Subobject/Limits`), `Over`,
  `Pi.lift`, `Pi.π`, `Limits.Pi.map`, `Sigma.desc`, `piComparison`, `HasFiniteProducts`,
  `HasFiniteLimits`, `HasImages`, `HasCoproducts`, `PreservesFiniteProducts`,
  `PreservesFiniteLimits`, `Functor.IsLeftAdjoint`, `IsTerminal`, `IsTerminal.isTerminalObj`,
  `Types.productIso`, `TypeCat.ofHom`, `piObjIso`, `piObjIso_hom_comp_π`,
  `NatTrans.naturality_apply`.
- Sites: `GrothendieckTopology` with its complete lattice, `Sieve`, `Sheaf`, `sheafToPresheaf`,
  `presheafToSheaf`, `sheafBotEquivalence`, `Presheaf.IsSheaf`, `Sheaf.instHasColimitsOfShape`
  (`Sites/Limits`), the instance `HasImages (Sheaf J (Type u))` (`Sites/Subsheaf`).
- Categories and examples: `FintypeCat.Skeleton`, `FintypeCat.Skeleton.incl`, `FintypeCat.incl`,
  `unopUnop`, `yoneda`, `SingleObj`, `SingleObj.star`, `AsSmall`, `AsSmall.up`, `AsSmall.equiv`,
  `SimplexCategory` with `SimplexCategory.δ`, `SimplexCategory.σ` and
  `SimplexCategory.isTerminalZero`; `Sheaf.canonicalTopology`, `Subobject.underlying`,
  `IsIdempotentComplete` and `Sieve` with its maximal element.
- Schemes: `AlgebraicGeometry.Scheme.Γ`, `Scheme.zariskiTopology`,
  `Scheme.subcanonical_zariskiTopology` (`AlgebraicGeometry/Sites/BigZariski`), `Spec` and
  `Scheme.ΓSpecIso`.
- Algebra: `MvPolynomial`, `Ideal.FG`, `Ideal.span`, `IsLocalization.Away`, `RingHom.toAlgebra`,
  `MulEquiv`, `CommRingCat`, `Algebra.FinitePresentation`, `IsFinitelyPresentable`,
  `CommRingCat.isFinitelyPresentable_under`, `CommRingCat.isFinitelyPresentable_hom`
  (`Algebra/Category/Ring/FinitePresentation`) and `essentiallySmall_of_le`
  (`Algebra/Category/CommAlgCat/FiniteType`).

**From Tau Ceti** (at the pin). `FirstOrder.Language.BoundedFormulaInf` with its constructors
`equal`, `rel` and `iSup` and its `⊤`, `⊥`, `⊓` and `ex` (`TauCeti/ModelTheory/Infinitary/Syntax`),
and `FirstOrder.Language.BoundedFormulaInf.Realize` (`TauCeti/ModelTheory/Infinitary/Semantics`),
for 1.2; `CategoryTheory.GrothendieckTopology.isSheaf_Γ` (`Scheme.Γ` is a sheaf for every
subcanonical topology on schemes) and `AlgebraicGeometry.Scheme.Ga`, both in
`TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean`, for 4.2.

**From GrothendieckTopoi.** 1.1 (`IsGrothendieckTopos`: `Sheaf J (Type u)` is a Grothendieck topos
for every small site and every Grothendieck topos is equivalent to one, so the quantifier over small
sites in 2.1 is a quantifier over Grothendieck topoi), 1.2 (epimorphisms and coproducts in
`Sheaf J (Type u)`, every epimorphism being the coequalizer of its kernel pair, and the frame
property of its subobject lattices), 1.4 (Giraud's axioms: coequalizers of internal equivalence
relations are universal, so images are stable under pullback, for 2.2 (b)), 2.1
(`GeometricMorphism`: left exact left adjoints between Grothendieck topoi are the inverse images of
geometric morphisms), 2.2 (`GeometricMorphism.homEquivInverse`: 2-cells and transformations of
inverse images), 2.4 (`GeometricMorphism.ofContinuous`: inverse images of continuous maps, for the
Examples of Layer 1), 2.5 (`IsFiltering`, `nonempty_geometricMorphism_equiv_isFiltering`,
Diaconescu's theorem), 4.2 (the subtopoi of `Sheaf J (Type u)` are the `Sheaf J' (Type u)` for
`J' ≥ J`), 6.1 (points of a topos, `nonempty_point_equivalence`), 6.5 (connected nonempty projective
objects, Roos's theorem), 6.6 (`IsIrreducibleObject`, `IsRigidTopology`,
`isIrreducibleObject_iff_projective_preservesCoproducts` and
`isRigidTopology_iff_nonempty_equiv_presheaf`).

**From LocallyPresentableCategories.** 1.5 (finitely accessible categories are `Ind A`), for 3.5
and the Examples of Layer 3; 3.1 (Gabriel–Ulmer duality) and 3.5 (essentially algebraic theories),
for the Examples of Layer 3.

## How to read the build

Layer 1 is geometric logic on Mathlib, with Tau Ceti for one translation: syntax, the set-theoretic
semantics with its preservation by homomorphisms, structures and models in a category with finite
limits, images and small coproducts, the transport of a model along a left exact left adjoint, and
the translation into Tau Ceti's infinitary formulas. Layer 2 defines classifying sites through the
universal property of Layer 1's transport, builds the classifying category of a Horn theory and the
normal form of geometric formulas, proves the existence of classifying sites by the syntactic site
and their uniqueness, with the definability of the subobjects of powers of the generic model,
relates quotient theories to finer topologies, and defines Morita equivalence; it consumes
Diaconescu's theorem and the subtopoi of a sheaf topos from GrothendieckTopoi. Layer 3 specialises
to the trivial topology: Horn theories, the object classifier, torsors and `B G`, intervals and
simplicial sets, then irreducible formulae and finitely presentable models (3.5), on which the
quotients of a theory of presheaf type by topologies on its finitely presentable models
(3.6) are built. Layer 4 treats rings: the small category of finitely presented rings,
the classifying topos of rings, the Zariski topology, and local rings as the quotient classified by
it, an instance of 2.5 with the topology given explicitly.

## Layer 1: geometric logic and its semantics

### 1.1 Geometric formulas, sequents and theories

Define the inductive type `GeometricFormula.{w} L n` with constructors `top`, `and`, `iSup` (a
family indexed by `ι : Type w`), `equal` (two terms of `L.Term (Fin n)`), `rel` (a relation
symbol applied to terms) and `ex` (binding the last variable of `Fin (n + 1)`, Convention 2), the
false formula `GeometricFormula.bot` (the disjunction over `PEmpty`), the structure `Sequent L`
(a context length `n`, a hypothesis and a conclusion in context `n`) and `GeometricTheory L`, a
set of sequents (Johnstone, Elephant, D1.1; Mac Lane–Moerdijk, X.1 and X.3, pp. 527–530 and
533–539). Implication, negation
and universal quantification are not formulas; a sequent `φ ⊢ ψ` plays the role of
`∀ x, φ → ψ`.
*Needs:* Mathlib `FirstOrder.Language`, `FirstOrder.Language.Term`.

**Checks.**

- `bot` is the empty disjunction: its realization (1.2) is `∃ i : PEmpty, …`, false at every
  assignment; defining it as `equal (var 0) (var 1)` would be satisfiable in a one-element
  structure, and would need a context with two variables.
- Disjunctions are infinitary: over the language of rings, the disjunction indexed by `ULift ℕ`
  of the equations `x₀ + ⋯ + x₀ = 0` (`k + 1` summands) says that `x₀` is torsion; it holds at
  every element of `ℤ/6` and only at `0` in `ℤ`. By compactness it is not equivalent to a
  finitary first-order formula, so finite disjunctions would not express it.
- The bound variable is the last one (Convention 2): `ex (equal (var 0) (var 1 * var 1))` in
  context `Fin 1` holds at `4` and fails at `2` in `ℤ`.

### 1.2 Set-theoretic semantics and homomorphisms

Define `GeometricFormula.Realize` for a structure `[L.Structure M]` on a type and an assignment
`Fin n → M` (through Mathlib's `Term.realize` and `Structure.RelMap`), `Sequent.Realize` (every
assignment satisfying the hypothesis satisfies the conclusion) and `GeometricTheory.IsSetModel`.
Prove `GeometricFormula.realize_hom`: for a homomorphism `f : M →[L] N`, `φ.Realize x` implies
`φ.Realize (f ∘ x)`. The proof is an induction on `φ`, with Mathlib's
`FirstOrder.Language.Hom.map_fun` and `FirstOrder.Language.Hom.map_rel` at the atomic formulas and
`f a` as the witness of `ex` (Elephant, D1.2).

Define `GeometricFormula.toInf`, the translation into Tau Ceti's `L_{∞ω}` formulas
`L.BoundedFormulaInf (Σ X : Type w, X) Empty n` (no free variables; the context `Fin n` becomes
the bound-variable slots): `top`, `and` and `ex` go to Tau Ceti's `⊤`, `⊓` and `ex`, terms are
relabelled by `Sum.inr`, and the disjunction of `φ : ι → _` goes to the disjunction over the pairs
`⟨X, x⟩` whose branch is `φ x` when `X = ι` and `⊥` otherwise. Prove
`GeometricFormula.realize_toInf`: `φ.toInf.Realize Empty.elim x ↔ φ.Realize x`, by induction on
`φ`, with Tau Ceti's realization lemmas for `⊤`, `⊓`, `ex` and `iSup`.
*Needs:* 1.1; Mathlib `Term.realize`, `Term.relabel`, `Structure.RelMap`,
`FirstOrder.Language.Hom`; Tau Ceti `FirstOrder.Language.BoundedFormulaInf`,
`FirstOrder.Language.BoundedFormulaInf.Realize`.

**Checks.**

- `equal (var 0 + var 1) (var 2)` in context `Fin 3` holds in `ℤ` at `(2, 3, 5)` and fails at
  `(2, 3, 6)`.
- Only positive formulas are preserved: `2` is not invertible in `ℤ` and is invertible in `ℚ`;
  the geometric formula `ex (equal (var 0 * var 1) 1)` ("`x₀` is a unit") goes from false to true
  along the inclusion, as 1.2 allows, while its negation would go from true to false, which is
  why negation is not a geometric connective.
- `IsSetModel` of the empty theory holds in every structure, the empty type included; the theory
  `{⟨0, top, ex top⟩}` (inhabited) fails in `PEmpty` and holds in `PUnit`.
- `toInf` of `bot`, the disjunction over `PEmpty`, has only `⊥` branches (no pair `⟨PEmpty, x⟩`
  exists), so its realization is false, as that of `bot`.
- The carrier must hold every index type: `toInf` of the torsion formula of 1.1, a disjunction
  over `ULift ℕ`, has the `k`-th equation as branch at `⟨ULift ℕ, k⟩` and `⊥` at `⟨Bool, b⟩`; at
  `1` it is realized in `ℤ/6` (`k = 5`) and not in `ℤ`. A translation into a fixed carrier such
  as `ℕ` could not reach a disjunction over `ULift ℝ`.
- The context becomes the bound slots: `toInf` of `ex (equal (var 0) (var 1 * var 1))` is Tau
  Ceti's `ex` of the relabelled equation, which binds the last slot by `Fin.snoc` as in
  Convention 2, and is realized at `4` and not at `2` in `ℤ`; relabelling the context into free
  variables would leave `ex` nothing to bind.

### 1.3 Structures and models in a category

Define the structure `CatStructure L E` for `[HasFiniteProducts E]`: an object `carrier`, for each
`k`-ary function symbol a morphism `funMap f : Aᵏ ⟶ A`, and for each `k`-ary relation symbol an
object `relMap R` over `Aᵏ` (Convention 3). Define `CatStructure.pow` (`Aⁿ`), `CatStructure.termMap`
(terms as morphisms `Aⁿ ⟶ A`), and, for `[HasFiniteLimits E] [HasImages E] [HasCoproducts.{w} E]`,
`CatStructure.interp` (formulas as subobjects of `Aⁿ`: `⊤`, `⊓`, the image of the coproduct of the
interpretations, `equalizerSubobject`, the pullback of the image of `relMap R` along the tuple of
terms, and `Subobject.exists` along the projection of Convention 2), `CatStructure.IsModel` (for
every axiom, the interpretation of the hypothesis lies below that of the conclusion),
`CatStructure.IsHom` (a morphism of carriers commuting with `funMap` and sending each relation into
its counterpart) and `CatStructure.Isomorphic` (an isomorphism of carriers that is a homomorphism
both ways) (Elephant, D1.2; Mac Lane–Moerdijk, X.2, pp. 530–533). Define `CatStructure.ofStructure`,
the structure in `Type u` of a structure on `M : Type u`, and prove
`CatStructure.isModel_ofStructure_iff`: `(CatStructure.ofStructure M).IsModel T ↔ T.IsSetModel M`
for `T : GeometricTheory.{u} L`. Route: by induction, the interpretation of `φ` is the subset of
`Fin n → M` (through `Types.productIso`) of the assignments realizing `φ`; images in `Type u` are
ranges, coproducts are sigma types, and the order of subobjects is inclusion. Prove also, as API:

- `CatStructure.Isomorphic` is reflexive (the identity), symmetric (the inverse) and transitive
  (the composite), the homomorphism conditions being stable under composition because
  `Limits.Pi.map` and `Subobject.pullback` are functorial;
- `CatStructure.IsModel` is invariant under `CatStructure.Isomorphic`: an isomorphism of carriers
  carries `M.interp φ` to `N.interp φ` for every formula, by induction on `φ`.

*Needs:* 1.1, 1.2; Mathlib `Subobject`, `Subobject.pullback`, `Subobject.exists`,
`imageSubobject`, `equalizerSubobject`, `Pi.lift`, `Limits.Pi.map`, `Sigma.desc`, `Over`,
`Types.productIso`, `TypeCat.ofHom`.

**Checks.**

- In `Type u`, the interpretation of `equal (var 0) (var 1)` in the structure on `Bool` is the
  diagonal, two of the four pairs; the interpretation of `bot` is `⊥`, the image of the map out of
  the empty coproduct (Convention 1).
- Disjunction is the image of the coproduct, not the coproduct: in `Type u` on `ℤ`, the disjunction
  of `equal (var 0) 0` with itself has interpretation `{0}`, one element, while the coproduct of the
  two subobjects has two; a definition by the coproduct would not give a subobject.
- `IsHom` on the language of rings in `Type u`: `n ↦ 2 * n` on `ℤ` commutes with `+`, `-` and `0`
  and fails `funMap` at `1` (`2 ≠ 1`); the identity passes. A definition checking only the carrier
  would accept both.
- `Isomorphic` needs both directions: in `Type u` over a language with one unary relation `P`, the
  identity of `Bool` from `P = ∅` to `P = {true}` is a homomorphism and an isomorphism of carriers,
  but its inverse sends `P = {true}` outside `∅`, so the two structures are not isomorphic.

### 1.4 Inverse images of models

Define `CatStructure.map M F` for `F : E ⥤ E'` preserving finite products: carrier `F.obj A`,
function symbols `inv (piComparison F _) ≫ F.map (M.funMap f)`, relations
`F.map (M.relMap R).hom ≫ piComparison F _`. Prove `CatStructure.IsModel.map`: for small sites
`(C, J)`, `(D, K)` and `F : Sheaf J (Type u) ⥤ Sheaf K (Type u)` with `[PreservesFiniteLimits F]`
and `[F.IsLeftAdjoint]`, a model of `T` in `Sheaf J (Type u)` maps to a model in
`Sheaf K (Type u)`. Route: `F` preserves finite limits, monomorphisms, epimorphisms and small
coproducts, hence images, so `(M.map F).interp φ` is the image of `M.interp φ` under `F`, by
induction on `φ`; the order of subobjects is preserved because `F` preserves monomorphisms
(Mac Lane–Moerdijk, X.3, pp. 533–539; Elephant, D1.2). Prove also, as API:

- `M.map (𝟭 E)` is `CatStructure.Isomorphic` to `M`, and for `F` and `G` preserving finite
  products, `(M.map F).map G` is `CatStructure.Isomorphic` to `M.map (F ⋙ G)`, both through the
  identity of the carrier and the `piComparison` of a composite;
- for a left exact left adjoint `F` as above, `M.Isomorphic N` implies
  `(M.map F).Isomorphic (N.map F)`, since `F` preserves the images that interpret the relations.

*Needs:* 1.3; GrothendieckTopoi 1.2 (epimorphisms and coproducts in `Sheaf J (Type u)`); Mathlib
`HasImages (Sheaf J (Type u))`, `piComparison`, `PreservesFiniteProducts`,
`PreservesFiniteLimits`, `Functor.IsLeftAdjoint`.

**Checks.**

- Colimits are needed. Over a language with two constants `c₀, c₁`, the theory
  `{⊤ ⊢ x = c₀ ∨ x = c₁}` holds in `Bool` with `c₀ = false`, `c₁ = true`. The functor
  `X ↦ X × X` of `Type u` preserves limits and is not a left adjoint; its image structure on
  `Bool × Bool` has constants `(false, false)` and `(true, true)`, and `(false, true)` is neither,
  so it is not a model.
- Left exactness is needed. `X ↦ Bool × X` is a left adjoint (of `X ↦ Bool → X`) and does not
  preserve the terminal object, so `CatStructure.map` is not even defined for it; it sends the
  model `PUnit` of `{⊤ ⊢ x = y}` (context `Fin 2`) to `Bool`, which is not a subsingleton.
- The degenerate topos (the empty site) has `⊤ = ⊥` in every subobject lattice, so every
  structure there is a model of every theory, `{⊤ ⊢ bot}` included; its image under any left
  exact left adjoint is again in a degenerate topos, consistently with 1.4.

### Examples

- For the trivial topology on `Discrete PUnit`, `Sheaf ⊥ (Type u) ≌ Type u`
  (`sheafBotEquivalence` and evaluation), and 1.3 makes models there the set-models.
- For a continuous map of spaces, the inverse image of sheaves is a left exact left adjoint
  (GrothendieckTopoi 2.4), so 1.4 carries a sheaf of local rings to a sheaf of local rings.

### Dependencies

Mathlib; Tau Ceti for 1.2; GrothendieckTopoi 1.2 for 1.4 and 2.4 for the Examples. Within the
layer, each target uses the previous ones.

## Layer 2: classifying topoi

### 2.1 Classifying sites

Define `IsClassifyingSite T J U` for a small site `(C, J)` and
`U : CatStructure L (Sheaf J (Type u))`: `U` is a model of `T`, and for every small site `(D, K)`,
(i) every model `M` of `T` in `Sheaf K (Type u)` is `Isomorphic` to `U.map F` for some left exact
left adjoint `F : Sheaf J (Type u) ⥤ Sheaf K (Type u)`, and (ii) for two such `F`, `G`, evaluation
`α ↦ α.app U.carrier` is injective on `F ⟶ G` and its image is exactly the homomorphisms
`U.map F ⟶ U.map G`. By GrothendieckTopoi 1.1 and 2.1–2.2 this says that `T`-models in every
Grothendieck topos `E` are, naturally in `E`, the opposite of the geometric morphisms `E → Sh(C, J)`
(Convention 4; Mac Lane–Moerdijk, X.6, pp. 559–566; Elephant, D3.1). By Diaconescu's theorem
(GrothendieckTopoi 2.5) they are also the `J`-filtering functors `C ⥤ E`.
*Needs:* 1.3, 1.4; GrothendieckTopoi 1.1, 2.1, 2.2, 2.5.

**Checks.**

- `T = {⊤ ⊢ bot}` (in context `Fin 0`): a model in `Sheaf K (Type u)` needs `⊤ ≤ ⊥` in the
  subobjects of the terminal object, so `Sheaf K (Type u)` is degenerate. The empty site, whose
  topos has one object, classifies `T`; `(Discrete PUnit, ⊥)` does not, since no structure in
  its topos, equivalent to `Type u`, is a model.
- For the theory of objects (3.2) and the one-point site `(Discrete PUnit, ⊥)`, (i) says that every
  set `X` is `F_X(U)` for the left exact left adjoint `F_X` sending the generic object to `X`,
  and (ii) that natural transformations `F_X ⟶ F_Y` are the functions `X → Y`, covariantly.
- Clause (ii) is not implied by (i). For the theory `{⊢ ∃ x, ⊤, ⊤ ⊢ x = y}` over the empty
  language, take `C = Discrete Bool` with `⊥` (the topos `Type u × Type u`) and `U` terminal.
  Every model in `Sheaf K (Type u)` is terminal, hence the image of `U` under any left exact left
  adjoint, so (i) holds. For `K` the one-point site, the two evaluations `F`, `G` at `false` and
  `true` admit no transformation `F ⟶ G` (its component at the pair `(PUnit, PEmpty)` would be a
  map `PUnit ⟶ PEmpty`), while the identity of `PUnit` is a homomorphism `U.map F ⟶ U.map G`;
  (ii) fails, as it should, since `Type u × Type u` is not the classifying topos `Type u`.

### 2.2 The classifying category of a Horn theory

Define `GeometricFormula.IsHorn` (built from `top`, `and`, `equal` and `rel` only),
`GeometricTheory.IsHorn` (hypothesis and conclusion of every axiom Horn) and
`GeometricFormula.exs`, the existential quantification of the last `m` variables of `Fin (n + m)`.
For a Horn theory `T : GeometricTheory.{u'} L`, where `u' = max u₁ u₂ u` (the empty theory
included), define its classifying category 𝒞_T without a proof system: the objects are the pairs
`(n, φ)` of a context and a Horn formula in context `n`; a morphism `(n, φ) ⟶ (m, ψ)` is an
`m`-tuple `t` of terms in context `n` such that, for every model `M` of `T` in every
`Sheaf K (Type u')` of a small site, `M.interp φ` lies below the pullback of `M.interp ψ` along
`Pi.lift fun i => M.termMap (t i)`, two tuples being identified when, for every such `M`,
`M.interp φ` lies below the equalizer of each pair of their components; composition is
substitution (`Term.subst`) and the identities are the variables. Horn formulas use no `iSup`, so
they are in bijection with a type in `Type (max u₁ u₂)`, and 𝒞_T is equivalent to a small
category in `Type u'` (`AsSmall.{u'}`). Equivalently, 𝒞_T is the opposite of the category of
finitely presented set-models of `T`, `(n, φ)` presenting the model generated by `n` elements
subject to the atomic formulas of `φ`. Prove:

- (a) for every small site `(D, K)` with `D : Type u'`, the models of `T` in `Sheaf K (Type u')`
  correspond, up to `CatStructure.Isomorphic` and up to isomorphism of functors, to the functors
  from that small category to `Sheaf K (Type u')` that are `IsFiltering` for the trivial topology
  (GrothendieckTopoi 2.5), a model `M` going to the functor that sends `(n, φ)` to the domain of
  `M.interp φ` and `t` to the map it induces (Elephant, D1.4; Caramello 2017, proof of
  Theorem 17.6, p. 81 in the numbering of arXiv:0905.0299v1). Route: 𝒞_T has finite limits
  (`(0, top)` is terminal, products are conjunctions in the concatenated context, equalizers add
  equations), the functor of a model preserves them, and on a category with finite limits the
  filtering functors for `⊥` are those preserving finite limits; conversely a filtering functor `A`
  gives the structure on `A (1, top)`.
- (b) `GeometricFormula.exists_interp_eq_iSup_exs`: for `φ : GeometricFormula.{u} L n` there are
  `ι : Type u`, `m : ι → ℕ` and Horn formulas `θ i` in context `n + m i` such that
  `M.interp φ = M.interp (.iSup fun i => (θ i).exs)` for every structure `M` in every
  `Sheaf K (Type u)` of a small site. Route: induction on `φ` in the frames `Subobject` of
  GrothendieckTopoi 1.2: meets distribute over joins, and `Subobject.exists` commutes with joins
  (1.2). Images are stable under pullback, since every epimorphism is the coequalizer of its kernel
  pair (1.2) and such coequalizers are universal (GrothendieckTopoi 1.4), so `Subobject.exists`
  satisfies Frobenius reciprocity and commutes with pullback along projections. The index types
  stay in `Type u` (`PUnit`, products, sigma types) (Elephant, D1.3.10, as used in Caramello 2017,
  proof of Theorem 17.6, p. 81).

*Needs:* 1.3; GrothendieckTopoi 1.2, 1.4, 2.5; Mathlib `Term.subst`, `Pi.lift`,
`Subobject.pullback`, `Subobject.exists`, `equalizerSubobject`, `AsSmall`.

**Checks.**

- `commRingTheory` is Horn; `localRingTheory` is not (it has `iSup` and `ex`), and neither is
  `torsorTheory` (`⊢ ∃ x, ⊤`).
- `exs` binds the last variables: for `n = 1` and `m = 1`, `exs (equal (var 0) (var 1 * var 1))`
  is the formula "`x₀` is a square" of Convention 2, true at `4` and false at `2` in `ℤ`, while
  binding `x₀` would give a formula true everywhere; for `m = 0`, `exs φ` is `φ`.
- Over the empty language a term is a variable, so for the empty theory the morphisms
  `(n, top) ⟶ (m, top)` are the maps `Fin m → Fin n`, and `(2, equal (var 0) (var 1))` is
  isomorphic to `(1, top)`: 𝒞_T is equivalent to `FintypeCat.Skeleton.{u}ᵒᵖ`, the site of 3.2.
- The identification depends on the source: for `commRingTheory`, the tuples `(x₀)` and
  `(x₀ * x₀)` are identified as morphisms `(1, equal (var 0 * var 0) (var 0)) ⟶ (1, top)` and are
  not as morphisms `(1, top) ⟶ (1, top)` (in `ℤ` at `2`, `2 ≠ 4`): the first hom-set is
  `ℤ[x]/(x² - x)`, the second `ℤ[x]`.
- In (b), the conclusion of the second new axiom of `localRingTheory` is already in normal form
  (index `ULift Bool`, `m = 1`); `and (ex θ) ψ` has the normal form `ex (and θ ψ')`, with `ψ'` the
  weakening of `ψ` to `Fin (n + 1)`, by Frobenius reciprocity (in `Type u`,
  `(∃ y, θ x y) ∧ ψ x ↔ ∃ y, θ x y ∧ ψ x`); a normal form with finite index types would not reach
  the torsion formula of 1.1.

### 2.3 Existence: the syntactic site

Prove `exists_isClassifyingSite`: for `L : FirstOrder.Language.{u₁, u₂}` and
`T : GeometricTheory.{max u₁ u₂ u} L` there are a small category `C : Type (max u₁ u₂ u)`, a
topology `J` and a model `U` with `IsClassifyingSite T J U` (Makkai–Reyes 1977, « Classifying
topoi », pp. 272–297; Mac Lane–Moerdijk, X.5–X.6, pp. 553–566; Elephant, D3.1). Route: by 2.2 (b),
each axiom `φ ⊢ ψ` of `T` has the same models in every sheaf topos as the axioms `χ ⊢ ψ'`, for the
disjuncts `exs χ` of the normal form of `φ` and `ψ'` the weakening of `ψ`, and each of these as
an axiom `χ ⊢ ⋁ᵢ exs θᵢ` with `χ` and the `θᵢ` Horn (Elephant, D1.3.10, as used in
Caramello 2017, proof of Theorem 17.6, p. 81 in the numbering of arXiv:0905.0299v1). Take for `C`
the classifying category of the empty theory over `L` (2.2), as a small category, for `J` the
topology generated by the families `(n + mᵢ, θᵢ ∧ χ') ⟶ (n, χ)` of the axioms, given by the first
`n` variables (`χ'` the weakening of `χ`), and for `U` the sheafification of the representable
presheaf of `(1, top)`: by 2.2 (a), the `J`-continuous filtering functors on `C` are the
`T`-models (Caramello 2017, « Lattices of theories », Remark 3.7 in the numbering of
arXiv:0905.0299v1), and GrothendieckTopoi 2.5 gives the universal property.
*Needs:* 2.1, 2.2; GrothendieckTopoi 2.5; Mathlib `AsSmall`, `yoneda`, `presheafToSheaf`.

**Checks.**

- The empty theory over the empty language: no axiom adds a cover, so `J = ⊥` on the category of
  2.2, which is equivalent to `FintypeCat.Skeleton.{u}ᵒᵖ` (2.2, Checks): the site of 3.2.
- One `0`-ary relation symbol `p` and the axioms `⊢ ∃ x, ⊤` and `⊤ ⊢ x = y`: the axioms make the
  carrier a one-point set, so the set-models are the two truth values of `p`, with one homomorphism
  `false ⟶ true` besides the identities; the classifying topos is presheaves on the arrow category
  `0 ⟶ 1`, the Sierpiński topos, whose points are the two points of the Sierpiński space with one
  2-cell between them (GrothendieckTopoi 2.2, Checks). Without the axioms every pair `(M, p)` of a
  set and a truth value is a set-model, and `(PUnit, false)`, `(Bool, false)` are not isomorphic.
- The universe of the site is needed: take as `0`-ary relation symbols the elements of `Type u`
  itself, a type in `Type (u + 1)` not equivalent to any type in `Type u`, and the axioms
  `⊢ ∃ x, ⊤` and `⊤ ⊢ x = y`. Distinct
  symbols `p ≠ q` give distinct subobjects of the terminal object of any classifying topos (the
  set-model in which only `p` holds separates them), while for `C : Type u` the subterminal
  objects of `Sheaf J (Type u)` form a `u`-small set (each is determined by a set of objects of
  `C`); so no classifying site lives in `Type u`, and 2.3 gives one in `Type (u + 1)`. With two
  symbols, `ULift.{u + 1} Bool`, and the same axioms, the theory is classified at universe `u`, by
  presheaves on the product of two copies of the arrow category `0 ⟶ 1`.

### 2.4 Uniqueness

Prove `IsClassifyingSite.exists_equivalence`: if `(C, J, U)` and `(C', J', U')` classify the same
`T`, there is `e : Sheaf J (Type u) ≌ Sheaf J' (Type u)` with `(U.map e.functor).Isomorphic U'`.
Route: (i) for `U'` gives `F` with `U' ≅ U.map F`, and symmetrically `G`; (ii) shows that
`G ⋙ F` and `F ⋙ G` are isomorphic to the identities, a 2-dimensional Yoneda argument
(Caramello 2017, the chapter « Lattices of theories », §2.1 in the numbering of arXiv:0905.0299v1).

Prove also `IsClassifyingSite.exists_interp_eq_of_subobject`: for
`L : FirstOrder.Language.{u₁, u₂}`, `T : GeometricTheory.{max u₁ u₂ u} L` and a classifying site
`(C, J, U)` of `T` in `Type (max u₁ u₂ u)`, as in 2.3, every subobject of `U.pow n` is
`U.interp ψ` for some `ψ : GeometricFormula.{max u₁ u₂ u} L n`. Prove also that the objects
underlying the `U.interp φ` form a separating family of `Sheaf J (Type (max u₁ u₂ u))`, a small one
up to isomorphism, since each `U.pow n` has a small set of subobjects (Caramello 2012a, proof of
Lemma 3.2, p. 182, for the geometric syntactic site). Route: both facts are invariant under the
equivalence of the first statement, which carries `U` to `U'` and so `U.interp φ` to
`U'.interp φ` (1.4, API), so it is enough to prove them on the site of 2.3. There the sheafified
representables are the `U.interp χ` with `χ` Horn, and they separate. A map from one of them into
`U.pow n` is given on a cover by tuples of terms, so its image is the interpretation of a
disjunction of `exs` of Horn formulas (the form of 2.2 (b)), and a subobject of `U.pow n` is the
union of the images of the maps into it from sheafified representables.
*Needs:* 1.3, 1.4 (API: `CatStructure.Isomorphic` is an equivalence relation, `CatStructure.map`
along the identity and along a composite); 2.1, 2.2 (b), 2.3; Mathlib `Equivalence`,
`Subobject`.

**Checks.**

- The theory of objects is classified by `FintypeCat.Skeleton.{u}ᵒᵖ` (3.2) and, by 2.3, by the
  syntactic site on the category of 2.2; the two sites are equivalent categories, and 2.4 gives
  the equivalence of topoi sending generic object to generic object.
- The isomorphism of generic models is not unique: for `G = ℤ/2`, the generic torsor has the
  automorphism `x ↦ g · x` of the non-trivial `g` (it commutes with the action, `G` being
  abelian), so `U.map (𝟭 _)` and `U` are isomorphic in two ways.
- For `T = {⊤ ⊢ bot}`, every classifying site has a degenerate topos, and all degenerate topoi are
  equivalent (one object, one morphism).
- Definability, in the topos of 3.2 (functors from finite sets to sets, `U` the inclusion). A
  subobject of the terminal object `U.pow 0` is a subfunctor `S` of `N ↦ {*}`; if `S(N) = {*}`
  then `S(N') = {*}` for every `N'` with a map `N → N'`, and `∅` maps to every `N'`, while every
  nonempty `N` maps to every nonempty `N'`. So `S` is `⊥`, `⊤`, or `N ↦ [N ≠ ∅]`: exactly the
  interpretations of `bot`, `top` and `ex top` in context `0`, and no other subobject exists.
- The classifying property is used. For the site `(Discrete Bool, ⊥)` with `U` terminal and
  `T = {⊢ ∃ x, ⊤, ⊤ ⊢ x = y}` over the empty language (2.1, Checks), `U` is a model of `T`, and the
  topos `Type u × Type u` has four subobjects of the terminal object, while every formula
  interprets in `U` as `⊥` or `⊤`: the atoms are equations between variables, interpreted as `⊤`
  on the powers of a terminal object, and `and`, `iSup` and `ex` of `⊥` and `⊤` give `⊥` or `⊤`.

### 2.5 Quotients and finer topologies

Prove `IsClassifyingSite.exists_quotient_topology`: if `(C, J, U)` classifies `T` and `T ⊆ T'`,
then some `J' ≥ J` makes `(C, J')` with the model
`U.map (sheafToPresheaf J (Type u) ⋙ presheafToSheaf J' (Type u))` classify `T'`; and
`IsClassifyingSite.exists_quotient_theory`: conversely, for every `J' ≥ J` some `T' ⊇ T` is
classified by `(C, J')` with the same model. The functor `sheafToPresheaf J ⋙ presheafToSheaf J'`
is the inverse image of the inclusion of the subtopos `Sheaf J' (Type u)` (GrothendieckTopoi 4.2).
This is the duality theorem between quotients of a geometric theory and subtopoi of its
classifying topos (Caramello 2017, the chapter « Lattices of theories », Theorem 3.6 and
Remark 3.7 in the numbering of arXiv:0905.0299v1). Route: `T'`-models are the `T`-models whose
filtering functor sends the families of the new axioms to epimorphic families (the proof of
Theorem 3.6), which is continuity for the topology `J'` generated by `J` and those families.
*Needs:* 1.3, 1.4 (API: invariance of `CatStructure.IsModel` under `CatStructure.Isomorphic`,
`CatStructure.map` along a composite and of isomorphic structures); 2.1, 2.3, 2.4;
GrothendieckTopoi 2.5, 4.2; Mathlib `sheafToPresheaf`, `presheafToSheaf`.

**Checks.**

- `T' = T ∪ {⊤ ⊢ bot}` gives `J' = ⊤`, every sieve covering, and the degenerate topos; `J' = J`
  gives a `T'` with the same models as `T` in every topos.
- Over the empty language, `T' = {⊤ ⊢ x = y}` (subsingletons) is a quotient of the theory of
  objects; its models in a topos are the subterminal objects, as are the models of the theory of
  one `0`-ary relation symbol of 2.3, Checks, so some `J'` on `FintypeCat.Skeleton.{u}ᵒᵖ` has
  `Sheaf J' (Type u)` equivalent to the Sierpiński topos (2.4): two points, `PEmpty` and
  `PUnit`.
- Layer 4: `commRingTheory ⊆ localRingTheory` and `⊥ ≤ zariskiTopology` on `FPRing.{u}ᵒᵖ` is an
  instance with both topologies given explicitly (4.3).

### 2.6 Morita equivalence

Define `MoritaEquivalent T T'` for theories over possibly different languages: there are
classifying sites `(C, J, U)` of `T` and `(C', J', U')` of `T'` with
`Sheaf J (Type u) ≌ Sheaf J' (Type u)`. By 2.4 the condition does not depend on the chosen sites
(Caramello 2017, « Lattices of theories », Definition 3.5, p. 14 in the numbering of
arXiv:0905.0299v1; Elephant, D3.1).
*Needs:* 1.3, 1.4 (API: `CatStructure.Isomorphic` is an equivalence relation, `CatStructure.map`
along a composite); 2.1, 2.4.

**Checks.**

- Over the empty language, `{⊢ ∃ x, ⊤, ⊤ ⊢ x = y}` (exactly one element) is classified by
  `Type u` (one-point site), and so is `torsorTheory` of the trivial group (3.3): they are
  Morita-equivalent although their languages differ.
- `torsorTheory (Multiplicative (ZMod 4))` and `torsorTheory (Multiplicative (ZMod 2 × ZMod 2))`
  are not Morita-equivalent (3.3), though both groups have four elements.
- The homomorphisms matter: the theory of objects and the theory of decidable objects (a binary
  relation `≠` with `x ≠ x ⊢ bot` and `⊤ ⊢ x = y ∨ x ≠ y`) have the same set-models, sets, but
  the homomorphisms of the second are the injections. Their classifying topoi, functors on
  finite sets with all maps and with injections, are not equivalent (Borceux–Dejean 1986,
  Theorem 1 (3), p. 134, and Proposition 2, p. 135: both categories are Cauchy complete and not
  equivalent, one having a non-monomorphism `Fin 2 ⟶ Fin 1`).

### Examples

- Points: for `(D, K) = (Discrete PUnit, ⊥)`, 2.1 identifies the set-models of `T` with the
  points of its classifying topos (GrothendieckTopoi 6.1).

### Dependencies

Layer 1; GrothendieckTopoi 1.1, 1.2, 1.4, 2.1, 2.2, 2.5, 4.2. Within the layer, 2.3–2.6 use 2.1, 2.3
uses 2.2, 2.4 uses 2.2 (b) and 2.3 for the definability statement, 2.5 uses 2.3 and 2.4, and 2.6
uses 2.4.

## Layer 3: theories of presheaf type

### 3.1 Horn theories

Define `IsOfPresheafType T`: some small `C` with the trivial topology `⊥` and a model `U` classify
`T`. Prove `isOfPresheafType_of_isHorn`: a Horn theory `T : GeometricTheory.{max u₁ u₂ u} L` over
`L : FirstOrder.Language.{u₁, u₂}` is of presheaf type, with a site in `Type (max u₁ u₂ u)`.
Route: by 2.2 (a) the models of `T` are the filtering functors on its classifying category 𝒞_T,
which by GrothendieckTopoi 2.5 are the geometric morphisms into presheaves on 𝒞_T; take for `C`
the small category equivalent to 𝒞_T with `⊥`, and for `U` the representable presheaf of
`(1, top)` (Elephant, D3.1; Caramello 2017, proof of Theorem 17.6, p. 81 in the numbering of
arXiv:0905.0299v1). The criterion of 3.5 (a) characterizes presheaf type for every geometric
theory: for a Horn theory the covering by irreducible formulae is the normal form of 2.2 (b).
*Needs:* 2.1, 2.2; GrothendieckTopoi 2.5; Mathlib `AsSmall`, `yoneda`, `sheafBotEquivalence`.

**Checks.**

- Presheaf type does not need Horn axioms: `torsorTheory G` is not Horn, and it is of presheaf
  type, classified by `AsSmall.{u} (SingleObj G)` with `⊥` (3.3).
- Set-models of a Horn theory are closed under products (each axiom is checked coordinatewise):
  `ℤ × ℤ` is a commutative ring. `ℤ/2 × ℤ/2` is not local (`x = (1, 0)`: neither `x` nor `1 - x`
  is invertible) although `ℤ/2` is, so no Horn theory has the local rings as set-models.
- `bot` is not Horn: `{⊤ ⊢ bot}` is excluded, consistently with its classifying topos being
  degenerate, `Sh` of the empty category, which is also a presheaf topos; the hypothesis of 3.1 is
  sufficient, not necessary.

### 3.2 The object classifier

Define `objectTheory`, the empty theory over `FirstOrder.Language.empty`, and `genericObject`: the
presheaf `unopUnop _ ⋙ FintypeCat.Skeleton.incl ⋙ FintypeCat.incl` on
`FintypeCat.Skeleton.{u}ᵒᵖ` as a sheaf for `⊥` (`sheafBotEquivalence`), the inclusion of finite
sets into sets. Prove `isClassifyingSite_genericObject`: functors from finite sets to sets
classify objects (Mac Lane–Moerdijk, VIII.4, pp. 434–437; Elephant, D3.1).
*Needs:* 2.1, 2.2, 3.1; Mathlib `FintypeCat.Skeleton`, `FintypeCat.Skeleton.incl`,
`FintypeCat.incl`, `unopUnop`, `sheafBotEquivalence`.

**Checks.**

- At the object `3` of the skeleton the generic object has three elements (`Fin 3`), and its
  `n`-th power is the representable of `n`, so the subobjects of its powers are the sieves.
- Variance: with `FintypeCat.Skeleton` itself as site (presheaves on finite sets), the topos would
  be functors on `FinSetᵒᵖ`, equivalently on finite Boolean algebras (Stone duality), which
  classifies Boolean algebras (3.1), not objects.
- Set-models are sets and homomorphisms are all functions: the point of a set `X` has inverse
  image the left Kan extension along finite sets into sets followed by evaluation at `X`, which
  sends the generic object to `X`.

### 3.3 Torsors and the classifying topos of a group

Define `torsorFunctions G` (one unary symbol for each `g : G`), `torsorLanguage G`, `torsorAct g t`
(the term `g · t`), `torsorTheory G` (left action, inhabited, transitive `⊤ ⊢ ⋁_g g · x = y`, free
`g · x = h · x ⊢ bot` for `g ≠ h`), `torsorYoneda G` (the Yoneda embedding of `SingleObj G` into
sheaves for `⊥` on `AsSmall.{u} (SingleObj G)`) and `genericTorsor G` (the representable presheaf,
`G` acting on the left by postcomposition, Convention 5). Prove `isClassifyingSite_genericTorsor`:
right `G`-sets classify `G`-torsors (Mac Lane–Moerdijk, VIII.2–VIII.3, pp. 423–434). Prove
`moritaEquivalent_torsorTheory_iff`: the theories of `G`- and `H`-torsors are Morita-equivalent
exactly when `G ≃* H`. Route: an equivalence of the presheaf topoi on `SingleObj G` and
`SingleObj H` gives an equivalence of their Cauchy completions (Borceux–Dejean 1986, Proposition 2,
p. 135: the Cauchy completion is the full subcategory of absolutely presentable presheaves, which an
equivalence preserves); an idempotent of a group is `1`, so idempotents split in `SingleObj G`,
which is therefore equivalent to its Cauchy completion (Borceux–Dejean 1986, Theorem 1 (3), p. 134),
and an equivalence `SingleObj G ≌ SingleObj H` restricts to a group isomorphism on the endomorphisms
of the object.
*Needs:* 2.1, 2.4, 2.6; GrothendieckTopoi 2.5; Mathlib `SingleObj`, `AsSmall`, `yoneda`,
`sheafBotEquivalence`, `MulEquiv`.

**Checks.**

- `G` trivial: the axioms say `⊢ ∃ x, ⊤` and `⊤ ⊢ x = y`, models are terminal objects, and
  `AsSmall (SingleObj PUnit)` has one object and one arrow, so `B G` is `Type u`.
- Freeness is needed: for `G = ℤ/2`, the one-point set with the trivial action is inhabited and
  transitive but not free; the axiom `g · x = 1 · x ⊢ bot` for `g ≠ 1` excludes it.
- The direction of the action (Convention 5): postcomposition gives
  `(g * h) · x = g · (h · x)` and is a morphism of presheaves; precomposition is not natural for
  non-abelian `G` (for `G = 𝔖₃` and transpositions `a ≠ b`, `a * b ≠ b * a`).
- `ZMod 4` and `ZMod 2 × ZMod 2`, as multiplicative groups, are not isomorphic (only the first
  has an element of order `4`), so their torsor theories are not Morita-equivalent; each topos has
  one point up to isomorphism (every torsor in `Type u` is isomorphic to `G`), so counting points
  does not separate them, and the automorphism group of the point, `G`, does.

### 3.4 Intervals and simplicial sets

Define `intervalLanguage` (constants `0`, `1` and a binary relation `≤`), `intervalConst`,
`intervalLE` and `intervalTheory`: a linear order (`≤` reflexive, transitive, antisymmetric,
`⊤ ⊢ x ≤ y ∨ y ≤ x`) with `0 ≤ x ≤ 1` and `0 = 1 ⊢ bot`. Define `simplexYoneda` (the Yoneda
embedding of the simplex category into sheaves for `⊥` on `AsSmall.{u} SimplexCategory`),
`isTerminalSimplexYonedaZero` (`Δ[0]` is terminal, from `SimplexCategory.isTerminalZero`) and
`genericInterval` (Convention 6). Prove `isClassifyingSite_genericInterval`: simplicial sets
classify intervals, with generic interval `Δ[1]` (Mac Lane–Moerdijk, VIII.8, pp. 455–466). Route:
the
finitely presentable intervals are the finite ones `{0 < 1 < ⋯ < n + 1}`, and their opposite is
the simplex category through `⦋n⦌ ↦ Hom(⦋n⦌, ⦋1⦌)`; 3.1's route for cartesian theories does not
apply (the linearity axiom is a disjunction) and is replaced by a direct check that intervals in
`E` are the filtering functors on the simplex category (GrothendieckTopoi 2.5).
*Needs:* 2.1; GrothendieckTopoi 2.5; Mathlib `SimplexCategory`, `SimplexCategory.δ`,
`SimplexCategory.σ`, `SimplexCategory.isTerminalZero`, `IsTerminal.isTerminalObj`, `AsSmall.equiv`.

**Checks.**

- At level `⦋0⦌`, `Δ[1]` has the two vertices; the constants are `δ 1 = 0` and `δ 0 = 1`, and
  `(0, 1)` lies in the image of `(σ 0, σ 1)` while `(1, 0)` does not (Convention 6): exchanging
  the constants would break `0 ≤ x`.
- Linearity is needed: the poset `{0 < a, b < 1}` with `a`, `b` incomparable satisfies every
  other axiom; it is not an interval, and correspondingly not a point of simplicial sets.
- `0 = 1 ⊢ bot` is needed: without it the one-point set, with `0 = 1`, would be an interval. In
  `Δ[1]` the equalizer of the two vertices `δ 1, δ 0 : Δ[0] ⟶ Δ[1]` is empty (at each level `⦋n⦌`
  the constant maps at `0` and at `1` differ), so the generic interval satisfies the axiom.

### 3.5 T-irreducible formulae and finitely presentable models

Let `(C, J, U)` classify `T` (2.1), with topos `E = Sheaf J (Type u)`. The interpretation
`U.interp φ` of a geometric formula `φ` in context `n` is a subobject of `U.pow n`; write `[[φ]]`
for its underlying object of `E`. Define `GeometricFormula.IsIrreducible U φ` (`φ` is
*`T`-irreducible*): `[[φ]]` is an irreducible object of `E`, that is, only the maximal sieve
covers it in the canonical topology (GrothendieckTopoi 6.6). By 2.4 and 1.4 the condition does not
depend on the classifying site. In the syntactic category of `T` (objects the formulae-in-context
`{x . φ}`, arrows the `T`-provably functional formulae; Elephant, D1.4) the object `[[φ]]` is the
Yoneda image of `{x . φ}` (Caramello 2012a, Lemma 3.2 and the discussion before Theorem 4.1), so
by Lemma 3.2 (iii) there the condition says that `{x . φ}` is irreducible for the geometric
topology, which is the source's Definition 3.1 (c): whenever `T` proves `φ ⊢ ⋁ᵢ ∃ xᵢ, θᵢ` for
`T`-provably functional formulae `θᵢ` from `{xᵢ . φᵢ}` to `{x . φ}`, some `θᵢ` has a
`T`-provably functional section.

Define the category `SetModel T` of set-models of `T` in `Type u` with the homomorphisms of
structures (Mathlib's `M →[L] N`), and `FPModel T`, its full subcategory of the objects that are
`IsFinitelyPresentable.{u}`. A set-model `M` is *presented by* `φ` when there are `ξ : Fin n → M`
with `φ.Realize ξ` such that for every model `N` and every `b` with `φ.Realize b` there is a unique
homomorphism `f : M → N` with `f ∘ ξ = b` (`SetModel.IsPresentedBy`; Caramello 2017, « Lattices of
theories », Definition 14.5 in the numbering of arXiv:0905.0299v1, with the requirement `φ.Realize
ξ` that makes `ξ` the element corresponding to the identity). In (a), (c) and (d), which use the
definability statement of 2.4, `L : FirstOrder.Language.{u₁, u₂}` and
`T : GeometricTheory.{max u₁ u₂ u} L`, with sites in `Type (max u₁ u₂ u)`, as in 2.3
(Convention 1). Prove, with `U` the generic model of a classifying site of `T`:

- (a) `isOfPresheafType_iff_forall_covered`: `T` is of presheaf type if and only if for every
  geometric formula `φ` in context `n` there are a `u`-small family of `T`-irreducible formulae
  `ψᵢ` and morphisms `[[ψᵢ]] → [[φ]]` forming an epimorphic family, that is, `φ` is covered by
  `T`-irreducible formulae (Caramello 2012a, Corollary 3.15, whose collection `ℱ` is the one of
  all `T`-irreducible formulae: condition (ii) is then the definition). Route, "if": the `[[φ]]`
  separate `E` (2.4), so if each is covered by irreducible objects, the irreducible objects
  separate `E`, and they form a `u`-small family up to isomorphism, as the subobjects of the
  `U.pow n` do. By GrothendieckTopoi 6.6 (b) they are connected nonempty projective objects, so `E`
  is a presheaf topos by GrothendieckTopoi 6.5 (Roos), and transporting `U` along an equivalence
  with the presheaves on a small category, for the trivial topology, shows that `T` is of presheaf
  type (2.1, 1.4). "Only if": `E` is then a presheaf topos, so by GrothendieckTopoi 6.5 and 6.6 (b)
  its irreducible objects separate it, and the family of all maps from irreducible objects into
  `[[φ]]` is epimorphic. Each irreducible object `I` is isomorphic to some `[[ψ]]` with `ψ`
  `T`-irreducible: the family of all maps `[[χ]] → I` is epimorphic (2.4), so one of them is split
  epimorphic, which makes `I` a retract of some `[[χ]]`, hence a subobject of `U.pow n`, hence some
  `[[ψ]]` (2.4).
- (a′) `exists_isClassifyingSite_fpModel`: for `T` of presheaf type, `FPModel T` is essentially
  small, and a small category `C ≌ (FPModel T)ᵒᵖ` with the trivial topology classifies `T`, the
  presheaf underlying the generic model being `N ↦ N.carrier` on `FPModel T`
  (`SetModel.forget`), along the equivalence. Prove also that the interpretation of a geometric
  formula `φ` is then `N ↦ [[φ]]_N`, the set of the assignments in `N` that realize `φ`, and that a
  set-model presented by a formula is finitely presentable (Caramello 2017, « Lattices of
  theories », Remark 14.2, p. 65, and §14.2, p. 68, in the numbering of arXiv:0905.0299v1;
  Caramello 2012a, §4, p. 189, for the generic model). Route: let `(C₀, ⊥, U₀)` classify `T`. By 2.1
  for the one-point site and Diaconescu's theorem (GrothendieckTopoi 2.5), the set-models and their
  homomorphisms are the flat functors on `C₀` and their transformations, that is `Ind` of `C₀ᵒᵖ`
  (LocallyPresentableCategories 1.5; Caramello 2017, Remark 14.2). The finitely presentable objects
  of `Ind (C₀ᵒᵖ)` are the retracts of the representables, since the identity of such an object
  factors through a stage of its presentation as a filtered colimit of representables. So
  `(FPModel T)ᵒᵖ` is the Cauchy completion of `C₀`, which is small, and `FPModel T` is idempotent
  complete (Borceux–Dejean 1986, Theorem 1 (2), p. 134). Presheaves on `C₀` and on its Cauchy
  completion are equivalent (Borceux–Dejean 1986, Theorem 1 (4), p. 134), and the equivalence sends
  an object `P` to the functor `N ↦` the stalk of `P` at the point `N`. For `P = U₀.carrier` the
  stalk is `N.carrier` (2.1 (i)), and for `P = [[φ]]` it is `[[φ]]_N`, since inverse images preserve
  the interpretation of formulae (1.4). The functor `N ↦ [[φ]]_N` preserves filtered colimits of
  set-models, which are computed on the underlying sets, because a geometric formula is realized at
  an assignment of a filtered colimit exactly when it is realized at one stage (induction on `φ`);
  so, by the Yoneda lemma, a model presented by `φ` represents it and is finitely presentable.
- (b) `GeometricFormula.isIrreducible_iff_exists_presentedBy`: for `T` of presheaf type, a
  geometric formula is `T`-irreducible if and only if it presents a set-model of `T` (Caramello
  2012a, Theorem 4.1 (i) for "presents implies irreducible" and Theorem 4.3 (ii) for the converse).
  Route: by 2.4 and (a′), `E` is equivalent to `[FPModel T, Type u]`, under which `[[φ]]` is the
  functor `N ↦ [[φ]]_N` on finitely presentable models. If `φ` presents `M`, then `M` is finitely
  presentable (a′) and `[[φ]]` is the representable `Hom(M, −)`, which is irreducible by
  GrothendieckTopoi 6.6 (b): a representable of a presheaf topos is projective and preserves
  coproducts, by the Yoneda lemma. Conversely an irreducible `[[φ]]` is a connected nonempty
  projective object of a presheaf topos (GrothendieckTopoi 6.6 (b)), hence a retract of a
  representable (GrothendieckTopoi 6.5), hence representable because `FPModel T` is idempotent
  complete (a′), say `[[φ]] ≅ Hom(M, −)` on `FPModel T`, with `M` finitely presentable. Both sides
  preserve filtered colimits ((a′), and `M` is finitely presentable) and every set-model is a
  filtered colimit of finitely presentable ones, so the isomorphism holds on all set-models; by the
  Yoneda lemma `M` is presented by `φ`, with the image of `𝟙_M` as generators (Caramello 2017,
  « Lattices of theories », §14.2: the functor `N ↦ [[φ]]_N` is representable exactly when a model
  is presented by `φ`).
- (c) `exists_isPresentedBy_irreducible_of_isFinitelyPresentable`: for `T` of presheaf type,
  every finitely presentable set-model is presented by a `T`-irreducible formula (Caramello 2012a,
  Theorem 4.3 (i)). Route: by (a′), `Hom(M, −)` is a representable of `[FPModel T, Type u]`, hence
  irreducible (GrothendieckTopoi 6.6 (b)), hence isomorphic to some `[[φ]]` with `φ`
  `T`-irreducible, by 2.4, each irreducible object being a retract of some `[[χ]]` as in (a). Then
  `φ` presents `M`, as at the end of the route of (b).
- (d) `nonempty_equivalence_irreducible_fpModel` and `isIdempotentComplete_irreducible`: for `T` of
  presheaf type, the full subcategory of `E` on the objects isomorphic to `[[φ]]` with `φ`
  `T`-irreducible (`irreducibleFormulaObjects`) is equivalent to `(FPModel T)ᵒᵖ` and is
  idempotent complete (Caramello 2012a, Theorem 4.3 and its proof). Route: by (b) and (c) these
  objects are, under (a′), the representables `Hom(M, −)`, `M` finitely presentable, and by the
  Yoneda lemma `Hom(Hom(M, −), Hom(M', −))` is `Hom(M', M)`; they are closed under retracts since
  `FPModel T` is idempotent complete (a′).

For a Horn theory, of presheaf type by 3.1, every Horn formula presents the model of 2.2 (the model
generated by `n` elements subject to the atomic formulae of `φ`), so by (b) it is `T`-irreducible,
and the covering of (a) is the normal form of 2.2 (b).
*Needs:* 1.4, 2.1, 2.2 (b), 2.4, 3.1; GrothendieckTopoi 1.1, 2.5, 6.5, 6.6;
LocallyPresentableCategories 1.5; Mathlib `Sheaf.canonicalTopology`, `Subobject.underlying`,
`Sigma.desc`, `IsFinitelyPresentable`, `IsIdempotentComplete`, `ObjectProperty.FullSubcategory`,
`ObjectProperty.ι`, `FirstOrder.Language.Hom`, `Equivalence.op`, `unopUnop`, `sheafToPresheaf`,
`TypeCat.ofHom`.

**Checks.**

- Theory of objects (3.2), whose set-models are the sets: `(1, ⊤)` presents the one-element set
  (`Hom(1, N) = N`), `(2, x₀ = x₁)` presents it too, `(2, ⊤)` presents the two-element set, and
  `(0, ⊤)` presents `∅` (`Hom(∅, N)` is a point); all four are irreducible. `(0, ∃ y, ⊤)` is not:
  it would present a set `M` with `Hom(M, ∅) = ∅` and `Hom(M, N)` a point for `N ≠ ∅`, but `M ≠ ∅`
  has at least `2` maps into a two-element `N`. It is covered by `(1, ⊤)` along the projection,
  whose image is `∃ y, ⊤` (2.2 (b)), and the projection is not split: this is the covering of
  (a). The object `[[∃ y, ⊤]]` is a nonzero subobject of the terminal object, hence connected, so
  irreducibility is strictly stronger than connectedness: it needs projectivity.
- In the same theory `(0, ⊥)` is not irreducible: the empty family is epimorphic onto `[[⊥]]`,
  the initial object, and does not contain the identity; it presents no model either, since a
  homomorphism `M → 1` into the one-point model exists while `[[⊥]]_1 = ∅`.
- Intervals (3.4): `(1, ⊤)` presents the three-element interval `{0 < x < 1}`, with `Hom` into
  an interval `N` the points of `N`, and `(0, ⊤)` presents `{0 < 1}`; under 3.4 they are the
  representables of `⦋1⦌` and `⦋0⦌`, so `[[(1, ⊤)]] = Δ[1]` and `[[(0, ⊤)]] = Δ[0]` are irreducible.
  The formula `x₀ = 0 ∨ x₀ = 1` in context `1` is interpreted by `∂Δ[1] = Δ[0] ⊔ Δ[0]`, a
  coproduct of two irreducible objects that is not connected, hence not irreducible: the family
  of the two vertices `Δ[0] → ∂Δ[1]` is epimorphic onto it and has no split member.
- Torsors (3.3): `(1, ⊤)` presents the left `G`-set `G` (`Hom(G, N) = N`, evaluating at `1`) and is
  irreducible; every torsor in `Type u` is isomorphic to `G`, so `FPModel (torsorTheory G)` has
  one object up to isomorphism, as the presheaf topos `B G` has one irreducible object
  (GrothendieckTopoi 6.6, Checks).
- Commutative rings (4.1): `(1, x₀ * x₀ = x₀)` presents `ℤ[x]/(x² − x) ≅ ℤ × ℤ` and is irreducible,
  and `(1, (1 + 1) * x₀ = 1)` presents `ℤ[1/2]`; `ℚ` is a set-model of `commRingTheory` that is not
  finitely generated as a ring, hence not finitely presentable, and by (a′) no formula presents it.
- Idempotents (a′): for the Horn theory of a unary function symbol `f` with the axiom
  `⊤ ⊢ f (f x) = f x`, the set-models are the sets with an idempotent endomorphism. `(1, ⊤)`
  presents `{x, f x}` (a homomorphism out of it is the image of `x`), whose endomorphisms are `𝟙`
  and `x ↦ f x`, and `(1, f x = x)` presents the one-point set, a retract of `{x, f x}` along
  `x ↦ f x`. Both formulae are irreducible (b). `(n, ⊤)` presents the free model on `n` generators,
  which has `2n` elements, so no free model has one element. The idempotent `x ↦ f x` of
  `{x, f x}` therefore splits in `FPModel T`, through the one-point set, but not in its full
  subcategory on the free models; `FPModel T` is idempotent complete, as (a′) requires.
- Degenerate and trivial cases of (a′): for `T = {⊤ ⊢ bot}` there is no set-model, so `FPModel T`
  is the empty category and its presheaf topos is the degenerate topos, the classifying topos of
  `T` (2.1, Checks). For the theory of objects (3.2), `FPModel T` is the finite sets, `C` is
  equivalent to `FintypeCat.Skeleton.{u}ᵒᵖ`, the site of 3.2, and `N ↦ N.carrier` is the inclusion
  of finite sets into sets, the generic object.

### 3.6 Quotients of a theory of presheaf type

Let `T` be of presheaf type. By 3.5 (a′) its classifying topos is the presheaf topos
`[FPModel T, Type u]`, of which `(FPModel T)ᵒᵖ` with the trivial topology is a site, up to a small
category equivalent to it (Caramello 2017, « Lattices of theories », Remark 14.2 in the numbering
of arXiv:0905.0299v1); by 2.5 the topologies `J` on it, transported along that equivalence,
correspond to the quotients of `T`. A sieve on
`op c` in `(FPModel T)ᵒᵖ` is a cosieve on `c`: a family of homomorphisms `c → d`, closed under
precomposition by homomorphisms out of `d`. A set-model `M` of `T` is *`J`-homogeneous*
(`SetModel.IsHomogeneous J M`) when for every `c`, every `J`-covering sieve `S` on `op c` and every
homomorphism `y : c → M` there are `f : c → d` in `S` and `u : d → M` with `y = u ∘ f` (Caramello
2012b, Corollary 4.9 in the numbering of arXiv:0805.2187v1, the case of `Set` of its Theorem 4.8;
its Definition 4.4 is the form in an arbitrary sheaf topos, with epimorphic families of objects of
homomorphisms). Prove:

- (a) `exists_quotient_isSetModel_iff_isHomogeneous`: for every topology `J` on `(FPModel T)ᵒᵖ`
  there is a quotient `T ⊆ T'` whose set-models are exactly the `J`-homogeneous set-models of `T`,
  and which is classified by `Sh((FPModel T)ᵒᵖ, J)`, that is, by a small category `C` with an
  equivalence `e : C ≌ (FPModel T)ᵒᵖ` and the topology `e.functor.inducedTopology J` (Caramello
  2017, « Lattices of theories », Theorem 14.4; Caramello 2012b, Theorem 4.6). In every
  Grothendieck topos the models of `T'` are the `J`-homogeneous models of `T`. Route: with `C` the
  site of 3.5 (a′), 2.5 (`IsClassifyingSite.exists_quotient_theory`) gives `T'` with
  `(C, e.functor.inducedTopology J)` classifying it, with the sheafified generic model. A model `M`
  of `T` corresponds by Diaconescu's theorem
  (GrothendieckTopoi 2.5) to a flat functor `F_M` on `(FPModel T)ᵒᵖ`, with `F_M ≅ Hom(i(−), M)` (the
  "Yoneda representation", Caramello 2012b, §4), and `M` is a model of `T'` exactly when `F_M` is
  `J`-continuous, that is, sends every `J`-covering sieve to an epimorphic family. In `Set` this is
  the lifting condition: an element `y` of `F_M(c) = Hom(c, M)` lies in the image of a sieve `S`
  exactly when it factors through some `f ∈ S`.
- (b) `isSetModel_iff_isIrreducibleObject`: if `T'` is the quotient of (a), a finitely
  presentable set-model `M` of `T` is a model of `T'` if and only if `op M` is `J`-irreducible
  (GrothendieckTopoi 6.6), that is, the only `J`-covering sieve on `op M` is the maximal one.
  Caramello 2014, Remark 6.27 (i), in the numbering of arXiv:1404.4610v2, states the "only if"
  and "if" under the further hypothesis that `T'` is of presheaf type and its finitely
  presentable models are finitely presentable as `T`-models. Route: if `M` is homogeneous,
  apply the lifting condition to `c = M`, `y = 𝟙_M` and a covering sieve `S` on `op M`: some
  `f : M → d` in `S` has `u : d → M` with `u ∘ f = 𝟙_M`, so the identity of `op M` is
  `f^op ∘ u^op ∈ S`, and `S` is maximal. Conversely, if `op M` is `J`-irreducible, take `c`, a
  covering sieve `S` on `op c` and `y : c → M`; the pullback of `S` along `y^op` is covering on
  `op M`, hence maximal, so `y^op ∈ S`, and `f = y`, `u = 𝟙_M` give `y = u ∘ f`.

The statement of 2.5 (`IsClassifyingSite.exists_quotient_topology`,
`IsClassifyingSite.exists_quotient_theory`) is the general case, for any classifying site; here
the site is the one of 3.5 (a′), the quotient is described by the lifting condition, and its
finitely presentable models by (b).
*Needs:* 2.5, 3.1, 3.5; GrothendieckTopoi 2.5, 6.6; Mathlib `Sieve`, `GrothendieckTopology`,
`IsFinitelyPresentable`, `ObjectProperty.FullSubcategory`.

**Checks.**

- `J = ⊥`, only maximal sieves cover: every model is homogeneous, so `T' = T` (2.5 Check), and
  every object is `J`-irreducible, as (b) requires. For the theory of objects (3.2), whose
  set-models are the sets, let `J` be generated by the empty sieve on `op ∅` (`∅` is the initial
  object of `FPModel T`, so `op ∅` is terminal): stability makes the empty sieve cover every
  object, so `J = ⊤`. No set `M` is homogeneous (take `c = ∅` and the map `∅ → M`: the empty sieve
  has no `f`), so `T'` is inconsistent, as in the 2.5 Check for `J' = ⊤`, and no object is
  irreducible, the empty sieve being covering and not maximal.
- Subsingletons, a quotient of the theory of objects (2.5 Check): let `J` be generated by the
  sieve on `op 2` of the maps `h : 2 → e` with `h 0 = h 1` (those factoring through `2 → 1`). A
  set `M` is homogeneous exactly when each `y : 2 → M` is constant, that is `|M| ≤ 1`. The
  finitely presentable `J`-irreducible sets are `∅` and `1`: for `n ≥ 2` the pullback of the
  generating sieve along `op n → op 2` given by an injection `p : 2 → n` consists of the
  `h : n → e` with `h (p 0) = h (p 1)`, which does not contain `𝟙_n`; on `op 1` the pullback along
  `2 → 1` is maximal, and on `op ∅` no map `2 → ∅` exists, so every covering sieve is maximal.
  These are the finitely presentable subsingletons, as (b) asserts.
- Commutative rings and local rings: for the Zariski topology of 4.2 on the opposite of the
  finitely presented rings, a ring `R` is homogeneous for the sieve generated by `A → A[1/f]` and
  `A → A[1/(1 − f)]` exactly when every `y : A → R` has `y(f)` or `y(1 − f)` invertible, since `y`
  factors through `A[1/f]` exactly when `y(f)` is invertible. For `A = ℤ[x]` this is the second
  axiom of `localRingTheory`, and the empty cover of the zero ring excludes `R = 0`, as
  `0 = 1 ⊢ ⊥` does (4.3). By (b) the finitely presented rings that are irreducible are the local
  ones: `ℤ/4` and `ℤ/3` are, `ℤ` is not (the cover `{ℤ → ℤ[1/2], ℤ → ℤ[1/3]}` does not contain
  `𝟙`), and neither is `ℤ/6` (the cover by the localizations away from `3` and from `1 − 3 = 4`,
  which generate the unit ideal).

### Examples

- The set-models of a Horn theory over a small language form a finitely accessible category,
  `Ind` of the finitely presentable models (LocallyPresentableCategories 1.5); for
  `commRingTheory`, the commutative rings are filtered colimits of finitely presented ones, the
  points of the classifying topos of 4.1.
- For a Horn theory, the classifying category of 2.2 is the opposite of the finitely presentable
  set-models, the theory with finite limits of LocallyPresentableCategories 3.1 and 3.5.

### Dependencies

Layers 1–2; GrothendieckTopoi 1.1, 2.5, 6.5, 6.6 (3.5–3.6); LocallyPresentableCategories 1.5 (3.5
and the Examples), 3.1 and 3.5 (Examples only). Within the layer, 3.2 uses 3.1, 3.5 uses 3.1 and
3.6 uses 3.5.

## Layer 4: rings, local rings and the Zariski topos

### 4.1 The classifying topos of commutative rings

Define the structure `FPRing` (a number `n` of generators and a finitely generated ideal of
`MvPolynomial (Fin n) ℤ`), `FPRing.Ring` (the quotient, lifted to `Type u`), the small category
instance on `FPRing` with ring maps as morphisms, `FPRing.forget`, `ringEq` (the equation `t = s`
in three variables) and `commRingTheory` (the eight equations of a commutative ring). Define the
generic ring: `ringOp A f` (the operation of a function symbol `f` on `A.Ring`, through
`FirstOrder.Ring.compatibleRingOfRing`), `forgetPresheaf` (`unopUnop _ ⋙ FPRing.forget`),
`genericRingPresheaf` (carrier `forgetPresheaf`, the operation of `f` at `A` being `ringOp A f`
after the comparisons `piObjIso` and `Types.productIso`, natural because ring maps commute with
`ringOp`) and `genericRing`, its image in `Sheaf ⊥ (Type u)` under `sheafBotEquivalence`. Prove
`finitePresentation_of_isFinitelyPresentable`: a commutative ring that is
`IsFinitelyPresentable.{u}` in `CommRingCat.{u}` is a finitely presented `ℤ`-algebra, the
converse of `CommRingCat.isFinitelyPresentable_under` over `ℤ` (a finitely presentable ring is a
retract of a finitely presented one through which its identity factors). Prove
`isClassifyingSite_genericRing`: `(FPRing.{u}ᵒᵖ, ⊥, genericRing)` classifies commutative rings
(Mac Lane–Moerdijk, VIII.5, pp. 437–445, with Proposition 5.1). Route: 3.1, through 2.2 for
`commRingTheory`: its classifying category is equivalent to `FPRing.{u}ᵒᵖ`, `(n, φ)` going to
`ℤ[x₀, …, xₙ₋₁]` modulo the equations of `φ`, and its morphisms to the ring maps; the
representable of `(1, top)` goes to the forgetful functor, with the operations of the terms
`x₀ + x₁`, `x₀ * x₁`, … , which are those of `genericRing`. The finitely presented rings are the
finitely presentable set-models (`CommRingCat.isFinitelyPresentable_hom` and
`finitePresentation_of_isFinitelyPresentable`), and they form an essentially small category
(`essentiallySmall_of_le`), of which `FPRing.{u}` is a small model.
*Needs:* 2.1, 2.2, 3.1; Mathlib `MvPolynomial`, `Ideal.FG`, `FirstOrder.Language.ring`,
`FirstOrder.Ring.compatibleRingOfRing`, `piObjIso`, `piObjIso_hom_comp_π`, `Types.productIso`,
`NatTrans.naturality_apply`, `sheafBotEquivalence`, `IsFinitelyPresentable`,
`Algebra.FinitePresentation`, `CommRingCat.isFinitelyPresentable_under`,
`CommRingCat.isFinitelyPresentable_hom`, `essentiallySmall_of_le`.

**Checks.**

- `⟨0, ⊥, _⟩` presents `ℤ`, the initial object of `FPRing` (one ring map to every ring);
  `⟨0, ⊤, _⟩` presents the zero ring, the terminal object; `⟨1, ⊥, _⟩` presents `ℤ[X]`, and the
  forgetful functor is represented by it, `Hom(ℤ[X], A) ≅ A`.
- `ℤ` satisfies the eight equations; the ring of `2 × 2` integer matrices fails
  `ringEq (x * y) (y * x)` (for the two elementary matrices `E₁₂`, `E₂₁`), so the commutativity
  axiom is not decorative.
- The site is the opposite of `FPRing`: presheaves on `FPRing.{u}ᵒᵖ` are covariant functors on
  rings, and `unopUnop _ ⋙ FPRing.forget` is one of them; presheaves on `FPRing` itself would be
  contravariant and the forgetful functor would not be among them.
- The operations of `genericRing` are those of each `A.Ring`, not only its carrier: transporting
  them along the natural bijection `x ↦ x + 1` of the forgetful functor (natural since ring maps
  preserve `1`) gives another commutative ring object on the same presheaf, with zero `1` and
  addition `(a, b) ↦ a + b - 1` at `ℤ`, which pinning the carrier alone would not exclude.

### 4.2 The Zariski topology

Define `zariskiCovers A` (the sieves on `A : FPRing.{u}ᵒᵖ` containing, for each `f` of a finite
family generating the unit ideal, a map `A ⟶ B` making `B` a localization of `A` away from `f`)
and `zariskiTopology`, the smallest Grothendieck topology containing them. That the forgetful
functor is a Zariski sheaf is Tau Ceti's `GrothendieckTopology.isSheaf_Γ` for Mathlib's
`Scheme.zariskiTopology` (Mac Lane–Moerdijk, VIII.6, pp. 445–450, on this site).
`isSheaf_forget_zariskiTopology` records it on `FPRing.{u}ᵒᵖ`, the form 4.3 uses; it is the
adapter. Route: `A ↦ Spec A` sends a generating family of `zariskiCovers A`
to a Zariski covering `{Spec A[1/fᵢ] → Spec A}` of the big site, and the forgetful functor to the
restriction of `𝔾_a`; the pullback of a generating family along `A ⟶ A'` contains the
localizations of `A'` away from the images of the `fᵢ`, which still generate the unit ideal, so it
suffices to check the sheaf condition on the generating families, where it is that of `𝔾_a`.
*Needs:* 4.1; Tau Ceti `CategoryTheory.GrothendieckTopology.isSheaf_Γ`; Mathlib
`Scheme.zariskiTopology`, `Scheme.subcanonical_zariskiTopology`, `Scheme.ΓSpecIso`,
`GrothendieckTopology` (complete lattice), `Ideal.span`, `IsLocalization.Away`,
`RingHom.toAlgebra`, `Presheaf.IsSheaf`.

**Checks.**

- The zero ring is covered by the empty sieve (`Ideal.span ∅ = ⊥ = ⊤` there), so a sheaf has a
  one-element value at it; the forgetful functor does, the zero ring having one element.
- `ℤ` is covered by `{ℤ ⟶ ℤ[1/2], ℤ ⟶ ℤ[1/3]}` (`2` and `3` generate `ℤ`), and `ℤ` is the
  equalizer of `ℤ[1/2] × ℤ[1/3] ⇉ ℤ[1/6]`.
- `{ℤ ⟶ ℤ[1/2]}` alone is not a Zariski cover: if it were, the sheaf condition for the forgetful
  functor would make `ℤ ⟶ ℤ[1/2]` bijective, contradicting 4.2.

### 4.3 Local rings and the Zariski topos

Define `localRingTheory`: `commRingTheory` with `0 = 1 ⊢ bot` and
`⊤ ⊢ (∃ y, x * y = 1) ∨ (∃ y, (1 + -x) * y = 1)`. Prove `isClassifyingSite_localRingTheory`: the
sheafified generic ring
`genericRing.map (sheafToPresheaf ⊥ (Type u) ⋙ presheafToSheaf zariskiTopology (Type u))`
classifies local rings on `(FPRing.{u}ᵒᵖ, zariskiTopology)` (Mac Lane–Moerdijk, VIII.6,
pp. 445–450; Hakim 1972, Chapitre III, §3, pp. 41–49). By 4.2 the sheafified carrier is again the
forgetful functor. Route: 2.5 with `T = commRingTheory`,
`T' = localRingTheory`; the sieves of the two new axioms, on the generic ring, are the empty
sieve on the zero ring and the cover `{A ⟶ A[1/x], A ⟶ A[1/(1 - x)]}`, which generate
`zariskiTopology` (every Zariski cover is reached from those binary ones by the transitivity
axiom, by induction on the size of the family generating the unit ideal).
*Needs:* 2.5, 4.1, 4.2; Mathlib `sheafToPresheaf`, `presheafToSheaf`.

**Checks.**

- `ℤ` is not local: at `x = 3`, neither `3` nor `1 - 3 = -2` is invertible; `ℤ/4` and the
  localization `ℤ_(2)` are; `ℤ/6` is not (`x = 3`: `3` and `-2 = 4` are not units).
- The zero ring satisfies the second axiom (`0 * 0 = 1` there), so `0 = 1 ⊢ bot` is what
  excludes it; in `zariskiTopology` it is the empty cover of the zero ring (4.2, first Check).
- The generic local ring is local internally, not globally: its value at `ℤ` is `ℤ`, not local
  (first Check), and the disjunction holds only on the cover `{ℤ[1/x], ℤ[1/(1 - x)]}` (for
  `x = 3`, `ℤ[1/3]` and `ℤ[1/(-2)]`).

### Examples

- The points of the Zariski topos are the local rings (Layer 2, Examples), and the stalk of the
  forgetful functor at the point of a local ring `R` is `R`.
- For a scheme `X`, the structure sheaf is a local ring in `Sh(X)`, the image of the generic local
  ring under the geometric morphism `Sh(X) → Sh(FPRing.{u}ᵒᵖ, zariskiTopology)` it classifies.

### Dependencies

Layers 1–3. Within the layer, 4.2 uses 4.1 and 4.3 uses 4.1 and 4.2.

## Downstream consumers

No roadmap on main or in the open pull requests cites ClassifyingTopoi. GrothendieckTopoi
(Scope and ownership, Out of scope) and LocallyPresentableCategories (Scope and ownership) name
classifying topoi of geometric theories as outside their scope; AdicSpacesPartIV describes the
étale topos of a field as the classifying topos of its Galois group, an example of 3.3 for a
profinite group with continuous actions, which this roadmap does not treat.

## Research context

Grothendieck's 1973 Buffalo lectures on topoi treated classifying topoi as a programme: every
geometric theory should have a topos whose points are its models, and constructions on theories
should be constructions on topoi. The duality of 2.5 reverses order: ordered by inclusion of
axioms, the quotients of a theory form the opposite of the coHeyting algebra of subtopoi of its
classifying topos, hence a Heyting algebra (Caramello 2017, « Lattices of theories », Theorem 5.1,
p. 37 in the numbering of arXiv:0905.0299v1), and Caramello's method of topos-theoretic bridges
transfers properties of a classifying topos presented by two sites into properties of the two
theories. Open questions there concern which invariants of topoi admit syntactic
characterizations for arbitrary geometric theories, and the description of the theories of presheaf
type beyond the criteria known for cartesian theories.

## References

- S. Mac Lane, I. Moerdijk, *Sheaves in Geometry and Logic: A First Introduction to Topos
  Theory*, Universitext, Springer, 1992. doi:10.1007/978-1-4612-0927-0.
- P. T. Johnstone, *Sketches of an Elephant: A Topos Theory Compendium*, vols. 1–2, Oxford Logic
  Guides 43–44, Oxford University Press, 2002. Zbl 1071.18001, Zbl 1071.18002.
- M. Makkai, G. E. Reyes, *First Order Categorical Logic*, Lecture Notes in Math. 611, Springer,
  1977. doi:10.1007/BFb0066201.
- O. Caramello, *Theories, Sites, Toposes: Relating and Studying Mathematical Theories through
  Topos-Theoretic 'Bridges'*, Oxford University Press, 2017.
  doi:10.1093/oso/9780198758914.001.0001. Its chapter « Lattices of theories » is
  arXiv:0905.0299 (numbering of arXiv version 1).
- F. Borceux, D. Dejean, « Cauchy completion in category theory », *Cahiers Topologie Géom.
  Différentielle Catég.* 27 (1986), no. 2, 133–146. Numdam: CTGDC_1986__27_2_133_0.
- M. Hakim, *Topos annelés et schémas relatifs*, Ergeb. Math. Grenzgeb. 64, Springer, 1972.
- I. Moerdijk, *Classifying Spaces and Classifying Topoi*, Lecture Notes in Math. 1616, Springer,
  1995. doi:10.1007/BFb0094441.
- A. Joyal, M. Tierney, *An Extension of the Galois Theory of Grothendieck*, Mem. Amer. Math. Soc.
  51 (1984), no. 309. doi:10.1090/memo/0309.
- O. Caramello, « Syntactic characterizations of properties of classifying toposes », *Theory and
  Applications of Categories* 26 (2012), no. 6, 176–193 (cited as Caramello 2012a): §3 (Definition
  3.1, Lemma 3.2, Theorem 3.13, Corollary 3.15) and §4 (Theorems 4.1 and 4.3).
- O. Caramello, « Yoneda representations of flat functors and classifying toposes », *Theory and
  Applications of Categories* 26 (2012), no. 21, 538–553, arXiv:0805.2187 (cited as Caramello
  2012b, in the numbering of arXiv version 1): §4 (Definition 4.4, Theorems 4.6 and 4.8,
  Corollary 4.9).
- O. Caramello, « Extensions of flat functors and theories of presheaf type », arXiv:1404.4610
  (cited as Caramello 2014, in the numbering of arXiv version 2): §6.4.1 (Remark 6.27).
