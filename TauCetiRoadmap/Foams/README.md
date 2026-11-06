# Roadmap: foams

**Summary.** Develop gl(N) foams as used in the combinatorial construction of
gl(N) link homology, following Robert–Wagner for evaluation and
Goertz–Marino–Wedrich for monoidal 2-categories. Construct their graded state
spaces, spatial duality, graphical calculus and canopolis, together with the
oriented and unoriented Bar-Natan counterparts. The progressive gl(N) category
has all ambient 2-morphisms between its permitted webs, and progressive foam
expressions span those spaces. [Robert–Wagner][rw] · [Goertz–Marino–Wedrich][gmw]

## Scope and ownership

This is one of four roadmaps aimed at formalizing the functoriality of type A
link homology. The components are web calculi and quantum-group representations,
the foam theory developed here, geometric topology and movie presentations,
and link homology with its functoriality. This roadmap supplies the raw web
theory its constructions need. Web representation comparisons consume it.

A web is an oriented trivalent graph, including vertex-free circles. A
prefoam is an abstract cobordism built from surface facets, seams and singular
vertices. Define unlabelled webs first, prefoams bounding a specified web
second, and closed prefoams as the empty-boundary case. Labelling systems
assign decoration algebras to labels. Evaluation assigns a scalar to a closed
decorated foam. The universal construction quotients fillings by all outgoing
closing tests to obtain state modules. Nilvalent webs and prefoams have no
vertices or seams. Their oriented and unoriented theories use commutative
Frobenius algebras.

The required endpoints include the following constructions and comparisons.

- General labelled prefoam categories, the integral equivariant gl(N)
  evaluation and both nilvalent evaluations, including their graded versions.
- Abstract state spaces and, on compatibly planar web objects, decomposition
  into shifted empty webs, perfect pairings and strong tensor comparison.
  All admissible abstract foams remain available between these objects.
- Reusable enriched semistrict monoidal 2-categories, formal shifts with the
  full graded coefficient action, and the concrete gl(N) and Bar-Natan instances.
- Spatial duality, explicit elementary abstract foams and their compiler,
  progressive spanning, and functorial disk insertion with its comparisons.

KhovanovHomology K2 owns the chosen rank-two Frobenius algebra, circle tensors
and formal surface category modulo sphere, torus and four-tube relations.
Its K3 closed-evaluation construction supplies the formal surface evaluation.
Foams owns KH1 (grading, 1.4), KH2 (states, 2.13), KH3 (generators, 6.1)
and KH4 (formal surfaces, 7.4), using these contracts. The general Frobenius
theory and evaluated nilvalent categories are developed here. The exact
remaining ownership boundaries appear in the supplier contracts below.

The compiler interprets handcrafted abstract generators. Its inputs carry
finite incidence data. Crossing complexes, Reidemeister equivalences, movie
functoriality, embedded foam geometry, quantum-group representations, geometric
Grassmannian cohomology and comparison with Soergel bimodules are outside this
roadmap. The canopolis comparison concerns these concrete foam categories.

Suggested home is `TauCeti/KnotTheory/Foam/`, with reusable categorical results
under `TauCeti/CategoryTheory/`. The README specifies the mathematics.
[Suggested.lean](Suggested.lean) states the expressible Frobenius-reconstruction
and integral graded-freeness headlines as acceptance tests.

## Conventions

The table fixes the conventions used throughout; the layers below may restate
them with more detail.

| Item | Convention | Where |
| --- | --- | --- |
| Composition | In Lean, f ≫ g is first f, then g, for morphisms, 1-morphisms and 2-morphisms; in prose g ∘ f := f ≫ g. Goertz–Marino–Wedrich compose functionally | All layers |
| Hom-categories | 𝔅(s,t) is the hom-category from s to t; Goertz–Marino–Wedrich write _t𝒞Foam_s, target first | Layers 4, 7 |
| Monoidal tensor | ⊠ on objects of a semistrict monoidal 2-category, with unit the empty word ∅ in the foam instances; 1- and 2-morphisms are tensored by the left and right tensoring 2-functors, and f ⊠ g := (s ⊠ g) ≫ (f ⊠ t') for f : s → t, g : s' → t'; ⊗ is reserved for the enriching category and modules | Layers 3, 4 |
| Tensorator | (s ⊠ T) ≫ (S ⊠ t') ≅ (S ⊠ s') ≫ (t ⊠ T) for S : s → t, T : s' → t' (Goertz–Marino–Wedrich, Construction 4.28) | Layer 3 |
| Boundary words | +a = (a,↑), -a = (a,↓), with ↑ the direction of composition of 1-morphisms; the dual word s^# reverses order and signs | Layer 4 |
| Cups and caps | cup←_a : ∅ → (+a,-a), cup→_a : ∅ → (-a,+a), cap→_a : (+a,-a) → ∅, cap←_a : (-a,+a) → ∅ | Layer 4 |
| Vertex labels | a+b=c, where c labels the end of odd orientation and a, b the next two ends in the cyclic order (Goertz–Marino–Wedrich, Definition 3.12) | Layer 0 |
| Labels | Unbounded natural labels: nonnegative L_ℕ and positive L_+; NFoam uses L_ℕ, and positive words and webs form its locally full sub-2-category NFoam_+ | Layers 0, 4 |
| Webs | Interval edges (arcs, including arcs with both ends at one vertex) and vertex-free circles; Goertz–Marino–Wedrich's "loops" are circles | Layer 0 |
| Orientation marking | Where oriented and unoriented versions both exist, a bare name denotes the unoriented one and an arrow (prose) or the prefix Oriented (Lean) the oriented one | Layers 0, 1, 2, 4 |
| Equivariant ring | Λ_N = ℤ[e₁,…,e_N], deg eᵢ = 2i, identified with ℤ[X₁,…,X_N]^(S_N) by eᵢ ↦ eᵢ(X₁,…,X_N), deg X_j = 2 | Standing conventions |
| Normalization | σ is a degree-zero unit; universal ring Λ_N[σ,σ⁻¹]. Default σ=1 (Ehrig–Tubbenhauer–Wedrich); literal Robert–Wagner formulas use σ=−1. The coefficient involution is the identity | Layers 1–2 |
| Coefficients | 𝕜 is a commutative ℤ-graded ring, commutative without signs. In statements about an instance, R is its coefficient ring: Λ_N (equivariant gl(N)); a ring with a specified map Λ_N → R and degree-zero unit σ, with the construction carried out directly over R (specialized gl(N)); or the base ring of A (Bar-Natan) | Layers 0, 3, 4 |
| Shift | (M{a})_d = M_(d-a); a degree-d 2-morphism f → g is a degree-zero map f → g{-d}; on hom-categories f⟦n⟧ = f{-n}, so it is a ShiftedHom f g d | Layers 0, 3 |
| Hom views | Hom^•(f,g) (full graded), its pieces Hom^d(f,g), Hom^0(f,g) (degree zero) and Hom^u(f,g) (ungraded); each statement about 2-morphisms names one | Layer 3 |
| Foam degree | deg dec(F) - Σ_f k(N-k) χ(f) + Σ_s ((k+l)(N-k-l)+kl) χ(s) - Σ_v ((k+l+h)(N-k-l-h)+kl+lh+kh) over facets of label k, all seams (also those ending on the boundary) with labels k, l, k+l, and singular vertices; boundary edges and vertices are not summed (Goertz–Marino–Wedrich, formula (3.10), Example 3.39) | Layer 1 |
| 2-hom shift | gl(N): δ(S,T) = ½(w_N(S)+w_N(T)), an integer since w_N(S) = w_N(T); Bar-Natan: δ(S,T) = ½(c(s)+c(t)) | Layer 4 |
| Frobenius degrees | deg m = deg η = 0, deg Δ = -deg ε = 2c; the circle carries A{-c}; A is supported in even degrees before this shift | Layers 0, 1 |
| Ordinary Khovanov specialization | A = DualNumber R, deg 1 = 0, deg X = -2, c = -1; the circle A{1} has degrees +1,-1 on 1,X. Quantum tensor symmetry is unsigned | KH1–KH4 |
| Adjunctions | unit : 𝟙 ⟶ f ≫ g, counit : g ≫ f ⟶ 𝟙; zip and unzip have degree ab, blister open and blister close degree -ab; in Hom^0 the adjunctions are M ⊣ S{-ab} and S ⊣ M{ab} | Layers 5, 6 |
| Axes | (x, y, z) = (⊠, composition of 1-morphisms, composition of 2-morphisms), Goertz–Marino–Wedrich's axes 0, 1, 2; their 0-axis arrow points left | Layer 4 |
| Empty web and word | Both are written ∅ | Layers 2, 4 |

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
  closed webs PositiveWeb and NonnegativeWeb. Neither version has an upper
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
- Vertical composition α ≫ β means first α, then β. Distinguish vertical
  composition, horizontal composition and tensor in notation and types. Each
  graphical formula specifies source, target, degree and stacking order.
- The Bar-Natan input is a commutative Frobenius algebra A, finite free over
  a commutative ring R, with multiplication m, unit η, comultiplication Δ,
  trace ε and perfect pairing ε(ab).
  Use the identity involution for the required unoriented instance.
  In the graded version require A to be supported in even degrees:
  A_(2j+1)=0 for every integer j. This applies before the circle shift
  A{-c}; shifted state spaces and 2-homs may have odd degrees.
  Require a finite homogeneous basis for the graded decomposition theorem.
  No rank-two, field or characteristic-zero restriction is imposed.
- Internal integer degree is distinct from the homological degree used in link
  homology. For gl(N), use Robert–Wagner's closed decorated foam degree; for
  Bar-Natan, use the Frobenius grading specified in Layer 1. Specify the
  boundary corrections for fillings and the shifts of closure state modules
  defining 2-homs so that identity foams have degree zero; prove degree
  additivity for all three compositions. Use Tau Ceti's native shift convention
  (M{a})_d = M_(d-a). Distinguish a full graded hom-module, its degree-zero
  part, and the underlying ungraded module. Additive and Karoubi completions for
  link complexes are downstream constructions. The finite sums, shifts and
  retracts used to state the foam decompositions belong here; reuse the existing
  categorical interfaces for them.
- Use the canonical category, linear and tensor instances constructed on each
  carrier. Use type synonyms for genuinely different structures rather than
  allowing unrelated instances to replace the intended structure in a theorem.

Here **prefoams** are foam representatives before evaluation relations:
unlabelled, labelled or decorated according to the stage specified. The prefixes
Labeled and Decorated mark labelled and decorated records, and categories
before evaluation relations are named …PreFoam. A **skein quotient** imposes
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

## Exact supplier contracts

### From Mathlib

- Use `CategoryTheory.Bicategory`, `CategoryTheory.Bicategory.Strict`,
  bicategorical adjunctions and their triangle/composition laws for the
  underlying 2-category. Use the ordinary monoidal opposite and standard rigid
  mates for ordinary-category comparisons. Higher spatial duality is developed
  in Layer 5. [Bicategories][ml-bicat] · [Monoidal opposites][ml-opp]
- Use `CategoryTheory.Preadditive`, `CategoryTheory.Linear`, linear quotients,
  finite additive envelopes and idempotent completions for the corresponding
  ordinary constructions. `CategoryTheory.MonoidalLinear` supplies linearity
  of an ordinary monoidal category. Layer 3 specifies the higher operations.
  [Linear categories][ml-linear] · [Linear quotients][ml-quotient]
- Use integer-graded objects and their convolution tensor when the required
  coproducts and preservation hypotheses hold, and use enriched ordinary
  categories, shifts and shifted homs for their stated interfaces.
  [Graded objects][ml-graded] · [Enriched categories][ml-enriched] · [Shifts][ml-shift]
- Use native module bases, linear maps, submodules, quotients and tensor products.
  `LinearMap.IsPerfPair` expresses perfectness, and `Coalgebra.IsFrobenius`
  expresses the Frobenius law. Section 0.8 constructs the trace-to-coalgebra
  comparison over finite free commutative algebras. [Perfect pairings][ml-pairing]
  · [Frobenius coalgebras][ml-frobenius]
- Use the symmetric-polynomial invariant ring and its fundamental theorem,
  weighted homogeneous submodules and polynomial grading for the coefficient
  and decoration rings. [Symmetric polynomials][ml-symmetric]

### From Tau Ceti

- Use `TauCeti.MorphismIdeal`, its quotient, quotient functor, zero criterion
  and lift, together with the additive quotient infrastructure. Verify tensor
  stability for the foam ideal using TemperleyLieb's contract below.
  [Morphism ideals and quotients][tc-ideal]
- The graded-module category and its shifts supply internally graded modules
  with degree-preserving maps. Its projectivity interface transfers underlying
  projectivity to categorical projectivity. Its bounded-below graded Nakayama
  theorem supplies generation from the positive-degree quotient. Sections 0.10
  and 2.8 specify the additional tensor and homogeneous-basis results needed
  here. [Graded modules][tc-graded] · [Projectivity][tc-projective] · [Nakayama][tc-nakayama]
- `TauCeti.hsymm_mul_diagramSchurPoly` and `TauCeti.hsymm_mul_schurPoly`
  give the complete-symmetric Pieri rule. The elementary-symmetric rule is the
  separate SchurWeyl contract below. [Complete-symmetric Pieri][tc-pieri]
- Permutation triples and bipartite ribbon graphs supply finite vertex, edge,
  face and connected-component data. Section 2.4 constructs the trivalent-web
  adapter and handles vertex-free circles. [Permutation triples][tc-permutations]
  · [Bipartite ribbon graphs][tc-ribbon]

### From other roadmaps

| Supplier and section | Contract consumed | Foams construction |
| --- | --- | --- |
| [PivotalSpherical, Layers 0–2][pivotal] | Ordinary chosen dual pairs, mates, monoidal dual functor, pivotal structure and traces | Match chosen foam pairings, then construct higher spatial duality |
| [KhovanovHomology, K1–K2 and K3 closed evaluation][khovanov] | Finite planar calculus, chosen graded Frobenius algebra, circle tensors, formal surface relations and evaluation | KH1–KH4 |
| [TemperleyLieb, Layer 2 and Layers 6–7][tl] | Ordinary presentations, categorical tensor ideals, additive/monoidal envelopes and quotient descent | Verify the foam ideals and higher-operation compatibility |
| [SurfaceTopology, Layer 2][surface] | Finite-map/permutation-triple/bipartite-ribbon-graph comparisons and Euler counts | Adapt trivalent rotations and vertex-free circles, prove fixed-rotation planarity |
| [PlanarTopology, Layers 6–7][planar] | Euler/orientation results and Schoenflies and interior-arc isotopy theorems | Relative-boundary disk diagrams, collar transport and insertion in Layer 7 |
| [RepresentationTheory/SchurWeyl, Layer 7][schur] | Young-diagram identities, Schur bases and both horizontal- and vertical-strip Pieri rules | Decoration substitutions, integral circle pairing and foam decomposition maps |
| [DGAInfinity, Layers 0–1][dga] | Graded module presentations and the total grading/universal property of balanced tensor products | Central commutative coefficient instances in 0.10 |
| [ZigzagPreprojective, Layer 8][zigzag] | Graded endobimodule tensor and its generic associator/unit coherence within the braid-complex development | Unsigned symmetry, coherent shifts and homogeneous scalar extension in 0.10 |
| [AlgebraicVectorBundles, Layer 2A][bundles] | Packaging homogeneous unit and multiplication as a monoid object under the requisite convolution/coproduct hypotheses | Apply the constructor to the circle algebras with their actual grading |
| [GrothendieckEulerForms, Layer 3: finite resolutions and the resolution theorem][euler] | Free internally graded modules with specified generator degrees | Prove finite homogeneous freeness of weighted integral retracts in 2.8 |

The general constructions in these supplier contracts retain their owners.
Closed-web planarity uses the finite-map interfaces. Layer 7 additionally
constructs the relative-boundary comparisons required by its disk operations.

## How to read the build

Layer 0 supplies finite records, decorations, Frobenius algebra and coefficient
foundations. Layer 1 supplies evaluations and Layer 2 their states and planar
reconstruction. Layer 3 develops the higher categorical interfaces independently
of the evaluations. Layer 4 combines them, Layer 5 constructs duality, Layer 6
interprets generators and proves progressive spanning, and Layer 7 adds disk
insertion. The ordinary normalization comparison precedes the planar relations.
KH1 → KH2 → KH3 → KH4 is an additional comparison chain. Each target lists
its statement inputs and any additional inputs to the suggested proof route.

## Layer 0: unlabelled prefoams, labelling and linearization

Use Goertz–Marino–Wedrich-style finite records, with indexed boundary
components and incidence occurrences allowing the repeated incidences
permitted by Robert–Wagner. Construct the unlabelled, labelled and linearized
foam-record stages in that order. The Frobenius-algebra and coefficient-module
foundations are independent developments. The underlying records contain
neither labels nor decorations.

### 0.1 Unlabelled closed webs

Define ClosedWeb by finite vertices, oriented interval edges and vertex-free
circles. Record source and target ends separately, including when they meet the
same vertex. Each vertex has three incident ends, a cyclic order and a
merge/split orientation pattern. Include the empty web, isomorphisms, disjoint
union, reversal W^r of interval orientations and mirror reversal W^m of
cyclic orders. A web without vertices (a nilvalent web) consists only of
vertex-free circles.

- Supply incidence transport, isomorphism extensionality, reversal and mirror involutions, and
  disjoint-union unit and associativity maps.

**Checks.**

- The empty web has no vertices, interval ends or circles; one vertex-free circle has zero vertices
  and one circle component. These are different objects.
- An interval loop at a vertex contributes two distinct incident ends and one edge; counting edges
  instead of ends gives the wrong valence.
- On three ends a,b,c, cyclic rotation takes (a,b,c) to (b,c,a), whereas mirror gives (a,c,b). Only
  the former preserves the original cyclic order.

Adapt [Goertz–Marino–Wedrich v1, Definition 3.4, p. 13][gmw] to separate edge-end occurrences and
vertex-free circles.

*Needs:* Statement: finite sets, permutations and directed incidence. Proof: finite isomorphism
transport.

### 0.2 Unlabelled prefoams with specified boundary

For an unlabelled closed web W, define FoamWithBoundary W by:

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

Define ClosedFoam := FoamWithBoundary empty.
An unlabelled prefoam U→V has boundary V ⊔ U^r. Isomorphisms preserve
all incidence, orientation, genus and specified-boundary data.

- Supply boundary restriction, occurrence counts, isomorphisms and disjoint union; derive the
  empty-boundary case from the same records.
- Compare the permitted unlabelled local links with the Robert–Wagner models; their colored surface
  consequences are proved in 1.1.

**Checks.**

- A disk facet has genus 0, one boundary circle and Euler characteristic 1; a sphere has genus 0, no
  boundary and Euler characteristic 2.
- An annulus has two indexed boundary components and Euler characteristic 0. Equal boundary words on
  its two components still contribute two occurrences.
- The cyclic words (+s,+t,−u) and (+t,−u,+s) agree by rotation. Reversing traversal gives
  (+u,−t,−s), a different oriented boundary word.
- A local seam has three sheet occurrences even when two refer to one global facet. Four occurrences
  fail the local model; a circular occurrence winding twice also fails.

This occurrence model adapts [Goertz–Marino–Wedrich v1, Definitions 2.1 and 3.1, pp. 9–10,
12–13][gmw]. Its repeated global incidences are an extension of their records. Prove admissibility
using [Robert–Wagner v3, Definition 2.1, Remark 2.2 and Lemma 2.5, pp. 6–8][rw].

*Needs:* Statement: 0.1 and finite cyclic words. Proof: finite boundary-cycle and
Euler-characteristic bookkeeping and the stated local-link comparisons.

### 0.3 The unlabelled prefoam category

Construct cylinders and gluing along whole boundary webs. Prove preservation of
the local conditions, associativity up to boundary-preserving isomorphism and
the cylinder unit laws, tracking genus by Euler characteristic. On isomorphism
classes this gives an ordinary symmetric monoidal category PreFoam, with
disjoint union as tensor and the empty web as unit. Construct it before
introducing a coefficient ring, labelling or linearization. Its nilvalent
prefoams form a non-full subcategory NilPreFoam^→.

- Supply well-defined composition on isomorphism classes, identity and tensor formulas, and the
  oriented nilvalent inclusion.

**Checks.**

- Gluing two disks along their circle gives a sphere: 1+1−0=2 is its Euler characteristic.
- Gluing two annuli along one boundary circle gives an annulus with two remaining boundary circles
  and Euler characteristic 0.
- The empty cylinder is the identity of the empty web; the circle cylinder is an annulus, with two
  boundary circles rather than one.

Adapt [Goertz–Marino–Wedrich v1, Definition 3.9 and Proposition 3.10, p. 17][gmw]; prove closure for
the occurrence model of 0.2.

*Needs:* Statement: 0.1–0.2. Proof: the gluing construction and occurrence-preserving isomorphisms.

### 0.4 Unoriented nilvalent prefoams

Add a separate finite combinatorial model NilPreFoam with unoriented boundary
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

- Supply surface-type and boundary-attachment transport, composition, tensor, the finite
  presentation and orientation forgetting.

**Checks.**

- The closed torus has genus 1 and Euler characteristic 0; the Klein bottle has crosscap number 2
  and Euler characteristic 0. Their records remain distinct.
- A Möbius band has crosscap number 1 and is excluded, although its Euler characteristic is 0.
- Closing the two ends of an annulus with the two attachment parities gives a torus or a Klein
  bottle. Both are allowed; genus alone cannot determine the composite.

Use [Goertz–Wedrich v2, Definition 1 and Example 2, p. 1, Lemma 8 and Propositions 10–11, pp.
3–4][gw-cob]. This is their category generated by orientable cobordisms, with boundary attachments
retained.

*Needs:* Statement: finite boundary-circle sets and surface-type records. Proof: 0.3 and the
orientable-generator presentation.

### 0.5 Labelling data and labelled prefoams

For a commutative ring R, define a trivalent **labelling datum** L as in
Goertz–Marino–Wedrich: a semigroup of labels with associative operation written
+, and a commutative R-algebra Dec(a) for each label a. The label operation
need not be commutative. If there is a neutral label 0, include Dec(0) ≅ R.
For either nilvalent version, only a set of labels and its family of commutative
R-algebras are required. The Bar-Natan datum has a single label with decoration
algebra A. Add compatible gradings when used: on each Dec(a), and integer
weights, depending on the labels, for facets, seams and singular vertices.

A labelled web (LabeledClosedWeb L.Label) assigns labels to its interval edges
and circles, satisfying the ordered equation a+b=c at each merge/split vertex,
where c labels the end whose orientation differs from the other two and a, b
label the next two ends in the cyclic order (Goertz–Marino–Wedrich, Definition
3.12). A labelled prefoam (LabeledFoamWithBoundary L W; closed case
LabeledClosedFoam L) assigns labels to facets, restricting to the specified
boundary labels. At a trivalent seam require a+b=c in the order determined by
its incidence and orientation roles. Impose Goertz–Marino–Wedrich's two ordered
associativity configurations at singular vertices. Retain the role data when
labels coincide or include 0; it is not inferred from numerical size.

Construct the category LabeledPreFoam L of labelled, undecorated prefoams and
its forgetful functor to PreFoam. Gluing joins only facets of the same label.
Closed labelled prefoams are again the empty-boundary case.

- Supply label-preserving isomorphisms, boundary restriction, gluing, forgetful functors and change
  of labelling datum preserving its ordered equations and decoration algebras.

**Checks.**

- For natural labels the ordered merge (1,2) has output 3.
- At 0+0=0, the distinguished end and merge/split role remain part of the incidence data; equal
  labels do not erase them.
- In S₃ with rightmost-first composition, (12)(23)=(123), whereas (23)(12)=(132). Exchanging the two
  ordered inputs changes the output label.

Use [Goertz–Marino–Wedrich v1, Definitions 2.4–2.5, pp. 10–11, and Definitions 3.11–3.13, pp.
17–18][gmw], on the occurrence records of 0.2.

*Needs:* Statement: 0.1–0.4, semigroups and commutative algebras. Proof: the two ordered
associativity configurations and label-compatible gluing.

### 0.6 Decorations and linearization

A decorated representative (DecoratedFoamWithBoundary L W; closed case
DecoratedClosedFoam L) assigns an element of Dec(a) to each facet of label
a. For a fixed labelled prefoam F, the decoration module is ⊗_(f ∈ Facets(F),
R) Dec(label(f)); individual assignments give pure tensors. Form hom-modules
from these modules, identifying isomorphic labelled records via the induced
permutation and transport of their tensor factors. Equivalently, impose
facet-decoration multilinearity and isomorphism transport on formal R-linear
combinations of decorated representatives.

Lift gluing by multiplying decorations in Dec(a) when a-labelled facets join;
identity facets carry 1. Prove bilinearity and the symmetric monoidal category
laws, obtaining LinearPreFoam L. No maps between decoration algebras of
different labels are required by gluing. Evaluation relations are imposed
only later. The ordinary unlabelled and labelled categories remain separate
from this linear category.

- Supply the multilinear insertion maps, isomorphism transport, hom-module extensionality, bilinear
  composition and linear tensor.

**Checks.**

- Joining two a-labelled facets decorated by x and x² gives decoration x³ in Dec(a).
- Decorating a fixed facet by x+y gives the sum of the two decorated foams. For two facets,
  (x+y)⊗z=x⊗z+y⊗z.
- With no facets the decoration tensor is R, not the zero module. A decoration 0 on any existing
  tensor factor gives zero.

Adapt [Goertz–Marino–Wedrich v1, Definition 3.13 and Proposition 3.17, pp. 18–19][gmw], explicitly
imposing facet multilinearity.

*Needs:* Statement: 0.5 and finite tensor products. Proof: 0.3, multiplication in each decoration
algebra and multilinear universal properties.

### 0.7 The gl(N) labelling instances

Instantiate L with either positive or nonnegative natural labels under addition
(the data L_+ and L_ℕ) and Dec_R(a) = R[x₁,…,x_a]^(S_a), first for R=ℤ and
then for R=Λ_N. Compare the latter decoration algebras with extension of scalars
from ℤ. Neither label semigroup has an upper bound; N enters the evaluation.
Construct the positive inclusion and bounded subtheories of these instances.

Construct zero-label erasure with explicit local rules. Smooth the bivalent
point left by an (a,0,a) web vertex and remove all-zero vertices. For foams,
remove zero facets and join the surviving sheets, handling every zero
pattern in a,b,c,a+b,b+c,a+b+c. Track circles created and changes of genus
and boundary components. Since Dec_R(0)=R, extract decorations of deleted
facets as scalar factors. Prove compatibility with boundary and raw gluing
here; erasure does not identify unreduced records. Layer 1 proves evaluation
invariance, and Layer 2 constructs the state-space and evaluated-category
comparisons.

- Supply symmetric-polynomial decoration transport, positive-label inclusion, zero-erasure maps and
  their boundary/gluing formulas.

**Checks.**

- At rank N=2 a raw facet labelled 3 is allowed. Its vanishing after evaluation is an evaluation theorem.
- Dec_R(0)=R, Dec_R(1)=R[x] and Dec_R(2)=R[x₁+x₂,x₁x₂]; the two-variable case uses invariant polynomials.
- Erasing an (a,0,a) vertex joins its a-labelled edges. Deleting a zero-labelled facet decorated by
  3 contributes scalar 3, not 1.

Use [Goertz–Marino–Wedrich v1, Examples 2.10–2.11, p. 12][gmw] and [Robert–Wagner v3, Remark 2.13,
p. 11, Lemma 3.22, p. 25][rw]. The complete raw erasure and its occurrence bookkeeping are
constructed here.

*Needs:* Statement: 0.5–0.6 and symmetric polynomials. Proof: the finite zero patterns and
symmetric-polynomial scalar extension.

### 0.8 Frobenius algebra foundations

For a commutative ring R and a finite free commutative R-algebra A, a
Frobenius trace is an R-linear map ε such that a ↦ (b ↦ ε(ab)) is an
isomorphism A ≅ Hom_R(A,R). Use the native perfect-pairing and
Coalgebra.IsFrobenius interfaces. From a basis and its ε-dual basis,
construct Δ, prove independence of the basis, and prove the counit,
coassociativity and Frobenius identities. Compare this trace presentation
with a coalgebra structure having counit ε and satisfying those identities.

Supply transport by trace-preserving algebra isomorphisms, tensor products,
scalar extension and the dual-basis and handle identities used below.
Prove `existsUnique_frobeniusCoalgebra` from Suggested.lean. It characterizes
the coalgebra uniquely by its prescribed counit and the Frobenius law over a
commutative ring. In the graded version require even support,
deg(m)=deg(η)=0 and deg(Δ)=-deg(ε)=2c for an integer c.
Prove compatibility of the comparisons and scalar extensions with those
gradings whenever the target also satisfies
these hypotheses. Finite projectivity alone does not supply the homogeneous
basis required for circle decompositions.

For the ordinary rank-two instance, consume KhovanovHomology K2's native
DualNumber R carrier, chosen coalgebra, perfect trace pairing and base-change
comparison. Prove that the coproduct reconstructed from its trace by this
general interface equals the chosen Khovanov coproduct. This specialization
does not replace the finite-free theory for general A.

- Supply the trace-to-coalgebra correspondence, dual-basis coproduct, handle element and transport
  operations, with degrees in the even-supported case.

**Checks.**

- For A=ℤ[X]/(X²), ε(1)=0 and ε(X)=1, the pairing matrix in (1,X) is [[0,1],[1,0]]; Δ(1)=1⊗X+X⊗1 and
  Δ(X)=X⊗X.
- Replacing ε(X)=1 by ε(X)=2 gives determinant −4. The resulting pairing over ℤ is not perfect, so
  it does not satisfy the hypothesis.
- For the first trace, h=mΔ(1)=2X, ε(h)=2 and h²=0. With deg(X)=2, ε has degree −2 and Δ has degree 2.

The finite-free reconstruction and transport package is developed here from Mathlib’s
perfect-pairing and Frobenius-coalgebra interfaces. Its foam application follows
[Goertz–Marino–Wedrich v1, Example 2.9, p. 12, Lemma 3.32, p. 26, Definition 3.35, p. 28][gmw].

*Needs:* Statement: native finite free commutative algebras, perfect pairings and Frobenius
coalgebras. Proof: dual bases and tensor universal properties; KhovanovHomology K2 for the chosen
rank-two instance.

### 0.9 Web presentations and reduction coefficients

Supply ordered signed boundary words, crossing-free cups, caps and merge/split
expressions (the raw syntax WebExpr s t from a word s to a word t), their
finite-incidence interpretation and closures Cl(S,T) of parallel expressions
or planar generator words S, T. Use the ordered label operation in trivalent
generators; Layer 4 uses the natural-label instance. Export the raw syntax and
its structural diagram quotient WebDiagram s t separately from any linear
skein quotient.

For the gl(N) reductions, use integral Laurent polynomials in q for quantum
integers [n] = q^(1−n) + q^(3−n) + … + q^(n−1), n ≥ 0, and binomial
coefficients recording shifts and multiplicities. Prove the identities needed in
Layer 2, keeping this variable separate from the equivariant parameters.

- Supply typed composition, tensor, reversal, finite-incidence interpretation, closure and the
  structural diagram quotient; give Laurent expansion and shift-multiplicity formulas.

**Checks.**

- A merge (+1,+2)→(+3) is well typed, while the same merge with output (+2) is not.
- Closing two parallel identity strands of label a produces one a-labelled circle, rather than two
  open intervals.
- [0]=0, [1]=1, [2]=q⁻¹+q and [3]=q⁻²+1+q². Multiplication gives [2]²=[3]+[1].

Construct this syntax here, following [Goertz–Marino–Wedrich v1, Definition 4.2 and Construction
4.6, pp. 30, 32][gmw]. Its closure and structural quotient are inputs to the higher construction,
whose tensorator remains a 2-morphism.

*Needs:* Statement: 0.1 and 0.5, signed words and Laurent polynomials. Proof: KhovanovHomology K1
and TemperleyLieb Layer 2 for ordinary planar-presentation infrastructure.

### 0.10 Coefficient modules, tensor products and ordinary grading shifts

Supply the coefficient foundations used by evaluation and reconstruction. Let 𝕜
be a commutative ring with an internal integer grading. Commutativity here is
ordinary commutativity, without signs depending on degrees. Define GrMod_𝕜
using Tau Ceti's graded-module category. Its
objects have 𝕜_r M_s ⊆ M_(r+s), and morphisms are degree-preserving 𝕜-linear
maps. Its individual degree pieces are 𝕜₀-modules; they need not be
𝕜-submodules. Include the regular module 𝕜 and grading shifts (M{a})_d =
M_(d-a) with zero, addition and inverse comparison maps.

Construct the symmetric monoidal structure on this category with tensor product
over 𝕜 and unit 𝕜. Consume DGAInfinity's graded balanced tensor and
ZigzagPreprojective's associator, unit and endobimodule coherence contracts.
Supply the specialization in which left and right 𝕜-actions agree and the
comparison with ModuleCat 𝕜's ordinary tensor product after forgetting
grading. Prove that the swap m ⊗ n ↦ n ⊗ m is well-defined and graded, and
prove its naturality, hexagon and symmetry laws. A general bimodule tensor
category does not itself supply this symmetry.

Specify the total-degree pieces as generated by homogeneous pure tensors
of degree p+q and prove the universal property for homogeneous 𝕜-balanced
bilinear maps. Prove functoriality, pure-tensor calculations, extensionality,
and the coherent comparison M{a} ⊗_𝕜 M'{b} ≅ (M ⊗_𝕜 M'){a+b}.
No finiteness, flatness or field hypothesis is imposed on these constructions.
For 𝕜 concentrated in degree zero, compare with integer-graded objects in
ModuleCat 𝕜. Use the unsigned symmetry throughout the internal grading.

For a graded ring map 𝕜 → 𝕜', construct graded extension of scalars
𝕜' ⊗_𝕜 -, its strong symmetric monoidal structure and compatibility with
shifts. Apply this to the weighted ring Λ_N = ℤ[e₁,…,e_N], where
deg(e_i)=2i, and to the specified graded specializations. Specialization
to nonhomogeneous scalar values is an ungraded construction and is not
silently asserted to preserve this grading. Scalar extension of modules
does not by itself prove scalar extension of universal-construction radicals.

At the ordinary-category level, construct the formal-shift closure C^(sh) of a
category C with graded 𝕜-module homs and balanced degree-additive composition.
Its shifted objects X{a} satisfy Hom^d(X{a},Y{b}) = Hom^(d+a-b)(X,Y); in its
degree-zero category, Hom(X{a},Y{b}) = Hom^(a-b)(X,Y). Prove the shift,
composition and inclusion formulas and the extension property for functors into
categories where these shifts are represented. Use this construction with finite
sums in Layer 2. The higher-category extension is a separate target in Layer 3.
Composition in C^(sh) carries no Koszul sign; this distinguishes it from Tau
Ceti's differential graded DGShiftClosure.

- Supply graded tensor and scalar-extension universal properties, pure-tensor formulas, unsigned
  symmetry and coherent shift comparisons.
- Supply the ordinary formal-shift closure and its extension property for graded functors.

**Checks.**

- In Λ_N for N≥1, e₁·1 has degree 2. The degree-zero piece ℤ is not a Λ_N-submodule.
- For degree-one generators x,y over ℤ, the swap sends x⊗y to +y⊗x. A Koszul swap would give the
  wrong sign.
- A degree-3 element of M has degree 5 in M{2}. A degree-zero map X{2}→Y{−1} corresponds to a
  degree-3 map X→Y.
- Specialization e₁↦1 in degree-zero ℤ is not graded; sending every positive-degree e_i to 0 is graded.

These are Foams specializations of the exact supplier contracts above. The formal-shift construction
uses the declared grading convention, independently of cochain signs.

*Needs:* Statement: the native graded-module category and ordinary tensor/shift interfaces. Proof:
DGAInfinity Layers 0–1 and ZigzagPreprojective Layer 8 for balanced total grading and bimodule
coherence; unsigned symmetry and scalar-change comparisons are proved here.


### Examples

Combine 0.2–0.3 on two disk fillings to obtain the sphere, and 0.8 on dual numbers to obtain ε(X)=1.
In 0.10, moving shifts 2 and −3 across a tensor gives total shift −1 with coefficient +1.

### Dependencies

Sections 0.1–0.7 build incidence, categories and decorations in order. Section 0.8 is an independent
algebraic branch. Section 0.9 uses the raw web data and ordinary planar suppliers. Section 0.10 uses
the graded module, DGAInfinity and ZigzagPreprojective contracts, independently of foam evaluation.

## Layer 1: closed-foam evaluations

### 1.1 Robert–Wagner gl(N) evaluation formula

For N > 0, construct the Λ_N-valued [Robert–Wagner
evaluation](https://arxiv.org/abs/1702.04140) ev_(N,RW) by finite colorings: each
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

- Supply finite colorings, auxiliary surface calculations, polynomial evaluation, degree and
  disjoint-union laws, zero erasure and vanishing for uncolorable facets.

**Checks.**

- The empty foam has one empty coloring and evaluates to 1.
- At N=2 a facet labelled 3 has no coloring by a subset of {1,2}; every closed foam containing it
  evaluates to 0.
- At N=2 the undecorated 1-labelled sphere evaluates to 0, the sphere decorated by x evaluates to
  −1, and the undecorated 1-labelled torus evaluates to 2.
- Take an a-labelled annulus whose two boundary circles attach to one seam, completed by a
  zero-labelled disk. Choose the ordered seam roles (a,0,a). Its value is binomial(N,a), hence 2 at
  N=2,a=1; a scalar r on the zero disk multiplies this by r. This checks admissible repeated global
  incidence.
- A positive a-labelled facet occupying both small sheet roles has no coloring: its own nonempty
  pigment set cannot be disjoint from itself. Such local admissibility must not be defined by
  existence of a coloring.

Use [Robert–Wagner v3, Definitions 2.3 and 2.11–2.12, pp. 7–8, 11, Lemma 2.5, p. 8, Proposition
2.18, pp. 12–14][rw]. Transport to the abstract occurrence domain is a target here. Compare degrees
with [Goertz–Marino–Wedrich v1, Definition 3.33, p. 27, Example 3.39, p. 29][gmw].

*Needs:* Statement: 0.2 and 0.5–0.7, N>0 and Λ_N. Proof: symmetric-polynomial identities, the
local-link comparison and the polynomiality argument.

### 1.2 Unit-normalized gl(N) evaluation

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
Set ev_N := ev_(N,1) as the default evaluation for all subsequent layers.
Use Khovanov–Kitchloo, equations (13)–(16) at p(x,y)=1, for the closed sign
comparison; the extension to an arbitrary unit is a target here.

For a circle of label a≤N, prove that the sphere decorated by the top
rectangular Schur polynomial evaluates to t_a(σ)=(-1)^(a(a-1)/2) σ^a.
This identifies the sphere normalization of Ehrig–Tubbenhauer–Wedrich,
Example 2.5 and Remark 2.24, at σ=1. The elementary maps in Layers 5–6
use the chosen evaluation and its canonical duality data. Construct specialized evaluations directly
over every commutative Λ_N-algebra R with a specified unit σ; graded claims
require a graded coefficient map and σ of degree zero.

- Supply the label-weighted Euler calculation, normalized evaluation, parameter specialization and
  top-Schur sphere formula.

**Checks.**

- For a closed a-labelled sphere χ_lin/2=a; for a torus it is 0; for a genus-two surface it is −a.
  The last case needs an invertible parameter.
- At σ=−1 the multiplier (−σ)^(χ_lin/2) is 1, recovering the Robert–Wagner formula.
- For a=0,1,2,3, the top-Schur traces are 1, σ, −σ², −σ³. At σ=1 these are 1,1,−1,−1, and at σ=−1
  they are 1,−1,−1,1. Fixing the 1-coloured trace alone does not remove the higher-colour signs.

The closed sign twist follows [Khovanov–Kitchloo v1, equations (13)–(16), p. 11][kk]. Its
arbitrary-unit extension is constructed here. Compare the default with [Ehrig–Tubbenhauer–Wedrich
v2, Example 2.5, equation (2-1), p. 6, Remark 2.24, p. 14][etw].

*Needs:* Statement: 1.1 and a degree-zero coefficient unit σ. Proof: the coloring-independent Euler
sum and evenness for closed monochrome surfaces.

### 1.3 Bar-Natan evaluation and Frobenius grading

For the single-label datum Dec(*)=A, let h=m ∘ Δ be the handle operator.
Evaluate an oriented closed surface of genus g decorated by a as ε(h^g(a)),
and multiply over components. Prove linearity, invariance, multiplicativity and
the empty value. In the unoriented version interpret the boundary-reflection
generator by the identity of A and prove descent through the relations of Layer
0. Check the orientation-forgetting comparison. This is the canonical choice of
Frobenius involution in the unoriented Bar-Natan example of
Goertz–Marino–Wedrich. Call these evaluations of decorated closed foams ev_A^→
(oriented) and ev_A (unoriented).

For a graded instance require A_(2j+1)=0 for all integers j, together with
deg(m)=deg(η)=0, deg(Δ)=2c, deg(ε)=-2c, where c is an integer.
The closed-foam degree is decoration degree minus c times Euler
characteristic. The circle state space has grading A{-c} under the native
shift convention. Prove the boundary and closure-shift formulas, including
their integrality and compatibility with composition. Even support is a
condition on the unshifted algebra, not on all its shifts. The ungraded
construction requires no grading.

Include R[x]/(x²) with ε(1)=0, ε(x)=1, and monic-polynomial quotients
with their coefficient-extraction traces. For graded examples require a
homogeneous defining polynomial and the stated even support and trace degree.
With R in degree zero and deg(x)=2, the dual-number algebra is even-supported
but its circle A{-1} has degrees −1 on 1 and +1 on x.

- Supply oriented and unoriented closed evaluation, decoration and gluing identities, and the degree
  formula for even-supported Frobenius input.

**Checks.**

- For A=ℤ[X]/(X²) with ε(X)=1, the undecorated sphere, torus and genus-two surface evaluate to
  0,2,0, respectively.
- A sphere decorated by X evaluates to 1. For the unoriented theory with identity involution the
  Klein bottle evaluates to 2, as does the torus.
- With deg(X)=2 and c=1, an undecorated disk has foam degree −1 and an X-decorated disk degree 1.
  The circle state algebra is A{−1}.

Use [Goertz–Marino–Wedrich v1, Example 2.9, p. 12, Definition 3.35 and Example 3.38, p. 28][gmw] and
[Goertz–Wedrich v2, Propositions 10–11, pp. 3–4][gw-cob].

*Needs:* Statement: 0.4 and 0.8, a finite free commutative Frobenius algebra with even support when
graded. Proof: its handle identities and the nilvalent presentation.

### 1.4 KH1. Ordinary Khovanov specialization and grading

For every commutative ring R concentrated in degree zero, specialize to
A = DualNumber R, with X its square-zero generator, ε(1)=0 and ε(X)=1,
using KhovanovHomology K2's chosen Frobenius structure. Put 1 in degree zero
and X in degree −2, so c=−1. Identify the circle A{1} with K2's quantum
object V: 1 has degree +1 and X degree −1. The circle multiplication and
comultiplication have degree −1, and its unit and counit degree +1.

Prove the degree-reversal comparison with the c=1 example: for
rev(M)_j = M_(-j), identify rev(M{a}) with rev(M){-a}, compatibly with
tensor, the Frobenius maps and coefficient change. This changes the internal
grading, not the underlying algebra or trace. Both unshifted algebras have
even support. Use unsigned symmetry on quantum tensor factors, including
odd-degree circle states; cochain signs are outside this construction.

- Supply the grading reversal, trace/coalgebra identification and coefficient-change compatibility
  for KhovanovHomology K2’s chosen object.

**Checks.**

- With deg(X)=−2 and c=−1, the two disk states in V=A{1} have degrees 1 and −1.
- η(1)=1 has degree 1 and ε(X)=1 has degree 1 as a map out of V. The vanishing ε(1)=0 is retained.
- m(1⊗1)=1 lowers degree from 2 to 1; Δ(1)=1⊗X+X⊗1 lowers degree from 1 to 0. Both maps have degree −1.

This comparison is owned here. Use [Bar-Natan v2, Definition 7.1 and Proposition 7.2, p. 1470][bn]
to identify the conventions of the K2 contract.

*Needs:* Statement: 0.8, 1.3 and KhovanovHomology K2. Proof: its explicit four maps and the shift
formulas of 0.10.


### Examples

For N=2 the top-decorated 1-sphere has value −1 under 1.1 and +1 under 1.2 at σ=1. The Bar-Natan
torus in 1.3 has value 2 in either orientation model.

### Dependencies

Sections 1.1–1.2 use Layer 0’s gl(N) records and coefficient rings. Section 1.3 uses the nilvalent
and Frobenius branches. KH1 also consumes KhovanovHomology K2. No universal construction or
reconstruction theorem is used.

## Layer 2: state spaces and reconstruction

First fix N > 0 and the default evaluation ev_N = ev_(N,1) from Layer 1, with
values in Λ_N = ℤ[e₁,…,e_N]. The following gl(N) subsections use this
evaluation and its specified scalar specializations. The final subsection gives
the independent Bar-Natan construction. Also apply the construction to
ev_(N,σ); the comparison below transports explicit planar decompositions
to this family. The universal-construction references
are Blanchet–Habegger–Masbaum–Vogel and its foam adaptation by
Goertz–Marino–Wedrich. Define fillings, radicals and state spaces once, for an
R-linear monoidal category with an R-linear evaluation of the endomorphisms of
its unit, and apply them to the gl(N) category LinearPreFoam L and to the
linearized, decorated versions of both nilvalent categories.

### 2.1 State spaces and the evaluated foam category

Use Layer 0's linear prefoam category for the gl(N) labelling datum over Λ_N.
Let ∅ be the empty web and Fill(W) its hom-module of fillings ∅→W.
Define
Rad_N(W) = {x | ev_N(G ∘ x) = 0 for every outgoing foam G}
and 𝓕_N(W) = Fill(W)/Rad_N(W). Prove that gluing induces maps
𝓕_N(F)[x] = [F ∘ x], and disjoint union induces natural graded maps
𝓕_N(W) ⊗_(Λ_N) 𝓕_N(V) → 𝓕_N(W ⊔ V). Establish their functoriality and
associativity, unit and symmetry laws; invertibility is proved on planar
objects below. Fillings and tests are all admissible abstract foams.

Construct the evaluated category using Goertz–Marino–Wedrich's trace ideal. For
a linear combination f:W→V, set I₁(W,V) = {f | ev_N(tr_W(g ∘ f)) = 0 for every
g:V→W}. Here the trace tr_W closes the remaining W boundary through the
bending identifications of Goertz–Marino–Wedrich, formula (3.1). Prove that I₁
is a two-sided categorical ideal and write Foam₁ for the quotient, with N fixed.
Reuse the existing linear-quotient and finite-sum interfaces.

For the comparison needed in reconstruction, also define I₂(W,V) = {f | ev_N(b
∘ f ∘ a) = 0 for all a:∅→W, b:V→∅}. Prove that I₂ is the kernel of the action
on states, that I₁ ⊆ I₂, and that Hom_(Foam₁)(∅,W) ≅ 𝓕_N(W). Thus 𝓕_N descends
to Foam₁. The concrete planar reduction below proves I₁=I₂ where it is needed; a
separate action-quotient category is not required.

- Supply filling modules, outgoing pairings and radicals, cobordism maps, the two ideals and their
  inclusion, and the initial lax tensor maps.

**Checks.**

- For the ordinary rank-two circle, disk states 1,X and outgoing tests X,1 give the identity pairing
  matrix; neither disk class vanishes.
- An oversized-labelled boundary at rank N has zero pairing with every outgoing test and hence zero
  state module.
- In the empty-boundary state module, a closed foam F satisfies [F]=ev(F)[empty]. The empty foam is
  a generator with self-pairing 1.
- The bilinear form B(x,y)=2xy on ℤ has zero radical but is not perfect. Modulo 2 its radical is the
  whole space, so its radical quotient is 0 while the scalar extension of the integral quotient is
  𝔽₂. This prevents a general base-change claim.

Use [Blanchet–Habegger–Masbaum–Vogel, Proposition 1.1 and Universal Construction, p. 886][bhmv] and
[Goertz–Marino–Wedrich v1, Lemmas 3.18–3.19, p. 20][gmw]. Perfectness and strong monoidality are
separate targets below.

*Needs:* Statement: 0.6 and an evaluation from Layer 1, ordinary linear categories and ideal
quotients. Proof: multiplicativity and gluing; no planar reconstruction hypothesis is used.

### 2.2 Zero-label erasure after evaluation

Use Layer 0's erasure and Layer 1's evaluation invariance to construct the
maps on states and inverse maps in Foam₁. Prove both inverse identities by
closure tests, retaining decorations on removed zero facets as scalars.
Prove compatibility with composition, disjoint union and coefficient change.

- Supply state-space erasure isomorphisms and the induced comparison of evaluated positive and
  nonnegative theories.

**Checks.**

- A zero-labelled circle has state module R with disk generator 1; erasing it gives the empty-web
  state module.
- A zero facet decorated by 3 contributes multiplication by 3 under erasure; erasure cannot discard
  that scalar.
- Erasing a (1,0,1) vertex produces an uninterrupted 1-labelled edge; an all-zero component disappears.

Lift [Robert–Wagner v3, Remark 2.13, p. 11, Lemma 3.22, p. 25][rw] to the stated
universal-construction comparisons.

*Needs:* Statement: 0.7, 1.1–1.2 and 2.1. Proof: evaluation-invariant erasure and explicit
insertion/erasure maps.

### 2.3 Vanishing above the evaluation rank

A filling containing a facet labeled greater than N is zero in 𝓕_N(W), since
every closing test has no coloring. Deduce that a web with such an edge has
zero state space and that foams with such facets induce zero maps.
Strengthen this by trace tests: the identity of such a web is zero in Foam₁.
It is therefore a zero object, isomorphic to any chosen zero object.
Prove compatibility with gluing, disjoint union and decorations. These are
statements in the evaluated theory; the empty web remains the tensor unit.

- Supply vanishing of state modules and evaluated identities, and its compatibility with tensor and
  composition.

**Checks.**

- At N=2 the 3-labelled circle is a zero object in the evaluated category.
- The empty web has state module Λ₂ and identity 1; it is not the zero object over Λ₂.
- Tensoring the 3-labelled circle with a 1-labelled circle still gives zero states, since every
  filling retains the oversized boundary label.

This consequence of [Robert–Wagner v3, Definitions 2.11–2.12, p. 11][rw] is proved for the
occurrence model and its evaluated category here.

*Needs:* Statement: 1.1–1.2 and 2.1. Proof: empty coloring sets in every closing test.

### 2.4 Combinatorial planarity and the restricted category

Define compatible planarity using the web's finite edge ends. Let τ pair
the two ends of each interval edge. From the stored cyclic order κ, form the
rotation ρ by taking κ at split vertices and κ⁻¹ at merge vertices, following
Goertz–Marino–Wedrich's conversion from generator words to abstract webs.
Reversing the global orientation inverts all rotations and leaves the test
unchanged.

For each component C under τ and ρ, count the cycles of ρ, τ and ρ ∘ τ as
V_C, E_C and F_C respectively. Count fixed points too. Define
IsCompatiblyPlanar W by the decidable integer condition
V_C - E_C + F_C = 2 on every component. Accept the empty web and
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
zero-erasure. Define LinearPreFoamᵖˡ as the full subcategory on these webs and
Foam₁ᵖˡ as its trace quotient. Prove that the fillings, outgoing tests and
ideals I₁,I₂ on retained objects agree with those in the unrestricted theory.
No chosen presentation or embedding is part of an object.

- Supply the effective rotation system, componentwise Euler test, finite-map adapters and closure
  under the prescribed planar operations.

**Checks.**

- For the theta graph with τ=(a A)(b B)(c C), effective rotation ρ=(a b c)(A C B) gives three faces.
  Thus V−E+F=2−3+3=2.
- With the same τ and ρ=(a b c)(A B C), there is one face and V−E+F=0. The underlying graph is
  planar but this rotation system fails the test.
- A vertex-free circle contributes Euler value 2 after the auxiliary subdivision; the empty web
  passes the componentwise condition vacuously. Two planar components each have value 2, not a
  combined requirement of 2.

Construct the web adapter here from the cited finite-map contract. For the rotation-system
convention see [Erickson, Planar Graphs, “Rotation systems” and “Surface maps”][erickson]. This test
retains cyclic-order compatibility.

*Needs:* Statement: 0.1, effective rotations, native bipartite ribbon graphs and SurfaceTopology
Layer 2. Proof: subdivision and component-count comparison; 0.9 and KhovanovHomology K1 for planar
presentations.

### 2.5 Change of normalization on planar abstract webs

For two units σ,τ in the same coefficient ring R put r=σ τ⁻¹. Choose a
crossing-free presentation for each retained abstract web W, with
label-weighted turning number p(W). Define this integer combinatorially
by summing turns in a planar presentation, normalized so a counterclockwise
a-circle has value a. Prove agreement with the sum of monochrome turning
numbers and independence of pigment assignments. A chosen presentation is
comparison data; it is not extra data in the abstract-web carrier.

For a colorable foam F:W→V, prove that
E(F)=(χ_lin(F)+p(W)−p(V))/2 is integral, using the parity of the Euler
characteristic of an oriented surface and its boundary circles. Rescale F
by r^E(F). Prove additivity under composition, identity preservation,
transport of all closure-test radicals and invertibility by exchanging
σ,τ. Uncolorable representatives vanish under every test and are zero in
the quotient. If presentations are not chosen additively, give the tensor
comparison r^((p(W)+p(V)−p(W⊔V))/2) and prove its coherence. Prove the
comparison's independence of choices up to specified natural isomorphism.

Obtain a graded R-linear symmetric monoidal equivalence between the planar
evaluated categories, and the natural comparison of state functors after
precomposing with it. This supplies the rescaling of local relation maps from the
Robert–Wagner formula to the default σ=1 normalization. Check compatibility
with disjoint union and the trace ideals before using the tensor comparison.
This lemma is an ingredient for the parameterized state theory; it does
not assert equivalence of specified duality or higher-category structures.

- Supply the boundary-dependent rescaling functor, its inverse, choice comparison and tensor
  comparison maps.

**Checks.**

- For a closed a-labelled sphere, changing τ to σ multiplies evaluation by (σ/τ)^a.
- For a cylinder W→W, χ_lin=0 and p(W) cancels, so E=0 and its identity is unchanged.
- For a counterclockwise 1-labelled circle with p=1, the birth disk has
  E=(1+0−1)/2=0 and the death disk has E=(1+1−0)/2=1. Their rescaling factors
  are 1 and r respectively, so the composite sphere has factor r.

This boundary rescaling and its ordinary monoidal comparison are constructed here.
[Khovanov–Kitchloo v1, equations (13)–(16), p. 11][kk] supplies only the closed sign antecedent.

*Needs:* Statement: 1.2, 2.1 and 2.4 with chosen planar turn data. Proof: parity, gluing and
additivity of the weighted Euler and turn expressions.

### 2.6 Local relations with arbitrary abstract exteriors

Express the Robert–Wagner maps in the default σ=1 normalization using
the preceding ordinary rescaling lemma, retaining their resulting unit
factors. For each required local relation ℒ = Σ_α c_α ℒ_α between fillings of a closed
web W_ℓ, prove ℒ − Σ_α c_α ℒ_α ∈ Rad_N(W_ℓ), i.e. ev_N(K ∘ ℒ) = Σ_α c_α
ev_N(K ∘ ℒ_α) for every admissible foam K : W_ℓ → ∅. Fix a coloring of K and
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
prove both p_α ∘ i_β = δ_αβ id and Σ_α i_α ∘ p_α = id with the
appropriate shifts. Determine the equivariant dual decorations explicitly.
Close the contextual identities against arbitrary reverse morphisms to obtain
these equalities in Foam₁, before assuming I₁=I₂ or faithfulness of 𝓕_N.

- Supply contextual local identities, all closing-test evaluations, their degrees and the explicit
  inclusion/projection matrices used for retracts.

**Checks.**

- The relation removing a zero facet decorated by r retains coefficient r in every exterior.
- For a two-term decomposition, the inclusion/projection matrix must be [[id,0],[0,id]] and the sum
  of the two projectors must be id. Matching only scalar traces does not give these identities.
- For A=ℤ[X]/(X²), ε(1)=0 and ε(X)=1 as in 0.8, closing the two neck-cutting terms gives
  ε(a)ε(Xb)+ε(Xa)ε(b)=ε(ab); for a=b=1 the result is 0, and for a=1,b=X it is 1.

Use [Robert–Wagner v3, Lemma 3.9/Corollary 3.10, p. 17, Proposition 3.13, p. 19, Lemmas 3.21–3.22,
pp. 24–25, Proposition 3.32, pp. 29–30][rw]. Their contextual extension to all allowed abstract
closing foams is proved here before reconstruction.

*Needs:* Statement: 2.1–2.5 and raw local foams. Proof: coloring formulas, symmetric-polynomial
identities and boundary matchings in arbitrary exteriors.

### 2.7 Planar reduction and finite identity resolutions

For a compatibly planar web W, remove labels greater than N by categorical
vanishing and zero labels by the proved erasure maps. Work first over Λ_N
with the default σ=1, using the normalized local maps. Prove a terminating web reduction certificate
using the local
relations, then lift it to retracts in Foam₁ before invoking reconstruction.

**The {1,2}-labelled base.** Prove the certificate for all compatibly planar
closed {1,2}-webs, including those with arbitrary planar rotations. Translate the moves and
termination argument of Carpentier, v1, Lemma 2, p. 4, proof pp. 4–7,
directly into web language:
circle/digon reductions, the braidlike square switch, and the cyclic
hexagon switch below. Formalize the finite path/lens descent which exposes
a reducing configuration, with the number of trivalent vertices as the
outer induction measure. Individual switches need not reduce that number.
Include multiple edges, loops, disconnected webs and nested components.
When no immediate reduction applies, prove existence of a finite sequence
of switches exposing a reduction. This includes all remaining square
orientation patterns. The existence and termination argument must accompany the local
relations.

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

Here [r]X is the sum of shifts of X with quantum-integer multiplicity
[r], and [0]X=0. Complement the directed cycle using Robert–Wagner
Lemma 3.21, expand the N−1 edge with Proposition 3.13 at parameters
m=n=k=1, l=N−3, and reassociate twice. Complement the resulting directed
square and then the adjacent hexagon; the opposite square decomposition
gives the other side. Verify the incidence, orientations and both inverse
foam identities. Both correction webs have four rather than six vertices.
At N=3 use direct cycle complementation; at N=2 use complementation and
zero erasure; at N=1 use the vanishing of label 2.

With P_R=(01)(23)(45), P_L=(05)(12)(34), R₀=(01)(25)(34), also prove
Q_01 ≅ P_R ⊕ [N−2]R₀ and Q_34 ≅ P_L ⊕ [N−2]R₀ for N≥2.
Retain common summands in the resulting stable hexagon relation;
categorical cancellation is not a prerequisite. These are local web
relations; no separate four-valent graph theory is required.

**Retracts and higher labels.** A switch
W_i ⊕ A_i ≅ W_(i+1) ⊕ B_i makes W_i a retract of W_(i+1) ⊕ B_i.
The correction webs are smaller. Propagate their retracts backwards along
the finite certificate from a terminal reduction. Lift Wu's v6 Theorem 2.4, p. 10, proof pp. 11–12
and equations
(2.3)–(2.6), whose scalar argument uses induction on maximal label and its occurrence count using
these base-case
retracts and Robert–Wagner's categorical relations. Select a single shifted
summand in a quantum-integer multiple when needed; do not divide by a
quantum integer. Retain homogeneous inclusion and projection foams at every
step. Auxiliary expansions may increase labels or vertices; the induction
measures the endpoints and corrections, not these auxiliary webs.

The target is a finite homogeneous retract u:W→P_W, v:P_W→W, v ∘ u = id_W,
with P_W = ⨁_r ∅{d_r} in the additive category Mat_((Foam₁ᵖˡ)^(sh)) with
formal shifts. Equivalently, produce id_W = Σ_r a_r ∘ b_r in Foam₁. Retain
representatives of a_r,b_r as linear combinations of explicit abstract gl(N)
foams. The crossing-free presentation guides the reduction; no foam embedding or
canonical choice of presentation is required.

Insert this identity resolution into a trace test to prove I₂⊆I₁ on
planar objects, hence I₁=I₂ there. The same maps give
[F] = Σ_r [a_r] ev_N(b_r ∘ F) for every abstract filling F.
Thus they span 𝓕_N(W), and the b_r detect its pairing radical. Prove
compatibility with grading and transport. Layer 6 separately expresses these
maps in its chosen generators; the resolution alone does not prove progressive
spanning.

- Supply finite switch/reduction sequences, their termination measure, stable decomposition maps,
  higher-label retracts and finite resolutions of the identity.

**Checks.**

- The coefficient [N−3] in the displayed stable hexagon relation is 1 at N=4 and 0 at N=3. Ranks 2
  and 1 require their separate label-vanishing cases.
- At N=4, cycle complement sends labels 1,2 to 3,2, respectively; treating both as unchanged would
  give the wrong square labels.
- If u:W→P and v:P→W satisfy vu=id_W, then p=uv satisfies p²=p. No cancellation of a common direct
  summand is used.
- For a planar cubic component with vertices, the face-degree identity is Σ_f(6−length(f))=12,
  counting boundary occurrences. It permits squares but does not distinguish their orientation
  types; the switch argument must cover every remaining square configuration.

Use [Carpentier v1, Lemma 2, p. 4, proof pp. 4–7][carpentier] for finite planar reduction, and [Wu
v6, Theorem 2.4, p. 10, proof pp. 11–12, equations (2.3)–(2.6)][wu-colored] for scalar maximal-label
induction. Their categorical lifts and integral retract witnesses are targets here; neither scalar
argument supplies those witnesses.

*Needs:* Statement: 0.9 and 2.4–2.6. Proof: the translated switch/lens argument, the explicit
contextual relations and maximal-label induction.

### 2.8 Integral freeness and decomposition into shifted empty webs

Prove the algebra lemma needed for this coefficient ring: every graded retract
of a finite sum of shifts of Λ_N, with deg(e_i)=2i, is finite graded free. Use
GrothendieckEulerForms' free graded module contract and Tau Ceti's
bounded-below graded Nakayama theorem. For a degree-zero idempotent p on a
finite sum of shifts, require a finite basis of its image with homogeneous
basis vectors. This is the theorem
`exists_homogeneous_basis_range_idempotent` in Suggested.lean. Reduce the image
modulo the positive-degree ideal, choose bases over ℤ in each degree, and lift
homogeneously. Graded Nakayama gives a surjection from the resulting shifted
free module. Its graded splitting makes the kernel a bounded-below summand,
and applying Nakayama to that kernel proves injectivity. The algebraic theorem
also allows N=0.
Supply the integral degree-zero basis lifting and homogeneous splitting; a field
hypothesis or an ungraded freeness theorem is not a substitute.

For the idempotent u ∘ v on P_W, construct a finite shifted free module D_W
and homogeneous matrices ι_W : D_W → P_W, π_W : P_W → D_W with ι_W ∘ π_W =
u ∘ v and π_W ∘ ι_W = id_(D_W). The maps v ∘ ι_W and π_W ∘ u then identify W
with a finite sum of shifted empty webs. This establishes decomposition into shifted empty webs for
the planar
gl(N) category. Retain explicit inclusions and projections satisfying both
biproduct identities.

- Supply a finite homogeneous native module basis of every stated idempotent image, and apply it to
  the planar retract and its shifted-empty-web decomposition.

**Checks.**

- For p=0 the image has the empty basis; for p=id on a rank-one summand of shift 3 the basis vector
  has degree 3.
- For p=diag(1,0) on Λ_N{a}⊕Λ_N{b}, the image has basis (1,0) of degree a, independently of b.
- For N≥1, shifts (2,0) and p(x,y)=(x,e₁x), p²=p and the image basis is (1,e₁) of degree 2. The
  second coordinate has degree 2−0, checking the shift sign.

The weighted integral freeness theorem is proved here. GrothendieckEulerForms Layer 3 supplies
general graded-free infrastructure; none of its semisimple or Koszul hypotheses is imposed on this
theorem. Compare the planar conclusion with [Robert–Wagner v3, Theorem 3.30, pp. 27–28][rw].

*Needs:* Statement: weighted polynomial homogeneous pieces, shifted finite free modules, linear
idempotents and native Module.Basis. Proof: positive-degree reduction, degreewise projectivity over
ℤ and bounded-below graded Nakayama. Application: 2.7 supplies the planar retract.

### 2.9 Parameter and coefficient transport of decompositions

Transport the explicit σ=1 decompositions by coefficient extension and
the ordinary rescaling lemma to obtain them for every σ, including the
universal Laurent parameter. Use the actual inclusion/projection identities,
not a general freeness theorem over an arbitrary R or an assertion that
radicals commute with base change. These operations need not identify the
original same-source Frobenius theories: their traces can differ.

- Supply transported retract maps, basis/decomposition comparisons and their compatibility with
  parameter and coefficient change.

**Checks.**

- The equation vu=id remains true after ℤ→𝔽₂, since it is an equation of explicit maps; flatness is
  unnecessary.
- The trace σ becomes −1 under σ↦−1 and +1 under σ↦1; both specializations send a unit to a unit.
- Specializing all e_i to 0 preserves the grading and turns a finite Λ_N-basis into the
  corresponding finite ℤ-basis. Sending e₁ to 1 gives only the ungraded comparison.

This is a Foams transport result for the constructed decompositions. It does not assert general
commutation of radicals with scalar extension.

*Needs:* Statement: 2.5 and 2.8, 0.10 and the specified ring maps. Proof: transport of explicit
decomposition maps and their identities.

### 2.10 Reconstruction, tensor products and specialization

Use these decompositions to prove the following concrete results on
Foam₁ᵖˡ, with the stated grading conventions:

- 𝓕_N identifies foam morphisms with Λ_N-linear maps of state modules,
  retaining maps of every homogeneous degree.
- The outgoing and trace pairings are perfect, with explicit graded dual
  bases. In particular, Hom_(Foam₁)(W,∅) ≅ Hom_(Λ_N)(𝓕_N(W),Λ_N).
- The canonical maps 𝓕_N(W) ⊗_(Λ_N) 𝓕_N(V) → 𝓕_N(W ⊔ V) are isomorphisms.
  Prove their naturality and coherence, including 𝓕_N(∅) ≅ Λ_N, and descend
  disjoint union to the evaluated planar category.
- After adjoining finite sums and grading shifts, 𝓕_N gives an equivalence
  on degree-zero morphisms with finite free graded Λ_N-modules.

Transport the explicit decompositions through the specified coefficient maps,
including Λ_N/(e₁,…,e_N) ≅ ℤ and extensions to a commutative ring R. Prove the
resulting state-space and category comparisons on planar objects. Use these
finite identities to justify scalar change; do not assume pairing radicals
commute with arbitrary base change. For ev_(N,σ) use the preceding normalization comparison and
retain the
parameter in all structure maps. Graded specialization requires a graded
coefficient map and a degree-zero unit; other specializations are ungraded.

- Supply equality of the two planar ideals, full reconstruction, perfect pairing and strong tensor
  maps, then their coefficient specializations.

**Checks.**

- For the empty web the state module and its endomorphism algebra are the coefficient ring; the unit
  comparison sends 1 to the empty foam.
- Two circles whose state modules have ranks r and s have tensor state rank rs. In the rank-two case
  the four decorated disk tensors form a basis.
- A decomposition id_W=Σ_i u_i v_i reconstructs a state x as Σ_i u_i(v_i x). A map annihilating all
  the u_i is therefore zero.

Apply [Goertz–Marino–Wedrich v1, Lemmas 3.24–3.26, pp. 22–24, and Lemmas 3.28, 3.30–3.31, p.
25][gmw] to the planar subcategory with all abstract foams. Prove their decomposition hypotheses in
that category.

*Needs:* Statement: 2.1 and the compatibly planar object class of 2.4. Proof: finite identity
resolutions and homogeneous bases from 2.7–2.9.

### 2.11 Circle state spaces as Frobenius algebras

For 0≤a≤N, identify the circle state module with the shift
A_(a,N){−a(N−a)} of the following even-supported algebra:

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
R ⊗_(Λ_N) A_(a,N). For a unit σ in R its trace is

    ε_σ = (-1)^(a(a−1)/2) σ^a ζ_a.

For the a-variable alphabet A and equivariant alphabet S, the ε_σ-dual of
s_λ(A) is (-1)^(a(a−1)/2) σ^(−a) s_(λᶜ)(A−S), where λᶜ is the
rotated rectangular complement and the difference alphabet is defined by
the quotient of complete-symmetric generating series. Prove this identity,
including its equivariant corrections. At σ=−1 the factor is
(-1)^(a(a+1)/2), as in Robert–Wagner; at σ=+1 it is the factor in
Ehrig–Tubbenhauer–Wedrich, Example 2.5 and Remark 2.24. Wu supplies the
Sylvester pairing; the additional sign is a foam normalization convention.

Identify opening, closing and saddle foams with the unit, trace,
multiplication and comultiplication; prove their laws and perfect pairing
from the explicit circle decomposition. Multiplication and unit have degree
zero on A_(a,N), and the trace has degree −2a(N−a). Package the homogeneous algebra multiplication
using the
AlgebraicVectorBundles Layer 2A contract, checking its convolution tensor and
coproduct hypotheses. Transport the other Frobenius maps through the circle
shift with their stated degrees. Export
decoration actions, dual-basis neck-cutting and coefficient-change formulas.
Include a=0,N, the specialization e_i=0, and the zero state space for a>N.

As a mandatory calculation, for N=2,a=1 obtain

    A = Λ₂[x]/(x²−e₁x+e₂),          basis (1,x), degrees (0,2),
    multiplication by x = [[0,−e₂],[1,e₁]],
    ε_σ(1)=0, ε_σ(x)=σ,             pairing = [[0,σ],[σ,σe₁]],
    dual basis = (σ⁻¹(x−e₁), σ⁻¹).

At the default σ=1 the dual basis is (x−e₁,1); at σ=−1 it is
(e₁−x,−1). Omitting e₁ gives an incorrect equivariant dual basis. Identify A_(N,N)=R after
coefficient change, with trace
ε_σ(1)=(-1)^(N(N−1)/2)σ^N. In particular the default trace is
ε_1(1)=(-1)^(N(N−1)/2).

- Supply the integral presentation, Schur basis, complementary dual basis, trace, four Frobenius
  maps and graded/scalar-change comparisons.

**Checks.**

- At N=2,a=1, elimination gives A=Λ₂[x]/(x²−e₁x+e₂). Multiplication by x in (1,x) has matrix
  [[0,−e₂],[1,e₁]].
- Its trace pairing is [[0,σ],[σ,σe₁]], with dual basis (σ⁻¹(x−e₁),σ⁻¹). The determinant is −σ², a unit.
- At a=0 the algebra and trace are Λ_N and id. At a=N the algebra is Λ_N but the trace is
  multiplication by (−1)^(N(N−1)/2)σ^N.
- The complementary-partition sign (−1)^(a(a−1)/2) is 1,1,−1,−1 for a=0,1,2,3; the consecutive trace
  ratio contributes (−1)^aσ.

Use [Wu v2, Theorem 2.10 and Remark 2.11, p. 9, Proposition 3.13, p. 13 and proof p.
22][wu-equivariant], which works over complex coefficients. Prove the integral presentation and dual
pairing here. The extra sign is from [Ehrig–Tubbenhauer–Wedrich v2, Example 2.5, p. 6, Remark 2.24,
p. 14][etw], not attributed to Wu.

*Needs:* Statement: 0.8, 1.2 and 2.10 with 0≤a≤N. Proof: SchurWeyl Layer 7, integral
symmetric-polynomial pairing identities and contextual circle/neck-cutting relations from 2.6.

### 2.12 Bar-Natan state spaces and circle decompositions

Apply the same outgoing-test construction and trace quotient to each nilvalent
category with its Layer 1 evaluation over R, giving the state spaces 𝓕_A
(unoriented) and 𝓕_A^→ (oriented). Prove that the state space of r circles is
A^⊗r, with A{-c} as each circle factor in the graded case. Decorated disks
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

- Supply explicit decorated-disk and outgoing-dual bases, state/tensor identifications,
  oriented/unoriented comparison and finite identity decompositions.

**Checks.**

- For one circle and A=ℤ[X]/(X²), the states 1,X pair with the tests X,1 as δ_ij.
- For two circles the four states 1⊗1,1⊗X,X⊗1,X⊗X give rank 4. There are no seam-generated
  additional states in the nilvalent theory.
- For zero circles the module is R. Forgetting orientations sends each decorated disk to the same
  basis vector and hence induces an isomorphism on these state modules.

Prove this explicit universal-construction version of [Goertz–Marino–Wedrich v1, Lemma 3.32, p.
26][gmw], using [Goertz–Wedrich v2, Propositions 10–11, pp. 3–4][gw-cob] for the unoriented domain.

*Needs:* Statement: 0.8, 1.3 and 2.1 for a finite free Frobenius algebra with the stated grading.
Proof: its dual basis and the nilvalent surface presentation, including unoriented closing tests.

### 2.13 KH2. Comparison with Khovanov circle tensors

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

- Supply indexed tensor comparison, relabelling, all four surface maps and coefficient-change naturality.

**Checks.**

- For zero circles the comparison is R→R, 1↦1; for one circle it sends the two disks to 1,X of
  degrees 1,−1.
- For two circles the basis degrees are 2,0,0,−2. Permuting the circles exchanges 1⊗X and X⊗1 with
  coefficient +1.
- Under ℤ→𝔽₂ the same four basis elements remain a basis. The torus value 2 specializes to 0.

This comparison is developed here between the two named state constructions. The four surface maps
use [Bar-Natan v2, Definition 7.1 and Proposition 7.2, p. 1470][bn].

*Needs:* Statement: KH1, 2.12 and KhovanovHomology K2’s indexed circle tensors. Proof: the explicit
disk dual basis and scalar-change formulas.


### Examples

At N=2,a=1, combine 2.8–2.11: the circle has a homogeneous basis (1,x), pairing determinant −σ², and
two-circle state rank 4. At e₁=e₂=0 the relation becomes x²=0 without any flatness assumption.

### Dependencies

Section 2.1 works on arbitrary abstract objects. Sections 2.2–2.7 establish the planar and
contextual inputs; 2.8 supplies the independent algebraic freeness upgrade. Sections 2.9–2.11 use
explicit resolutions to prove transport and reconstruction. Sections 2.12–2.13 use the independent
nilvalent Frobenius branch. No compiler or embedded-foam theorem is used.

## Layer 3: reusable semistrict monoidal 2-categories

A **tensorator** is the specified invertible 2-morphism comparing the two
orders of applying independent 1-morphisms in a tensor product.

### 3.1 Semistrict structure and local enrichment

Kapranov and Voevodsky gave explicit axioms for semistrict monoidal 2-categories.
Baez and Neuchl describe the same structure as a one-object Gray category.
[Baez–Neuchl, §2.1, Definition 2 and Lemmas 3–4, pp. 10–12][baez-neuchl]

Use Schommer-Pries’ presentation of a Gray monoid, with a strict underlying
2-category, identity associativity/unit coherence and cubical tensor
pseudofunctor. Its interchanger remains invertible and can be nontrivial.
Record the dictionary to Goertz–Marino–Wedrich's left/right tensoring,
composition order and tensorator direction. Construct both presentations and
prove the conversion preserves their equations. The thesis gives the monoidal,
braided and symmetric structures in a common notation, making it convenient to
add braiding and symmetry to these conventions. This layer uses the monoidal
part. [Schommer-Pries, v2, Defs. 2.3 and 2.26–2.27, pp. 90–92, 118–119][sp]
· [Goertz–Marino–Wedrich, Construction 4.28 and Theorem 4.29][gmw]

Extend an underlying Bicategory with
[Bicategory.Strict](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Bicategory/Strict/Basic.html#CategoryTheory.Bicategory.Strict), retaining Mathlib's
hom-categories, whiskering and adjunctions. Specify object tensor, left and right
tensoring 2-functors, the invertible tensor comparison and its unit, naturality
and coherence equations in Goertz–Marino–Wedrich's convention. Semistrictness does not make the
tensorator an identity.
Express strictness through Mathlib's eqToIso equations. Keep generic lemmas
at bicategory level when possible and use associators, unitors and coherence
tools in proofs. Mathematical strictness does not make all Lean expressions
definitionally equal; a second stand-alone strict 2-category hierarchy is not
part of this roadmap.

Develop identities, composition, opposites, transport and structure-preserving
maps. These structures and the following enrichment and shift constructions
must be usable independently of foams.

For a symmetric monoidal category V, equip each hom-category with compatible
V-enrichment: parallel 1-morphisms f,g have a hom-object f ⟶[V] g in V, with
unit and composition maps in V. Relate the underlying ordinary 2-morphisms to
Hom_V(𝟙_V, f ⟶[V] g) using
[EnrichedOrdinaryCategory](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Enriched/Ordinary/Basic.html).
Lift horizontal composition and left/right tensoring to enriched operations.
Their interchange uses the symmetry of V; require the associativity, unit and
tensorator equations as equations of maps in V. Tensorator naturality must hold
on whole hom-objects, not only on maps out of the tensor unit. Prove
compatibility with the underlying semistrict structure, composition of
structure-preserving maps, transport and local full subcategories. This does not
require a general theory of enriched limits or higher functor categories.

- Supply the semistrict data, equations, opposite and transport operations, maps preserving
  structure and the dictionary between the two presentations.
- Supply hom-objects, enriched units/composition, enriched horizontal and tensor operations,
  tensorator naturality and passage to the underlying ordinary structure.

**Checks.**

- For f:A→B and g:C→D, the two tensorator boundaries are (f⊠id_C);(id_B⊠g) and (id_A⊠g);(f⊠id_D),
  both from A⊠C to B⊠D. Switching an identity subscript makes a boundary ill typed.
- In the free braided model take the chosen crossing to have braid word b. Its inverse has word b⁻¹,
  with exponent −1 rather than 1; composing the two gives exponent 0. Use this non-symmetric model
  to check the dictionary’s direction.
- The cubical cases with either independent strand an identity have tensorator the identity, braid
  exponent 0. A double crossing has exponent 2 and must not be collapsed to an identity by
  semistrictness.
- For V=GrMod_ℤ the hom-object ℤ{1} has nonzero degree-one part but Hom_V(ℤ,ℤ{1})=0. Checking
  naturality only on maps from the unit would miss that part.
- For V=ModuleCat ℤ with rank-one homs, enriched composition sends 2⊗3 to 6. It agrees with
  composition of the underlying multiplication maps and is linear in each input.
- In the graded case, hom generators of degrees 1 and 2 compose in degree 3: ℤ{1}⊗ℤ{2}≅ℤ{3}. All
  three have zero degree-zero part, so the underlying degree-zero maps alone cannot specify this
  composition.

Use [Schommer-Pries v2, Definitions 2.3 and 2.26, pp. 90–92, 118, Appendix C.1–C.2, pp.
271–282][sp]. The dictionary to [Goertz–Marino–Wedrich v1, Construction 4.28 and Theorem 4.29, pp.
42–45][gmw] and the local enrichment package are developed here.

*Needs:* Statement: native bicategories, strictness and enriched ordinary categories, with V
symmetric monoidal. Proof: the cited coherence equations and ordinary monoidal transport; no foam
input.

### 3.2 Linear and graded coefficient instances

Construct the V = ModuleCat R instance and identify its data with local
Preadditive and Linear R structures and bilinear higher operations.
Construct the V = GrMod_𝕜 instance using Layer 0's symmetric monoidal
coefficient category. Require it for every commutative graded ring 𝕜 specified
there, not only rings concentrated in degree zero. In this instance vertical and
horizontal composition and tensor on 2-morphisms are 𝕜-balanced and
degree-additive; identities and tensorators have degree zero. In particular, the
equivariant foam target is enrichment over GrMod_(Λ_N), with tensor product
over Λ_N and unit Λ_N at the default σ=1, and over Λ_N[σ,σ⁻¹] for the universal
normalization. Also include the graded coefficient specializations R,
in particular R concentrated in degree zero, and the graded base ring of
a graded Bar-Natan instance.

Construct and compare three views of this structure: the full graded hom-objects
Hom^•(f,g) (degree pieces Hom^d, endomorphisms End^•); the ordinary
degree-zero 2-category, with homs Hom^0(f,g); and the ordinary locally
𝕜-linear 2-category, with homs Hom^u(f,g), obtained by forgetting the grading
on each hom-module. The degree-zero category is 𝕜₀-linear, but is not generally
𝕜-linear. The underlying homs of V-enrichment select degree zero; this is
different from forgetting the grading on the whole module. Prove the comparison
formulas for identities, composition and tensorators. State each result about
2-morphisms for one named view: Hom^•, Hom^0 or Hom^u. Construct
enrichment change for the strong symmetric monoidal forgetful and scalar
extension functors used here, with their effect on homs and coefficients.

- Supply the linear/enriched comparison, the internally graded coefficient instance, and the full
  graded, degree-zero and forgotten-grading views.

**Checks.**

- For coefficient ring Λ_N, multiplication by e₁ carries degree d to d+2. It is a homogeneous
  2-morphism of degree 2, not a degree-zero endomorphism.
- The tensor of homogeneous maps of degrees 2 and −3 has degree −1. Its construction balances over
  Λ_N, so (e₁x)⊗y=x⊗(e₁y).
- The degree-zero endomorphisms of the unit module Λ_N are ℤ, while its full graded endomorphisms
  are Λ_N. Over a ring concentrated in degree zero these two coefficient algebras coincide.

These coefficient instances and comparisons are constructed here from the stated native
linear-category and graded-module interfaces.

*Needs:* Statement: 3.1 and 0.10. Proof: the graded tensor universal property and enriched forgetful
comparison.

### 3.3 Formal shifts and their higher compatibility

Extend Layer 0's ordinary shift construction to the graded semistrict monoidal
2-category C. Keep its objects and adjoin shifted 1-morphisms f{a}, giving
C^(sh). Set Hom^d(f{a},g{b}) = Hom_C^(d+a-b)(f,g). Supply the induced
𝕜-action and the degree-zero locally 𝕜₀-linear category, with Hom(f{a},g{b}) =
Hom_C^(a-b)(f,g). Prove the coherent comparisons (f{a}){b} ≅ f{a+b}, f{a} ≫
g{b} ≅ (f ≫ g){a+b} and f{a} ⊠ g{b} ≅ (f ⊠ g){a+b}, where f ⊠ g := (s ⊠ g) ≫
(f ⊠ t') for f : s → t, g : s' → t' (the source of the tensorator). Prove
the zero/inverse shift laws and compatibility with identities, associativity,
both orders of moving shifts through the two factors, interchange and the
tensorator. In particular these comparisons introduce no Koszul sign. Reuse
[HasShift](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Shift/Basic.html)
on each hom-category, with f⟦n⟧ = f{-n} so that a degree-d 2-morphism f → g
is a ShiftedHom f g d, and the existing shifted-hom composition; local shift
functors alone do not establish these higher compatibility laws.

Retain the full coefficient algebra in the degree-zero presentation. For
homogeneous a ∈ 𝕜_d, construct the natural maps
ζ_f(a) : f → f{-d} corresponding to multiplication by a on the identity.
They are additive on each 𝕜_d, agree with ordinary scalar multiplication
in degree zero, preserve unit and multiplication with the shift comparison
maps, and commute with shifts. Require their naturality and centrality:
acting through either factor of horizontal composition or tensor gives
the same coefficient action on the composite after the specified shift
transports. Call this a graded central 𝕜-action. An ordinary 𝕜₀-linear
structure with shifts does not by itself retain this data.

Conversely, for a locally 𝕜₀-linear semistrict monoidal 2-category D with
these compatible shifts and a graded central 𝕜-action, construct
Hom_D^d(f,g) = Hom_D(f,g{-d}).
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

- Supply the shifted semistrict structure, its coherent horizontal/tensor comparisons and the
  reconstruction of full graded homs from shifted degree-zero homs and central coefficients.

**Checks.**

- Hom⁰(f{2},g{−1})=Hom³(f,g); Hom²(f{2},g{−1})=Hom⁵(f,g). These determine the shift sign.
- The scalar e₁ gives f→f{−2}; e₁² gives f→f{−4}. Discarding these shifted maps loses the
  positive-degree coefficient action.
- With the native translation f⟦n⟧=f{−n}, f⟦2⟧=f{−2}. Also f{2}⊠g{−3} identifies with (f⊠g){−1}.

This higher shift/reconstruction comparison is developed here. Its grading convention matches the
supplier’s module shift, and its native categorical notation is translated explicitly.

*Needs:* Statement: 3.1–3.2 and the ordinary shift construction 0.10. Proof: balanced
degree-additive higher operations and coherent central graded action.


### Examples

In the Λ_N instance, the homogeneous degree-2 scalar e₁ is represented after shifting by f→f{−2}.
Two such maps compose to e₁²:f→f{−4}; a model retaining only coefficient ring ℤ cannot reproduce
this.

### Dependencies

Use the native bicategorical/enrichment interfaces and 0.10. Section 3.1 precedes coefficient
instances 3.2 and formal shifts 3.3. This layer is independent of Layers 1–2.

## Layer 4: foam and Bar-Natan monoidal 2-categories

### 4.1 The gl(N) foam monoidal 2-category

Construct boundary objects and generated web 1-morphisms from this roadmap's own
web data. Define 2-morphism modules as state spaces of the designated abstract
closures of parallel webs. Call this 2-category NFoam; Goertz–Marino–Wedrich's
NFoam (Example 4.33) corresponds to its nonequivariant instance over ℤ. It
uses the nonnegative labels L_ℕ; words and webs with positive labels form a
locally full sub-2-category NFoam_+. For every pair of parallel planar
generator words S,T, prove that Cl(S,T), equivalently abs(IHom(S,T))
(Goertz–Marino–Wedrich's abs(Hom̲(S,T)), Construction 4.13), satisfies Layer
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
concatenation is tensor, and the dual word s^# of a word s reverses order and
signs. A positive sign +a = (a,↑) means a strand oriented in the direction ↑
of composition of 1-morphisms (Goertz–Marino–Wedrich's â); a negative sign −a
= (a,↓) (their ǎ) means the opposite orientation, also for zero-labeled
strands. Translate these signs explicitly to incoming/outgoing orientations on
each boundary.

Give typed identity strands, both oriented cups and caps, and merge/split
vertices. In the all-positive convention, merge has boundary (+a,+b) →
(+(a+b)) and split the reverse boundary. Cups cup←_a, cup→_a have
boundaries ∅ → (+a,-a) and ∅ → (-a,+a), with the corresponding caps cap→_a
: (+a,-a) → ∅, cap←_a : (-a,+a) → ∅. Supply the other oriented versions
through explicit reversal/bending operations and prove their boundary formulas.
The typing rules use local conservation and vertex roles, including at zero
labels, rather than an upper bound by N. Extend cups and caps to words as in
Goertz–Marino–Wedrich, Construction 4.9, and define W^∗ : t → s for W : s →
t as in their Construction 4.11.

Retain expression trees, composable stacking, side-by-side placement and scan
contexts id_left ⊠ generator ⊠ id_right. Construct finite open-web incidence
data with ordered boundary identifications, prove compatibility with these
operations, and compare their empty-boundary specialization with
LabeledClosedWeb L.Label, and with NonnegativeWeb and PositiveWeb for the
two natural-label instances. Do not infer that every abstract web is represented
by a planar expression. An open web and its abstract closed closure have
different types. Define the closure of parallel expressions using reversed
source, target and matching boundary connectors; prove label, orientation and
cyclic-order compatibility and transport under boundary-preserving isomorphisms.
No embedding is additional data on the resulting abstract closed web Cl(S,T).

Construct the ordinary diagram quotient imposing monoidal interchange and its
comparison with the planar generator words WebWord s t used as 1-morphisms
here. In the higher category, represent exchanges by the tensorator; do not
impose strict tensor interchange as equality of these 1-morphism presentations.
Export the ordinary quotient and raw syntax separately, with their positive and
rank-bounded restrictions, for the planned quantum-web development. Its linear
skein ideal and representation functor are subsequent constructions, not
prerequisites for this quotient or the foam 2-category.

For parallel S,T, define Cl(S,T) and its grading shift δ(S,T) := ½(w_N(S) +
w_N(T)) explicitly, and use 𝓕_(N,σ)(Cl(S,T)){δ(S,T)} as the primary 2-hom model
(Goertz–Marino–Wedrich, Example 4.33). Here w_N(W) := Σ_e k_e(N−k_e) − Σ_v
((k+l)(N−k−l) + kl) over the interval edges e (label k_e) and the vertices v
(labels k, l, k+l) of W; prove w_N(S) = w_N(T), so δ is an integer. Fix the
degrees from Robert–Wagner's closed-foam convention and choose coherent boundary
corrections so that the identity foam of each S has degree zero. State the
resulting formulas and prove degree additivity of vertical composition,
horizontal composition and tensor, as well as degree zero for the structural
comparison cells. Use the native Tau Ceti notation for shifts; do not assert
that the identity condition uniquely determines every source/target shift. The
abstract identity foams cup_S, the composition foams vert, hor
(Goertz–Marino–Wedrich, Constructions 4.17, 4.18 and 4.22) and the tensor
comparisons implement all operations. The alternative description by vanishing
in every closing context is a comparison target: prove equivalence with these
2-homs and compatibility with local insertion before using it. Crossing
generators and their complexes are outside this foam roadmap.

Realize the Goertz–Marino–Wedrich construction in Layer 3's graded coefficient
framework: GrMod_(Λ_N) for the default σ=1, GrMod_(Λ_N[σ,σ⁻¹]) for the universal
normalization, and GrMod_R, with
R in degree zero, for the nonequivariant instance. Over a commutative ring R
with a specified ring map Λ_N → R and degree-zero unit σ, use ev_(N,σ); its
comparison with scalar extension from Λ_N is Layer 2's planar comparison. Prove
that closure-state composition and tensor are balanced over that coefficient
ring, with the closure shifts and tensorators of the stated degrees. The
finite-free and tensor comparison theorems of Layer 2 use this same coefficient
tensor product. Compare the full graded theory, its degree-zero category and its
ungraded linear category.

Adjoin formal shifts of web 1-morphisms through Layer 3 and identify the
resulting shifted morphisms with the homogeneous foam maps. In the
equivariant degree-zero presentation, identify the central operation of
e_i with the map f → f{-2i}. Compare this coefficient action with the
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
End^•(id_∅) ≃ₐ[R] R. In the graded setting use the full graded endomorphism
algebra; its degree-zero part End^0(id_∅) corresponds to R₀.

Write NFoam_σ when distinguishing parameters, suppressing σ when fixed.
The concrete gl(N) theorem discharges the evaluation hypotheses; a construction
conditional on the desired local calculus does not complete this layer.

- Supply objects, web words, closure-state 2-homs, all compositions, tensorator, scalar action,
  formal shifts and the graded/unit comparisons.

**Checks.**

- For one identity a-strand, the closure is an a-labelled circle and δ=a(N−a). Its cup
  representative has the opposite raw degree, giving identity degree 0.
- For a=b=1 at N=3, the merge has edge contribution 2+2+2=6 and vertex correction 3, hence w=3. The
  boundary half-sum is (2+2+2)/2=3.
- End•(id_∅)=Λ_N at σ=1, with e₁ in degree 2 and degree-zero part ℤ. A web carrying label N+1
  instead has zero identity.

Adapt [Goertz–Marino–Wedrich v1, Constructions 4.13–4.18, pp. 34–36, Definition 4.19/Proposition
4.20, p. 37, Constructions 4.21–4.28 and Theorems 4.25/4.29, pp. 38–45][gmw] to planar closure
objects with all abstract fillings and the graded coefficient enrichment.

*Needs:* Statement: 0.9, 2.4 and 3.1–3.3. Proof: concrete evaluation, planar reconstruction, closure
planarity and the structural foam identities of Layer 2.

### 4.2 Oriented and unoriented Bar-Natan monoidal 2-categories

Construct BN_A^→ and BN_A using the nilvalent state spaces and closure
operations. Oriented objects are words of signed points; unoriented objects are
words of unsigned points. Their 1-morphisms are generated by identity strands,
cups and caps, without merge/split vertices. Their 2-homs are the state modules
of the resulting circle closures, with the shifts δ(S,T) := ½(c(s)+c(t)) for
S,T : s → t in the graded instances, where c(s) is c times the number of
points of s (Goertz–Marino–Wedrich, Example 4.30).

Prove the semistrict monoidal laws, coefficient linearity and graded
compatibility using Layer 3. Identify the unoriented generating object as
self-dual and prove its 2-dualizability in Layer 5. Construct the monoidal
2-functor BN_A^→ → BN_A forgetting orientations, and prove its
compatibility with evaluation and the closure-state models.
Recover End^•(id_∅) ≃ₐ[R] R for both categories. These are required concrete
instances, independent of the gl(N) coloring and reduction theorems.

- Supply the two concrete closure categories, compositions, tensor, orientation-forgetting 2-functor
  and unit-endomorphism identifications.

**Checks.**

- For one identity point the closure is a circle and δ=c; its undecorated disk degree −c becomes
  identity degree 0.
- For two identity points δ=2c; the closure has two circle factors. For no points δ=0 and the hom of
  the empty identity is R.
- An oriented cup has opposite boundary signs. Forgetting signs gives the unoriented cup on two
  unsigned points, with unchanged evaluated map.

Use [Goertz–Marino–Wedrich v1, Examples 4.30–4.31, p. 46][gmw], with the explicit unoriented domain
and Frobenius input of this roadmap.

*Needs:* Statement: 0.9, 2.12 and Layer 3. Proof: nilvalent reconstruction and the same structural
closure operations as 4.1.

### 4.3 The progressive foam monoidal 2-category

Construct the progressive gl(N) locally graded-linear semistrict monoidal
2-category NFoam^prog using progressive diagrams. Fix coordinates: x is the
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
2-morphisms, with the same grading shift: Hom_(NFoam^prog)(S,T) :=
Hom_(NFoam_σ)(S,T) = 𝓕_(N,σ)(Cl(S,T)){δ(S,T)}. This is equality of full graded
coefficient modules. Apply the same restriction to degree-zero and ungraded
presentations and include all formal shifts of progressive webs in the shifted
enlargement (NFoam^prog)^(sh). Thus each hom-category is the full subcategory
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

- Supply object/web membership, closure of operations, the locally fully faithful inclusion and
  inheritance of the full graded 2-hom modules.

**Checks.**

- The merge (+1,+2)→(+3) and its split are progressive; their boundary total label is 3.
- A cup and a vertex-free circle are not progressive webs. A positively oriented strand labelled 0
  is permitted in the nonnegative-label instance.
- For the identity 1-strand the progressive 2-endomorphism space equals the ambient one, including
  polynomial decorations. At N=2 the analogous 3-strand space is zero.

This full-on-2-morphisms restriction is defined here. It uses the word and coordinate convention of
[Goertz–Marino–Wedrich v1, Definition 4.2 and Convention 4.3, p. 30][gmw]; its spanning theorem is
6.6.

*Needs:* Statement: 4.1 and the signed web syntax 0.9. Proof: closure of the allowed objects/words
and the local full-subcategory construction 3.1.


### Examples

The identity 1-strand at N=2 has a circle closure with shift 1 and identity of degree 0. Restricting
to the progressive category keeps its entire rank-two endomorphism module.

### Dependencies

Combine Layer 2’s concrete reconstruction with Layer 3’s interfaces and 0.9’s word syntax. Construct
4.1 and 4.2 before restricting 4.1 to 4.3. Identity and composition are constructed before any
compiler.

## Layer 5: spatial duality

### 5.1 Spatial duality and concrete instances

Formalize spatial duality in the sense of
[Barrett–Meusburger–Schaumann, Gray categories with duals and their diagrams](https://arxiv.org/abs/1211.0529),
in the one-object Gray-category setting corresponding to a semistrict monoidal
2-category. Explain the dimension shift: objects, 1-morphisms and 2-morphisms
of the monoidal 2-category occupy dimensions 1, 2 and 3 in that Gray category.
Use Goertz–Marino–Wedrich §4.6 and Theorem 4.35 for the foam construction; match the
Barrett–Meusburger–Schaumann duality
and spatiality definitions, Definition 3.10 and Definition 4.8 in v5,
pp. 45 and 91.

First define the reusable duality data and axioms on the structure of Layer 3.
For each fixed gl(N) parameter σ use its canonical construction; the
unparameterized notation refers to σ=1.
Then construct them on all three main instances NFoam, BN_A^→, BN_A of
Layer 4: object duals, units and counits, adjoints for 1-morphisms, the two
duality operations (−)^∗ and # (# acting on 1-morphisms by the left mate
#W), triangulator ▽_s and comparison cells Δ_W : #W ⟶ W^# to the right
mate (Goertz–Marino–Wedrich, Construction 4.10, Theorem 4.35 and its proof),
stated in the ungraded view Hom^u together with the degrees of these cells,
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
directions using CategoryTheory.Bicategory.Adjunction, retaining explicit
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

- Supply the chosen duality cells, their variance/coherence, concrete representatives, object
  2-dualizability, merge–split adjunctions and their grading records.

**Checks.**

- Object duality sends the word (+a,+b) to (−b,−a); applying it twice recovers the original ordered word.
- For composable 2-morphisms α then β, the contravariant mate has order β* then α*. The identity has
  mate identity; this tests order rather than commutative scalar examples.
- For a=b=1, merge–split units have degrees 1 and −1 in the two directions. Shifting the adjoints by
  −1 and +1 makes the appropriate units degree zero.
- A shift by 3 reverses to −3 under the graded adjoint convention. Do not infer strict involutivity
  for independently shifted chosen adjoints from the ungraded *² law.

Use [Barrett–Meusburger–Schaumann v5, Definitions 3.10 and 4.8, pp. 45, 91][bms] and
[Goertz–Marino–Wedrich v1, Theorem 4.35, pp. 47–48, Corollary 4.37, p. 49, Constructions 4.38–4.39,
pp. 49–51][gmw]. Preserve the grading warning in Remark 4.40, p. 51, and weak-mate distinctions in
Remarks 4.41–4.42, pp. 53–54.

*Needs:* Statement: Layer 3’s structure, Barrett–Meusburger–Schaumann duality/spatiality data and
the concrete categories of Layer 4. Proof: the explicit structural foam models and ordinary
chosen-pairing mates from PivotalSpherical Layers 0–2.


### Examples

For merge labels 1 and 2, the two adjunction choices have units of degrees 2 and −2. Their
degree-zero versions require opposite shifts of size 2, while the spatial axioms remain stated in
the ungraded view with those degrees recorded.

### Dependencies

Use Layers 3–4 and the ordinary chosen-duality contract of PivotalSpherical. Construct the abstract
duality models before Layer 6 names them as generators. No compiler-spanning theorem is an input.

## Layer 6: foam compiler and graphical relations

### 6.1 Typed elementary expressions

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

- Supply each generator’s full incidence model, boundary and degree, derived circle operations,
  rotated variants and the nilvalent/KH3 comparisons.

**Checks.**

- At a=b=1, zip has boundary id_(+1,+1)→merge;split, whereas blister open has boundary
  id_(+2)→split;merge. Equal total label 2 does not make these boundary words equal.
- For KH3, opening sends 1↦1; closing sends 1↦0 and X↦1.
- The Khovanov merge sends (1⊗1,1⊗X,X⊗1,X⊗X) to (1,X,X,0); the split sends 1↦1⊗X+X⊗1 and X↦X⊗X.
- In the unoriented branch the boundary-reflection generator acts by id on both 1 and X; adding a
  Möbius-band generator would exceed the chosen domain.

Construct the compiler generators here. Compare the adjunction pictures with [Dyckerhoff–Wedrich v1,
§5.1, Remark 5.7, equations (5.1.7)–(5.1.8), p. 37][dw]. For KH3 use [Bar-Natan v2, Definition
7.1/Proposition 7.2, p. 1470][bn] and [Goertz–Wedrich v2, Lemma 8 and Propositions 10–11, pp.
3–4][gw-cob].

*Needs:* Statement: Layers 4–5 and finite abstract generators. Proof: 0.2 admissibility, 2.11–2.13
Frobenius maps and the chosen duality cells; KH3 additionally consumes KhovanovHomology K2.

### 6.2 Merge–split adjunctions

Organize zip, unzip, blister open and blister close as the units and counits
of the two adjunctions between merge and split, following the viewpoint of
Dyckerhoff–Wedrich, *Perverse schobers of Coxeter type A*, §5.1. Their example
uses induction/restriction bimodules and Frobenius extensions; adopt the
adjunction interface here without requiring a Soergel-bimodule comparison.

For admissible a,b, let P = (+a,+b), Q = (+(a+b)), and take the web
1-morphisms M = merge_(a,b) : P → Q and S = split_(a,b) : Q → P,
with adjunctions M ⊣ S and S ⊣ M in the ungraded view Hom^u. With ≫ meaning first the left factor,
use the
following boundary dictionary in the underlying ungraded category:

| Adjunction | Structure cell | Foam name in this convention |
| --- | --- | --- |
| M ⊣ S | unit : id_P → M ≫ S | zip |
| M ⊣ S | counit : S ≫ M → id_Q | blister close |
| S ⊣ M | unit : id_Q → S ≫ M | blister open |
| S ⊣ M | counit : M ≫ S → id_P | unzip |

Specify the matching oriented abstract incidence models; the boundary types, not
the names alone, determine the dictionary. In the graded theory state the
shifted adjunctions and degrees explicitly, using Layer 5's conventions: zip and
unzip have degree ab, blister open and blister close degree −ab, so M ⊣ S{-ab}
and S ⊣ M{ab} are adjunctions of the degree-zero shifted 2-category. Prove
that these four compiled generators equal the chosen adjunction cells. Export
all four triangle identities as graphical cancellation relations. Compatibility
of rotations/mates with spatial duality is an additional comparison, not a
consequence of merely possessing two adjunctions.

Reuse Mathlib.CategoryTheory.Bicategory.Adjunction.Basic, including
Adjunction.unit, Adjunction.counit, left_triangle, right_triangle and
Adjunction.comp; use bicategorical whiskering and coherence to place these
identities in larger expressions. Do not introduce a competing foam-specific
adjunction definition. Circle openings, closings and saddles retain their
separate Frobenius interpretation from Layer 2.

- Supply the four typed structure cells, shifted adjunctions, triangle cancellations and
  compatibility with chosen mates.

**Checks.**

- For a=1,b=2 the zip/unzip degree is 2 and the blister degree is −2; the shifted adjoints are S{−2}
  and M{2}.
- For a=0,b=2 all four degrees are 0, but the two distinct unit boundaries id_P and id_Q are still
  recorded before erasure.
- Whiskering zip by merge and then blister close gives id_M; the other triangle gives id_S.
  Reversing that order without reversing types is not a composable expression.

Use the native bicategorical adjunction interface. [Dyckerhoff–Wedrich v1, Definition 5.1, p. 34,
discussion pp. 35–36, Remark 5.7, p. 37][dw] motivates the dictionary; the foam identification and
mate compatibility are proved here.

*Needs:* Statement: Layer 5’s chosen adjunctions and 6.1’s generators. Proof: the native
bicategorical triangle laws and equality of compiled generators with the chosen cells.

### 6.3 Decorations and composition of expressions

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

- Supply the typed constructors, placement/identity operations, decoration algebra laws and explicit
  structural comparison cells.

**Checks.**

- On one identity facet, decorating by x then x² compiles to decoration x³.
- On two separate facets, decorations x and y compile to x⊗y. They are not a single decoration xy
  until a gluing joins those facets.
- Exchanging two independent generators changes the two typed words by the specified tensorator. In
  the free braided check its crossing exponent changes by 1, not 0.

This syntax and its local API are constructed here from the specified generators. It retains
semistrict comparison cells explicitly.

*Needs:* Statement: 6.1, decoration algebras and the three typed composition operations. Proof:
Layer 4’s balanced operations and tensorator equations.

### 6.4 Direct abstract interpretation and compilation

For parallel webs S,T, construct the following interpretation chain:


typed elementary foam expression from S to T
  → decorated abstract filling of Cl(S,T)
  → its class in 𝓕_ev(Cl(S,T)){δ(S,T)} = Hom_𝔅(S,T).


Here 𝔅 is the Layer 4 instance in use, L its labelling datum and 𝓕_ev its
state space (𝓕_(N,σ) for gl(N) over R with its specified map Λ_N → R
and unit σ; 𝓕_A^→; 𝓕_A); for BN_A^→ and BN_A the middle
term is the module of decorated fillings of Cl(S,T) in NilPreFoam^→, resp.
the unoriented model NilPreFoam, of Layer 0. The final state space carries
Layer 4's specified grading shift δ. Recursively interpret the generators by
their explicit abstract models and the expression operations by the structural
abstract composition foams of Layer 4. Prove the boundary and admissibility
conditions at every step, as well as invariance under boundary-preserving
changes of representatives. No intermediate embedded foam, ambient isotopy or
geometric abstraction map occurs in this chain.

For closed source and target webs the boundary is T ⊔ S^r. For webs
with endpoints, use the specified abstract boundary connectors to obtain
Goertz–Marino–Wedrich's closed internal-Hom web. Prove agreement with
Cl(S,T); the disjoint union of two open webs is not a closed boundary.
The abstract filling retains genus, incidence, facet orientations, seam orders
and decorations. Prove that passing to its state class agrees with direct
interpretation in Layer 4 and preserves vertical composition, horizontal
composition, tensor and decorations. Prove compatibility with the specified
grading and the Layer 5 dualities for rotated/reversed expressions.

- Supply recursive abstract interpretation, boundary/admissibility proofs and graded linear
  compilation with its composition and duality comparisons.

**Checks.**

- Compiling the identity on an a-strand produces a filling of its single-circle internal hom; its
  shifted degree is 0.
- For closed webs S,T the filling boundary is T⊔S^r. For open identity intervals it is one joined
  circle, not their disjoint union.
- On a rank-two circle, compiling split followed by merge sends 1 to 2X and X to 0. Closing after
  opening sends 1 to ε(1)=0.

Construct this interpreter here and compare it with [Goertz–Marino–Wedrich v1, Construction 4.6, p.
32, Constructions 4.13–4.18, pp. 34–36, Construction 4.22, p. 39][gmw].

*Needs:* Statement: 6.1–6.3, raw fillings and 2.1 state classes. Proof: the structural composition
foams of 4.1–4.2 and the duality comparisons of Layer 5.

### 6.5 Relations as the kernel of compilation

For each fixed parallel boundary pair, define
u ~ v ↔ compile(u) = compile(v). Extend compilation R-linearly from finite
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

- Supply the linear kernel, quotient-to-image identification, homogeneous relations and stability
  under all allowed contexts and dualities.

**Checks.**

- For A=ℤ[X]/(X²), a cylinder decorated by X² compiles to zero, so that expression lies in the kernel.
- The expression “split then merge” equals twice the X-decorated identity in this instance: both
  maps send 1↦2X and X↦0.
- An undecorated sphere is a zero relation in the rank-two theory, while an undecorated torus equals
  2 times the empty expression. They become the same zero scalar only after specialization to
  characteristic 2.

This kernel calculus is constructed here; its quotient is isomorphic to the compiler image. The
surjectivity needed for progressive webs is the separate target 6.6.

*Needs:* Statement: 6.4 and native free modules/linear kernels. Proof: compositionality, degree
preservation and the local relations of 2.6 and 2.11–2.12.

### 6.6 Progressive foam expressions and spanning

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
compileProg : (ProgressiveFoamExpr(S,T) →₀ R) →ₗ[R] Hom_(NFoam^prog)(S,T),
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

1. Use Layer 4's Cl(S,T) as the trace closure of the corresponding
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

- Supply progressive-expression membership, bending/trace comparisons, integral annular retract
  witnesses, progressive mate translation and the resulting spanning map.

**Checks.**

- For one identity 1-strand at N=2, the annular reduction is one circle; the two nested-cup states
  1,x span its rank-two module before unbending.
- For retract maps i:V→C and p:C→V with pi=id_V, e=ip satisfies e²=e and p(e c)=p(c). The proposed
  spanning states are p(b_j), not necessarily a basis.
- In the model V=ℤ, C=ℤ², i(v)=(v,v), p(x,y)=x, pi=1 but ip=[[1,0],[1,0]] is not the identity. This
  detects an erroneous demand that the annular retract be an isomorphism.
- The mate of id is id, and a mate reverses a vertical product’s order. Each matched generator must
  still have progressive source and target; a cup web fails that membership test.

Adapt [Queffelec–Rose v1, Proposition 5.1/Lemma 5.2, p. 19, equations (5.4)–(5.5), pp.
19–20][qr-annular] and [Gorsky–Wedrich v2, Definition 4.11/Proposition 4.13, p. 19, Corollary
4.20/Remark 4.21, p. 21][gw-annular]. The latter corollary is complex-linear. Integral equivariant
retract witnesses, their compiler expressions and the bending/progressive-mate compatibility are
proved here.

*Needs:* Statement: 4.3 and 6.4’s compilation map on progressive expressions. Proof: 2.7–2.11, Layer
5’s internal-hom/mate structure and explicit integral annular retracts translated into 6.1–6.3
syntax.


### Examples

In the nilvalent rank-two instance, split followed by merge is 2X multiplication. In the progressive
gl(2) identity-strand instance, unbending the two decorated disk states yields spanning
identity-strand foams.

### Dependencies

Sections 6.1–6.5 consume Layers 0–5; KH3 also consumes KH1–KH2. Section 6.6 additionally proves the
integral annular retract and progressive-mate steps. Planar state spanning alone does not supply
this syntactic spanning theorem.

## Layer 7: canopolis

Carry out the disk construction for gl(N) and for both nilvalent instances.
For oriented Bar-Natan use signed boundary points; for its unoriented version
use unsigned points. In both cases webs have no trivalent vertices, and
2-morphisms use their respective Layer 2 state spaces. Prove compatibility
with orientation forgetting. The detailed labelled-web construction below
specifies the gl(N) instance.

### 7.1 Canopolis structures

A canopolis is a family of categories with operations that insert their objects
and morphisms into planar diagrams with holes; each insertion is a functor and
is compatible with substitution of diagrams. Use the oriented, labeled form of
[Bar-Natan, §8.2, Definition 8.1](https://arxiv.org/abs/math/0410495);
Bar-Natan's term is *canopoly*. Define this reusable structure and its
structure-preserving maps before constructing the foam instance.

- Supply boundary profiles, planar operations, insertion functors, units/substitution and
  structure-preserving maps, with marked boundaries.

**Checks.**

- The one-hole identity annulus acts as the identity functor; inserting it twice still gives the
  identity operation.
- An operation with no inputs and no strands selects the empty-web object. A nullary operation
  containing one circle selects the circle object instead.
- An input boundary with oriented signs (+a,−a) is read with the hole’s opposite orientation.
  Omitting that reversal mismatches the endpoints in a cup insertion.

Use [Bar-Natan v2, Definition 8.1, pp. 1473–1474][bn], with the oriented/labelled profiles and
grading specified here.

*Needs:* Statement: finite boundary profiles and a family of categories. Proof: ordinary
planar-operation substitution and boundary bookkeeping.

### 7.2 Planar operations and disk categories

Index categories by boundary profiles: finite ordered lists of signed labels,
read from a marked point on an oriented disk boundary. Use both label
theories of Layer 0. An operation is an oriented disk with numbered input
holes and marked boundary points, containing disjoint oriented labeled arcs
and circles that match the profiles. Reverse the boundary-orientation
convention on input holes when specifying the matching rule. Trivalent web
vertices belong to the inserted objects, not to these connecting diagrams.
Construct fixed boundary collars and the relative-boundary comparison
for diagrams in disks with holes. Use PlanarTopology's Schoenflies and
interior-arc results together with KhovanovHomology K1's finite planar
calculus, and prove the additional boundary-relative extension and subdivision
statements here. Take operations up to boundary-preserving planar isotopy and prove identity,
substitution, associativity, boundary transport and relabeling laws. This
collection with substitution is the colored planar operad acting on the
categories; no separate general operad theory is a prerequisite.

Construct a category Can(b) for each profile b. Its objects are planar webs
with that boundary. Define its morphism modules by the abstract closure state
spaces of Layer 2, using the same grading conventions as Layer 4.
Object representatives and planar web isotopy transport
must be specified so that the construction does not silently identify
distinct 1-morphism presentations from Layer 4.

For a connecting diagram 𝒟 with inputs b₁,…,bₖ and output b, construct
𝒟_* : Can(b₁) × … × Can(bₖ) → Can(b). On objects insert webs; on
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

- Supply relative-boundary diagram equivalence, insertion and its representative independence, the
  disk categories and descent of all evaluated relations.

**Checks.**

- Inserting two undecorated disks into two separate circle holes gives the state 1⊗1, with no extra
  scalar.
- Inserting a sphere-valued scalar 2 into a disjoint empty input multiplies every output state by 2;
  an identity annulus multiplies by 1.
- Relabelling two input holes exchanges their tensor factors by the unsigned swap. A diagram with an
  endpoint of label 1 attached to an endpoint of label 2 is not an allowed insertion.

Construct these disk actions and relative-boundary comparisons here. [Bar-Natan v2, Definition 8.1,
pp. 1473–1474][bn] supplies the structure definition; [Ehrig–Tubbenhauer–Wedrich v2, Definition
2.10, p. 8][etw] supplies the foam insertion model.

*Needs:* Statement: 7.1, finite planar diagrams with marked boundary collars and the state
categories of Layer 2. Proof: PlanarTopology Layers 6–7 and KhovanovHomology K1, plus the
boundary-relative extensions and contextual local identities proved here.

### 7.3 Comparison with the monoidal 2-category and compiler

For a cut of the marked disk boundary into an input word u and output word v,
construct an equivalence between the disk category and the hom-category
𝔅(u,v) of Layer 4, with the boundary reversal and grading shifts stated.
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
expressions, interpreted by 𝒟_*. Prove that existing compiled expressions
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

- Supply cutting/closing equivalences, compatibility with tensor, composition and bending, and
  compiler interpretation in planar contexts.

**Checks.**

- Cutting a disk presentation of one through-strand gives its interval web; closing its identity hom
  gives one circle with the shift a(N−a).
- Side-by-side insertion of two identity diagrams gives the tensor of their identities. Vertical
  stacking gives their categorical composite, with the stated boundary types.
- Inserting the rank-two relation “sphere=0” into a disk context gives zero; inserting “torus=2”
  multiplies that context by 2.

This concrete canopolis/2-category/compiler comparison is developed here from [Bar-Natan v2,
Definition 8.1, pp. 1473–1474][bn] and [Ehrig–Tubbenhauer–Wedrich v2, Definition 2.10, p. 8][etw].
It is not assumed as a general reconstruction theorem.

*Needs:* Statement: 7.2 and Layers 4–6. Proof: explicit cut/closure maps, duality and tensorator
comparisons, and closure-test invariance under insertion.

### 7.4 KH4. Comparison with Khovanov's formal surface calculus

Let B be KhovanovHomology K2's finite cyclically ordered, based set of unsigned
boundary ports, with |B|=2r. Consume its integral formal local cobordism
category, written here as Cob(B), whose relations are S (a sphere is zero),
T (a torus is twice the empty surface) and 4Tu (the four-tube relation).
For KH1's dual-number instance over ℤ, construct a linear functor
J_B : Cob(B) → Can_A(B) to the unoriented nilvalent disk category.
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
χ(Σ)-r: c=−1 makes the foam degree χ(Σ) and the closure shift −r.
Extend J_B to formal shifts and the degree-zero categories and, by the native
finite-additive-envelope construction, to their finite sums. This extension
does not include complexes or idempotent completions. For every commutative
ring R, extend the integral source's hom groups by scalars to R and construct
the compatible R-linear comparison to Can over DualNumber R.

Prove that the family J_B preserves planar insertion, with the boundary and
slot identifications explicit. Under every planar closing exterior, KH2
identifies its action with K3's formal-surface evaluation. On the generating
templates it agrees with KH3. Use this layer's boundary-cut equivalences to
obtain the comparison with the Bar-Natan monoidal 2-category, coherently under
changes of cut. No faithfulness, fullness, equivalence, or identification
with gl(2) foams is asserted for J_B.

- Supply the formal-to-evaluated disk functors, descent through surface relations, finite
  sums/shifts and compatibility with KH2, KH3 and coefficient change.

**Checks.**

- For empty boundary, the formal sphere maps to 0 and the formal torus maps to 2 in R; in
  characteristic 2 both images are 0.
- For a boundary with 2r points the identity matching has χ=r and degree χ−r=0. For one circle,
  birth has degree 1 and death degree 1 in the Khovanov convention.
- The formal merge on 1⊗X and the formal split on X map to X and X⊗X, respectively, agreeing with
  KH3 after every R→S.

Use [Bar-Natan v2, Definition 7.1/Proposition 7.2, p. 1470, Definition 8.1, pp. 1473–1474][bn] and
[Goertz–Wedrich v2, Lemma 8/Propositions 10–11, pp. 3–4][gw-cob]. The functor and its compatibility
with the evaluated foam construction are Foams targets.

*Needs:* Statement: KH1–KH3, 7.2–7.3, KhovanovHomology K2’s formal surface category and K3’s closed
evaluation. Proof: abstract interpretation of its templates, all closing tests and the circle
dual-basis decomposition.


### Examples

For the empty boundary the formal sphere and torus map under KH4 to 0 and 2. Inserting either into
another disk diagram gives the zero map or twice the original map; these identities persist over
ℤ/2ℤ.

### Dependencies

Section 7.1 defines the reusable structure, 7.2 constructs its disk action using the stated planar
suppliers and local boundary extensions, and 7.3 compares it with Layers 4–6. KH4 then consumes
KH1–KH3 and KhovanovHomology K2/K3’s formal-surface contracts.

## Downstream consumers

The web-calculus and quantum-group comparison consumes the labelled web syntax,
circle algebras and foam relations. The geometric-topology component supplies
geometric presentations and movie theorems independently of these abstract
records. The link-homology component consumes the evaluated categories,
spatial duality, progressive spanning and planar insertion together with that
topological input. None of those downstream constructions is a prerequisite.

The KhovanovHomology comparison chain is KH1 → KH2 → KH3 → KH4. It exports
the specified grading, circle states, elementary maps and formal-surface
interpretation, without assuming a link complex or movie-functoriality theorem.

## References

Each linked version fixes the numbering used in the local citations. Claims
extending a cited result are assigned explicitly in the relevant topic.

- [Goertz–Marino–Wedrich, *Monoidal 2-categories from foam evaluation*, arXiv:2602.11120v1][gmw].
- [Robert–Wagner, *A closed formula for the evaluation of sl(N)-foams*, arXiv:1702.04140v3][rw].
- [Baez–Neuchl, *Higher-Dimensional Algebra I: Braided Monoidal 2-Categories*,
  §2.1, arXiv:q-alg/9511013][baez-neuchl].
- [Schommer-Pries, *The Classification of Two-Dimensional Extended Topological Field Theories*,
  arXiv:1112.1000v2][sp].
- [Barrett–Meusburger–Schaumann, *Gray categories with duals and their diagrams*,
  arXiv:1211.0529v5][bms].
- [Blanchet–Habegger–Masbaum–Vogel, *Topological quantum field theories derived from the Kauffman
  bracket*, Topology 34 (1995), 883–927][bhmv].
- [Wu, *Equivariant colored sl(N)-homology for links*, arXiv:1002.2662v2][wu-equivariant].
- [Wu, *A colored sl(N) homology for links in S³*, arXiv:0907.0695v6][wu-colored].
- [Ehrig–Tubbenhauer–Wedrich, *Functoriality of colored link homologies*, arXiv:1703.06691v2][etw].
- [Khovanov–Kitchloo, *A deformation of Robert–Wagner foam evaluation and link homology*,
  arXiv:2004.14197v1][kk].
- [Carpentier, *From planar graphs to embedded graphs*, arXiv:math/0005128v1][carpentier].
- [Queffelec–Rose, *Sutured annular Khovanov–Rozansky homology*, arXiv:1506.08188v1][qr-annular].
- [Gorsky–Wedrich, *Evaluations of annular Khovanov–Rozansky homology*, arXiv:1904.04481v2][gw-annular].
- [Dyckerhoff–Wedrich, *Perverse schobers of Coxeter type A*, arXiv:2504.08496v1][dw].
- [Goertz–Wedrich, *A note on TQFTs for orientable 2-dimensional cobordisms*,
  arXiv:2511.19373v2][gw-cob].
- [Bar-Natan, *Khovanov’s homology for tangles and cobordisms*, arXiv:math/0410495v2][bn].
- [Erickson, *Computational Topology: Planar Graphs*, 2023 course notes][erickson].

[gmw]: https://arxiv.org/abs/2602.11120v1
[rw]: https://arxiv.org/abs/1702.04140v3
[baez-neuchl]: https://arxiv.org/pdf/q-alg/9511013#page=10
[sp]: https://arxiv.org/pdf/1112.1000v2#page=144
[bms]: https://arxiv.org/abs/1211.0529v5
[bhmv]: https://doi.org/10.1016/0040-9383(94)00051-4
[wu-equivariant]: https://arxiv.org/abs/1002.2662v2
[wu-colored]: https://arxiv.org/abs/0907.0695v6
[etw]: https://arxiv.org/abs/1703.06691v2
[kk]: https://arxiv.org/abs/2004.14197v1
[carpentier]: https://arxiv.org/abs/math/0005128v1
[qr-annular]: https://arxiv.org/abs/1506.08188v1
[gw-annular]: https://arxiv.org/abs/1904.04481v2
[dw]: https://arxiv.org/abs/2504.08496v1
[gw-cob]: https://arxiv.org/abs/2511.19373v2
[bn]: https://arxiv.org/abs/math/0410495v2
[erickson]: https://jeffe.web.engr.illinois.edu/teaching/comptop/2023/notes/09-planar-graphs.html

[ml-bicat]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Bicategory/Strict/Basic.html
[ml-opp]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Monoidal/Opposite.html
[ml-linear]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Linear/Basic.html
[ml-quotient]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Quotient/Linear.html
[ml-graded]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/GradedObject/Monoidal.html
[ml-enriched]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Enriched/Ordinary/Basic.html
[ml-shift]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Shift/ShiftedHom.html
[ml-pairing]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/PerfectPairing/Basic.html
[ml-frobenius]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/RingTheory/Coalgebra/IsFrobenius.html
[ml-symmetric]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.html
[tc-ideal]: https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/CategoryTheory/Preadditive/MorphismIdeal/Basic.lean
[tc-graded]: https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Algebra/Category/GradedModuleCat/Basic.lean
[tc-projective]: https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Algebra/Category/GradedModuleCat/Projective.lean
[tc-nakayama]: https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Algebra/Module/GradedModule/Nakayama.lean
[tc-pieri]: https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/Pieri.lean
[tc-permutations]: https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/PermutationTriple/Basic.lean
[tc-ribbon]: https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/RibbonGraph/Basic.lean
[pivotal]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PivotalSpherical/README.md#layer-0-the-dual-and-double-dual-functors
[khovanov]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/KhovanovHomology/README.md#k2-the-rank-two-frobenius-object-and-circle-tensors
[tl]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/TemperleyLieb/README.md#layer-7-the-karoubi-envelope-and-the-root-of-unity-quotient
[surface]: https://github.com/mccorvie/TauCetiRoadmap/blob/add-planar-surface-topology-roadmaps/TauCetiRoadmap/SurfaceTopology/README.md#layer-2-presentations-and-comparison-theorems
[planar]: https://github.com/mccorvie/TauCetiRoadmap/blob/add-planar-surface-topology-roadmaps/TauCetiRoadmap/PlanarTopology/README.md#layer-7-the-schoenflies-theorem-and-tameness
[schur]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk
[dga]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DGAInfinity/README.md#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure
[zigzag]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ZigzagPreprojective/README.md#layer-8-braid-complexes-and-spherical-twist-comparisons
[bundles]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicVectorBundles/README.md#l2a--structured-linear-schemes
[euler]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GrothendieckEulerForms/README.md#layer-3-finite-resolutions-and-the-resolution-theorem

## Contributors

This roadmap is part of an autoformalization working group at IPAM, including
Juan Ramón Gómez García, Qiuyu Ren, Iordanis Romaidis, Paul Wedrich,
Michael Willis and Hongjian Yang.
