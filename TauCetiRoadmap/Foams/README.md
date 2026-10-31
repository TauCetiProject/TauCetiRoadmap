# Foams

Develop gl(N) foams as used in the combinatorial construction of gl(N) link
homology, organized into monoidal 2-categories with compatible gradings,
spatial duality, graphical calculus and a foam canopolis. Construct the
corresponding oriented and unoriented Bar-Natan structures. The gl(N)
construction follows [Robert–Wagner](https://arxiv.org/abs/1702.04140) for foam
evaluation and then [Goertz–Marino–Wedrich](https://arxiv.org/abs/2602.11120)
for the construction of monoidal 2-categories. Carry a degree-zero unit
σ recording the trace normalization. The default is σ=1, the sphere-trace
convention of Ehrig–Tubbenhauer–Wedrich; σ=−1 recovers Robert–Wagner.

This roadmap is intended as one of four roadmaps aimed at formalizing the
functoriality of type A link homology:

1. Web calculi and quantum-group representation theory.
2. Foam evaluation and monoidal 2-categories, developed here.
3. Geometric topology of webs, foams, link cobordisms and their movie presentations.
4. Link homology and its functoriality, integrating the preceding constructions.

Begin with unlabelled abstract prefoams and their category, then labelling
systems and decoration algebras in the generality of Goertz–Marino–Wedrich.
Construct gl(N) foam evaluation following Robert–Wagner, and oriented and
unoriented Bar-Natan evaluations from commutative Frobenius algebras.
Develop the associated state spaces and the gl(N) progressive subcategory.

A trivalent web is an oriented graph; its prefoams are surfaces with seams
and singular vertices giving cobordisms between webs. Nilvalent webs have
no vertices, and their prefoams have no seams or singular vertices. Develop
both oriented and unoriented nilvalent versions. Labels and decorations are
added after these unlabelled structures are defined. An evaluation assigns
a scalar to a closed decorated foam. The universal construction turns this
evaluation into modules of states for webs by quotienting fillings by all
closing tests. The higher-category structures organize the resulting maps
under stacking, side-by-side placement and insertion into larger diagrams.

This roadmap owns the raw web and boundary theory needed for its constructions.
The web-calculus component consumes that theory and adds skein quotients and
representation comparisons; no quantum-group representation theorem is a
prerequisite here.

Define closed abstract webs, abstract foams with a specified boundary web,
and closed foams as the empty-boundary case. Construct the higher category
from state spaces of closures, following
[Goertz–Marino–Wedrich, Monoidal 2-categories from foam evaluation](https://arxiv.org/abs/2602.11120).
Interpret elementary foam expressions directly by abstract fillings of closures
and their universal-construction classes.

Define abstract webs and foams without a planarity restriction. Layer 2
introduces a combinatorial planarity test for the web objects on which to
prove **decomposition into shifted empty webs**: every such web is isomorphic
to a finite direct sum of grading shifts of the empty web in the evaluated
category. This is property (A) of Goertz–Marino–Wedrich. Retain all admissible
abstract foams between these objects. These decompositions give strong
monoidality: disjoint union of webs corresponds to tensor product of state
modules by an isomorphism.

The mathematical definitions, generality and theorem statements below are the
specification. File boundaries and Lean encodings are implementation choices.
The companion [Suggested.lean](Suggested.lean) prototypes the closed webs,
labelling data, boundary words and planar generator words of Layers 0 and 4, the
universal construction of Layer 2 and the semistrict structure of Layer 3. It is
nonbinding and does not exhaust the roadmap. Suggested home:
`TauCeti/KnotTheory/Foam/`, beside `TauCeti/KnotTheory/Khovanov/`, with the
foam-independent structures of Layers 2–3 under `TauCeti/CategoryTheory/`.

## Scope and completion criteria

The roadmap supplies all of the following, including maps, naturality, transport,
and calculation lemmas for the objects it introduces.

1. The unlabelled web and prefoam category; general labelling data with a
   decoration algebra for each label; labelled prefoams and their linearization;
   and boundary words, web expressions and closures.
2. Integral equivariant Robert–Wagner evaluation, abstract state modules and
   explicit decomposition maps for compatibly planar objects, with scalar
   specializations from the integral model,
   including the Frobenius algebras associated to labeled circles. Also
   construct the nilvalent evaluations and state spaces from a commutative
   Frobenius algebra, in both orientation conventions.
3. A semistrict monoidal 2-category interface extending Mathlib's bicategory
   vocabulary, compatible local enrichment over a symmetric monoidal category,
   and concrete instances over modules and graded modules over graded
   commutative coefficient algebras. Construct formal shifts of 1-morphisms
   and their comparison with graded homs, preserving coefficient actions.
   Apply these to the gl(N) and Bar-Natan categories. Include the
   progressive gl(N) subcategory with a locally fully faithful inclusion.
4. A separate spatial-duality construction in the sense of
   Barrett–Meusburger–Schaumann, with object duals, 1-morphism adjoints and their
   coherence, applied to all three monoidal 2-categories.
5. Typed expressions in explicitly specified abstract elementary foams and
   compilation to 2-morphisms. Define foam relations by equality after compilation,
   including linear combinations and stability under graphical contexts.
   Prove that expressions using only progressive generators span every
   2-morphism module of the progressive subcategory.
6. Canopolis structures: categories of webs and evaluated foams in disks,
   with functorial insertion into disks with holes, in the oriented labelled
   and unoriented nilvalent cases. Prove their comparison with the monoidal
   2-categories and compatibility with compiler relations. For the ordinary
   rank-two Frobenius specialization, compare the state spaces and disk
   categories with KhovanovHomology's circle tensors and formal surface calculus.


The endpoints are the gl(N) foam 2-category and the oriented and unoriented
Bar-Natan monoidal 2-categories of Goertz–Marino–Wedrich, with spatial duality,
a usable graphical calculus and the corresponding canopolis constructions.
The progressive subcategory is a further target for gl(N). The required
Robert–Wagner results are the evaluation, local relations and planar
decomposition theorems specified in Layers 1–2.
Formalize the Robert–Wagner simplification proofs needed for decomposition into shifted empty webs,
including their local polynomial identities, categorical reduction and
terminating planar argument. Their other applications are not required.

[KhovanovHomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/KhovanovHomology/README.md)
owns the ordinary rank-two algebra and circle tensors (K2), formal surface
presentations and their sphere, torus and four-tube quotient (K2), and their
closed evaluation (the evaluation subsection of K3). Consume these and build
the comparisons here; do not reconstruct that formal category. General
Frobenius inputs and evaluated nilvalent categories remain owned here.
The comparison targets are **KH1** (Layer 1, grading), **KH2** (Layer 2,
states), **KH3** (Layer 6, generators) and **KH4** (Layer 7, formal surfaces).
The Khovanov construction has no dependency on these comparisons.

Crossing complexes, their additive/Karoubi completions, Reidemeister chain
equivalences and movie functoriality are outside this roadmap. The ordinary
rank-two theory belongs to KhovanovHomology K3–K7; the type A extensions,
deformations and additional relations used by Ehrig–Tubbenhauer–Wedrich belong
to the link-homology component of the four-roadmap plan. KhovanovHomology's
smooth comparison G and movie theorem K7 are not prerequisites here.
The compiler starts with handcrafted abstract foams and assembles their
2-morphisms by tensor product, horizontal composition and vertical composition.
It requires no embedded foam carrier, geometric gluing, abstraction from
embedded foams or foam-isotopy theorem. Planar web combinatorics remains
necessary for reduction and disk insertion, and is specified below.
Web/representation and full split-K₀ comparisons are intended for the planned
web-calculus companion, using the web data and decomposition results exported
here. Flag-variety cohomology, equivalence with the Queffelec–Rose foam
presentation, and comparisons with Soergel bimodules or categorified quantum
groups are outside this roadmap. Layer 7 compares the concrete foam
constructions; it does not assert an equivalence between arbitrary
canopolises and arbitrary monoidal 2-categories with duals.

## Standing conventions

The table fixes the conventions used throughout; the layers below may restate
them with more detail.

| Item | Convention | Where |
| --- | --- | --- |
| Composition | In Lean, `f ≫ g` is first `f`, then `g`, for morphisms, 1-morphisms and 2-morphisms; in prose `g ∘ f := f ≫ g`. Goertz–Marino–Wedrich compose functionally | All layers |
| Hom-categories | `𝔅(s,t)` is the hom-category from `s` to `t`; Goertz–Marino–Wedrich write `_t𝒞Foam_s`, target first | Layers 4, 7 |
| Monoidal tensor | `⊠` on objects of a semistrict monoidal 2-category, with unit the empty word `∅` in the foam instances; 1- and 2-morphisms are tensored by the left and right tensoring 2-functors, and `f ⊠ g := (s ⊠ g) ≫ (f ⊠ t')` for `f : s → t`, `g : s' → t'`; `⊗` is reserved for the enriching category and modules | Layers 3, 4 |
| Tensorator | `(s ⊠ T) ≫ (S ⊠ t') ≅ (S ⊠ s') ≫ (t ⊠ T)` for `S : s → t`, `T : s' → t'` (Goertz–Marino–Wedrich, Construction 4.28) | Layer 3 |
| Boundary words | `+a = (a,↑)`, `-a = (a,↓)`, with ↑ the direction of composition of 1-morphisms; the dual word `s^#` reverses order and signs | Layer 4 |
| Cups and caps | `cup←_a : ∅ → (+a,-a)`, `cup→_a : ∅ → (-a,+a)`, `cap→_a : (+a,-a) → ∅`, `cap←_a : (-a,+a) → ∅` | Layer 4 |
| Vertex labels | `a+b=c`, where `c` labels the end of odd orientation and `a`, `b` the next two ends in the cyclic order (Goertz–Marino–Wedrich, Definition 3.12) | Layer 0 |
| Labels | Unbounded natural labels: nonnegative `L_ℕ` and positive `L_+`; `NFoam` uses `L_ℕ`, and positive words and webs form its locally full sub-2-category `NFoam_+` | Layers 0, 4 |
| Webs | Interval edges (arcs, including arcs with both ends at one vertex) and vertex-free circles; Goertz–Marino–Wedrich's "loops" are circles | Layer 0 |
| Orientation marking | Where oriented and unoriented versions both exist, a bare name denotes the unoriented one and an arrow (prose) or the prefix `Oriented` (Lean) the oriented one | Layers 0, 1, 2, 4 |
| Equivariant ring | `Λ_N = ℤ[e₁,…,e_N]`, `deg eᵢ = 2i`, identified with `ℤ[X₁,…,X_N]^(S_N)` by `eᵢ ↦ eᵢ(X₁,…,X_N)`, `deg X_j = 2` | Standing conventions |
| Normalization | σ is a degree-zero unit; universal ring Λ_N[σ,σ⁻¹]. Default σ=1 (Ehrig–Tubbenhauer–Wedrich); literal Robert–Wagner formulas use σ=−1. The coefficient involution is the identity | Layers 1–2 |
| Coefficients | `𝕜` is a commutative ℤ-graded ring, commutative without signs. In statements about an instance, R is its coefficient ring: `Λ_N` (equivariant gl(N)); a ring with a specified map `Λ_N → R` and degree-zero unit σ, with the construction carried out directly over R (specialized gl(N)); or the base ring of A (Bar-Natan) | Layers 0, 3, 4 |
| Shift | `(M{a})_d = M_(d-a)`; a degree-d 2-morphism `f → g` is a degree-zero map `f → g{-d}`; on hom-categories `f⟦n⟧ = f{-n}`, so it is a `ShiftedHom f g d` | Layers 0, 3 |
| Hom views | `Hom^•(f,g)` (full graded), its pieces `Hom^d(f,g)`, `Hom^0(f,g)` (degree zero) and `Hom^u(f,g)` (ungraded); each statement about 2-morphisms names one | Layer 3 |
| Foam degree | `deg dec(F) - Σ_f k(N-k) χ(f) + Σ_s ((k+l)(N-k-l)+kl) χ(s) - Σ_v ((k+l+h)(N-k-l-h)+kl+lh+kh)` over facets of label k, all seams (also those ending on the boundary) with labels k, l, k+l, and singular vertices; boundary edges and vertices are not summed (Goertz–Marino–Wedrich, formula (3.10), Example 3.39) | Layer 1 |
| 2-hom shift | gl(N): `δ(S,T) = ½(w_N(S)+w_N(T))`, an integer since `w_N(S) = w_N(T)`; Bar-Natan: `δ(S,T) = ½(c(s)+c(t))` | Layer 4 |
| Frobenius degrees | `deg m = deg η = 0`, `deg Δ = -deg ε = 2c`; the circle carries `A{-c}`; A is supported in even degrees before this shift | Layers 0, 1 |
| Ordinary Khovanov specialization | `A = DualNumber R`, `deg 1 = 0`, `deg X = -2`, `c = -1`; the circle `A{1}` has degrees `+1,-1` on `1,X`. Quantum tensor symmetry is unsigned | KH1–KH4 |
| Adjunctions | `unit : 𝟙 ⟶ f ≫ g`, `counit : g ≫ f ⟶ 𝟙`; zip and unzip have degree ab, blister open and blister close degree -ab; in `Hom^0` the adjunctions are `M ⊣ S{-ab}` and `S ⊣ M{ab}` | Layers 5, 6 |
| Axes | `(x, y, z)` = (`⊠`, composition of 1-morphisms, composition of 2-morphisms), Goertz–Marino–Wedrich's axes 0, 1, 2; their 0-axis arrow points left | Layer 4 |
| Empty web and word | Both are written `∅` | Layers 2, 4 |

- The unlabelled category is independent of coefficients. Labelling data use
  a commutative ground ring R and a family of commutative R-algebras; symmetric
  polynomials are the gl(N) instance, not part of the general definition.
- For the gl(N) instance, fix a positive evaluation rank N. Prove the
  Robert–Wagner identities over Λ_N = ℤ[e₁,…,e_N], with deg(eᵢ)=2i (identified
  with ℤ[X₁,…,X_N]^(S_N) by eᵢ ↦ eᵢ(X₁,…,X_N), with deg X_j = 2), then
  construct the unit-normalized family over Λ_N[σ,σ⁻¹] and specialize by
  specified coefficient maps and units. The notation ev_N and 𝓕_N over Λ_N
  denotes σ=1; write ev_(N,σ) and 𝓕_(N,σ) when the parameter varies.
  Likewise NFoam and Can(b) use σ=1 unless a parameter is displayed.
  Reserve ev_(N,RW) for the literal Robert–Wagner formula at σ=−1. No
  field or characteristic-zero hypothesis is imposed on these scalar extensions.
- Develop two natural-label instances: arbitrary strictly positive
  natural-number labels, and arbitrary nonnegative natural-number labels, with
  closed webs `PositiveWeb` and `NonnegativeWeb`. Neither version has an upper
  bound on labels. Positive rank N is a parameter of the gl(N) evaluation, not a
  bound in the underlying definitions. Prove zero-label removal with its effect
  on boundary, decorations, evaluation and state spaces. Specify merge/split
  roles even when labels vanish; they cannot always be recovered from positivity
  or a unique largest label. N-labeled strands retain their orientation and
  determinant information. Prove vanishing under gl(N) evaluation for foams
  containing a facet labeled greater than N, including the corresponding zero
  classes for foams with boundary.
- Boundary labels are ordered and oriented. Web 1-morphisms are diagrammatic data,
  with their raw syntax and structural comparisons defined here. Linear skein
  relations are not equalities of these raw webs: the required local identities
  lift to isomorphisms and direct-sum decompositions in the evaluated foam theory.
- Vertical composition `α ≫ β` means first `α`, then `β`. Distinguish vertical
  composition, horizontal composition and tensor in notation and types. Each
  graphical formula specifies source, target, degree and stacking order.
- The Bar-Natan input is a commutative Frobenius algebra A, finite free over
  a commutative ring R, with multiplication m, unit η, comultiplication Δ,
  trace ε and perfect pairing ε(ab).
  Use the identity involution for the required unoriented instance.
  In the graded version require A to be supported in even degrees:
  `A_(2j+1)=0` for every integer j. This applies before the circle shift
  `A{-c}`; shifted state spaces and 2-homs may have odd degrees.
  Require a finite homogeneous basis for the graded decomposition theorem.
  No rank-two, field or characteristic-zero restriction is imposed.
- Internal integer degree is distinct from the homological degree used in link
  homology. For gl(N), use Robert–Wagner's closed decorated foam degree; for
  Bar-Natan, use the Frobenius grading specified in Layer 1. Specify the
  boundary corrections for fillings and the shifts of closure state modules
  defining 2-homs so that identity foams have degree zero; prove degree
  additivity for all three compositions. Use Tau Ceti's native shift convention
  `(M{a})_d = M_(d-a)`. Distinguish a full graded hom-module, its degree-zero
  part, and the underlying ungraded module. Additive and Karoubi completions for
  link complexes are downstream constructions. The finite sums, shifts and
  retracts used to state the foam decompositions belong here; reuse the existing
  categorical interfaces for them.
- Use the canonical category, linear and tensor instances constructed on each
  carrier. Use type synonyms for genuinely different structures rather than
  allowing unrelated instances to replace the intended structure in a theorem.

Here **prefoams** are foam representatives before evaluation relations:
unlabelled, labelled or decorated according to the stage specified. The prefixes
`Labeled` and `Decorated` mark labelled and decorated records, and categories
before evaluation relations are named `…PreFoam`. A **skein quotient** imposes
linear relations between local diagrams. A **closure** joins the boundary ends
of two parallel webs to make the closed web whose state module supplies their
2-morphisms. **Locally graded-linear** means that each space of 2-morphisms is a
graded module over the specified graded coefficient algebra and compositions are
balanced over that algebra and degree-additive. A homogeneous coefficient of
degree r sends degree-s morphisms to degree r+s. When the coefficients are
ungraded, place them in degree zero. Spatial duality, progressive diagrams and
canopolis operations are defined in Layers 5, 4 and 7 respectively. An
**additive closure** adjoins finite direct sums; an **idempotent (Karoubi)
completion** adjoins images of idempotent morphisms. The split Grothendieck
group K₀ records direct-sum decompositions by the relation [X ⊕ Y] = [X] + [Y].
**MOY** abbreviates Murakami–Ohtsuki–Yamada: the planar web relations whose
categorical lifts appear in Layer 2. The notation **gl(N)** specifies the
general linear type A theory with evaluation rank N; it does not impose a bound
on raw labels. **Equivariant** evaluation retains the symmetric parameters eᵢ;
the nonequivariant specialization sends them to zero.

## Library interfaces and dependencies

Use individual imports. The following are foundations, not claims that the whole
foam construction is already implemented.

| Foundation | Existing interface | Work owned here |
| --- | --- | --- |
| 2-categories | `Mathlib.CategoryTheory.Bicategory.Basic`, `Strict.Basic`, `Adjunction.Basic`, `Opposites` | Semistrict tensor, tensorator and spatial duality |
| Ordinary rigid categories | `TauCeti.CategoryTheory.Monoidal.Rigid.Mate`, `Rigid.DualFunctor`, `Monoidal.Opposite` | Reuse explicit-pairing mates, monoidal duality and opposite functors at the ordinary-category level; construct the higher-dimensional duality separately |
| Linear categories | `Mathlib.CategoryTheory.Linear.Basic`, `Linear.LinearFunctor`, `Monoidal.Linear` | Linear hom-categories and bilinear horizontal composition; ordinary `MonoidalLinear` is not a monoidal 2-category |
| Grading | `Mathlib.CategoryTheory.GradedObject`, `GradedObject.Monoidal`, `TauCeti.CategoryTheory.GradedObject.MonObj` | Graded hom-modules, closure shifts and composition; use homogeneous monoid constructors and transport, verifying their tensor/colimit hypotheses |
| Local enrichment | `Mathlib.CategoryTheory.Enriched.Basic`, `Enriched.Ordinary.Basic` | Compatible enrichment of hom-categories, horizontal composition, tensoring and tensorator naturality; distinguish degree-zero underlying categories from full graded homs |
| Graded coefficient modules | `TauCeti.Algebra.Category.GradedModuleCat.Basic`, `Shift`; `TauCeti.LinearAlgebra.TensorProduct.Balanced.Grading.Basic`, `Balanced.Coherence`; `TauCeti.Algebra.Category.GradedModuleCat.BimoduleTensor.Monoidal` | Specialize graded balanced tensor products to modules over a commutative graded algebra, provide the symmetry without signs, and compare with ordinary tensor and shift structures |
| Shifts | `Mathlib.CategoryTheory.Shift.Basic`, `Shift.CommShift`, `Shift.ShiftedHom` | Formal shift completion and shift-compatible higher composition, with graded central coefficient actions and reconstruction |
| Linear algebra | `Finsupp`, `LinearMap`, `Submodule`, module quotients, bilinear forms | Closure pairings, negligible ideals, descent and dual bases |
| Frobenius algebras | [`Coalgebra.IsFrobenius`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/RingTheory/Coalgebra/IsFrobenius.lean), [`LinearMap.IsPerfPair`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/LinearAlgebra/PerfectPairing/Basic.lean) and the [trace-based interface](https://github.com/leanprover-community/mathlib4/pull/42067) | Finite-free commutative-ring trace/coalgebra comparison, dual-basis formulas, even-supported grading and scalar change |
| Ordinary Khovanov algebra and states | `TauCeti.KnotTheory.Khovanov.Frobenius`, `QuantumGrading`, `CircleTensor` | Instantiate the general Frobenius input and compare the nilvalent states with the existing circle tensors; keep the chosen coalgebra and quantum grading |
| Retracts and graded modules | `Mathlib.Algebra.Module.Projective`, `CategoryTheory.Preadditive.Mat`, `CategoryTheory.Idempotents.Karoubi`; `TauCeti.Algebra.Category.GradedModuleCat.Free`, `Projective`; `TauCeti.Algebra.Module.GradedModule.Nakayama` | Instantiate the weighted Λ_N grading, use native graded free/projective modules and bounded-below Nakayama, and prove the integral graded-freeness theorem |
| Quotient descent and scalars | `Mathlib.CategoryTheory.Quotient.Linear`, `LinearAlgebra.Quotient.Bilinear`, `Algebra.Category.ModuleCat.ChangeOfRings` | Verify ideal compatibility, descend foam operations and construct the specified coefficient instances |
| Symmetric polynomials | `Mathlib.RingTheory.MvPolynomial.Symmetric.Defs`, `Eval`, `FundamentalTheorem`, `NewtonIdentities` | Foam decoration algebras, cancellation, traces and quotient bases |
| Schur calculus | `TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Basic`, `Basis`, `Pieri`, `JacobiTrudi` | Apply [diagramSchurPoly](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/Basic.lean) and both complete- and elementary-symmetric [Pieri rules](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/Pieri.lean) to foam calculations |
| Finite maps | `TauCeti.Combinatorics.PermutationTriple.Basic`, `TauCeti.Combinatorics.RibbonGraph.Basic` | Convert web incidence and cyclic orders to permutations; reuse connected-component, face and Euler-characteristic definitions and isomorphism invariance; supply the fixed-rotation planarity criterion and crossing-free presentation comparison |

[PivotalSpherical](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PivotalSpherical/README.md)
owns ordinary pivotal/spherical categories and traces. Consume that design where
an ordinary monoidal category occurs; higher spatial duality is owned here.
Use its Mathlib-compatible duality and trace interfaces. Develop missing
prerequisites under the owning roadmap and adopt Mathlib interfaces when supplied.

Use the [explicit-pairing mate interface](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/CategoryTheory/Monoidal/Rigid/Mate.lean)
when comparing chosen evaluation/coevaluation maps with ordinary rigid-category
duals. Object duals in an ordinary monoidal category and adjunctions between
1-morphisms in a bicategory have different types; the latter use Mathlib's
bicategorical adjunctions. Neither ordinary monoidal duality nor a braided
Drinfeld isomorphism supplies the Barrett–Meusburger–Schaumann spatiality axioms.

| Dependency | Interface consumed here | Comparison or construction owned here |
| --- | --- | --- |
| [KhovanovHomology K1–K2 and K3's closed-evaluation construction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/KhovanovHomology/README.md#k2-the-rank-two-frobenius-object-and-circle-tensors) | Finite planar calculus, rank-two Frobenius algebra and circle tensors; formal surface presentations, their relations and closed evaluation | KH1–KH4: grading, state and generator comparisons, then a formal-to-evaluated disk functor. No link complex, smooth comparison or movie theorem is consumed |
| [PivotalSpherical](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PivotalSpherical/README.md) | Ordinary duality and trace interfaces | Foam trace radicals and the higher spatial duality of Layer 5 |
| [TemperleyLieb, Layers 2, 6–7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c70fe0f61bb20992d659d1fb21d1e24225038c08/TauCetiRoadmap/TemperleyLieb/README.md) | Ordinary monoidal presentations, categorical tensor ideals, linear/monoidal envelopes and quotient descent | Prove the foam ideals satisfy the required laws and construct higher composition/tensorator compatibility; no Temperley–Lieb positivity or fusion-classification hypothesis is imported |
| [SurfaceTopology, Layer 2](https://github.com/mccorvie/TauCetiRoadmap/blob/7f2099ebe4dd3e6388764fc67b57461e890de13f/TauCetiRoadmap/SurfaceTopology/README.md) and the native permutation/ribbon-graph library | Finite maps, their conversions and Euler counts | Translate the specified web cyclic orders, handle vertex-free circles, and prove the combinatorial planarity/presentation comparison. General finite-map lemmas belong with this shared infrastructure |
| [PlanarTopology, Layers 6–7](https://github.com/mccorvie/TauCetiRoadmap/blob/7f2099ebe4dd3e6388764fc67b57461e890de13f/TauCetiRoadmap/PlanarTopology/README.md) | Planar diagram and isotopy interfaces for Layer 7 | Connecting diagrams with boundary profiles and their substitution. This geometric comparison is not needed to decide closed-web planarity |
| [RepresentationTheory/SchurWeyl, Layer 7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md) | General Young-diagram and symmetric-function identities | Foam-specific decoration substitutions, Robert–Wagner signs and decomposition maps |

Closed-web planarity and the finite-map arguments for reduction use permutations
and incidence only. Their interpretation as sphere embeddings belongs to
SurfaceTopology's realization theory and is not a prerequisite here.

## Layer 0: unlabelled prefoams, labelling and linearization

Use Goertz–Marino–Wedrich-style finite records, with indexed boundary
components and incidence occurrences allowing the repeated incidences
permitted by Robert–Wagner. Construct the unlabelled, labelled and linearized
foam-record stages in that order. The Frobenius-algebra and coefficient-module
foundations are independent developments. The underlying records contain
neither labels nor decorations.

### Unlabelled closed webs

Define `ClosedWeb` by finite vertices, oriented interval edges and vertex-free
circles. Record source and target ends separately, including when they meet the
same vertex. Each vertex has three incident ends, a cyclic order and a
merge/split orientation pattern. Include the empty web, isomorphisms, disjoint
union, reversal `W^r` of interval orientations and mirror reversal `W^m` of
cyclic orders. A web without vertices (a nilvalent web) consists only of
vertex-free circles.

### Unlabelled prefoams with specified boundary

For an unlabelled closed web W, define `FoamWithBoundary W` by:

1. Finite interior vertices and oriented interval seams with ends at interior
   or boundary vertices, together with vertex-free circular seams. Boundary
   vertices and edges are identified with those of W.
2. Finite facets, each with a genus and an indexed family of boundary
   components.
3. For each component, a nonempty cyclic word in signed interval seams and
   boundary edges, or a singleton circular seam or boundary circle. Signs
   record traversal with or against an interval's orientation; consecutive
   ends match. Words are taken up to rotation, not reversal. Retain letter
   and corner occurrences, including repeated words on distinct components.
   Each circular occurrence traverses its seam once.
4. At each seam, three sheet occurrences with a cyclic order and compatible
   orientation roles. At each interior vertex, four seam-end occurrences
   and six corners forming the prescribed oriented tetrahedral link.
   These are incidence and orientation conditions, independent of labels.
5. At each boundary vertex, one seam end; at each boundary edge, one
   facet-boundary occurrence. Boundary interval edges occur positively,
   and the induced directions and cyclic orders agree with W.

Allow repeated global facet, seam and vertex incidence when these local
conditions hold. Facet orientation is encoded by the boundary words and
seam roles; closed facets are recorded by genus without a redundant flag.
Include the oriented **nilvalent** case: no seams or singular
vertices, and boundary a union of circles.

Define `ClosedFoam := FoamWithBoundary empty`.
An unlabelled prefoam U→V has boundary `V ⊔ U^r`. Isomorphisms preserve
all incidence, orientation, genus and specified-boundary data.

### The unlabelled prefoam category

Construct cylinders and gluing along whole boundary webs. Prove preservation of
the local conditions, associativity up to boundary-preserving isomorphism and
the cylinder unit laws, tracking genus by Euler characteristic. On isomorphism
classes this gives an ordinary symmetric monoidal category `PreFoam`, with
disjoint union as tensor and the empty web as unit. Construct it before
introducing a coefficient ring, labelling or linearization. Its nilvalent
prefoams form a non-full subcategory `NilPreFoam^→`.

### Unoriented nilvalent prefoams

Add a separate finite combinatorial model `NilPreFoam` with unoriented boundary
circles. Record connected surface type, boundary-component indices and relative
boundary-attachment information: an orientable component has a genus; a
nonorientable component has a positive even crosscap number. Here a crosscap is
a projective-plane summand in the surface classification. Gluing must track
orientation-reversing attachments, not just genus. Closed prefoams again have
empty boundary.

This models the category generated by orientable cobordisms in
[Goertz–Wedrich](https://arxiv.org/abs/2511.19373), Lemma 8 and Proposition 10.
It includes Klein bottles but excludes a single Möbius band. Prove closure,
category laws, a finite presentation and the orientation-forgetting functor
from the oriented nilvalent category. Do this before labelling and
linearization; no embedded surface carrier is required.

### Labelling data and labelled prefoams

For a commutative ring R, define a trivalent **labelling datum** L as in
Goertz–Marino–Wedrich: a semigroup of labels with associative operation written
`+`, and a commutative R-algebra `Dec(a)` for each label a. The label operation
need not be commutative. If there is a neutral label 0, include `Dec(0) ≅ R`.
For either nilvalent version, only a set of labels and its family of commutative
R-algebras are required. The Bar-Natan datum has a single label with decoration
algebra A. Add compatible gradings when used: on each `Dec(a)`, and integer
weights, depending on the labels, for facets, seams and singular vertices.

A labelled web (`LabeledClosedWeb L.Label`) assigns labels to its interval edges
and circles, satisfying the ordered equation `a+b=c` at each merge/split vertex,
where c labels the end whose orientation differs from the other two and a, b
label the next two ends in the cyclic order (Goertz–Marino–Wedrich, Definition
3.12). A labelled prefoam (`LabeledFoamWithBoundary L W`; closed case
`LabeledClosedFoam L`) assigns labels to facets, restricting to the specified
boundary labels. At a trivalent seam require `a+b=c` in the order determined by
its incidence and orientation roles. Impose Goertz–Marino–Wedrich's two ordered
associativity configurations at singular vertices. Retain the role data when
labels coincide or include 0; it is not inferred from numerical size.

Construct the category `LabeledPreFoam L` of labelled, undecorated prefoams and
its forgetful functor to `PreFoam`. Gluing joins only facets of the same label.
Closed labelled prefoams are again the empty-boundary case.

### Decorations and linearization

A decorated representative (`DecoratedFoamWithBoundary L W`; closed case
`DecoratedClosedFoam L`) assigns an element of `Dec(a)` to each facet of label
a. For a fixed labelled prefoam F, the decoration module is `⊗_(f ∈ Facets(F),
R) Dec(label(f))`; individual assignments give pure tensors. Form hom-modules
from these modules, identifying isomorphic labelled records via the induced
permutation and transport of their tensor factors. Equivalently, impose
facet-decoration multilinearity and isomorphism transport on formal R-linear
combinations of decorated representatives.

Lift gluing by multiplying decorations in Dec(a) when a-labelled facets join;
identity facets carry 1. Prove bilinearity and the symmetric monoidal category
laws, obtaining `LinearPreFoam L`. No maps between decoration algebras of
different labels are required by gluing. Evaluation relations are imposed
only later. The ordinary unlabelled and labelled categories remain separate
from this linear category.

### The gl(N) labelling instances

Instantiate L with either positive or nonnegative natural labels under addition
(the data `L_+` and `L_ℕ`) and `Dec_R(a) = R[x₁,…,x_a]^{S_a}`, first for R=ℤ and
then for R=Λ_N. Compare the latter decoration algebras with extension of scalars
from ℤ. Neither label semigroup has an upper bound; N enters the evaluation.
Construct the positive inclusion and bounded subtheories of these instances.

Construct zero-label erasure with explicit local rules. Smooth the bivalent
point left by an (a,0,a) web vertex and remove all-zero vertices. For foams,
remove zero facets and join the surviving sheets, handling every zero
pattern in a,b,c,a+b,b+c,a+b+c. Track circles created and changes of genus
and boundary components. Since `Dec_R(0)=R`, extract decorations of deleted
facets as scalar factors. Prove compatibility with boundary and raw gluing
here; erasure does not identify unreduced records. Layer 1 proves evaluation
invariance, and Layer 2 constructs the state-space and evaluated-category
comparisons.

### Frobenius algebra foundations

For a commutative ring R and a finite free commutative R-algebra A, a
Frobenius trace is an R-linear map ε such that `a ↦ (b ↦ ε(ab))` is an
isomorphism `A ≅ Hom_R(A,R)`. Use the native perfect-pairing and
`Coalgebra.IsFrobenius` interfaces. From a basis and its ε-dual basis,
construct Δ, prove independence of the basis, and prove the counit,
coassociativity and Frobenius identities. Compare this trace presentation
with a coalgebra structure having counit ε and satisfying those identities.

Supply transport by trace-preserving algebra isomorphisms, tensor products,
scalar extension and the dual-basis and handle identities used below.
Develop any missing finite-free commutative-ring comparison here, following
the trace-based interface cited above; a field-only construction does not
supply this result. In the graded version require even support,
`deg(m)=deg(η)=0` and `deg(Δ)=-deg(ε)=2c` for an integer c.
Prove compatibility of the comparisons and scalar extensions with those
gradings whenever the target also satisfies
these hypotheses. Finite projectivity alone does not supply the homogeneous
basis required for circle decompositions.

For the ordinary rank-two instance, consume KhovanovHomology K2's native
`DualNumber R` carrier, chosen coalgebra, perfect trace pairing and base-change
comparison. Prove that the coproduct reconstructed from its trace by this
general interface equals the chosen Khovanov coproduct. This specialization
does not replace the finite-free theory for general A.

### Web presentations and reduction coefficients

Supply ordered signed boundary words, crossing-free cups, caps and merge/split
expressions (the raw syntax `WebExpr s t` from a word s to a word t), their
finite-incidence interpretation and closures `Cl(S,T)` of parallel expressions
or planar generator words S, T. Use the ordered label operation in trivalent
generators; Layer 4 uses the natural-label instance. Export the raw syntax and
its structural diagram quotient `WebDiagram s t` separately from any linear
skein quotient.

For the gl(N) reductions, use integral Laurent polynomials in q for quantum
integers `[n] = q^(1−n) + q^(3−n) + … + q^(n−1)`, n ≥ 0, and binomial
coefficients recording shifts and multiplicities. Prove the identities needed in
Layer 2, keeping this variable separate from the equivariant parameters.

### Coefficient modules, tensor products and ordinary grading shifts

Supply the coefficient foundations used by evaluation and reconstruction. Let 𝕜
be a commutative ring with an internal integer grading. Commutativity here is
ordinary commutativity, without signs depending on degrees. Define `GrMod_𝕜`
using [Tau Ceti's graded-module
category](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Algebra/Category/GradedModuleCat/Basic.lean):
objects have `𝕜_r M_s ⊆ M_(r+s)`, and morphisms are degree-preserving 𝕜-linear
maps. Its individual degree pieces are 𝕜₀-modules; they need not be
𝕜-submodules. Include the regular module 𝕜 and grading shifts `(M{a})_d =
M_(d-a)` with zero, addition and inverse comparison maps.

Construct the symmetric monoidal structure on this category with tensor product
over 𝕜 and unit 𝕜. Reuse the [graded balanced tensor
product](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/LinearAlgebra/TensorProduct/Balanced/Grading/Basic.lean),
its associativity and unit maps and [graded bimodule
coherence](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Algebra/Category/GradedModuleCat/BimoduleTensor/Monoidal.lean).
Supply the specialization in which left and right 𝕜-actions agree and the
comparison with `ModuleCat 𝕜`'s ordinary tensor product after forgetting
grading. Prove that the swap `m ⊗ n ↦ n ⊗ m` is well-defined and graded, and
prove its naturality, hexagon and symmetry laws. A general bimodule tensor
category does not itself supply this symmetry.

Specify the total-degree pieces as generated by homogeneous pure tensors
of degree p+q and prove the universal property for homogeneous 𝕜-balanced
bilinear maps. Prove functoriality, pure-tensor calculations, extensionality,
and the coherent comparison `M{a} ⊗_𝕜 M'{b} ≅ (M ⊗_𝕜 M'){a+b}`.
No finiteness, flatness or field hypothesis is imposed on these constructions.
For 𝕜 concentrated in degree zero, compare with integer-graded objects in
`ModuleCat 𝕜`. Use the unsigned symmetry throughout the internal grading.

For a graded ring map `𝕜 → 𝕜'`, construct graded extension of scalars
`𝕜' ⊗_𝕜 -`, its strong symmetric monoidal structure and compatibility with
shifts. Apply this to the weighted ring `Λ_N = ℤ[e₁,…,e_N]`, where
`deg(e_i)=2i`, and to the specified graded specializations. Specialization
to nonhomogeneous scalar values is an ungraded construction and is not
silently asserted to preserve this grading. Scalar extension of modules
does not by itself prove scalar extension of universal-construction radicals.

At the ordinary-category level, construct the formal-shift closure `C^(sh)` of a
category C with graded 𝕜-module homs and balanced degree-additive composition.
Its shifted objects X{a} satisfy `Hom^d(X{a},Y{b}) = Hom^(d+a-b)(X,Y)`; in its
degree-zero category, `Hom(X{a},Y{b}) = Hom^(a-b)(X,Y)`. Prove the shift,
composition and inclusion formulas and the extension property for functors into
categories where these shifts are represented. Use this construction with finite
sums in Layer 2. The higher-category extension is a separate target in Layer 3.
Composition in `C^(sh)` carries no Koszul sign; this distinguishes it from Tau
Ceti's differential graded `DGShiftClosure`.

## Layer 1: closed-foam evaluations

### Robert–Wagner gl(N) evaluation formula

For N > 0, construct the Λ_N-valued [Robert–Wagner
evaluation](https://arxiv.org/abs/1702.04140) `ev_(N,RW)` by finite colorings: each
facet of label a receives an a-element subset of N colors (also called
pigments), with disjoint union at each merge seam. Prove polynomiality,
symmetry, degree, decoration linearity, isomorphism invariance, multiplicativity
and empty value one. Prove the reversal identities needed by the later duality
construction. Rational expressions in ℚ(X₁,…,X_N) used in the proof must descend
to integral polynomials before specialization; do not evaluate denominators at
coincident roots.

For the degree use Robert–Wagner Definition 2.3 and the decoration contribution
in Definition 2.11. Take the boundary correction from Goertz–Marino–Wedrich,
formula (3.10) and Example 3.39, summing over all seams but not over boundary
edges or vertices, and derive the gluing-degree formula for fillings from this
convention. Layer 4 then shifts closure-state modules to put identity
2-morphisms in degree zero. The chosen corrections must also make composition
and tensor graded; identity normalization alone is not a proof of these
compatibility laws.

Prove Robert–Wagner Lemma 2.5 from the finite foam records: monochrome and
bichrome pieces form oriented surfaces, and mixed seams form circles with
constant sign. Include the boundary and gluing versions. These are derived
properties, not extra restrictions on foams. Prove the signs, divisibility
and cancellation needed for evaluation, reusing symmetric and Schur polynomials.
Export decorated sphere and theta evaluations and naturality under scalar maps.
Formalize the Appendix A identities used by the required decompositions, including
Propositions A.13 and A.16, and the relevant
finite coloring/sign computations of Appendix B as proofs supporting the local
relations. Establish polynomiality over the universal integral ring before
mapping to a general commutative ring; no domain or characteristic-zero
assumption is imposed on the specialized ring.

Prove that a closed foam containing a facet of thickness a > N has zero
gl(N) evaluation: such a facet cannot receive an a-element subset of the
N colors, so the coloring set is empty. Preserve this vanishing under the
specified scalar specializations. The foam remains an object of the abstract
theory; it is not excluded by the definition or identified with the empty foam.

### Unit-normalized gl(N) evaluation

Define the linear-label Euler characteristic χ_lin(F) by summing the Euler
characteristics of the monochrome surfaces of a coloring. Prove that this
sum is independent of the coloring and give its formula from facet, seam
and singular-vertex incidences, including the boundary version. It is
distinct from the quadratic-label expression defining the foam degree.
For closed colorable foams χ_lin(F) is even. Define

    ev_(N,σ)(F) = (−σ)^(χ_lin(F)/2) ev_(N,RW)(F)

over Λ_N[σ,σ⁻¹], and give uncolorable foams value zero. Extend linearly
in decorations and foam representatives. Prove the evaluation laws above
for this family, including reversal, zero-label erasure with its scalar
factors, and vanishing above N. Negative Euler characteristics require σ
to be a unit. Its degree is zero; no relation σ²=1 or square root is imposed.
The specializations σ=−1 and σ=+1 recover respectively the literal
Robert–Wagner evaluation and the positive one-color sphere normalization.
Set `ev_N := ev_(N,1)` as the default evaluation for all subsequent layers.
Use Khovanov–Kitchloo, equations (13)–(16) at p(x,y)=1, for the closed sign
comparison; the extension to an arbitrary unit is a target here.

For a circle of label a≤N, prove that the sphere decorated by the top
rectangular Schur polynomial evaluates to `t_a(σ)=(-1)^(a(a-1)/2) σ^a`.
This identifies the sphere normalization of Ehrig–Tubbenhauer–Wedrich,
Example 2.5 and Remark 2.24, at σ=1. The elementary maps in Layers 5–6
use the chosen evaluation and its canonical duality data. Construct specialized evaluations directly
over every commutative Λ_N-algebra R with a specified unit σ; graded claims
require a graded coefficient map and σ of degree zero.

### Bar-Natan evaluation and Frobenius grading

For the single-label datum Dec(*)=A, let `h=m ∘ Δ` be the handle operator.
Evaluate an oriented closed surface of genus g decorated by a as `ε(h^g(a))`,
and multiply over components. Prove linearity, invariance, multiplicativity and
the empty value. In the unoriented version interpret the boundary-reflection
generator by the identity of A and prove descent through the relations of Layer
0. Check the orientation-forgetting comparison. This is the canonical choice of
Frobenius involution in the unoriented Bar-Natan example of
Goertz–Marino–Wedrich. Call these evaluations of decorated closed foams `ev_A^→`
(oriented) and `ev_A` (unoriented).

For a graded instance require `A_(2j+1)=0` for all integers j, together with
`deg(m)=deg(η)=0`, `deg(Δ)=2c`, `deg(ε)=-2c`, where c is an integer.
The closed-foam degree is decoration degree minus c times Euler
characteristic. The circle state space has grading `A{-c}` under the native
shift convention. Prove the boundary and closure-shift formulas, including
their integrality and compatibility with composition. Even support is a
condition on the unshifted algebra, not on all its shifts. The ungraded
construction requires no grading.

Include `R[x]/(x²)` with ε(1)=0, ε(x)=1, and monic-polynomial quotients
with their coefficient-extraction traces. For graded examples require a
homogeneous defining polynomial and the stated even support and trace degree.
With R in degree zero and deg(x)=2, the dual-number algebra is even-supported
but its circle `A{-1}` has degrees −1 on 1 and +1 on x.

### KH1. Ordinary Khovanov specialization and grading

For every commutative ring R concentrated in degree zero, specialize to
`A = DualNumber R`, with X its square-zero generator, ε(1)=0 and ε(X)=1,
using KhovanovHomology K2's chosen Frobenius structure. Put 1 in degree zero
and X in degree −2, so c=−1. Identify the circle `A{1}` with K2's quantum
object V: 1 has degree +1 and X degree −1. The circle multiplication and
comultiplication have degree −1, and its unit and counit degree +1.

Prove the degree-reversal comparison with the c=1 example: for
`rev(M)_j = M_(-j)`, identify `rev(M{a})` with `rev(M){-a}`, compatibly with
tensor, the Frobenius maps and coefficient change. This changes the internal
grading, not the underlying algebra or trace. Both unshifted algebras have
even support. Use unsigned symmetry on quantum tensor factors, including
odd-degree circle states; cochain signs are outside this construction.

## Layer 2: state spaces and reconstruction

First fix N > 0 and the default evaluation `ev_N = ev_(N,1)` from Layer 1, with
values in `Λ_N = ℤ[e₁,…,e_N]`. The following gl(N) subsections use this
evaluation and its specified scalar specializations. The final subsection gives
the independent Bar-Natan construction. Also apply the construction to
ev_(N,σ); the comparison below transports explicit planar decompositions
to this family. The universal-construction references
are Blanchet–Habegger–Masbaum–Vogel and its foam adaptation by
Goertz–Marino–Wedrich. Define fillings, radicals and state spaces once, for an
R-linear monoidal category with an R-linear evaluation of the endomorphisms of
its unit, and apply them to the gl(N) category `LinearPreFoam L` and to the
linearized, decorated versions of both nilvalent categories.

### State spaces and the evaluated foam category

Use Layer 0's linear prefoam category for the gl(N) labelling datum over Λ_N.
Let ∅ be the empty web and Fill(W) its hom-module of fillings ∅→W.
Define
`Rad_N(W) = {x | ev_N(G ∘ x) = 0 for every outgoing foam G}`
and `𝓕_N(W) = Fill(W)/Rad_N(W)`. Prove that gluing induces maps
`𝓕_N(F)[x] = [F ∘ x]`, and disjoint union induces natural graded maps
`𝓕_N(W) ⊗_(Λ_N) 𝓕_N(V) → 𝓕_N(W ⊔ V)`. Establish their functoriality and
associativity, unit and symmetry laws; invertibility is proved on planar
objects below. Fillings and tests are all admissible abstract foams.

Construct the evaluated category using Goertz–Marino–Wedrich's trace ideal. For
a linear combination f:W→V, set `I₁(W,V) = {f | ev_N(tr_W(g ∘ f)) = 0 for every
g:V→W}`. Here the trace `tr_W` closes the remaining W boundary through the
bending identifications of Goertz–Marino–Wedrich, formula (3.1). Prove that I₁
is a two-sided categorical ideal and write Foam₁ for the quotient, with N fixed.
Reuse the existing linear-quotient and finite-sum interfaces.

For the comparison needed in reconstruction, also define `I₂(W,V) = {f | ev_N(b
∘ f ∘ a) = 0 for all a:∅→W, b:V→∅}`. Prove that I₂ is the kernel of the action
on states, that I₁ ⊆ I₂, and that `Hom_(Foam₁)(∅,W) ≅ 𝓕_N(W)`. Thus 𝓕_N descends
to Foam₁. The concrete planar reduction below proves I₁=I₂ where it is needed; a
separate action-quotient category is not required.

### Zero-label erasure after evaluation

Use Layer 0's erasure and Layer 1's evaluation invariance to construct the
maps on states and inverse maps in Foam₁. Prove both inverse identities by
closure tests, retaining decorations on removed zero facets as scalars.
Prove compatibility with composition, disjoint union and coefficient change.

### Vanishing above the evaluation rank

A filling containing a facet labeled greater than N is zero in 𝓕_N(W), since
every closing test has no coloring. Deduce that a web with such an edge has
zero state space and that foams with such facets induce zero maps.
Strengthen this by trace tests: the identity of such a web is zero in Foam₁.
It is therefore a zero object, isomorphic to any chosen zero object.
Prove compatibility with gluing, disjoint union and decorations. These are
statements in the evaluated theory; the empty web remains the tensor unit.

### Combinatorial planarity and the restricted category

Define compatible planarity using the web's finite edge ends. Let τ pair
the two ends of each interval edge. From the stored cyclic order κ, form the
rotation ρ by taking κ at split vertices and κ⁻¹ at merge vertices, following
Goertz–Marino–Wedrich's conversion from generator words to abstract webs.
Reversing the global orientation inverts all rotations and leaves the test
unchanged.

For each component C under τ and ρ, count the cycles of ρ, τ and ρ ∘ τ as
V_C, E_C and F_C respectively. Count fixed points too. Define
`IsCompatiblyPlanar W` by the decidable integer condition
`V_C - E_C + F_C = 2` on every component. Accept the empty web and
vertex-free circles; equivalently, mark each circle by an auxiliary
bivalent vertex and prove subdivision independence. Test the prescribed
rotation, not whether the underlying graph admits some planar rotation.
Zero-labeled edges remain in this test until erased.

Reuse Tau Ceti's permutation and ribbon-graph structures, with the finite-map
conversions of SurfaceTopology Layer 2. Consume the general spanning-tree,
boundary-cycle and noninterleaving chord lemmas developed for
[KhovanovHomology K1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/KhovanovHomology/README.md#k1-resolution-circles-and-local-planar-calculus),
stated on the shared finite-map carriers. Construct the trivalent-web adapter
here: preserve the specified rotations, labels and vertex-free circles, and
prove independence of auxiliary subdivision. A theorem about four-valent
PD-codes alone does not supply this adapter. Prove the criterion equivalent
to existence of a crossing-free web presentation, preserving labels and cyclic
orders. Supply the finite face and insertion lemmas needed by reduction.
A geometric realization theorem is not a prerequisite.

Prove closure under isomorphism, disjoint union, reverse, mirror and
zero-erasure. Define `LinearPreFoamᵖˡ` as the full subcategory on these webs and
`Foam₁ᵖˡ` as its trace quotient. Prove that the fillings, outgoing tests and
ideals I₁,I₂ on retained objects agree with those in the unrestricted theory.
No chosen presentation or embedding is part of an object.

### Change of normalization on planar abstract webs

For two units σ,τ in the same coefficient ring R put r=σ τ⁻¹. Choose a
crossing-free presentation for each retained abstract web W, with
label-weighted turning number p(W). Define this integer combinatorially
by summing turns in a planar presentation, normalized so a counterclockwise
a-circle has value a. Prove agreement with the sum of monochrome turning
numbers and independence of pigment assignments. A chosen presentation is
comparison data; it is not extra data in the abstract-web carrier.

For a colorable foam F:W→V, prove that
`E(F)=(χ_lin(F)+p(W)−p(V))/2` is integral, using the parity of the Euler
characteristic of an oriented surface and its boundary circles. Rescale F
by r^E(F). Prove additivity under composition, identity preservation,
transport of all closure-test radicals and invertibility by exchanging
σ,τ. Uncolorable representatives vanish under every test and are zero in
the quotient. If presentations are not chosen additively, give the tensor
comparison `r^((p(W)+p(V)−p(W⊔V))/2)` and prove its coherence. Prove the
comparison's independence of choices up to specified natural isomorphism.

Obtain a graded R-linear symmetric monoidal equivalence between the planar
evaluated categories, and the natural comparison of state functors after
precomposing with it. This supplies the rescaling of local relation maps from the
Robert–Wagner formula to the default σ=1 normalization. Check compatibility
with disjoint union and the trace ideals before using the tensor comparison.
This lemma is an ingredient for the parameterized state theory; it does
not assert equivalence of specified duality or higher-category structures.

### Local relations with arbitrary abstract exteriors

Express the Robert–Wagner maps in the default σ=1 normalization using
the preceding ordinary rescaling lemma, retaining their resulting unit
factors. For each required local relation `ℒ = Σ_α c_α ℒ_α` between fillings of a closed
web `W_ℓ`, prove `ℒ − Σ_α c_α ℒ_α ∈ Rad_N(W_ℓ)`, i.e. `ev_N(K ∘ ℒ) = Σ_α c_α
ev_N(K ∘ ℒ_α)` for every admissible foam `K : W_ℓ → ∅`. Fix a coloring of K and
sum over its extensions, allowing K to identify local facets. Verify
Euler-characteristic changes, decorations and mixed-circle signs. Establish the
needed sign-parity locality using the finite matchings of cut mixed-seam arcs.
Do not assume that a closed evaluation factors into separate inside and outside
evaluations.

Use Robert–Wagner Lemmas 3.14 and 3.18, Corollaries 3.16 and 3.19, and the
required Appendix B computations for these identities. In the denominator
convention of Definition 2.12, distinguish χ from χ/2. Supply the following
maps with their boundaries, labels, decorations and grading shifts:

- Zero-label removal and inverse maps: Remark 2.13 and Lemma 3.22.
- Reassociation of merge/split configurations: Lemma 3.9 and Corollary 3.10.
- Orientation/complement changes on cycles using N-labeled facets, including
  a↦N−a: Lemma 3.21.
- The categorical Murakami–Ohtsuki–Yamada relation (7), with its Schur-decorated
  inclusions and projections: Proposition 3.13.
- Circle resolutions by decorated opening and closing disks, including the
  sphere and neck-cutting identities: Proposition 3.32, especially (8) and (10).

Derive the digon and other reductions needed below. For every decomposition,
prove both `p_α ∘ i_β = δ_αβ id` and `Σ_α i_α ∘ p_α = id` with the
appropriate shifts. Determine the equivariant dual decorations explicitly.
Close the contextual identities against arbitrary reverse morphisms to obtain
these equalities in Foam₁, before assuming I₁=I₂ or faithfulness of 𝓕_N.

### Planar reduction and finite identity resolutions

For a compatibly planar web W, remove labels greater than N by categorical
vanishing and zero labels by the proved erasure maps. Work first over Λ_N
with the default σ=1, using the normalized local maps. Prove a terminating web reduction certificate using the local
relations, then lift it to retracts in Foam₁ before invoking reconstruction.

**The {1,2}-labelled base.** Prove the certificate for all compatibly planar
closed {1,2}-webs, not just resolved braid webs. Translate the moves and
termination argument of Carpentier, Lemma 2, directly into web language:
circle/digon reductions, the braidlike square switch, and the cyclic
hexagon switch below. Formalize the finite path/lens descent which exposes
a reducing configuration, with the number of trivalent vertices as the
outer induction measure. Individual switches need not reduce that number.
Include multiple edges, loops, disconnected webs and nested components;
an Euler count alone does not guarantee a reducible square.

For the cyclic switch, number six boundary points 0,…,5 cyclically with
even points incoming, odd points outgoing, all of label 1. Let H_L be the
clockwise directed hexagon with successive edge labels 2,1,2,1,2,1, and
H_R the counterclockwise hexagon with labels 1,2,1,2,1,2 on those same
edges. Let Q_01 be the arc (01) and the four-vertex square on 2,3,4,5;
its cycle is counterclockwise, with labels 1,2,1,2 on the successive edges
in the listed clockwise order. Let Q_34 be the arc (34) and the clockwise
square on 0,1,2,5, with successive labels 2,1,2,1. All arcs run from even
to odd endpoints.
For N≥4 construct the stable isomorphism

    H_R ⊕ [N−3] Q_01 ≅ H_L ⊕ [N−3] Q_34.

Here `[r]X` is the sum of shifts of X with quantum-integer multiplicity
[r], and `[0]X=0`. Complement the directed cycle using Robert–Wagner
Lemma 3.21, expand the N−1 edge with Proposition 3.13 at parameters
m=n=k=1, l=N−3, and reassociate twice. Complement the resulting directed
square and then the adjacent hexagon; the opposite square decomposition
gives the other side. Verify the incidence, orientations and both inverse
foam identities. Both correction webs have four rather than six vertices.
At N=3 use direct cycle complementation; at N=2 use complementation and
zero erasure; at N=1 use the vanishing of label 2.

With P_R=(01)(23)(45), P_L=(05)(12)(34), R₀=(01)(25)(34), also prove
`Q_01 ≅ P_R ⊕ [N−2]R₀` and `Q_34 ≅ P_L ⊕ [N−2]R₀` for N≥2.
Retain common summands in the resulting stable hexagon relation;
categorical cancellation is not a prerequisite. These are local web
relations; no separate four-valent graph theory is required.

**Retracts and higher labels.** A switch
`W_i ⊕ A_i ≅ W_(i+1) ⊕ B_i` makes W_i a retract of W_(i+1) ⊕ B_i.
The correction webs are smaller. Propagate their retracts backwards along
the finite certificate from a terminal reduction. Lift Wu, Theorem 2.4's
induction on maximal label and its occurrence count using these base-case
retracts and Robert–Wagner's categorical relations. Select a single shifted
summand in a quantum-integer multiple when needed; do not divide by a
quantum integer. Retain homogeneous inclusion and projection foams at every
step. Auxiliary expansions may increase labels or vertices; the induction
measures the endpoints and corrections, not these auxiliary webs.

The target is a finite homogeneous retract `u:W→P_W`, `v:P_W→W`, `v ∘ u = id_W`,
with `P_W = ⨁_r ∅{d_r}` in the additive category `Mat_((Foam₁ᵖˡ)^(sh))` with
formal shifts. Equivalently, produce `id_W = Σ_r a_r ∘ b_r` in Foam₁. Retain
representatives of a_r,b_r as linear combinations of explicit abstract gl(N)
foams. The crossing-free presentation guides the reduction; no foam embedding or
canonical choice of presentation is required.

Insert this identity resolution into a trace test to prove I₂⊆I₁ on
planar objects, hence I₁=I₂ there. The same maps give
`[F] = Σ_r [a_r] ev_N(b_r ∘ F)` for every abstract filling F.
Thus they span 𝓕_N(W), and the b_r detect its pairing radical. Prove
compatibility with grading and transport. Layer 6 separately expresses these
maps in its chosen generators; the resolution alone does not prove progressive
spanning.

### Integral freeness and decomposition into shifted empty webs

Prove the algebra lemma needed for this coefficient ring: every graded retract
of a finite sum of shifts of Λ_N, with deg(e_i)=2i, is finite graded free. Reuse
the native graded free/projective module interfaces and [bounded-below graded
Nakayama](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Algebra/Module/GradedModule/Nakayama.lean).
Supply the integral degree-zero basis lifting and homogeneous splitting; a field
hypothesis or an ungraded freeness theorem is not a substitute.

For the idempotent `u ∘ v` on P_W, construct a finite shifted free module D_W
and homogeneous matrices `ι_W : D_W → P_W`, `π_W : P_W → D_W` with `ι_W ∘ π_W =
u ∘ v` and `π_W ∘ ι_W = id_(D_W)`. The maps v ∘ ι_W and π_W ∘ u then identify W
with a finite sum of shifted empty webs. This establishes decomposition into shifted empty webs for the planar
gl(N) category. Retain explicit inclusions and projections satisfying both
biproduct identities.

### Parameter and coefficient transport of decompositions

Transport the explicit σ=1 decompositions by coefficient extension and
the ordinary rescaling lemma to obtain them for every σ, including the
universal Laurent parameter. Use the actual inclusion/projection identities,
not a general freeness theorem over an arbitrary R or an assertion that
radicals commute with base change. These operations need not identify the
original same-source Frobenius theories: their traces can differ.

### Reconstruction, tensor products and specialization

Use these decompositions to prove the following concrete results on
`Foam₁ᵖˡ`, with the stated grading conventions:

- 𝓕_N identifies foam morphisms with Λ_N-linear maps of state modules,
  retaining maps of every homogeneous degree.
- The outgoing and trace pairings are perfect, with explicit graded dual
  bases. In particular, `Hom_(Foam₁)(W,∅) ≅ Hom_(Λ_N)(𝓕_N(W),Λ_N)`.
- The canonical maps `𝓕_N(W) ⊗_(Λ_N) 𝓕_N(V) → 𝓕_N(W ⊔ V)` are isomorphisms.
  Prove their naturality and coherence, including `𝓕_N(∅) ≅ Λ_N`, and descend
  disjoint union to the evaluated planar category.
- After adjoining finite sums and grading shifts, 𝓕_N gives an equivalence
  on degree-zero morphisms with finite free graded Λ_N-modules.

Transport the explicit decompositions through the specified coefficient maps,
including `Λ_N/(e₁,…,e_N) ≅ ℤ` and extensions to a commutative ring R. Prove the
resulting state-space and category comparisons on planar objects. Use these
finite identities to justify scalar change; do not assume pairing radicals
commute with arbitrary base change. For ev_(N,σ) use the preceding normalization comparison and retain the
parameter in all structure maps. Graded specialization requires a graded
coefficient map and a degree-zero unit; other specializations are ungraded.

### Circle state spaces as Frobenius algebras

For 0≤a≤N, identify the circle state module with the shift
`A_(a,N){−a(N−a)}` of the following even-supported algebra:

    A_(a,N) = Λ_N[c₁,…,c_a,b₁,…,b_(N−a)] /
      (Σ_(i+j=r) c_i b_j − e_r : 1≤r≤N).

Set c₀=b₀=1 and out-of-range coefficients to zero; deg(c_i)=deg(b_i)=2i.
This is the algebraic presentation of equivariant Grassmannian cohomology;
no geometric cohomology construction is a prerequisite. Prove that the
decoration map is surjective with exactly this kernel. Construct the Schur
basis s_λ(c), with λ in the a×(N−a) rectangle, of rank binomial(N,a).
Give multiplication and the sphere trace, rather than identifying modules
from equal ranks alone. Use Wu, §2.3, Theorem 2.10 and Remark 2.11, and
Proposition 3.13 for the circle identification; prove the integral versions
of these polynomial identities over Λ_N.

Write ζ_a for the Λ_N-linear coefficient of the top rectangular Schur basis
element: it is 1 there and zero on the other basis elements. Identify it with
Wu's Sylvester functional. For a coefficient map Λ_N→R, use the algebra
`R ⊗_(Λ_N) A_(a,N)`. For a unit σ in R its trace is

    ε_σ = (-1)^(a(a−1)/2) σ^a ζ_a.

For the a-variable alphabet A and equivariant alphabet S, the ε_σ-dual of
s_λ(A) is `(-1)^(a(a−1)/2) σ^(−a) s_(λᶜ)(A−S)`, where λᶜ is the
rotated rectangular complement and the difference alphabet is defined by
the quotient of complete-symmetric generating series. Prove this identity,
including its equivariant corrections. At σ=−1 the factor is
(-1)^(a(a+1)/2), as in Robert–Wagner; at σ=+1 it is the factor in
Ehrig–Tubbenhauer–Wedrich, Example 2.5 and Remark 2.24. Wu supplies the
Sylvester pairing; the additional sign is a foam normalization convention.

Identify opening, closing and saddle foams with the unit, trace,
multiplication and comultiplication; prove their laws and perfect pairing
from the explicit circle decomposition. Multiplication and unit have degree
zero on A_(a,N), and the trace has degree −2a(N−a). Package the shifted maps
using `GradedObject.monObjOfHomogeneous` and its transport lemmas. Export
decoration actions, dual-basis neck-cutting and coefficient-change formulas.
Include a=0,N, the specialization e_i=0, and the zero state space for a>N.

As a mandatory calculation, for N=2,a=1 obtain

    A = Λ₂[x]/(x²−e₁x+e₂),          basis (1,x), degrees (0,2),
    multiplication by x = [[0,−e₂],[1,e₁]],
    ε_σ(1)=0, ε_σ(x)=σ,             pairing = [[0,σ],[σ,σe₁]],
    dual basis = (σ⁻¹(x−e₁), σ⁻¹).

At the default σ=1 the dual basis is (x−e₁,1); at σ=−1 it is
(e₁−x,−1). Omitting e₁ gives an incorrect equivariant dual basis. Identify A_(N,N)=R after coefficient change, with trace
`ε_σ(1)=(-1)^(N(N−1)/2)σ^N`. In particular the default trace is
`ε_1(1)=(-1)^(N(N−1)/2)`.

### Bar-Natan state spaces and circle decompositions

Apply the same outgoing-test construction and trace quotient to each nilvalent
category with its Layer 1 evaluation over R, giving the state spaces `𝓕_A`
(unoriented) and `𝓕_A^→` (oriented). Prove that the state space of r circles is
`A^⊗r`, with `A{-c}` as each circle factor in the graded case. Decorated disks
and dual bases for ε(ab) give the maps and their inverse identities. Check all
tests in the chosen unoriented domain as well as the oriented one.

Prove neck-cutting and decomposition of a circle into copies of the empty
web, shifted by homogeneous basis degrees in the graded case. Require a
finite homogeneous basis for this graded decomposition statement.
Deduce decomposition into shifted empty webs, equality of the trace ideal and state-action kernel,
perfect pairings and strong tensor comparison for all nilvalent webs.
These proofs use the Frobenius pairing, independently of gl(N) planar
reduction. Prove coefficient-change compatibility and recover A's given
Frobenius structure on the circle, with the stated shift.

Keep these concrete Frobenius and gl(N) arguments separate; a general
implication/converse classification of arbitrary evaluations is not required.

### KH2. Comparison with Khovanov circle tensors

For KH1's instance and each finite circle set I, construct a natural graded
R-linear isomorphism from the unoriented nilvalent state space of those
circles to KhovanovHomology K2's indexed tensor of copies of V. Construct
the oriented comparison through orientation forgetting. Match the decorated
disk basis with K2's enhanced-state basis, including the empty set of circles.
Prove compatibility with relabelling, disjoint union, the trace pairing and
birth, death, merge and split maps, retaining the unaffected circle factors.
Use the maps and coefficient comparisons owned by K2, rather than specifying
a second circle-tensor theory.

For any homomorphism of commutative coefficient rings R → S, prove this
comparison commutes with the scalar-extension isomorphisms on both sides.
Use the explicit dual-basis decomposition to justify base change of these
state spaces, without a flatness hypothesis or a general claim that radicals
commute with arbitrary scalar extension. The closed-evaluation comparison
with formal surface presentations is KH4, after disk insertion is available.

## Layer 3: reusable semistrict monoidal 2-categories

A **tensorator** is the specified invertible 2-morphism comparing the two
orders of applying independent 1-morphisms in a tensor product.

### Semistrict structure and local enrichment

Use Baez–Neuchl, *Higher-Dimensional Algebra I: Braided Monoidal 2-Categories*,
Lemma 4 (data (1)–(7) and conditions (i)–(viii)), verified for foams in
Goertz–Marino–Wedrich, Theorem 4.29, as an explicit reference definition of a
semistrict monoidal 2-category (Gray monoid). Neuchl, *Representation Theory of
Hopf Categories*, Definition 1.8, is an equivalent presentation. Record a
convention dictionary between Baez–Neuchl and Goertz–Marino–Wedrich: left/right
tensoring, direction of the tensorator (Goertz–Marino–Wedrich, Construction
4.28), order of composition and coherence equations. The braided extension and a
general strictification theorem are not targets here.

Extend an underlying `Bicategory` with
[Bicategory.Strict](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Bicategory/Strict/Basic.html#CategoryTheory.Bicategory.Strict), retaining Mathlib's
hom-categories, whiskering and adjunctions. Specify object tensor, left and right
tensoring 2-functors, the invertible tensor comparison and its unit, naturality
and coherence equations in Goertz–Marino–Wedrich's convention. Semistrictness does not make the
tensorator an identity.
Express strictness through Mathlib's `eqToIso` equations. Keep generic lemmas
at bicategory level when possible and use associators, unitors and coherence
tools in proofs. Mathematical strictness does not make all Lean expressions
definitionally equal; a second stand-alone strict 2-category hierarchy is not
part of this roadmap.

Develop identities, composition, opposites, transport and structure-preserving
maps. These structures and the following enrichment and shift constructions
must be usable independently of foams.

For a symmetric monoidal category V, equip each hom-category with compatible
V-enrichment: parallel 1-morphisms f,g have a hom-object `f ⟶[V] g` in V, with
unit and composition maps in V. Relate the underlying ordinary 2-morphisms to
`Hom_V(𝟙_V, f ⟶[V] g)` using
[EnrichedOrdinaryCategory](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Enriched/Ordinary/Basic.html).
Lift horizontal composition and left/right tensoring to enriched operations.
Their interchange uses the symmetry of V; require the associativity, unit and
tensorator equations as equations of maps in V. Tensorator naturality must hold
on whole hom-objects, not only on maps out of the tensor unit. Prove
compatibility with the underlying semistrict structure, composition of
structure-preserving maps, transport and local full subcategories. This does not
require a general theory of enriched limits or higher functor categories.

### Linear and graded coefficient instances

Construct the `V = ModuleCat R` instance and identify its data with local
`Preadditive` and `Linear R` structures and bilinear higher operations.
Construct the `V = GrMod_𝕜` instance using Layer 0's symmetric monoidal
coefficient category. Require it for every commutative graded ring 𝕜 specified
there, not only rings concentrated in degree zero. In this instance vertical and
horizontal composition and tensor on 2-morphisms are 𝕜-balanced and
degree-additive; identities and tensorators have degree zero. In particular, the
equivariant foam target is enrichment over `GrMod_(Λ_N)`, with tensor product
over Λ_N and unit Λ_N at the default σ=1, and over Λ_N[σ,σ⁻¹] for the universal
normalization. Also include the graded coefficient specializations R,
in particular R concentrated in degree zero, and the graded base ring of
a graded Bar-Natan instance.

Construct and compare three views of this structure: the full graded hom-objects
`Hom^•(f,g)` (degree pieces `Hom^d`, endomorphisms `End^•`); the ordinary
degree-zero 2-category, with homs `Hom^0(f,g)`; and the ordinary locally
𝕜-linear 2-category, with homs `Hom^u(f,g)`, obtained by forgetting the grading
on each hom-module. The degree-zero category is 𝕜₀-linear, but is not generally
𝕜-linear. The underlying homs of V-enrichment select degree zero; this is
different from forgetting the grading on the whole module. Prove the comparison
formulas for identities, composition and tensorators. State each result about
2-morphisms for one named view: `Hom^•`, `Hom^0` or `Hom^u`. Construct
enrichment change for the strong symmetric monoidal forgetful and scalar
extension functors used here, with their effect on homs and coefficients.

### Formal shifts and their higher compatibility

Extend Layer 0's ordinary shift construction to the graded semistrict monoidal
2-category C. Keep its objects and adjoin shifted 1-morphisms f{a}, giving
`C^(sh)`. Set `Hom^d(f{a},g{b}) = Hom_C^(d+a-b)(f,g)`. Supply the induced
𝕜-action and the degree-zero locally 𝕜₀-linear category, with `Hom(f{a},g{b}) =
Hom_C^(a-b)(f,g)`. Prove the coherent comparisons `(f{a}){b} ≅ f{a+b}`, `f{a} ≫
g{b} ≅ (f ≫ g){a+b}` and `f{a} ⊠ g{b} ≅ (f ⊠ g){a+b}`, where `f ⊠ g := (s ⊠ g) ≫
(f ⊠ t')` for `f : s → t`, `g : s' → t'` (the source of the tensorator). Prove
the zero/inverse shift laws and compatibility with identities, associativity,
both orders of moving shifts through the two factors, interchange and the
tensorator. In particular these comparisons introduce no Koszul sign. Reuse
[HasShift](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Shift/Basic.html)
on each hom-category, with `f⟦n⟧ = f{-n}` so that a degree-d 2-morphism `f → g`
is a `ShiftedHom f g d`, and the existing shifted-hom composition; local shift
functors alone do not establish these higher compatibility laws.

Retain the full coefficient algebra in the degree-zero presentation. For
homogeneous `a ∈ 𝕜_d`, construct the natural maps
`ζ_f(a) : f → f{-d}` corresponding to multiplication by a on the identity.
They are additive on each 𝕜_d, agree with ordinary scalar multiplication
in degree zero, preserve unit and multiplication with the shift comparison
maps, and commute with shifts. Require their naturality and centrality:
acting through either factor of horizontal composition or tensor gives
the same coefficient action on the composite after the specified shift
transports. Call this a graded central 𝕜-action. An ordinary 𝕜₀-linear
structure with shifts does not by itself retain this data.

Conversely, for a locally 𝕜₀-linear semistrict monoidal 2-category D with
these compatible shifts and a graded central 𝕜-action, construct
`Hom_D^d(f,g) = Hom_D(f,g{-d})`.
Use shifted composition and the central action to give these pieces a
graded 𝕜-module structure and prove all enriched higher-category laws.
State the required shift and coefficient coherence as hypotheses of this
construction, rather than infer them from unrelated local shifts.
Construct the comparisons in both directions: the degree-zero category
of the reconstructed enrichment recovers D, and adjoining formal shifts
to that enrichment maps equivalently to D by evaluating the chosen shifts.
Starting with C recovers its shifted enlargement; equivalence to C itself
requires that the shifts already be represented. Prove the corresponding
extension property for enriched monoidal maps into such shifted targets,
with uniqueness up to coherent structure-preserving isomorphism.

## Layer 4: foam and Bar-Natan monoidal 2-categories

### The gl(N) foam monoidal 2-category

Construct boundary objects and generated web 1-morphisms from this roadmap's own
web data. Define 2-morphism modules as state spaces of the designated abstract
closures of parallel webs. Call this 2-category `NFoam`; Goertz–Marino–Wedrich's
`NFoam` (Example 4.33) corresponds to its nonequivariant instance over ℤ. It
uses the nonnegative labels `L_ℕ`; words and webs with positive labels form a
locally full sub-2-category `NFoam_+`. For every pair of parallel planar
generator words S,T, prove that `Cl(S,T)`, equivalently `abs(IHom(S,T))`
(Goertz–Marino–Wedrich's `abs(Hom̲(S,T))`, Construction 4.13), satisfies Layer
2's combinatorial planarity criterion. Construct its crossing-free presentation
by finite closure and gluing operations; a geometric cube-boundary realization
is not a prerequisite. Prove that every source and target boundary of the
structural foams, including those used by composition, tensorators and
whiskering, is in the same planar-object subcategory. Verify the corresponding
closure statements for duality operations when constructing them in Layer 5. Use
these results whenever invoking Layer 2's reconstruction or strong tensor
comparisons. Prove well-defined identities, vertical and horizontal composition,
whiskering, tensor and grading, and instantiate Layer 3. Duality is constructed
in Layer 5.

Develop the crossing-free diagrammatic language independently of a skein
category. A boundary word is a finite ordered list of signed labels, using
either natural-label instance of Layer 0. The empty word is the tensor unit,
concatenation is tensor, and the dual word `s^#` of a word s reverses order and
signs. A positive sign `+a = (a,↑)` means a strand oriented in the direction ↑
of composition of 1-morphisms (Goertz–Marino–Wedrich's `â`); a negative sign `−a
= (a,↓)` (their `ǎ`) means the opposite orientation, also for zero-labeled
strands. Translate these signs explicitly to incoming/outgoing orientations on
each boundary.

Give typed identity strands, both oriented cups and caps, and merge/split
vertices. In the all-positive convention, merge has boundary `(+a,+b) →
(+(a+b))` and split the reverse boundary. Cups `cup←_a`, `cup→_a` have
boundaries `∅ → (+a,-a)` and `∅ → (-a,+a)`, with the corresponding caps `cap→_a
: (+a,-a) → ∅`, `cap←_a : (-a,+a) → ∅`. Supply the other oriented versions
through explicit reversal/bending operations and prove their boundary formulas.
The typing rules use local conservation and vertex roles, including at zero
labels, rather than an upper bound by N. Extend cups and caps to words as in
Goertz–Marino–Wedrich, Construction 4.9, and define `W^∗ : t → s` for `W : s →
t` as in their Construction 4.11.

Retain expression trees, composable stacking, side-by-side placement and scan
contexts `id_left ⊠ generator ⊠ id_right`. Construct finite open-web incidence
data with ordered boundary identifications, prove compatibility with these
operations, and compare their empty-boundary specialization with
`LabeledClosedWeb L.Label`, and with `NonnegativeWeb` and `PositiveWeb` for the
two natural-label instances. Do not infer that every abstract web is represented
by a planar expression. An open web and its abstract closed closure have
different types. Define the closure of parallel expressions using reversed
source, target and matching boundary connectors; prove label, orientation and
cyclic-order compatibility and transport under boundary-preserving isomorphisms.
No embedding is additional data on the resulting abstract closed web `Cl(S,T)`.

Construct the ordinary diagram quotient imposing monoidal interchange and its
comparison with the planar generator words `WebWord s t` used as 1-morphisms
here. In the higher category, represent exchanges by the tensorator; do not
impose strict tensor interchange as equality of these 1-morphism presentations.
Export the ordinary quotient and raw syntax separately, with their positive and
rank-bounded restrictions, for the planned quantum-web development. Its linear
skein ideal and representation functor are subsequent constructions, not
prerequisites for this quotient or the foam 2-category.

For parallel S,T, define `Cl(S,T)` and its grading shift `δ(S,T) := ½(w_N(S) +
w_N(T))` explicitly, and use `𝓕_(N,σ)(Cl(S,T)){δ(S,T)}` as the primary 2-hom model
(Goertz–Marino–Wedrich, Example 4.33). Here `w_N(W) := Σ_e k_e(N−k_e) − Σ_v
((k+l)(N−k−l) + kl)` over the interval edges e (label k_e) and the vertices v
(labels k, l, k+l) of W; prove `w_N(S) = w_N(T)`, so δ is an integer. Fix the
degrees from Robert–Wagner's closed-foam convention and choose coherent boundary
corrections so that the identity foam of each S has degree zero. State the
resulting formulas and prove degree additivity of vertical composition,
horizontal composition and tensor, as well as degree zero for the structural
comparison cells. Use the native Tau Ceti notation for shifts; do not assert
that the identity condition uniquely determines every source/target shift. The
abstract identity foams `cup_S`, the composition foams `vert`, `hor`
(Goertz–Marino–Wedrich, Constructions 4.17, 4.18 and 4.22) and the tensor
comparisons implement all operations. The alternative description by vanishing
in every closing context is a comparison target: prove equivalence with these
2-homs and compatibility with local insertion before using it. Crossing
generators and their complexes are outside this foam roadmap.

Realize the Goertz–Marino–Wedrich construction in Layer 3's graded coefficient
framework: `GrMod_(Λ_N)` for the default σ=1, `GrMod_(Λ_N[σ,σ⁻¹])` for the universal
normalization, and `GrMod_R`, with
R in degree zero, for the nonequivariant instance. Over a commutative ring R
with a specified ring map Λ_N → R and degree-zero unit σ, use `ev_(N,σ)`; its
comparison with scalar extension from Λ_N is Layer 2's planar comparison. Prove
that closure-state composition and tensor are balanced over that coefficient
ring, with the closure shifts and tensorators of the stated degrees. The
finite-free and tensor comparison theorems of Layer 2 use this same coefficient
tensor product. Compare the full graded theory, its degree-zero category and its
ungraded linear category.

Adjoin formal shifts of web 1-morphisms through Layer 3 and identify the
resulting shifted morphisms with the homogeneous foam maps. In the
equivariant degree-zero presentation, identify the central operation of
e_i with the map `f → f{-2i}`. Compare this coefficient action with the
ground-ring action on the universal-construction state module; it is
distinct from choosing a polynomial decoration on one particular facet.
Prove compatibility of the specified scalar changes with these comparisons,
using Layer 2's scalar-change theorems for states. A general completion
programme for link complexes is not a prerequisite.

Apply Layer 2's oversized-label vanishing to these 2-hom modules. Prove that
a 1-morphism with an edge labeled greater than N has zero identity
2-morphism, hence is a zero object in its hom-category. Prove the analogous
vanishing for 2-morphisms represented by foams with such a facet, with
compatibility under vertical composition, horizontal composition and tensor.

As a corollary of the preceding evaluation package, identify
`End^•(id_∅) ≃ₐ[R] R`. In the graded setting use the full graded endomorphism
algebra; its degree-zero part `End^0(id_∅)` corresponds to R₀.

Write `NFoam_σ` when distinguishing parameters, suppressing σ when fixed.
The concrete gl(N) theorem discharges the evaluation hypotheses; a construction
conditional on the desired local calculus does not complete this layer.

### Oriented and unoriented Bar-Natan monoidal 2-categories

Construct `BN_A^→` and `BN_A` using the nilvalent state spaces and closure
operations. Oriented objects are words of signed points; unoriented objects are
words of unsigned points. Their 1-morphisms are generated by identity strands,
cups and caps, without merge/split vertices. Their 2-homs are the state modules
of the resulting circle closures, with the shifts `δ(S,T) := ½(c(s)+c(t))` for
`S,T : s → t` in the graded instances, where c(s) is c times the number of
points of s (Goertz–Marino–Wedrich, Example 4.30).

Prove the semistrict monoidal laws, coefficient linearity and graded
compatibility using Layer 3. Identify the unoriented generating object as
self-dual and prove its 2-dualizability in Layer 5. Construct the monoidal
2-functor `BN_A^→ → BN_A` forgetting orientations, and prove its
compatibility with evaluation and the closure-state models.
Recover `End^•(id_∅) ≃ₐ[R] R` for both categories. These are required concrete
instances, independent of the gl(N) coloring and reduction theorems.

### The progressive foam monoidal 2-category

Construct the progressive gl(N) locally graded-linear semistrict monoidal
2-category `NFoam^prog` using progressive diagrams. Fix coordinates: x is the
side-by-side tensor direction, y is the direction of horizontal composition of
webs, and z is the direction of vertical composition of foams. Translate these
conventions to the graphical convention of Goertz–Marino–Wedrich explicitly:
their axes 0, 1, 2 play the roles of x, y, z; their 0-axis arrow points left
(their Convention 4.3), while words are read left to right in both.

Its objects are words of labels with every strand sign positive. This is a
condition on orientation, independent of whether labels are strictly positive
or nonnegative. Its web 1-morphisms are expressions in identity strands and
upward merges and splits, under horizontal composition and tensor. Their
realizations have every edge strictly increasing in y in its oriented
direction, with the specified merge/split behavior at vertices. Cups, caps
and closed circle components are excluded from these web expressions.
Prove that the expressions have progressive realizations and that the
structural reordering maps respect them.

For every pair of parallel progressive webs S,T, retain **all** ambient
2-morphisms, with the same grading shift: `Hom_(NFoam^prog)(S,T) :=
Hom_(NFoam_σ)(S,T) = 𝓕_(N,σ)(Cl(S,T)){δ(S,T)}`. This is equality of full graded
coefficient modules. Apply the same restriction to degree-zero and ungraded
presentations and include all formal shifts of progressive webs in the shifted
enlargement `(NFoam^prog)^(sh)`. Thus each hom-category is the full subcategory
on progressive web 1-morphisms. Restrict objects and 1-morphisms only; impose no
restriction on foam representatives or closing tests in this definition. Keep
the label and evaluation conventions of this roadmap, including zero-labeled
strata before erasure and labels greater than N.

Prove that the allowed objects and 1-morphisms are closed under identities,
horizontal composition and tensor. Inherit every 2-morphism operation,
the tensorator and its inverse, and their coherence from the ambient
construction. Prove that the inclusion is locally fully faithful,
graded-linear and monoidal. Establish
transport, boundary formulas, label conservation, positive/nonnegative
label comparisons and oversized-label vanishing in this subcategory.
In particular, horizontal composition preserves total boundary label and
tensor adds it. The empty word remains the tensor unit.

The progressive subcategory is not required to carry all of Layer 5's
spatial duality: bending an object strand introduces the opposite sign.
The merge–split adjunction cells belong to these full 2-morphism spaces;
their elementary expressions are identified in Layers 5–6. Layer 6 defines
progressive foam expressions and proves their spanning theorem; neither is
part of the definition here. Comparisons with Soergel
bimodules and categorified quantum groups motivate this definition but are
not theorem targets here.

## Layer 5: spatial duality

Formalize spatial duality in the sense of
[Barrett–Meusburger–Schaumann, Gray categories with duals and their diagrams](https://arxiv.org/abs/1211.0529),
in the one-object Gray-category setting corresponding to a semistrict monoidal
2-category. Explain the dimension shift: objects, 1-morphisms and 2-morphisms
of the monoidal 2-category occupy dimensions 1, 2 and 3 in that Gray category.
Use Goertz–Marino–Wedrich §4.6 and Theorem 4.35 for the foam construction; match the Barrett–Meusburger–Schaumann duality
and spatiality definitions cited there, including their version/numbering.

First define the reusable duality data and axioms on the structure of Layer 3.
For each fixed gl(N) parameter σ use its canonical construction; the
unparameterized notation refers to σ=1.
Then construct them on all three main instances `NFoam`, `BN_A^→`, `BN_A` of
Layer 4: object duals, units and counits, adjoints for 1-morphisms, the two
duality operations `(−)^∗` and `#` (`#` acting on 1-morphisms by the left mate
`#W`), triangulator `▽_s` and comparison cells `Δ_W : #W ⟶ W^#` to the right
mate (Goertz–Marino–Wedrich, Construction 4.10, Theorem 4.35 and its proof),
stated in the ungraded view `Hom^u` together with the degrees of these cells,
and the spatial compatibility equations. Record the variance of each operation
in vertical composition, horizontal composition and tensor. Weak preservation
requires its comparison cells and coherence, not an equality substituted for
them.

Prove the triangle, involutivity and spatial identities in the required form,
with grading and linearity compatibility. Include cup–cap, rotated vertex and
mate calculations. Distinguish these algebraic identities from a completeness
theorem for geometric isotopy. Ordinary pivotal/spherical categories are useful
interfaces but do not replace the Barrett–Meusburger–Schaumann higher-dimensional structure.

In the gl(N) instance, specialize the adjoint structure to merge and split vertices. Package both
directions using `CategoryTheory.Bicategory.Adjunction`, retaining explicit
chosen units and counits. Verify the grading shifts needed for degree-zero
adjunction maps, rather than asserting an unshifted graded biadjunction.
Use Layer 3's formal-shift comparison and preserve its graded coefficient
action under the dualities; in particular, verify the shift reversal for
adjoints and the induced degrees of their units and counits.
Give explicit abstract foam representatives for these cells and the object
2-dualizability witnesses: the evaluation/coevaluation webs, their required
adjunction units and counits, and the triangulator/comparison 2-cells.
Evaluation and coevaluation are 1-morphisms; their witnessing foams are
2-morphisms. Derive the witnesses for tensor words from elementary boundary
objects. Layer 6 names and interprets these same models; the duality and
adjunction proofs here do not depend on the compiler.

## Layer 6: foam compiler and graphical relations

### Typed elementary expressions

The gl(N) compiler uses the following handcrafted abstract foam families
as elementary data:

- The 2-morphism witnesses for 2-dualizability of boundary objects from Layer 5,
  with their evaluation/coevaluation 1-morphisms and explicit boundary types.
- Zip, unzip, blister open and blister close, realizing the two merge–split
  adjunctions below.
- The two oriented associativity-vertex types with six adjacent local facet
  sectors, with their tetrahedral links, label equations and seam cyclic orders.

For each family specify its entire abstract incidence model, source and target
web, labels, facet orientations and decorations. Verify Layer 0 admissibility.
In particular, give the two associativity models separately, including how
their six local sectors attach to global facets; names and a count of sectors
are not sufficient definitions. Specify rotated/reversed variants by explicit
models or by the proved dualities. State any relations between the two types
as theorem targets, rather than assuming they are inverse by their names.

Use the fixed structural tensorator cells and their inverses when required by
the semistrict syntax. Circle opening, circle closing and saddle operations
are named expressions obtained from the dualizability data and composition;
give those expressions and verify their abstract models. They are not an
additional unspecified geometric input.

Here label admissibility means the local conservation and orientation rules,
not an upper bound by N. Generators with larger labels are defined before
evaluation; prove the resulting vanishing in the evaluated calculus.

For the Bar-Natan instances, use the nilvalent part of this calculus:
identity surfaces, circle opening/closing, saddles, decorations and the
object-duality witnesses. Include the boundary-reflection operation in the
unoriented syntax and verify its evaluated identity action for the chosen
involution. Prove compiler compatibility with the orientation-forgetting
2-functor. No zip, blister or associativity-vertex model is needed in this
nilvalent branch.

**KH3 (ordinary Khovanov generators).** In KH1's specialization, prove that
the compiled circle opening, closing, merge and split act under KH2 by K2's
unit, counit, multiplication and comultiplication. Include identities,
decorations and unaffected factors, and prove compatibility with vertical
composition, horizontal composition, tensor and orientation forgetting.
KH4 compares these abstract expressions with the formal surface templates;
KH3 itself needs no triangulated or embedded surface carrier.

### Merge–split adjunctions

Organize zip, unzip, blister open and blister close as the units and counits
of the two adjunctions between merge and split, following the viewpoint of
Dyckerhoff–Wedrich, *Perverse schobers of Coxeter type A*, §5.1. Their example
uses induction/restriction bimodules and Frobenius extensions; adopt the
adjunction interface here without requiring a Soergel-bimodule comparison.

For admissible a,b, let `P = (+a,+b)`, `Q = (+(a+b))`, and take the web
1-morphisms `M = merge_(a,b) : P → Q` and `S = split_(a,b) : Q → P` (Lean
adjunctions in the ungraded view `Hom^u`: `mergeSplitAdj a b : M ⊣ S`,
`splitMergeAdj a b : S ⊣ M`). With `≫` meaning first the left factor, use the
following boundary dictionary in the underlying ungraded category:

| Adjunction | Structure cell | Foam name in this convention |
| --- | --- | --- |
| `M ⊣ S` | `unit : id_P → M ≫ S` | zip |
| `M ⊣ S` | `counit : S ≫ M → id_Q` | blister close |
| `S ⊣ M` | `unit : id_Q → S ≫ M` | blister open |
| `S ⊣ M` | `counit : M ≫ S → id_P` | unzip |

Specify the matching oriented abstract incidence models; the boundary types, not
the names alone, determine the dictionary. In the graded theory state the
shifted adjunctions and degrees explicitly, using Layer 5's conventions: zip and
unzip have degree ab, blister open and blister close degree −ab, so `M ⊣ S{-ab}`
and `S ⊣ M{ab}` are adjunctions of the degree-zero shifted 2-category. Prove
that these four compiled generators equal the chosen adjunction cells. Export
all four triangle identities as graphical cancellation relations. Compatibility
of rotations/mates with spatial duality is an additional comparison, not a
consequence of merely possessing two adjunctions.

Reuse `Mathlib.CategoryTheory.Bicategory.Adjunction.Basic`, including
`Adjunction.unit`, `Adjunction.counit`, `left_triangle`, `right_triangle` and
`Adjunction.comp`; use bicategorical whiskering and coherence to place these
identities in larger expressions. Do not introduce a competing foam-specific
adjunction definition. Circle openings, closings and saddles retain their
separate Frobenius interpretation from Layer 2.

### Decorations and composition of expressions

Add identity foams and a generator decorating a specified facet of an identity
foam by an element of its decoration algebra. Distinguish scalar coefficients
from facet decorations. Prove the interpretation respects the unit, product,
addition and scalar laws of decorations.

Build well-typed expressions using side-by-side monoidal product, horizontal
composition and vertical composition, permitting identities in every context.
A useful normal presentation is a vertical stack of slices made from generators
and identities by horizontal composition and tensor. Its syntax must record
placement and order: independent-event exchanges are not imposed as strict
interchange if the target requires a tensorator. Any necessary structural
isomorphism is typed explicitly and interpreted using Layer 4.

### Direct abstract interpretation and compilation

For parallel webs S,T, construct the following interpretation chain:

```
FoamExpr(S,T)
  → DecoratedFoamWithBoundary L (Cl(S,T))
  → 𝓕_ev(Cl(S,T)){δ(S,T)} = Hom_𝔅(S,T).
```

Here 𝔅 is the Layer 4 instance in use, L its labelling datum and `𝓕_ev` its
state space (`𝓕_(N,σ)` for gl(N) over R with its specified map `Λ_N → R`
and unit σ; `𝓕_A^→`; `𝓕_A`); for `BN_A^→` and `BN_A` the middle
term is the module of decorated fillings of `Cl(S,T)` in `NilPreFoam^→`, resp.
the unoriented model `NilPreFoam`, of Layer 0. The final state space carries
Layer 4's specified grading shift δ. Recursively interpret the generators by
their explicit abstract models and the expression operations by the structural
abstract composition foams of Layer 4. Prove the boundary and admissibility
conditions at every step, as well as invariance under boundary-preserving
changes of representatives. No intermediate embedded foam, ambient isotopy or
geometric abstraction map occurs in this chain.

For closed source and target webs the boundary is `T ⊔ S^r`. For webs
with endpoints, use the specified abstract boundary connectors to obtain
Goertz–Marino–Wedrich's closed internal-Hom web. Prove agreement with
`Cl(S,T)`; the disjoint union of two open webs is not a closed boundary.
The abstract filling retains genus, incidence, facet orientations, seam orders
and decorations. Prove that passing to its state class agrees with direct
interpretation in Layer 4 and preserves vertical composition, horizontal
composition, tensor and decorations. Prove compatibility with the specified
grading and the Layer 5 dualities for rotated/reversed expressions.

### Relations as the kernel of compilation

For each fixed parallel boundary pair, define
`u ~ v ↔ compile(u) = compile(v)`. Extend compilation R-linearly from finite
linear combinations, using the native free-module/Finsupp machinery. A linear
foam relation is an element of the kernel of this linear map; equivalently two
linear combinations are related when their difference lies in that kernel.
For graded relations, retain degree data and prove the kernel is homogeneous.

Prove that these are equivalence relations and that their linear kernels are
stable under vertical and horizontal composition, tensoring with any composable
expression, and the specified duality operations. This is what permits replacing
a local relation inside a larger graphical expression. Prove the corresponding
quotient calculus maps faithfully onto the image of compilation.

Keep direct interpretation and its kernel-relation calculus separate from
surjectivity onto algebraic 2-hom spaces. The progressive spanning theorem
below additionally requires surjectivity for parallel progressive webs.
Layer 2 provides explicit abstract spanning fillings; expressing the required
maps in this particular elementary syntax is a further obligation.
Surjectivity for unrestricted web boundaries is not a target here.
Likewise the kernel definition
does not assert a decidable equality test or a finite complete list of relations.
Export the relations already proved for evaluation and decomposition into shifted empty webs in this
syntax, with explicit coefficients, degrees and boundary data. Layer 7 extends
the interpretation to insertion into arbitrary planar contexts.

In particular, identify the compiled circle-opening, circle-closing and saddle
expressions with Layer 2's Frobenius unit, counit, multiplication and
comultiplication. Export the Frobenius and neck-cutting identities as compiler
relations, including decoration insertions.

### Progressive foam expressions and spanning

Define progressive foam expressions only after the typed elementary
generators and compiler have been constructed. Select the instances of the
elementary families whose entire source and target web expressions
belong to Layer 4's progressive web syntax. Spell out this selection using
the boundary formulas for each family. It includes the positively directed
zip, unzip, blister-open and blister-close instances for merge and split,
and the allowed associativity-vertex instances. Classify each dualizability
witness by its full boundary types. Circle-opening and circle-closing
expressions are excluded because their webs contain circles. A derived saddle
expression is progressive only if its decomposition has progressive
intermediate webs; checking just its external signs is insufficient.
This makes the generator restriction
independent of whether a particular evaluated morphism happens to vanish.

Build expressions from these generators, identities and decorations on
identity facets by vertical composition, horizontal composition and tensor,
requiring every intermediate web to be progressive. Include the specified
structural tensorator cells and their inverses on progressive webs, with
their existing compiler interpretation. Arbitrary ambient 2-morphisms are
not primitive expressions. Call the foams obtained by this construction
progressive foams; no independent geometric slice condition defines the
2-morphism spaces of Layer 4.

For parallel progressive webs S,T, restrict the compiler to these expressions
and extend it linearly. Prove the surjectivity theorem
`compileProg : (ProgressiveFoamExpr(S,T) →₀ R) →ₗ[R] Hom_(NFoam^prog)(S,T)`,
where the source is the free R-module of finite linear combinations of
progressive expressions. Equivalently, every ambient 2-morphism between
these webs is a finite R-linear combination of their compiled values.
Prove the graded version with homogeneous expressions and coefficients of
the required total degree, for both label theories and the coefficient
instances constructed in Layers 1–2.
In the degree-zero shifted presentation, translate each
homogeneous expression and coefficient using Layer 3; do not discard the
positive-degree coefficients by replacing R with R₀ in the spanning claim.

Prove this through the following internal-hom and annular argument.

1. Use Layer 4's `Cl(S,T)` as the trace closure of the corresponding
   composite of progressive webs, with its specified dual, order and shift.
   Construct bending and unbending as inverse maps using the existing
   internal-hom operations; prove that their closure conventions agree.
2. Give an annular reduction certificate expressing its state space V as a
   retract of a finite sum C of shifted state spaces of concentric labelled
   circles, with homogeneous foam maps i:V→C, p:C→V and p∘i=id.
   Adapt Queffelec–Rose, Proposition 5.1, using the direct-summand steps
   described in Gorsky–Wedrich, Remark 4.21. Prove the local maps over Λ_N
   from the contextual relations, then specialize and change normalization.
   Keep labelled circles, rather than splitting them by rational Young
   symmetrizers. Prove termination, p∘i=id_V and the formula for the
   projector i∘p at each retract step; reserve two-sided inverse identities
   for isomorphism and biproduct moves. An explicit homotopy equivalence
   V[0] ≃ C• whose terms are finite sums of shifted circle-state spaces also
   suffices: its homological degree-zero components give a retract of C⁰
   onto V, since every chain homotopy on V[0] is zero. Require these components
   to be homogeneous integral equivariant foam expressions. An abstract
   equivalence, or one established only over complex coefficients, does not
   by itself supply the required witnesses.
3. Realize every annular slide used in those witnesses as a composite of
   Layer 5's left and right # operations. Under unbending identify it with
   a *-mate calculation. Check on each elementary family that the needed
   mates are progressive expressions, including intermediate webs, degrees
   and decoration transport, then extend under the three compositions.
4. Decorated nested cups span the state spaces of concentric circles by
   the explicit circle bases. Apply p to this family; its images span V.
   Express each image as nested cups followed by a trace closure of
   progressive expressions, and unbend to obtain the asserted surjection.

The annular witnesses and their translation are proof obligations in this
calculus, not consequences of defining the progressive category as an image.
Nested cups are auxiliary state vectors, not extra progressive generators.
Carry out the argument for each specified normalization, with σ=1 as the
default, using its canonical duality maps. Deduce that the
progressive expression module modulo the compiler
kernel is isomorphic to the full 2-hom module, compatibly with the three
compositions, decorations and grading. This does not claim that every
geometric representative is isotopic to a progressive expression, or that
a finite list of local relations presents the kernel.

## Layer 7: canopolis

Carry out the disk construction for gl(N) and for both nilvalent instances.
For oriented Bar-Natan use signed boundary points; for its unoriented version
use unsigned points. In both cases webs have no trivalent vertices, and
2-morphisms use their respective Layer 2 state spaces. Prove compatibility
with orientation forgetting. The detailed labelled-web construction below
specifies the gl(N) instance.

A canopolis is a family of categories with operations that insert their objects
and morphisms into planar diagrams with holes; each insertion is a functor and
is compatible with substitution of diagrams. Use the oriented, labeled form of
[Bar-Natan, §8.2, Definition 8.1](https://arxiv.org/abs/math/0410495);
Bar-Natan's term is *canopoly*. Define this reusable structure and its
structure-preserving maps before constructing the foam instance.

### Planar operations and disk categories

Index categories by boundary profiles: finite ordered lists of signed labels,
read from a marked point on an oriented disk boundary. Use both label
theories of Layer 0. An operation is an oriented disk with numbered input
holes and marked boundary points, containing disjoint oriented labeled arcs
and circles that match the profiles. Reverse the boundary-orientation
convention on input holes when specifying the matching rule. Trivalent web
vertices belong to the inserted objects, not to these connecting diagrams.
Take operations up to boundary-preserving planar isotopy and prove identity,
substitution, associativity, boundary transport and relabeling laws. This
collection with substitution is the colored planar operad acting on the
categories; no separate general operad theory is a prerequisite.

Construct a category `Can(b)` for each profile b. Its objects are planar webs
with that boundary. Define its morphism modules by the abstract closure state
spaces of Layer 2, using the same grading conventions as Layer 4.
Object representatives and planar web isotopy transport
must be specified so that the construction does not silently identify
distinct 1-morphism presentations from Layer 4.

For a connecting diagram 𝒟 with inputs b₁,…,bₖ and output b, construct
`𝒟_* : Can(b₁) × … × Can(bₖ) → Can(b)`. On objects insert webs; on
morphisms use the abstract identity strips and annuli associated to the
connecting arcs and circles, and the specified abstract gluing. Prove
multilinearity, preservation of identities and simultaneous
vertical composition, and compatibility with grading and scalar change.
Use the coefficient-balanced tensor products and shift comparisons from
Layers 0 and 3. For formal shifts of input web objects, sum the shifts on
the inserted output and prove compatibility with the graded central action.
Include k = 0 and the empty profile. A closed connecting circle produces a
circle web object, not a scalar by definition; its maps recover Layer 2's
Frobenius algebra after evaluation.

Prove independence of representatives and the canopolis unit and substitution
equalities in the chosen diagram model. If intermediate constructions use
comparison isomorphisms, supply their coherence and a comparison to a model
satisfying these equalities; merely naming a weak action does not establish
the stated canopolis. Prove that negligible relations are preserved by
every planar insertion by completing any output closing test to a test on
the replaced input. The abstract tests remain those of Layer 2.

### Comparison with the monoidal 2-category and compiler

For a cut of the marked disk boundary into an input word u and output word v,
construct an equivalence between the disk category and the hom-category
`𝔅(u,v)` of Layer 4, with the boundary reversal and grading shifts stated.
Include the passage between planar web diagrams and their elementary
presentations and prove independence of the chosen presentation by the
specified comparison maps. This is a comparison of evaluated categories,
not equality of raw web expressions.

Identify planar insertion under these equivalences with the corresponding
composites of horizontal composition, tensor and boundary bending. Prove
coherence under changes of cuts and decompositions using the tensorator and
Layer 5's spatial duality. Construct the comparison for the foam example;
no general equivalence of abstract higher-category formalisms is required.

Extend the compiler by allowing a planar insertion operation on compatible
expressions, interpreted by `𝒟_*`. Prove that existing compiled expressions
retain their interpretation and that kernel relations are stable under all
these operations. This extension does not assert that every resulting
expression can be rewritten using only the specified elementary families.
For progressive source and target webs, Layer 6's spanning theorem does
express its evaluated value as a linear combination of progressive expressions.

Use [Ehrig–Tubbenhauer–Wedrich, Definition 2.10](https://arxiv.org/abs/1703.06691)
as a reference for arranging foam categories in this way. The integral
evaluation and coefficient generality are those proved here; their
link complexes, deformation arguments and movie-move identities are outside
this layer.

### KH4. Comparison with Khovanov's formal surface calculus

Let B be KhovanovHomology K2's finite cyclically ordered, based set of unsigned
boundary ports, with |B|=2r. Consume its integral formal local cobordism
category, written here as Cob(B), whose relations are S (a sphere is zero),
T (a torus is twice the empty surface) and 4Tu (the four-tube relation).
For KH1's dual-number instance over ℤ, construct a linear functor
`J_B : Cob(B) → Can_A(B)` to the unoriented nilvalent disk category.
Identify B with a boundary profile by its basepoint and prove naturality
under the marking-preserving boundary relabellings of the source calculus.

On objects, compare K1's crossingless planar arc-and-circle models with the
nilvalent disk webs, retaining their boundary collars and isolated circles.
On morphisms, translate the admissible finite abstract surface presentations
to fillings of the closure of the source and target webs and take their
universal-construction classes. Retain the component, boundary-incidence and
attachment data needed by the unoriented carrier. Consume K3's
[closed-evaluation construction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/KhovanovHomology/README.md#k3-signed-cubes-complexes-and-euler-characteristic)
for the component/genus calculations and Frobenius normal-form gluing laws.
Prove invariance of the assigned classes under K2's marking-preserving
isomorphisms, relative subdivisions, inverse moves, diagonal flips and collar
refinements. Prove compatibility with identities, gluing and planar insertion.
This is a comparison of finite abstract presentations, not embedded foam geometry.

Prove S, T and 4Tu vanish in the target for every admissible abstract closing
test of Layer 2. Include the additional tests allowed by the unoriented
nilvalent domain; vanishing only after orientable formal closures is not
enough. Use the Frobenius neck-cutting identities and the identity involution
to prove contextual vanishing before descending to Cob(B). These are
rank-two specialization theorems, not imposed relations for general A or gl(N).

For an undecorated formal surface Σ, prove preservation of K2's degree
`χ(Σ)-r`: c=−1 makes the foam degree χ(Σ) and the closure shift −r.
Extend J_B to formal shifts and the degree-zero categories and, by the native
finite-additive-envelope construction, to their finite sums. This extension
does not include complexes or idempotent completions. For every commutative
ring R, extend the integral source's hom groups by scalars to R and construct
the compatible R-linear comparison to Can over `DualNumber R`.

Prove that the family J_B preserves planar insertion, with the boundary and
slot identifications explicit. Under every planar closing exterior, KH2
identifies its action with K3's formal-surface evaluation. On the generating
templates it agrees with KH3. Use this layer's boundary-cut equivalences to
obtain the comparison with the Bar-Natan monoidal 2-category, coherently under
changes of cut. No faithfulness, fullness, equivalence, or identification
with gl(2) foams is asserted for J_B.


## Verification examples and theorem boundaries

| Check | Error it should detect |
| --- | --- |
| N=2,a=1 equivariant circle and dual basis at σ=±1 | Lost equivariant correction or wrong trace normalization |
| N=2,3,4 cyclic hexagon switches, including correction summands | Negative quantum multiplicity or unjustified categorical cancellation |
| Nested decorated cups followed by annular retract projections | Abstract state spanning mistaken for progressive compiler spanning |
| A positive-genus closed foam with formal unit σ | Missing inverse powers of σ |
| Empty web and foam | Wrong evaluation normalization or tensor unit |
| Decorated sphere and theta | Wrong sign, degree or decoration transport |
| Circle Frobenius pairing and neck-cutting | Missing perfectness, grading shift or incorrect saddle interpretation |
| Bar-Natan dual numbers with trace ε(1)=0, ε(x)=1 | Wrong circle algebra; KH1 must put 1,X in degrees +1,−1 and reverse the c=1 example |
| KH2 on zero, one and two circles, and all four Frobenius maps | Incorrect basis, tensor comparison, unaffected factors or map degrees |
| KH4 on an undotted sphere, torus and a four-tube relation | Failure to obtain 0, 2 and contextual relation vanishing, including every admitted unoriented test |
| KH4 on an identity strip and two successive planar insertions | Wrong χ−r correction, collar transport or substitution law |
| KH2 and KH4 after ℤ → ℤ/2ℤ | Unjustified flatness assumption or a construction dividing by 2 |
| Unoriented boundary reflection and Klein-bottle gluing | Loss of attachment data or failure of closure under composition |
| Oriented-to-unoriented Bar-Natan 2-functor | Evaluation, composition or grading incompatible with forgetting orientation |
| Digon maps composed in both orders | Rank identity mistaken for a categorical decomposition |
| Cup–cap and rotated vertex | Wrong orientation, variance or grading shift |
| Tensorator naturality on generators | Strict tensor interchange imposed accidentally |
| Upward merge/split composites and a downward bend | Positive strand signs confused with positive labels, or nonprogressive webs admitted |
| Ambient 2-morphisms between progressive webs | The full 2-hom module incorrectly replaced by a span in Layer 4 |
| Reduction to progressive generator expressions | The required spanning theorem assumed from the definition or from decomposition into shifted empty webs alone |
| Two nested planar insertions and simultaneous stacking | Missing canopolis substitution or functoriality law |
| A nullary planar operation containing a circle | Circle object confused with its scalar evaluation |
| Two boundary cuts of the same disk diagram | Missing boundary reversal, grading shift or tensorator comparison |
| Pairing `B(x,y)=2xy` on `ℤ` | Nondegenerate mistaken for perfect |
| The same pairing modulo two | Radical quotient assumed to commute with all base changes |
| `e_i x` in degree `deg(x)+2i` | Graded Λ_N-action replaced by degree-preserving Λ_N-linearity on each piece |
| `(e_i m) ⊗ n = m ⊗ (e_i n)` over Λ_N | Tensor over ℤ confused with tensor balanced over Λ_N |
| A degree-d foam as `f → g{-d}` | Formal shift sign inconsistent with `(M{a})_p = M_(p-a)` |
| `e_i id_f` in the shifted degree-zero category | Positive-degree coefficients lost when taking degree zero |
| Shifts moved through both factors in either order | Missing higher shift coherence or accidental Koszul sign |
| Abstract facet orientations after gluing | Incompatible seam or boundary orientations |
| A generator placed in a nontrivial horizontal/tensor context | Confusing the three compositions or omitting side boundaries |
| A linear relation inserted inside a composite | Failure of kernel stability or decoration linearity |
| Compiler applied to a rotated generator | Mismatch with spatial duality or boundary conventions |
| Both merge–split adjunctions and their four triangle identities | Wrong generator pairing, missing shifts or unjustified cyclicity |
| Disks glued along a circle; annulus composed with itself | Incorrect Euler characteristic or identity cylinder |
| Splicing two cycles versus splicing one cycle | Failure to distinguish merging from splitting boundary components |
| Repeated seam occurrences and a seam returning to one vertex | Occurrence model silently identified with the Goertz–Marino–Wedrich regular subdomain |
| An a-labeled annulus with both boundaries on one seam, completed by a zero-labeled disk | Valid Robert–Wagner repeated incidence excluded; expected evaluation is binomial(N,a) with unit decorations |
| The same example with an integer decoration on the zero facet | Zero erasure discards a scalar factor |
| A positive a-labeled facet occupying both small seam roles | Admissibility confused with existence of a coloring; the coloring set is empty |
| A tetrahedral vertex whose local sectors reconnect globally | A link built from global facet names instead of corner occurrences |
| Zero-label vertex and rank-one circle | Positive-label inference reused outside its domain |
| Theta web with equal stored cyclic orders at its split and merge; then reverse just one order | The merge/split conversion omitted: the expected face counts are three and one, giving Euler characteristics two and zero |
| Compatible planarity under reverse and mirror | Stored seam-induced cyclic orders confused with ordinary rotation orders |
| Disconnected webs, the empty web and vertex-free circles | A global Euler characteristic test, fixed-point cycles omitted, an arbitrary planar rotation, or auxiliary vertices changing the web |
| A checked rotation system and its reconstructed crossing-free presentation | Numerical planarity mistaken for a proved presentation or reduction theorem |
| A local Robert–Wagner relation with arbitrary exterior identifications | Embedded-only closure test mistaken for an abstract contextual identity |
| A retract before its free-module upgrade | Quantum-integer division, categorical cancellation or unjustified freeness |
| Embedded tests applied to an abstract filling expansion | State-space comparison unnecessarily made dependent on movie completeness |

## Mathematical references and dependency order

- [Carpentier, From planar graphs to embedded graphs](https://arxiv.org/abs/math/0005128), Lemma 2: translate the finite planar switch/reduction argument directly to webs; its scalar proof does not itself prove categorical retracts.
- [Wu, Equivariant colored sl(N)-homology for links](https://arxiv.org/abs/1002.2662), §2.3, Theorem 2.10, Remark 2.11 and Proposition 3.13: circle presentation, Schur pairing and circle identification. Prove the required identities integrally here.
- [Khovanov–Kitchloo, A deformation of Robert–Wagner foam evaluation and link homology](https://arxiv.org/abs/2004.14197), equations (13)–(16): closed sign normalization. The unit family and ordinary rescaling used in Layer 2 are targets here.
- [Queffelec–Rose, Sutured annular Khovanov–Rozansky homology](https://arxiv.org/abs/1506.08188), Proposition 5.1, and [Gorsky–Wedrich, Evaluations of annular Khovanov–Rozansky homology](https://arxiv.org/abs/1904.04481), Proposition 4.13, Corollary 4.20 and Remark 4.21: annular reduction and its direct-summand form. Layer 6 requires integral equivariant witnesses in the present calculus, without a general current-algebra or Schur-functor equivalence.

- [Erickson, Computational Topology: Planar Graphs](https://jeffe.web.engr.illinois.edu/teaching/comptop/2023/notes/09-planar-graphs.html), sections on rotation systems and surface maps: finite edge-end, vertex and face permutations. Fix the composition convention explicitly when adapting it to web data.
- [Blanchet–Habegger–Masbaum–Vogel, Topological quantum field theories derived from the Kauffman bracket](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/bhmv.pdf), Topology 34 (1995), 883–927: universal-construction reference for Layer 2.
- [Khovanov, Universal construction of topological theories in two dimensions](https://arxiv.org/abs/2007.03361): supplementary universal-construction reference; no automatic strong monoidality.
- [Neuchl, Representation Theory of Hopf
  Categories](https://math.ucr.edu/home/baez/neuchl.pdf), Definition 1.8: a
  presentation equivalent to the Baez–Neuchl definition used for Layer 3.
- [Baez–Neuchl, Higher-Dimensional Algebra I: Braided Monoidal
  2-Categories](https://doi.org/10.1006/aima.1996.0052), Lemma 4 (data (1)–(7)
  and conditions (i)–(viii)): explicit semistrict monoidal 2-category definition
  for Layer 3, verified for foams in Goertz–Marino–Wedrich, Theorem 4.29, with
  the braided extension outside this roadmap's scope.
- [Dyckerhoff–Wedrich, Perverse schobers of Coxeter type A](https://arxiv.org/html/2504.08496v1#S5.SS1), §5.1: ambidextrous adjunctions up to shifts and their foam diagrams, motivating Layers 5–6's merge–split interface.
- [Mathlib bicategory adjunctions](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.html): structure cells, triangle identities and composition lemmas used in Layers 3, 5 and 6.
- [Mathlib enriched ordinary categories](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Enriched/Ordinary/Basic.html) and [shifted homs](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Shift/ShiftedHom.html): underlying ordinary morphisms, shift composition and the interfaces for Layer 3's comparison constructions.
- [Robert–Wagner, A closed formula for the evaluation of sl(N)-foams](https://arxiv.org/abs/1702.04140): integral evaluation and those concrete calculations needed in Layers 1–2. Reconcile its notation with the gl(N) convention.
- [Robert, A new way to evaluate MOY graphs](https://arxiv.org/abs/1512.02370), Lemma 4.2: the reduction to a smaller set of MOY relations used in Layer 2.
- [Wu, A colored sl(N) homology for links in S³](https://arxiv.org/abs/0907.0695), Theorem 2.4: the maximal-label induction whose categorical lifts give the finite-retract reduction in Layer 2. No matrix-factorization or link-homology development from that paper is required here.
- [Goertz–Marino–Wedrich, Monoidal 2-categories from foam evaluation](https://arxiv.org/abs/2602.11120): Layers 0 and 2–5; §§2–3 specify evaluation hypotheses and §4 supplies monoidal structure and then duality. Layer 6's abstraction and interpretation must agree with these constructions.
- [Goertz–Wedrich, A note on TQFTs for orientable 2-dimensional cobordisms](https://arxiv.org/abs/2511.19373), Lemma 8 and Propositions 10–11: the unoriented nilvalent domain and its presentation.
- [Barrett–Meusburger–Schaumann, Gray categories with duals and their diagrams](https://arxiv.org/abs/1211.0529): Layer 5's duality and spatiality axioms and the interpretation of their diagrams.
- [Queffelec–Rose, The sl(n) foam 2-category: a combinatorial formulation of Khovanov–Rozansky homology via categorical skew Howe duality](https://arxiv.org/abs/1405.5920), §3.1: reference for progressive diagrams and grading conventions. Layer 4 retains full ambient 2-homs; Layer 6 asks for spanning by progressive expressions. Equivalence with their presentation and quantum-group comparisons are outside the scope.
- [Bar-Natan, Khovanov's homology for tangles and cobordisms](https://arxiv.org/abs/math/0410495), §8.2, Definition 8.1: the canopolis structure in Layer 7, generalized to oriented labeled boundary profiles.
- [Ehrig–Tubbenhauer–Wedrich, Functoriality of colored link homologies](https://arxiv.org/abs/1703.06691), §2, especially Definition 2.10: foam categories and planar insertion; no link-functoriality theorem is imported.

Layer 0 constructs the unlabelled categories, general labelling data and
decorated linear categories before the gl(N) and Bar-Natan specializations. It
also supplies graded coefficient modules, balanced tensor and ordinary formal
shifts before they are used in Layers 1–2. Layer 3 adds enrichment and higher
shift compatibility independently of Layer 1. Layer 2 uses the two evaluations
of Layer 1 to construct gl(N) state spaces and planar decomposition, and
independently the Bar-Natan circle decompositions. Layer 4 joins these with the
higher-category interfaces. Layer 5 adds spatial duality; Layer 6 supplies the
compiler and its relations. The compiler's core interpretation uses Layer 4, and
its duality compatibility uses Layer 5. Layer 7 constructs the canopolis
from the same state theory, compares it with Layers 4–5 and extends Layer 6's
contextual relations. Layer 2 supplies the ordinary rescaling needed for
the parameterized state theory before its use in local relations and
decompositions. All constructions default to σ=1. Every layer is a target.

The Khovanov comparisons form a separate dependency chain: K2's chosen
algebra supplies KH1; the nilvalent state construction and K2's circle tensors
supply KH2; the nilvalent compiler supplies KH3; the disk construction, KH2–KH3,
K2's formal surfaces and K3's surface evaluation supply KH4. Only KH4 consumes
the formal surface calculus. Its finite-sum extension uses the native additive
envelope; no Khovanov complex, Reidemeister equivalence, smooth comparison or
movie theorem enters this chain. The general gl(N) evaluation and higher
categorical structures do not depend on KH1–KH4.

## Contributors

This roadmap is part of an autoformalization working group at IPAM, including
Juan Ramón Gómez García, Qiuyu Ren, Iordanis Romaidis, Paul Wedrich,
Michael Willis and Hongjian Yang.
