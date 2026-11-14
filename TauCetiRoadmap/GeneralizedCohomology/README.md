# Generalized cohomology, spectra and orientations

Build the stable algebraic topology needed to use cohomology theories rather than
only singular cohomology: integer gradings, relative and reduced theories,
representing spectra, products, infinite-CW comparisons, generalized bundle
orientations and Thom spectra. Brown representability, the Milnor sequence and
Spanier–Whitehead duality are parts of a usable library with explicit comparison
maps. The construction of a spectrum does not substitute for its homotopy theory.

The spectrum model is **symmetric spectra of pointed simplicial sets**. Its
pointed simplicial sets use Mathlib `SSet`, its sphere actions use the permutation
groups of `Fin n`, and its structure is a module over the symmetric sphere
sequence under Day convolution. Follow Hovey–Shipley–Smith's model, including the
stable model structure and its comparison with sequential spectra. In particular,
naïve colimits of homotopy groups do not define stable equivalences for arbitrary
symmetric spectra.

`README.md` is definitive. `Suggested.lean` checks selected carrier and interface
shapes; it is not an exhaustive checklist and its admitted constructions are targets.
Suggested implementation homes are `TauCeti/AlgebraicTopology/Spectra/` and
`TauCeti/AlgebraicTopology/GeneralizedCohomology/`.

## Scope and suppliers

All CW statements include arbitrary cell sets and unbounded dimension in the
chosen universe. Finite or countable hypotheses occur only on results that use
them. Spaces of CW type are included by comparison, and the spectrum-defined
extension to arbitrary spaces uses singular simplicial sets. No dimension axiom
is imposed on generalized theories.

| Owner | Contract consumed here | Boundary |
| --- | --- | --- |
| [AlgebraicTopology](../AlgebraicTopology/README.md), Stages 2–5, 8 | CW cells/skeleta and cellular approximation, homotopy groups and Whitehead, ordinary pair/triple homology and products; Stage4.5 ordinaryPairQuotientComparison and ordinaryPairQuotientCohomologyComparison | singular chains and ordinary homology/cohomology remain there |
| AlgebraicTopology Stage 6.0 | countable inverse towers: `lim = ker(1−shift)`, `lim¹ = coker(1−shift)`, exactness, Mittag–Leffler and cofinal-shift maps | G3 builds the topological telescope and mapping-spectrum comparison, not another algebraic tower carrier |
| [DGFloer](../DGFloer/README.md), Layer1 item4; AlgebraicTopology Stage8 | DGFloer functorial abelian EM models; ordinaryEMUniversalClass, ordinaryEMRepresentability, ordinaryEMRelativeRepresentability, ordinaryEMLoopComparison, ordinaryCohomologySuspension and projectiveEMComparisons on arbitrary CW spaces | G2 assembles HA and proves the spectral ordinary comparison; nonabelian K(π,1) remains ordinary topology |
| DGFloer Layer 1 item 4 | Serre classes, including torsion, and simply connected Hurewicz modulo a class | G5 supplies the rational-sphere/stabilization argument, not a second general Serre-class owner |
| [HomotopySpheres Stage 3A](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint; pointed convenient mapping spaces, suspension/loop, smash, mapping cone/Puppe, stable sphere stems and Freudenthal | G2 builds pointed simplicial and spectral constructions and the adapters; it does not create a second topological smash or stable-stem owner |
| [TopologicalKTheory](../TopologicalKTheory/README.md), T1, T5–T7; [CharacteristicClasses](../CharacteristicClasses/README.md), C1–C3 | actual numerable bundles/classifiers, CC C2.1 disc/sphere quotient and ordinary Thom classes, bundle-level real/complex Bott isomorphisms and chosen ordinary class conventions | G4–G5 supply the spectral and generalized adapters. G4.0 supplies the quaternionic bundle/HP adapter; G5 compares KSp with quaternionic bundle groups |
| [ComplexKahlerGeometry K1/K7.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a452db2cfef888380d1b7b7ce00fa06d5bad1109/TauCetiRoadmap/ComplexKahlerGeometry/README.md); [ComplexManifolds PR279](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279), Milestones1–2 | #279's real scalar restriction and complex orientation as consumed by K1, and K7.1's native CP complex and real atlases | G4.0b consumes these atlases and owns only the fixed interleaved real Euclidean model change and rank-one Grassmannian diffeomorphism |
| [SmoothBundlesConnections](../SmoothBundlesConnections/README.md), B1.4 | proper free-action smooth quotient and principal-bundle/submersion comparisons | G4.0b supplies the Sp/Stiefel/Grass/HP carriers before Riemannian metric consumers |
| [SpinRepresentations](../SpinRepresentations/README.md), L7; [SpinGeometry](../SpinGeometry/README.md), G4.1 | native Spin(3) topology/action and Spin-cover frame/form adapters | G4.0a supplies the calibrated Spin(4) and quaternionic forgetting maps |
| [SpinGeometry G1.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/41b8e2757fda1d8b7502af380e44b011b83bd7ff/TauCetiRoadmap/SpinGeometry/README.md#g1-negative-metric-clifford-modules-and-their-positive-metrics) | `cliffordScalarTrace` and its ℂ-linear extension τ_ℂ, their normalized regular-module trace formulas and algebra-isomorphism transport, independent of later C*-models | G5.5 proves positivity/faithfulness for its mixed Cartan adjoint and the Hilbert-module/completion norm comparisons |
| [GeometricTopology](../GeometricTopology/README.md), smooth embeddings and tubular neighbourhoods | actual finite-dimensional normal bundles, tubes and collapse comparison | G5 constructs finite-spectrum duality; structured PT and geometric bordism remain TangentialBordism |
| DGFloer Layer1 item2 | ordinary Serre homology/cohomology spectral sequences, arbitrary-CW/base comparisons and multiplicative convergence | G5 uses these for rational EM/sphere calculations; no returned dependency on generalized spectra |
| [HilbertModules H2, H4–H6](https://github.com/TauCetiProject/TauCetiRoadmap/pull/861), [CStarAlgebras C5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/860), [OperatorKTheory K5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/866) | complex Hilbert compact operators/spatial tensors, strong-topology unitary contractibility, regular functional calculus and graded Clifford APIs | G5 adds the real/Clifford specializations, equivariant spectral construction and graded family-index/classification comparisons; complex generic operator foundations keep these owners |
| [BordismFormalGroups F6.5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d52555458ff6c92e777455b7c6e615849ae89f4e/TauCetiRoadmap/BordismFormalGroups/README.md#f65-local-group-actions-and-completion-comparisons) | generic categorical model, enriched diagrams, coherent model diagrams/stability, Kan extensions and marked straightening (including the coCartesian instance), LM module-fibre rectification, and operator-category unit-adjoined monoidal localization/relative adjunctions | G5.7 verifies these hypotheses on its specified G2 models and constructs the continuous-torus, Borel, Thom/support and tower instances; chromatic and Tate applications remain with their owner |
| G5's compatible bundle-diagram interface | actual bundles, stabilization isomorphisms, coherent block-sum/permutation maps and their universal classifier adapters | TangentialBordism consumes this interface for ξ-normal structures; geometric cycles over X, structured Pontryagin–Thom, coefficient/characteristic-number calculations and rational bordism generators stay there |

The cited supplier targets are contracts to build, with no claim that their
current implementations are complete. G4.0 builds the quaternionic adapter and G5 builds the generic compatible
bundle-diagram interface before any structured-bordism consumer. Brown's additive representation in G3
does not use ordinary Eilenberg–Mac Lane representability; HA and its ordinary
comparison do. Missing concrete APIs are built in Tau Ceti following the current
Mathlib design, without waiting for upstream or redirecting work to it.

BordismFormalGroups owns formal laws, projective power-series coordinates,
orientation changes and coefficient-ring universality, using native
`FormalGroup R`/`FormalGroup.IsComm` in Mathlib RingTheory/FormalGroup/Basic.lean
with its actual MvPowerSeries Fin2 law. StringOrientation and
EllipticCohomology own BString/string data, tmf/Tmf/TMF and their orientations.
TangentialBordism owns the geometric projective-bundle transfers and their
bordism-kernel generation; PositiveScalarCurvature consumes them for surgery
and metric applications. These consumers do not supply G1–G5's foundations.

## Conventions and complete basic APIs

- Work in explicitly fixed universes. The category of u-small CW objects has a
  set of cells in `Type u`, and theory values for Brown's theorem are u-small.
  Prove the solution-set bounds so the representing CW object is in that same
  universe, and prove universe-lift comparisons. Do not use a proper-class
  wedge in a construction. The pointed CW category has chosen cell structures,
  a 0-cell basepoint, all continuous based maps, and pointed homotopy classes.
  Its products are CW products in PR284's convenient category: prove the weak
  product CW structure agrees with k(X×Y). All products, wedges, smash and
  relative-product unions below use that topology and its comparison maps.
- Based spaces carry a point and maps preserve it. For CW models use a chosen
  0-cell as basepoint; for general models use the derived singular extension.
  `X₊` means a **disjoint** basepoint; it is distinct from one-point
  compactification. Form mapping cones for arbitrary pointed maps; identify
  them with subset quotients only for cofibration/NDR pairs.
- Write `ΣX = S¹ ∧ X`, with the suspension coordinate on the left, and orient
  `S¹` by the increasing interval parameter. `Σ` on spectra is the derived
  suspension, made invertible in the stable homotopy category. `Σⁿ` uses every
  integer n, with native `HasShift C ℤ`, inverse and composition isomorphisms.
  Use native `Pretriangulated`/`IsTriangulated` for the cofiber triangles.
  A reduced cone uses A×[0,1], with A attached at t=0 and its t=1 end
  collapsed. The increasing collapse c:C_f→ΣA sends (a,t) to [t,a].
  Suspension in cohomology is σ(a)=ι×a with the positively oriented interval
  unit class ι on S¹ on the left. For the ordinary pair-to-mapping-cone
  comparison normalize `δ_(X,A)(a)=c*σ(a)`. Pin the relative cycle map:
  for ([0,1],{0,1}) a positive interval lifts to the closed cycle consisting
  of that interval plus the increasing cone over 1 minus the cone over 0;
  a=1 at endpoint 1 then evaluates +1 after collapse. Distinguish the cone
  pair (CA,A): extending 1 at the attached end to 0 at the apex gives its
  cochain boundary −1 on the positive interval. Its connecting map is
  `δ_(CA,A)=−σ` under CA/A≃ΣA, whereas the actual pair-to-mapping-cone
  map contributes the additional sign in the displayed formula.
  AT uses its apex0/attached-end1 cone and last interval coordinate. Its
  `ordinaryCohomologySuspension` agrees with a×ι and obeys
  `σ_AT(a)=(−1)^n τ*σ(a)` for |a|=n and the block swap τ:X∧S¹→S¹∧X.
  Use interval reflection t↦1−t for the cone comparison, retaining AT's
  actual reference chains and quotient/pair maps. Prove the respective
  chain signs −1 and (−1)^n on cells/spheres, and the graded external-product
  block-symmetry identity on arbitrary spaces. Prove the relation
  `δ_(X,A)=(−1)^(n+1)c_AT*σ_AT` for AT's increasing collapse. Prove the
  HA comparison intertwines extend-then-d through these actual maps;
  the cone-pair and ordinary-pair boundaries are not identified literally.
  For an unpointed pair use Σ(A₊), so the reduced suspension represents
  full Hⁿ(A), including degree0 constants. AT separately supplies the
  unreduced suspension and its quotient identifying the two apices;
  its pullback kills the constant degree0 class and agrees with this
  pointed pair triangle. Retain the empty-A branch.
  Normalize the homology boundary by the same ordered interval and AT's
  pair chain boundary. These tests and adapter maps pin the signs.
- For a spectrum E, `π_n E = [Σⁿ S,E]`,
  `Eⁿ(X,A) = [Σ∞ C(A₊→X₊),ΣⁿE]`, and
  `E_n(X,A) = π_n(E ∧ᴸ Σ∞ C(A₊→X₊))`. For a based space use reduced
  suspension spectra and based cofibers. In particular `Eⁿ(*) = π_(−n) E`;
  the coefficient grading must not be reversed silently.
- Cohomology takes arbitrary wedges to **products**; homology takes them to
  **direct sums**. Colimits in spectra are homotopy colimits when forming
  telescopes or deriving a functor. A strict levelwise limit is not a homotopy
  limit without a comparison theorem and its hypotheses.
- Products are induced by the derived smash and a chosen unital associative,
  homotopy-commutative spectrum multiplication. A strict ring-spectrum model
  is used where module-model categories are constructed. Homotopy-commutative
  multiplication is sufficient for the graded ring on groups; it is not an
  assertion that the model is an E∞ ring or that every homotopy ring rectifies
  to a strictly commutative ring. Permuting sphere coordinates supplies the
  Koszul sign `(-1)^(pq)` for **integer** degrees p,q.
- For a group, functor, structure map or quotient introduced here, supply maps,
  identity/composition laws, naturality, change of representative/model and
  the relevant universal property. For a spectral construction supply stable
  equivalence invariance and the stated topological/simplicial comparison.

## G1. Reduced, relative and multiplicative theories

G1 starts with the pointed topological/CW suppliers. It states and develops
axiomatic theories independently of their G2 spectral representation.

1. **Theory categories.** Define integer-graded reduced cohomology theories on
   pointed CW spaces and unreduced theories on CW pairs, valued in native
   `AddCommGrpCat` or `ModuleCat` when coefficients are specified. Fields are
   actual functors, natural connecting maps and equations/exactness properties:
   homotopy invariance, cofiber exactness, suspension and arbitrary wedge.
   Give the relative triple sequence and its commutative morphism diagrams.
   Shape unreduced homology after native `TopPair.HomologyPretheory` and its
   Eilenberg–Steenrod axiom interfaces, restricted to CW pairs and extended
   by the comparison. Define its homological degree−1 boundary and direct-sum
   wedge axiom; the cohomological version follows the corresponding opposite
   category with its integer grading. Define maps of theories to preserve the boundary
   and suspension identifications, not merely degreewise natural maps.
2. **Reduced/unreduced comparison.** Construct `Eⁿ(X) ≃ Ẽⁿ(X₊)` and
   `Eⁿ(X,A) ≃ Ẽⁿ(X/A)` for CW cofibration pairs, taking X/∅=X₊. For arbitrary maps use their
   mapping-cone group instead of a subset-relative notation. For a nonempty
   pointed X prove the split augmentation sequence
   `Eⁿ(X) ≃ Eⁿ(*) ⊕ Ẽⁿ(X)`; prove the analogous homological statement.
   Construct inverse functors between the reduced and relative axiomatic
   theories and their natural isomorphisms. The reduced theory has a nonunital
   internal algebra; the unreduced unit and augmentation are actual compatible
   maps, not an informal adjunction of a unit to an unspecified graded group.
   Prove the equivalence preserves multiplicative theories, using the actual
   homeomorphism X₊∧Y₊≃(X×Y)₊. Prove equivalence between the ring-valued
   relative definition with suspension laws and these reduced external-product
   axioms, including unit, augmentation, boundary and all comparison diagrams.
3. **Cofibers and open covers.** Consume the single topological cone/Puppe
   supplier, prove the comparison with pair/triple exact sequences, and derive
   Mayer–Vietoris with the ordered-cover map `(restriction,−restriction)`
   from E*(U)⊕E*(V) to E*(U∩V). Its connecting map is the one from
   this ordered homotopy-pushout triangle, normalized by the fixed ordinary
   pair comparison. For a∈Eᵖ(X), b∈Eᑫ(U∩V), prove
   `δ_MV(a|_(U∩V)∪b)=(−1)^p a∪δ_MV(b)` and the corresponding
   right action without a sign; prove the ordered-cover swap rule.
   Extend a CW theory through singular CW replacement, prove weak-equivalence
   invariance there, and establish excision/open-cover MV for that extension.
   State the comparison with the original theory on CW-type spaces.
4. **External and internal products.** A multiplicative theory includes natural biadditive maps
   `Ẽᵖ(X) × Ẽᑫ(Y) → Ẽ^(p+q)(X∧Y)`, with
   associativity, unit, interchange, graded symmetry and suspension laws
   as actual axioms: σ(a)×b=σ(a×b) and a×σ(b)=(-1)^p σ(a×b) for |a|=p,
   after the displayed sphere/block permutations. Derive the relative products
   `Eᵖ(X,A) × Eᑫ(Y,B) → E^(p+q)(X×Y,A×Y∪X×B)` for cofibration pairs
   and compatibility with pullback and restriction. Internal cup is pullback
   by the reduced diagonal. Define the graded coefficient ring, module actions
   and change-of-ring/theory maps on these actual carriers.
5. **Unique smash lift.** Prove the cofiber sequence
   `X∨Y → X×Y → X∧Y` for well-pointed CW models, together with its
   natural split on theory groups and after stable suspension, and its extension by derived
   replacement. The product class restricts to zero on the wedge. Prove the
   collapse pullback is injective using the Puppe continuation and the split
   surjectivity on the preceding groups; consequently the external class is
   the unique lift of the pullback-and-cup class. A vanishing wedge restriction
   alone gives existence and does not prove uniqueness. Prove the convenient
   comparison `(U×V)⁺≃U⁺∧V⁺` for locally compact Hausdorff U,V, and its
   compact based-space version obtained by deleting the respective basepoints;
   do not identify disjoint basepoint addition with this compactification.
6. **Boundary module identities.** For `a∈Eᵖ(X)` and `b∈Eᑫ(A)` prove
   `δ(i* a ∪ b)=(-1)^p a∪δb` in `E^(p+q+1)(X,A)` and
   `δ(b∪i* a)=δb∪a`, with the absolute/relative actions displayed. Give the
   analogous two-variable relative/external formulas on their correctly typed
   triples. Do not state an untyped derivation law whose factors inhabit
   incompatible absolute or relative groups.
7. **Sphere and circle tests.** Suspension identifies
   `Ẽⁿ(S^r) ≃ E^(n−r)(*)` for r≥0. Construct the suspension-of-unit class
   σ in `E¹(S¹)` and prove
   `Eⁿ(S¹) ≃ Eⁿ(*) ⊕ E^(n−1)(*)` as graded coefficient modules and rings,
   with the second summand a square-zero ideal. Prove σ²=0 by the nullhomotopy
   of the reduced diagonal `S¹→S¹∧S¹`; odd-degree graded commutativity alone
   proves only 2σ²=0. Prove the bimodule/Koszul action on the shifted summand.

## G2. A concrete spectral model and represented theories

1. **Pointed simplicial substrate.** Define pointed simplicial sets as the
   native undercategory `Under Δ[0]`; prove its equivalence with simplicial
   objects in native `Pointed`. Construct the pointed smash as the degreewise
   quotient of `X×Y` by `X∨Y`, its unit S⁰, mapping simplicial set, tensors and
   cotensors, suspension/loop adjunction and all associator/unitor/braiding
   equations. The simplicial circle is `Δ[1]/∂Δ[1]`, with its boundary collapsed
   to the chosen point. Prove colimit and enrichment properties needed below.
   First build the unpointed Kan–Quillen model structure using Mathlib's
   boundary/horn generating maps. Define a simplicial weak equivalence to mean
   its realization induces a bijection on components and isomorphisms on all
   based homotopy groups; prove the equivalent Kan-group criterion after
   fibrant replacement. Consume AT Stage 8's Kan-group comparison and follow
   Riou's topcat-model-category project and the cited Mathlib PR shapes.
   Supply the lifting, smallness, factorization and model axioms and the
   pointed undercategory model structure. On topological spaces use the
   weak-homotopy/Serre model with its explicit convenient-space adapter.
   Consume AT4's `simplicialRealizationCW`, AT8.2's `simplicialGroupKan`,
   `simplicialGroupMooreHomotopyIso` and `kanRealizationUnitHomotopyIso`,
   and CC C1.2's actual |Sing X|→X weak-equivalence. DGFloer Layer 1 item 2
   supplies its abstract CW-approximation comparison. Use those unit/counit
   results to prove realization ⊣ Sing is a Quillen equivalence.
   Build `realizationProductKelleyComparison`, the homeomorphism
   |K×L|≃|K|×_k|L| and its pointed smash/quotient versions, and the
   monoidal/cofiber diagrams. This early realization-product adapter uses
   only AT4/8.2 and PR284 Stage3A. AT's ordinaryEMRepresentability
   and ordinaryEMLoopComparison consume this foundational monoidal
   portion for their realization and loop adapters; it does not depend on HA, G3 Brown or the other G2 targets.
2. **Symmetric sphere modules.** Use the finite-bijection skeleton with
   objects n and hom sets `Fin n ≃ Fin m`; its automorphism group at n is
   `Equiv.Perm (Fin n)`.
   Symmetric sequences are its functors to pointed simplicial sets. Construct
   Day convolution and prove the induction/wedge formula
   `(A⊗B)_n = ∨_(p+q=n) (Σ_n)₊ ∧_(Σ_p×Σ_q) (A_p∧B_q)`.
   Use native Day-convolution, action and monoid/module-object APIs. The sphere
   sequence has `S_n=(S¹)^∧n`, coordinate-permutation actions and block-concatenation
   multiplication. Prove it is a commutative monoid object. A symmetric spectrum
   is a **module over this monoid**, so unit, associativity and the full
   `Σ_p×Σ_n` equivariance of iterated structure maps are actual laws.
   Construct free spectra F_n, evaluation adjunctions, limits/colimits and
   the smash over S as its balanced coequalizer, with internal function spectra.
   For each integer k≥1 build the corresponding sphere monoid S^(k),
   with levels (S^k)^∧n and n-block actions, and its native module category.
   Prove the G2.2–4 construction/model/positive-flat/commutative transfer
   theorems for these specified sphere monoids, including closure and
   suspension/loop stability. Their k=1 instance is the chosen carrier;
   G2.5 constructs the actual comparison, not a second retained homotopy
   category with unrelated operations.
3. **Stable model structure.** Construct the level model structures and the
   stable projective model structure using the native `ModelCategory` and
   small-object/localization machinery. Prove smallness, the generating
   factorizations, lifting/retract/two-out-of-three properties, and the stable
   existence theorem. Define the weak-equivalence class before stable
   localization: use level-projective cofibrant replacements and require the
   induced derived level-mapping simplicial sets into every level-fibrant
   Ω-spectrum to be weak equivalences. Define Ω-spectra by Kan levels and
   weak-equivalence adjoints `E_n→ΩE_(n+1)`. Prove the identification of stable
   fibrant objects, functorial replacements and mapping-space computation of
   localized morphisms. Prove independence of the replacements.
4. **Stable category and operations.** Form the native categorical localization
   at stable equivalences, prove locally small morphisms, additive/abelian
   hom groups and biproducts. Construct suspension/desuspension, distinguished
   cofiber triangles, mapping-spectrum LES, and triangulated coherence.
   Prove the pushout-product and monoid axioms needed for the derived smash,
   show the sphere is its unit and prove closed symmetric monoidal structure.
   Construct CW-spectrum approximation from integer-shifted sphere cells;
   compare free-spectrum cells with their stable sphere shifts. Prove spectral
   Whitehead, that the sphere is a compact generator, and the finite-subcomplex
   filtered-hocolimit decomposition, with all cell/replacement structure maps.
   Strict associative spectral rings and their module categories have the
   indicated transferred model structures; prove that relative smash and
   function modules derive correctly. Construct the positive flat model
   and its monoidal/commutative-ring comparisons, prove that its commutative
   cofibrant replacements have flat underlying spectra, and prove the point-set
   smash of flat spectra computes derived smash. For every explicit Thom/K/HA
   multiplication either prove the named raw model flat or use that actual
   positive-flat replacement and transport the multiplication/unit; the resulting
   product comparison uses this theorem, not an unverified cofibrancy assumption. For the canonical commutative Thom
   examples construct the positive stable model and its commutative-ring
   transfer and comparisons. State which monoidal/cofibrancy hypotheses each
   comparison uses; this does not rectify an arbitrary homotopy ring. Homotopy ring objects and strict
   associative models are distinguished in the APIs.
   Construct the simplicial tensors, cotensors and mapping spaces for the
   stable projective and positive-flat stable models. Prove SM7, including
   pushout-products of positive-flat cofibrations with simplicial
   monomorphisms and the trivial-cofibration conclusions when either input
   is trivial, including spectral stable-trivial cofibrations. Construct the
   level/latching and stable-localization comparisons used in that proof.
   Use Mathlib `CommMon` over this constructed closed symmetric monoidal
   spectral carrier for commutative spectral rings.
5. **Sphere/space comparisons.** Construct `Σ∞` and derived `Ω∞`, prove their
   adjunction and compare derived maps from suspension spectra with maps into
   Ω-spectrum levels, with enough level shifts to accommodate negative degrees.
   For every m≥1 build topological S^(m)-symmetric spectra as native
   sphere modules in the convenient based category, with stable/positive-flat
   and commutative-ring models. This includes m=2,3,4 used below. Pin an increasing interval homeomorphism
   |Δ[1]/∂Δ[1]|≃ℝ⁺ and its smash powers
   |(Δ[1]/∂Δ[1])^∧n|≃(ℝ^n)⁺. Prove Σ_n-equivariance and all ordered
   block/unit diagrams, retaining the left coordinate and orientations.
   For S^(m), use n blocks of m increasing real coordinates and construct
   |((Δ[1]/∂Δ[1])^∧m)^∧n|≃(ℝ^(mn))⁺ with those block actions.
   For m=2,3,4 label each block (1,i), (1,i,j), (1,i,j,k), respectively.
   These are ordered real coordinate positions; MSp^(4)'s geometric
   fourth-coordinate map uses −k as specified in G5.4.
   Levelwise Sing is lax symmetric monoidal: construct the actual
   Sing X∧Sing Y→Sing(X∧Y), and restrict sphere-module scalars along
   the adjoint sphere-monoid maps S_sim^(m)→Sing S_top^(m). This
   defines SingSp^(m) on spectra and commutative rings for every m≥1. Its left adjoint is monoidal realization
   using the pinned sphere homeomorphism. Prove the stable and positive-flat
   Quillen equivalences, commutative-ring comparison, stable-equivalence
   invariance and semistability/true-π transport under their replacement
   hypotheses. These adapters carry every topological Thom/operator/Γ model
   into the single retained simplicial category. Prove the homotopy, smash,
   cofiber and suspension diagrams with PR284's convenient spaces.
   Prove general Freudenthal for (k−1)-connected pointed CW spaces, k≥1:
   π_iX→π_(i+1)ΣX is an isomorphism for 1≤i≤2k−2 and surjective
   at i=2k−1, with the π₁ group branch at k=1. Build the
   required CW homotopy-excision theorem: an (m,n)-connected homotopy
   pushout square, m,n≥1, is (m+n−1)-cartesian. Applying it to the two
   cones gives the (2k−1)-connected unit X→ΩΣX. Prove iterated/stable
   ranges and compatibility with the sphere-only supplier theorem. Construct
   the sequential Bousfield–Friedlander/symmetric Quillen comparison and its
   derived inverse, including explicit unit/counit equivalences. Construct
   the monoidal stable comparison for stabilization with S² and S⁴.
   Construct the following Φ_s, δ_k^(m) and L_m first in convenient
   topological spectra, then their simplicial enriched versions and comparison
   diagrams through SingSp^(m). Own the actual imaginary-coordinate-loop
   functors here: for s≥2,
   (Φ_sE)_n=Map_*(S^n_last,E_n), lowering S^s indexing to S^(s−1).
   Permutations act by conjugation on loops and the given block action on E.
   Construct structure maps using the real/last-coordinate sphere shuffle
   followed by E's structure, and the lax symmetric monoidal unit/product
   maps via concatenation of loop coordinates. Its left adjoint P_s has
   (P_sF)_n=S^n∧F_n, with the diagonal coordinate action and structure
   pairing the added S¹ with the S^(s−1) input before F's structure.
   Prove this actual adjunction on sphere modules. Φ_s carries commutative
   monoids by its lax symmetric monoidal structure. Prove P_s⊣Φ_s is
   a weak monoidal Quillen equivalence on the positive-flat models: the
   derived product RΦ_sE∧ᴸRΦ_sF→RΦ_s(E∧ᴸF) and sphere unit are stable
   equivalences. Construct and prove the induced Quillen equivalence on
   commutative rings, with its derived unit/counit. For complex models pin
   S^(ℝ^n)∧S^(iℝ^n)≃S^(ℂ^n); against the interleaved complex orientation
   its permutation sign is (−1)^(n(n−1)/2). For quaternionic models remove
   k, then j, then i; after uncurrying the looped blocks are ordered i,j,k.
   Define L_1=id and L_m=Φ_2⋯Φ_m for m≥2, with
   (L_mE)_n=Map_*(S^((m−1)n),E_n), under these exact shuffles.
   Thus L_2=Φ_2 and L_4=Φ_2Φ_3Φ_4. L_m's loop sphere has n blocks
   of dimension m−1 and the Σ_n block action. The permutation from m coordinate groups of size n to n groups
   of size m has sign (−1)^(binom(m,2)binom(n,2)); thus the three i,j,k
   loop groups contribute (−1)^(n(n−1)/2), while all four 1,i,j,k groups
   contribute+1. Prove these signs in the actual coordinate maps.
   For all m,k≥1 define δ_k^(m) from S^(m)-modules to S^(km)-modules:
   (δ_k^(m)E)_n=E_(kn), with the iterated S^(km) structure and the
   block-permutation Σ_n→Σ_(kn). Construct the natural comparison
   χ_(m,k):L_mE→L_(km)δ_k^(m)E. At level n it is
   Map(S^((m−1)n),E_n)→Map(S^((km−1)n),E_(kn)), obtained from
   the ((k−1)n)-fold E structure. Pin the coordinate recipe: label the
   kn original m-blocks (a,b,c), a<n,b<k,c<m; retain (a,0,0) as the
   n real suspension coordinates. The new loop inputs are the remaining
   labels in lexicographic (a,b,c) order. Evaluate the old map on (a,0,c),
   c>0, then insert the b>0 coordinates in the iterated-structure order
   (b,a,c), and apply E's level block permutation from that new-block-prefix
   order to (a,b,c). Prove the actual labelled shuffle and its determinant
   signs, the sphere unit and all permutation/product/structure diagrams.
   Prove χ_(m,k) lax symmetric monoidal and a stable equivalence for
   m-semistable E (the canonical map from the naïve system
   colim_n π_(j+mn)E_n to derived stable π_j is an isomorphism for every j),
   including the corresponding semistability-preservation theorem, or through
   positive Ω^(m) replacements. Construct its actual
   commutative-ring comparison. The m=1 branch is X→L_kδ_kX; the
   m=2,k=2 branch supplies MU→L_4δ_2^(2)MU^(2).
   Restrictions retain these block actions; a bare subsequence is not the
   comparison.
   Prove the adjoint/prolongation zigzag, its derived equivalence and true-π
   comparison. Prove semistability and raw colimit computations for the
   canonical Thom models, or compute through actual positive Ω replacements;
   arbitrary symmetric spectra do not acquire a naïve-π comparison by this
   notation. Prove the positive/flat commutative-ring comparison and specify
   the functor carrying commutative monoids. G5 consumes this single route;
   the comparison retains its actual block actions and monoidal maps.
   Identify
   `π_n S` with the supplier's stabilized sphere colimit for n≥0 using the
   Ω replacement or sphere semistability from item 6, and prove vanishing in
   negative degrees. No new private stable-stem type is retained.
6. **True versus naïve homotopy.** Define spectral π_n by stable sphere maps.
   For a fibrant Ω-spectrum, prove the eventual level-group computation with
   the correct shift and abelian-group range. Include positive Ω-fibrant
   spectra, computing in sufficiently large positive levels with the same
   shift and abelian-group bounds. Define semistability, prove when
   the sequential colimit `colim_k π_(n+k)(E_k)` computes true π_n and require
   a nonsemistable counterexample F₁S¹. Ordinary sequential spectra
   have their own proved stable-colimit comparison; do not transfer that
   statement to arbitrary symmetric spectra by forgetting permutation actions.
7. **Represented theories and ordinary adapters.** First complete G2.10
   (raw part after G2.1, fibration-LES application after DGF1.2), then
   DGF1.4's fixed abelian models, before this item.
   Prove that the displayed
   formulas in the conventions satisfy every G1 axiom and product/sign law.
   Their spectral maps induce natural maps of theories. Assemble the ordinary
   coefficient comparison into a concrete HA for any abelian A: its n-th pointed simplicial level is
   the reduced free A-module Ã[Sⁿ] on Sⁿ=(S¹)^∧n, with coordinate actions.
   Define structure maps by x∧Σ a_i y_i↦Σ a_i(x∧y_i); for a commutative ring A
   define multiplication by the bilinear smash of generators. Prove the full
   symmetric-module/ring laws. Compare these levels with DGFloer's single
   K(A,n) models via Dold–Kan and AT's loop/ordinary representability adapters,
   prove stable π is A concentrated in degree zero, and compare HA theories
   with AT's reduced/absolute/relative singular theories, including Stage 4.5's
   required quotient comparison and the normalized pair boundary. Prove
   every adjoint Ã[Sⁿ]→ΩÃ[S^(n+1)] is a weak equivalence: use the
   reduced-free-module cofiber short exact sequence, the simplicial-abelian
   Kan-fibration theorem and contraction of Ã[CSⁿ]. For a commutative
   ring A give the unit x↦1·x on each sphere level, identify product/unit with AT's ordinary products. Construct ordinary
   stable Hurewicz `E→HZ∧ᴸE` from the sphere unit, and the homology/cohomology
   pairings and coefficient-change maps needed for G5. For an A-module M
   construct HM by the same reduced-free-M construction and the actual
   HA-module action, with all structure/unit diagrams. Compare module
   ordinary theories and coefficient changes. The left structure map versus
   AT's last-coordinate `ordinaryEMLoopComparison` uses the cyclic block
   permutation with sign(−1)^n on π_n; retain the fixed reference class.

8. **Multiplicative infinite-loop construction.** Define Γ-objects using
   the skeleton of finite based sets and based maps, fixing Γ^op to be
   that category. Use native functors; a Γ-space is a based functor from
   this category to convenient based spaces. Transport its associated
   spectra to pointed SSet by G2.5's single SingSp comparison. Construct its prolongation to based simplicial sets,
   assembly maps and associated symmetric spectrum, with actual permutation
   actions. Special means its n-to-1 Segal maps are weak equivalences;
   very special adds a group-valued π₀. Prove group completion, the Ω-spectrum
   theorem and natural/model-invariant comparison with G2's connective
   symmetric spectra. Develop the topologically enriched nerve/realization
   and permutative-category input: coherent ⊕, zero and symmetry induce the
   Segal maps, with the actual group-completion universal property. For
   bipermutative inputs with ⊗, unit and both distributivity coherences,
   construct the multiplicative machine and its unital E∞ multiplication.
   Construct its Barratt–Eccles operad from the nerves of permutation
   translation categories, with free actions, contractible terms and actual
   block-substitution/unit equations. Build the corresponding algebra/free-
   algebra APIs and operadic model transfer and change-of-operad comparison,
   using G2's pushout-product/monoid/cofibrancy hypotheses. Compare/rectify it to a commutative symmetric ring using the positive
   model hypotheses. Supply strictification/rectification constructions
   and comparisons; no multiplicative coherence is inferred from group laws.
   Construct the natural comparison of the derived free commutative algebra
   on a positive-flat cofibrant spectrum V with the wedge of extended powers
   `(V∧ᴸ⋯∧ᴸV)_(hΣ_m)`, including m=0, unit, operadic multiplication and
   replacement maps. Construct relative free-cell pushout filtrations over
   flat commutative bases and their underlying derived-colimit comparisons,
   including transfinite compositions. Compare the operadic and positive
   commutative free cells under this same construction.
   Construct commutative spectral localization at a homogeneous even-degree
   class, its unit and universal property among rings in which that class
   is invertible, in the homotopy category of commutative spectral rings.
   Construct central point-set representatives and the semistability/replacement
   comparisons used by the telescope. Identify its underlying module with the shifted multiplication
   telescope, and prove coefficient, module and multiplicative comparisons.
   This lane uses G2.1–4 and precedes G5's periodic K-ring construction.
9. **General topological-group classifiers.** Extend the same CC C1.1b
   numerable join carrier and universal-bundle construction to arbitrary
   topological groups, retaining its actual local sections and numerable
   pullback classification; do not replace it by the discrete-group carrier.
   For well-pointed groups construct the topologically enriched bar model,
   prove its universal-bundle/classifier comparison with the join and its
   product-preserving realization comparison in the convenient category.
   Include continuous group homomorphisms, products, subgroup-associated
   bundles, chosen trivializations and clutching on spheres. Distinguish
   actual trivializations (maps) from their homotopy classes. After choosing
   one reference trivialization, identify the set of actual trivializations
   with the continuous gauge maps C(X,G), and its homotopy quotient with
   [X,G]; prove the change-of-reference action. This provides
   the general-G source examples and G5's strictly functorial Spin models;
   CC retains its ordinary classes and compact-Lie computations.
   Prove sphere clutching with its actual hypotheses. For n≥1, a chosen
   fibre frame over the basepoint of S^(n+1) gives π_n(G,e); forgetting
   that frame quotients by the π₀G conjugation action. For S¹ use conjugacy
   classes in π₀G. For path-connected G identify this with unbased [S^n,G];
   for disconnected G distinguish its component choices and π₁ action
   from the bundle-clutching quotient. Prove all normalization, gauge,
   homotopy and based/unbased comparison maps.
   For G=GL_k(ℝ), use polar/Gram–Schmidt deformation to O(k), retaining
   determinant components, and prove this complete low-rank table for the
   identity basepoint (π₀ is a group here):

   | k | π₀ | π₁ | π₂ | π₃ |
   | --- | --- | --- | --- | --- |
   | 0 | 0 | 0 | 0 | 0 |
   | 1 | ℤ/2 | 0 | 0 | 0 |
   | 2 | ℤ/2 | ℤ | 0 | 0 |
   | 3 | ℤ/2 | ℤ/2 | 0 | ℤ |
   | 4 | ℤ/2 | ℤ/2 | 0 | ℤ⊕ℤ |
   | k≥5 | ℤ/2 | ℤ/2 | 0 | ℤ |

   Prove it from the Stiefel group fibrations, the sphere groups and
   G4.0's calibrated native Spin(3)/Spin(4) quaternionic homeomorphisms
   and vector-action equations, together with the LieGroups sphere fibrations. Pin Spin(4)'s generators by (q_L,q_R):v↦q_L v q_R^−1.
   A determinant-negative component acts on π₁ at k=2 by negation,
   on π₃ at k=4 by swapping these factors, and trivially on the other
   displayed nonzero higher groups. For n≥1 and k≥1 identify unbased
   [S^n,GL_k(ℝ)] with ℤ/2×π_nSO(k) AS SETS. For pointwise multiplication
   construct its group isomorphism with π_nSO(k)⋊_αℤ/2 instead: split the
   determinant components by the constant reflection
   r_k=diag(−1,1,…,1), and let α be conjugation by r_k on the based
   homotopy group. In the convention (a,ε) represented by h·r_k^ε,
   prove (a,ε)(b,η)=(a+α^ε(b),ε+η), including identification of
   pointwise multiplication in the based kernel with the π_n group law.
   Use the displayed conjugation actions to compute the infinite dihedral
   group for [S¹,GL_2(ℝ)] and the factor-swap semidirect product
   (ℤ⊕ℤ)⋊ℤ/2 for [S³,GL_4(ℝ)]; the other displayed higher-group cases
   have trivial action. Compare choices of reflection and basepoint by
   their actual homotopies/conjugation maps. For S⁰, pointwise multiplication
   gives (π₀GL_k(ℝ))², hence four classes for k≥1, whereas unframed
   clutching over S¹ gives only the two conjugacy classes in π₀GL_k(ℝ).
   Retain the trivial k=0 case. Prove the stabilization maps: on π₁,
   SO(2)→SO(3) is reduction modulo2; on π₃, SO(3)→SO(4) is the
   diagonal ℤ→ℤ⊕ℤ and SO(4)→SO(5) is addition, with these Spin
   generators. Subsequent displayed stable maps are isomorphisms. Derive the unframed sphere-bundle
   sets by those orbit actions; unbased maps into GL_k have two target
   components for connected spheres when k≥1 and are not that orbit set.
   Include S⁰ separately (two component choices) and the trivial k=0
   branch. The general classifier/bar construction precedes the table;
   its low-rank computations consume G4.0's Sp/Spin/sphere comparisons.


10. **Mapping-path replacements and homotopy fibres.** This foundational
   raw convenient-space construction uses G2.1, native continuous maps
   and the compact-open path topology. Own `IsHurewiczFibration p` for a
   continuous p:E→B: use an actual continuous lifting function
   Λ:{(e,γ):E×C(I,B) | γ(0)=p(e)}→C(I,E), with Λ(e,γ)(0)=e
   and p(Λ(e,γ)(t))=γ(t). Prove it yields continuous homotopy lifting
   for parameter spaces Z in arbitrary universes: for a:Z→E and
   H:Z×I→B starting at p∘a, construct L:Z×I→E starting at a with p∘L=H.
   For the converse, require lifting for the universal parameter
   MappingPathSpace p in Type(max uE uB), or its ULift to a larger
   universe. The interval's compact-open exponential law and this
   universal test establish the equivalence and its upward universe
   comparisons. Develop pullback/composition and map/homotopy naturality.
   For E,B:Type u, prove the Hurewicz-to-Serre comparison into native
   `TauCeti.TopCat.serreFibrations`: feed `IsHurewiczFibration.lift` into
   `mem_serreFibrations_of_hasHomotopyLiftingProperty`, swapping the
   parameter product A×I with I×A. For distinct E/B universes transport
   through ULift to a common larger universe, proving the equivalence
   `IsHurewiczFibration p ↔ IsHurewiczFibration (ULift map of p)`;
   take native Serre membership at that common universe.
   This predicate comparison uses G2.1 and the native API shape, not a DG LES. DGF Layer2 consumes
   this single predicate and comparison for Moore-path replacements.
   For f:B→K construct `MappingPathSpace f := {p:B×C(I,K) // p.2(0)=f(p.1)}`
   and `MappingPathFiber f k := {p:B×C(I,K) //
   p.2(0)=f(p.1) ∧ p.2(1)=k}` with the actual product/subspace topology.
   Construct the constant-path inclusion B→MappingPathSpace f, the
   projection to B, endpoint map to K and the flattening homeomorphism
   between MappingPathFiber and the literal endpoint fibre. Contract
   the replacement to B by the actual reparameterization γ(s t).
   Name the based path space at k as MappingPathSpace of the constant
   map {∗}→K with value k; the same γ(s t) homotopy contracts it to the
   constant path. Construct `mappingPathFiberConstHomeomorphPath b k`,
   identifying every endpoint fibre of the constant b map with native `Path b k`,
   including its actual forget/reinsert maps and forward/inverse evaluation lemmas.
   Specialize this same comparison at b=k as
   `mappingPathFiberConstHomeomorphLoopSpace`, into native `LoopSpace K k=Path k k`,
   retaining constant loops, evaluation and concatenation comparisons.
   Prove the endpoint map is a Hurewicz, hence Serre, fibration by a
   continuous parametrized path-concatenation lifting construction.
   Likewise the fibre projection to B is the pullback of the fixed-end
   path fibration and has actual lifting maps. At b with a chosen
   reference path f(b)→k construct its homotopy equivalence with Ω(K,k)
   by γ↦α⁻¹*γ and ℓ↦α*ℓ for the reference path α,
   where * traverses its left factor first; if the
   endpoint path components differ that fibre is empty. No path-independent
   loop-fibre identification is asserted.
   For a Hurewicz p:E→B and e0 with b0=p(e0), let F be its fibre and
   P={lambda:I→E | lambda(0)∈F, lambda(1)=e0}. Construct the continuous
   q:P→Omega(B,b0), q(lambda)=p∘lambda, and its all-parameter Hurewicz
   lifts using the square-pair homeomorphism carrying one initial edge
   onto bottom∪right. Construct a continuous section on ALL loop
   components: lift beta(1−t) from e0 with universal parameter OmegaB
   and reverse the resulting path. For the inverse homotopy use the
   base square beta_lambda(s), prescribing lambda on bottom, the
   selected section on top and e0 on right. Build the required
   one-edge→three-edge square homeomorphism by the boundary map
   theta3(s)=3s on [0,1], 3+(s−1)/3 on [1,4], and its radial extension.
   Prove both inverse formulas, continuity at the center and product
   transport for arbitrary parameters. Lift this whole three-edge
   prescription and curry in the path variable. This gives
   q∘sigma=id and id_P~sigma∘q over OmegaB, including every component
   without a connectedness or CW-type hypothesis. The equivalence is
   ordinary/unbased: strict based choices and based homotopies require
   actual relative lifting; a generic lifting function need not fix
   constant paths. Do not substitute a single contractible fibre for
   this global construction or infer a general contractible-fibre
   theorem from it. Preserve ordinary compact-open interval evaluation,
   chosen e0, empty-fibre cases and arbitrary-universe HLP transport.
   For a supplied path alpha:I→B, construct the pullback E_alpha→I.
   Lift the two contractions (t,u)↦(1−u)t and (t,u)↦(1−u)t+u with
   parameter E_alpha to obtain homotopy-inverse endpoint maps r0,r1. Their
   restricted constant-base tracks give both inverse homotopies for
   each endpoint-fibre inclusion, even without regular lifting. Define
   fibre transport r1∘i0 and its reverse r0∘i1; derive both composite
   homotopies from those four homotopies, including empty endpoint
   fibres. This compares fibres along a supplied path, not by a
   path-independent canonical map. Neither raw construction consumes
   DGF's LES, Moore/transitive lifts or general Whitehead machinery.
   Retain the raw carrier/topology when passing to G2.1's compactly
   generated category: build its k-ification and the projection,
   endpoint, fibre/pullback and exponential-law comparisons. Raw
   compact-open evaluation/currying uses the locally compact interval;
   arbitrary-domain mapping-space adjunctions use the convenient
   category's k-products and function objects. Include empty fibres,
   arbitrary chosen k, based maps/reference paths when supplied, map
   homotopies, pullback/naturality and homotopy-choice comparisons.
   Compare these explicit replacements with the derived homotopy fibre
   in the designated topological model, using the native Serre predicate
   through the preceding Hurewicz comparison. Then apply DGFloer1.2's
   fibration homotopy exact sequence to these replacements; only this
   LES application consumes DGF1.2. The raw carrier/lifting/native comparison
   starts after G2.1. The LES comparison follows DGF1.2 and precedes
   DGF1.4, hence G2.7's HA/ordinary comparison.
   StringOrientation's BString and
   TangentialBordism's normal-classifier lifting use this single carrier;
   neither constructs an endpoint-dependent disjoint sum of path fibres.


   **Fixed-data relative lifting and topological bundles.**
   Own `zeroSetSDR_liftingInclusion`: for a subspace A=u⁻¹(0) of Y,
   continuous u:Y→I, a supplied retraction r:Y→A and homotopy i r→id fixing A,
   arbitrary-parameter Hurewicz p lifts every compatible square on A→Y, fixing
   the supplied A-data strictly. With h from i r to id, use
   F(y,t)=h(y,min(t/u(y),1)) for u>0 and F(a,t)=a, lift from g r,
   and evaluate at time u(y). Compact-I tube continuity at A is indispensable;
   no regular lifting function is assumed. Own the closed-NDR parameter-corner
   consequence: J=X×{0}∪A×I has control u(x)t and the explicit SDR
   (H(x,s min(1,t/u)), t(1−s min(1,u/t))), fixing the zero axes.
   Prove its continuity at both axes and its global endpoint in J, including
   u=t=1. This supplies arbitrary fixed basepoint tracks for well-pointed
   parameters. DGF1.2 consumes it in its Hurewicz-based LES lane; AT8 remains
   the relative-pair owner. No CW, convenient or stable prerequisite is imposed
   on this ordinary zero-set SDR theorem.

   Consume actual native Trivialization and FiberBundleCore for general
   topological bundles. Given a supplied continuous topological-group action
   and continuous overlap G-valued cocycle, construct joint coordinate changes
   and their inverses without imposing compact-open Homeo(F) group hypotheses
   for arbitrary F. Own `numerableFiberBundle_hurewicz` for a supplied locally
   finite partition of unity with supports in trivializing opens; construct
   the continuous universal path-lifting function by the actual numerable
   local-to-global lifting argument, with refinement, zero-duration continuity
   and all parameter/universe comparisons. Paracompact Hausdorff bases supply
   such numerations. This is a construction target, not a theorem inferred
   from the local native clift. Arbitrary-base bundles have the separate
   existing native Serre theorem consumed by DGF1.2. Empty F needs no choice
   of a point; projection surjectivity still requires Nonempty F. These
   fixed-data and numerable-bundle statements retain their stated hypotheses;
   they give no global homotopy equivalence from a single contractible fibre.

## G3. Brown representation, arbitrary CW and infinite comparisons

1. **Brown on arbitrary CW.** Prove set-valued pointed Brown representability
   on **connected** pointed CW complexes: the functor takes arbitrary wedges
   to products, homotopy pushouts to weak pullbacks, and the point to a
   singleton. Give the representing space and universal class by cell
   attachment and kernel killing, with the solution-set bounds in the chosen
   universe. Use the telescope of the countable construction and derive
   surjectivity onto its inverse-limit compatible classes from wedge/exactness;
   a strict inverse limit is not the representing construction.
   For an integer-graded additive theory, represent Ẽ^(q+1) on connected CW
   spaces and use Ẽ^q(X)≃Ẽ^(q+1)(ΣX) and suspension–loop adjunction to
   represent Ẽ^q on **all** pointed CW spaces, including disconnected ones.
   Prove naturality and the usual Yoneda uniqueness of representing spaces.
   Consume AT's based-loop-CW-type comparison. Prove the displayed
   bijection with [X,ΩK_(q+1)] is additive, with loop concatenation agreeing
   with the theory addition by the co-H-space/Eckmann–Hilton argument.
   Identify the basepoint components separately: connected representing
   spaces give the Ω₀ branch; the additive disconnected extension retains
   all components indexed by the coefficient group.
2. **Integer-graded representing spectra and operations.** Choose actual
   maps ΣE_n→E_(n+1) representing the suspension adjoints between the chosen
   representing spaces; prove their Ω equivalences. The connected Brown
   representatives have adjoints into Ω₀K_(n+1); looping that equivalence
   gives the all-component additive representing levels and full Ω-spectrum
   maps, without dropping their coefficient-group components. A sequential spectrum
   needs these maps, not an unstated higher-coherence axiom. Transport by
   pointed Sing and G2's sequential/symmetric Quillen equivalence, and prove
   representation on all relative/reduced groups.
   Prove the presentation E≃hocolim_n Σ^(−n)Σ∞E_n after the specified
   sequential/Ω replacement, and its free-spectrum version. Prove diagonal
   cofinality presentations for derived twofold and threefold smash products.
   Construct the restriction tower of stable maps from the desuspended
   suspension spectra of the representing levels. Prove its Milnor exact
   sequence and use it to state the existence, ambiguity and obstruction to
   lifting stable operations and universal external-product classes to spectral
   maps. Name the exact stagewise-phantom kernel; compare it with intrinsic
   finite-source phantoms rather than asserting their equality without proof.
   Prove associativity and symmetry defects of lifted products lie in the
   corresponding restriction kernel, and prove honest stable ring laws when
   that kernel vanishes (including explicit Mittag–Leffler hypotheses).
   For a supplied coherent spectral-ring product prove its axiomatic-theory
   comparison without this ambiguity. Additive Brown representation and
   ordinary product axioms do not imply a strict associative or E∞ refinement.
   Natural transformations on all spectra are induced by unique spectral
   maps, by Yoneda; the preceding restriction-kernel ambiguity concerns data
   given only on spaces/representing levels.
3. **Arbitrary-CW comparison theorem.** A natural morphism of theories that
   commutes with suspension/boundaries and is an isomorphism on coefficient
   groups in every integer degree is an isomorphism on all CW pairs. Prove
   the finite cell step, arbitrary wedges of cells, relative skeletal step,
   unbounded-dimensional passage using item 4 and transport to CW-type spaces. Include
   naturality with arbitrary attaching maps and coefficient-module actions.
   Neither finite generation of the cell set nor connectivity of E is assumed.
4. **Telescope and Milnor.** For a countable sequence of pointed spaces form
   its actual mapping-cylinder homotopy telescope. Its alternating open
   cylinder cover and G1 MV/disjoint-union axioms produce the exact
   sequence below. Take A to be the even pieces and B the odd pieces.
   On overlap i the ordered restriction difference is
   (−1)^i(a_i−f_i*a_(i+1)). Normalize its product identification by
   ε((b_i))=((−1)^i b_i), so the group map becomes exactly 1−shift.
   Its coker-to-MV comparison sends [b] to [εb]; hence the lim¹ injection
   is δ_MV∘ε, not the unnormalized δ_MV. Carry this identification through
   the spectral triangle comparison, with the positive interval at overlap0
   fixing the global sign. This uses no point-set difference
   map of spaces or a G2 dependency. For spectra construct the actual
   cofiber of 1−shift on the wedge; compare this triangle with the topological
   construction after suspension spectra. Apply the single AT tower algebra to prove
   `0→lim¹ E^(q−1)(X_i)→E^q(hocolim X_i)→lim E^q(X_i)→0`.
   The inverse-limit map is restriction. The lim¹ injection is the ε-normalized ordered-MV connecting map, and
   in the spectral comparison the cofiber connecting map for
   `∨Σ∞X_i --(1−shift)→ ∨Σ∞X_i → Σ∞Tel`, factored through the
   coker of `(a_i)↦(a_i−f_i*a_(i+1))`; use the left-suspension/cone convention
   above. Prove agreement with AT 6.0, naturality, cofinal-shift comparisons
   and coefficient-module actions. For sequential inclusions of
   CW subcomplexes prove telescope≃union. For arbitrary CW dimension use the
   countable dimension filtration; an uncountable CW complex need not admit
   a countable filtration by finite subcomplexes.
5. **Increasing open covers.** If X is the union of an increasing countable
   family of open sets U_i, prove the canonical telescope map is a weak
   equivalence after convenient/singular replacement. Compact spheres and
   their homotopies lie in one U_i; prove the exact compact-family comparison.
   Deduce the Milnor sequence for the spectrum-defined extension, compare it
   with any original theory on CW-type opens/union, and prove MV/disjoint-union
   axioms imply the same sequence for that CW-replacement extension. For
   a direct open-MV proof use a numerable exhaustion, with a continuous
   f:X→[0,∞) whose increasing sublevels refine the U_i, and construct the
   alternating open telescope cover. For a numerable bundle cover, prove
   Dold's countable disjoint-refinement lemma: a countable numerable cover V_n,
   each V_n a disjoint union of trivializing opens, with refinement maps and
   an actual subordinate partition. Its finite unions give the required
   exhaustion. The proof uses the disjoint-union axiom and finite trivializing-
   piece complexity, not a finite-CW hypothesis on those opens.
6. **Phantom and mapping-spectrum control.** For a countable CW-spectrum
   filtration `P_i→P_(i+1)` by the G2 CW-spectrum cells prove
   `0→lim¹[ΣP_i,E]→[hocolim P_i,E]→lim[P_i,E]→0` with natural group maps.
   Identify the kernel as stagewise phantom maps. When P_i are finite and
   exhaust all compact subobjects, compare it with vanishing on every finite
   spectrum. For an arbitrary CW spectrum define phantom maps by restrictions
   to all finite subspectra; supply the finite-subobject/filtered-hocolimit
   comparison and state precisely when a countable lim¹ description applies.
   Do not identify arbitrary spectral maps with a bare inverse limit of
   unstable maps. Prove sufficient Mittag–Leffler/surjectivity conditions for
   vanishing. Construct the nonzero phantom
   `S_ℚ=Tel(S --2→ S --3→ S --4→ ⋯) → ΣHZ`: its restriction groups
   [S,ΣHZ] vanish, while the lim¹ term of [ΣS,ΣHZ] is identified with
   Ext¹_ℤ(ℚ,ℤ)≠0. Exhibit the constant-one class in the tower's coker:
   a hypothetical preimage forces factorial residue congruences incompatible
   with a fixed integer. Prove this Ext/lim¹ identification and nonvanishing and
   show the map is intrinsically phantom by compactness.
7. **Continuity and finite-source formulas.** Finite cell spectra are compact:
   stable maps out of them commute with filtered homotopy colimits. Prove the
   corresponding homology filtered-colimit theorem and the finite-CW
   suspension-spectrum mapping formula `colim_k[Σ^kX,E_(n+k)]` for finite
   pointed CW X and a sequential spectrum E, or a symmetric spectrum after
   semistable/Ω replacement, with k chosen so n+k≥0 and the groups are in
   their abelian range. On infinite sources use the preceding mapping
   LES, not that finite-source formula without phantom corrections. Prove
   finite-skeleton and completion comparisons for projective/Thom examples;
   no general canonical splitting of a Milnor short exact sequence is claimed.


8. **Spectral homotopy limits and Postnikov covers.** Construct derived
   products in G2's model, functorial tower replacements and
   `spectrumTowerHomotopyLimit E` as the derived fibre of1−shift on
   ∏_r E_r. Its r-th coordinate is pr_r−f_r pr_(r+1), using the
   stable addition, not subtraction of arbitrary pointed-set level maps.
   Prove comparison with the model homotopy limit, naturality, cofinality
   and the exact homotopy Milnor sequence
   `0→lim¹ π_(n+1)E_r→π_n holim E_r→lim π_n E_r→0` in every
   integer n. Identify these kernel/cokernel arrows with AT6.0's single
   abelian tower carrier; prove the actual product/fibre and connecting
   comparisons rather than only invoking the algebraic sequence.
   For every integer k construct the functorial
   `spectrumConnectiveCover E k=τ_(≥k)E` with its map to E: π_n
   vanishes for n<k and the map is an isomorphism for n≥k. Use
   functorial cellular factorization with sphere cells in degrees≥k,
   proving attachment/smallness and homotopy-colimit comparisons in
   G2's model. Prove derived smash of an a-connective and a b-connective
   spectrum is(a+b)-connective by their cellular models and the sphere
   smash comparison. Construct `spectrumPostnikovTruncation E k=τ_(<k)E`,
   its map from E and the natural exact triangle τ_(≥k)E→E→τ_(<k)E.
   Prove its π_n comparison for n<k and vanishing for n≥k. Compare
   choices and construct the compatible derived spectral functors.
   Prove the full mapping-space universal properties: the connective
   cover is right adjoint to inclusion of k-connective spectra, and
   truncation is left adjoint to inclusion of spectra with no homotopy
   in degrees≥k. Maps from k-connective objects to those truncated
   objects form a contractible mapping space, including parameter
   homotopies. Prove idempotence, shift/unit and tower composition laws.
   For a connective ring R and an R-module E, construct the coherent
   R-module structure on τ_(≥k)E by connectivity/coreflection, and prove
   the cover map R-linear. Rectify through G2's module model and verify
   all action coherences; for k>0 this is not a unital ring structure.
   For connective commutative spectral rings construct the structured zeroth
   Postnikov refinement on Mathlib `CommMon` over G2.4's constructed
   symmetric monoidal spectral carrier.
   Use its positive-flat commutative-ring model and the same HA of G2.7
   for a native commutative coefficient ring A. Consume G2.5's identification
   of sphere homotopy with the supplier's stabilized stems; identify π₀S
   with ℤ using AT's positive sphere-degree class, compatibly with product
   and unit. Construct the commutative model's simplicial enrichment,
   tensors/cotensors and functorial replacements. Transfer G2.4's spectral
   SM7 through the forgetful cotensor and fibration/trivial-fibration
   comparisons to prove the commutative corner-map property.
   First prove `connectiveSpectrumMapsToHA`: for connective V the actual
   simplicial map, defined by π₀, from the derived `Map_Sp(V,HA)` to
   the constant simplicial set `Hom_AddCommGrp(π₀V,A)` is a weak equivalence.
   Use this section's additive mapping-space truncation and G2.7's HA,
   with cofibrant source and fibrant target replacements; prove coefficient
   naturality and the replacement comparisons.
   Reuse G2.8's single free/operadic and relative free-cell comparisons.
   Prove an m-fold homotopy symmetric power of a k-connective spectrum
   is mk-connective for k≥0. Using G2.8's comparison, prove homotopy
   orbits and filtered homotopy colimits preserve k-connectivity.
   Construct connective commutative-cell presentations and their weak
   equivalences to connective rings. Degree-zero generators use a specified
   positive-flat cofibrant K₀≃S: the derived free algebra has polynomial
   π₀ and its maps to HA are the discrete choices in A. Degree-one relation
   cells impose the specified π₀ relations; higher free generators and
   degree-d attaching cells for d≥2 have contractible HA mapping fillers.
   Prove these claims on the actual mapping pushouts/pullbacks using SM7,
   then pass through transfinite composites by Kan mapping towers and
   sphere compactness. Construct by π₀ the actual natural simplicial map
   from the derived `Map_CAlg(R,HA)`, using a cofibrant source and fibrant
   HA target, to `Hom_CommRing(π₀R,A)` and prove it a weak equivalence,
   with the right side a discrete Kan space. Retain its bifunctor
   naturality, composition and replacement comparisons.
   On specified connective positive-flat cofibrant commutative models
   construct `connectiveCommRingPostnikovZero R=P0R` and a strictly
   natural commutative-ring map `R→P0R`. Use functorial small-object
   factorization with the commutative model's generating trivial
   cofibrations and free commutative cells on
   `F_m(∂Δ[k]₊)→F_m(Δ[k]₊)`, m≥1 and k−m≥2, where F_m is G2's
   spectral free/evaluation adjoint. Prove smallness, positive-flat
   cofibrancy, the stable sphere comparison and the relative free-cell
   connectivity bounds. The high cells preserve connectivity and π₀;
   the lifting properties give positive Ω-fibrancy and, by G2.6's
   positive-level group formula, kill every positive stable homotopy group.
   Prove P0 preserves weak equivalences between these models. For a raw
   connective R use the earlier functorial
   cofibrant replacement cR→R and export the natural span
   `R←cR→P0(cR)`. Identify the underlying spectrum of P0(cR), under cR, with
   `spectrumPostnikovTruncation R 1=τ_(≤0)R` by the additive universal
   property and its homotopy-group comparison. Construct a commutative
   equivalence `P0(cR)≃H(π₀R)` between specified replacements, natural
   in Ho(CAlg), with the identity on π₀. The preceding actual mapping-space
   comparison supplies its derived uniqueness. Strict functoriality is
   asserted for P0 on the specified models; the HA comparison is
   Ho-natural, without an asserted strictly natural point-set map R→HA.
   Prove `spectrumPostnikovConvergence`: E→holim_(k→∞)τ_(<k)E
   is an equivalence by eventual π-stability and the above Milnor sequence.
   Likewise hocolim_(k→∞)τ_(≥−k)E→E is an equivalence. Neither statement
   assumes E bounded below. Generic constructors precede specialized
   KO covers, ABP characteristic maps and String/bordism coefficients.
9. **Integral localization and derived prime completion.** For a
   multiplicative set S⊂Z construct S^(-1)S as the sphere localization
   and `spectrumIntegerLocalization E S=E∧S^(-1)S`, with actual unit,
   functorial telescope and localization universal property. Prove
   π_n(S^(-1)E)=S^(-1)π_n E for every integer n, smashing/localization
   idempotence and compatible ring/module structures using G2.8's
   coherent commutative localization. For a prime p, the complement of
   (p) gives `spectrumPrimeLocalization E p=E_(p)` and
   π_n E_(p)=π_n E⊗Z_(p), without connectivity restrictions.
   Choose a degree-p sphere representative and its coherent powers;
   construct E/p^r as its derived multiplication cofiber, with the
   transition E/p^(r+1)→E/p^r induced by(p,id). Construct
   `spectrumDerivedPrimeCompletion E p=holim_(r≥1)E/p^r` using item8.
   Prove its map/unit, independence, idempotence and universal property
   among spectra with derived function spectrum F^R(S[1/p],E)≃0,
   equivalently contractible mapping spaces from every integer shift
   Σ^j S[1/p]. An unshifted mapping-space test alone is insufficient. Identify it
   with F^R(Σ^(−1)M(Z[1/p]/Z),E) by the actual Moore/telescope duality
   comparison. Prove the natural Hom/Ext exact sequence
   `0→Ext¹_Z(Z[1/p]/Z,π_nE)→π_n E^∧_p→
     Hom_Z(Z[1/p]/Z,π_(n−1)E)→0`, via a countable free presentation
   and its Moore cofibre, and compare it with the cofiber/tower Milnor
   sequence. For degreewise finitely generated π_*E prove
   π_n E^∧_p=π_n E⊗Z_p; no such tensor formula is claimed for arbitrary
   homotopy groups. Construct the completed monoidal/module/ring
   comparisons through the derived completed smash
   `(E^∧_p∧F^∧_p)^∧_p`; an ordinary smash of complete spectra need
   not be complete. Do not assign a commutative ring structure to every
   multiplication cofiber E/p^r. For the bounded-below, degreewise finite
   type spectra used by HF_p Adams, prove comparison of derived prime
   completion with the actual HF_p nilpotent/Adams completion and its
   convergence hypotheses. These two completions are not identified
   without hypotheses on general unbounded spectra. Degreewise finite
   generation plus these comparisons supply the localized/completed
   arithmetic descent used by TB, rather than undefined E_(p) notation.
10. **Unstable skeletal mapping-space continuity.** For a CW pair(X,A)
   with arbitrary cell sets/dimension, use its actual increasing skeletal
   cofibrations and convenient mapping spaces into a supplied Y. Prove
   `Map(X,Y)≃holim_m Map(X^m,Y)` and its based/relative versions,
   constructing restriction-fibration replacements from the homotopy
   extension property and G2.10's mapping-path carriers. The same
   statement holds with a specified fixed restriction on A; use the
   relative skeleta A∪(relative cells of dimension≤m) for that branch.
   Construct the pointed-set π0 Milnor sequence, proving surjectivity
   onto compatible component families. Over a chosen coherent reference
   family, identify the fibre by the nonabelian lim¹ of the groups
   π1 Map(X^m,Y) in those components: it is the orbit set of
   `(g_m)·(h_m)=(g_m h_m r_m(g_(m+1))^(-1))` on their product.
   Prove choice/conjugation/naturality comparisons, and the positive
   mapping-homotopy-group Milnor sequences with the actual higher
   loops and connecting maps. When the tower groups are abelian,
   identify this orbit set with AT6.0's existing coker(1−shift); do
   not replace a nonabelian component problem by an additive lim¹.
   Finite-source stabilization formulas and all-CW lift classification
   use these unstable maps; the spectral/cohomological Milnor sequences
   alone do not supply them. This sublane uses only the earlier
   convenient-space/CW foundations, before Brown or stable Spin data.

## G4. Generalized Leray–Hirsch, Thom and Euler theory

0. **Quaternionic bundle and manifold adapters.** The topological block
   G4.0a and the smooth finite-dimensional block G4.0b below are separate
   exports; spectral/classifier consumers need only G4.0a. G4.0a: Use native `Quaternion ℝ` with
   continuous multiplication/conjugation and its Euclidean norm. Fibres are
   finite-dimensional **right** ℍ-modules, expressed as left modules over
   `(Quaternion ℝ)ᵐᵒᵖ`; transition maps commute with the right action. Use
   native real VectorBundle ℝ total spaces and local trivializations, with
   fibrewise Module ℍᵐᵒᵖ structure and trivializations linear for that action.
   Native VectorBundle requires a commutative normed field, so it is not
   instantiated with ℍᵐᵒᵖ. Use the corresponding principal Sp(r)-associated
   bundle comparison. Use native Projectivization ℍᵐᵒᵖ for right lines and
   consume AT4.6's generic division-ring quotient topology and add only
   the quaternionic charts/CW and the pinned Grassmannian homeomorphism. Define the Hermitian form
   `h(v,w)=Σ_i conjugate(v_i) w_i`, right-linear in w, and construct numerable
   bundle metrics by real partitions of unity. The compact group Sp(r) is the
   native `unitary (Matrix (Fin r) (Fin r) (Quaternion ℝ))`, with both inverse
   equations and the subspace topology. Prove it closed and prove the
   entrywise bound ‖gᵢⱼ‖≤1 from g* g=1; boundedness in the finite
   product norm selected by Matrix.Norms.Elementwise and
   finite-dimensional real compactness then give compactness. Its Lie charts are
   the separate G4.0b target below.
   Construct the first-column fibration Sp(r−1)→Sp(r)→S^(4r−1),
   prove Sp(r) connected and simply connected for r≥1, and use covering
   lifting/uniqueness to construct the Spin homomorphism below. For G2.9's
   low-dimensional compact Spin comparisons consume native
   TauCeti.realSpinThreeEquivQuaternionUnitary and its actual quaternion
   conjugation action theorem, and
   TauCeti.realSpinFourEquivQuaternionUnitaryProd. Consume
   SpinRepresentations L7's Spin(3) continuity/sphere comparison; prove the
   Spin(4) map and inverse continuous using its finite Clifford algebra
   maps and compact-to-Hausdorff comparison. Construct the calibrated
   ℝ⁴≃ℍ isometry carrying the coordinate basis to (1,i,j,k), determine
   the native factor order by its generator formulas and prove the resulting
   rightHom vector action is v↦q_L v q_R^−1. Pin the full adapter: if
   (n₁,n₂) is the native product and u=(1+j)/√2, set
   (q_L,q_R)=(u n₂ u^−1,u^−1 n₁ u). This includes inner conjugations
   as well as swapping the factors. Prove it intertwines the native odd/even
   Clifford multiplication and vector projection, testing all coordinate
   generator pairs; a factor swap alone fails already on ι(e₀)ι(e₁).
   Compare the corresponding homomorphisms/homeomorphisms; those calibrated factors pin
   the G2.9 diagonal/addition/swap generators.
   Do not use the commutative-scalar
   `Matrix.unitaryGroup` alias or algebraic Sp(2r,ℝ).
   Build `quaternionicFrameBundle` and quaternionic Stiefel spaces. Define
   Gr_ℍ(r,N) as the subtype of native Submodule ℍᵐᵒᵖ (Fin N→ℍ)
   with native finrank ℍᵐᵒᵖ equal r, with the quotient topology induced
   by the span map from full-rank ordered right r-frames. Prove the actual
   GL_r(ℍ)-full-frame and Sp(r)-orthonormal-frame quotient comparisons
   by continuous quaternionic Gram–Schmidt; use native matrix units for
   GL_r(ℍ), not Module.Grassmannian's commutative-ring quotient-rank carrier.
   Construct these Grassmannians,
   local charts, tautological bundles, orthogonal complements, clutching,
   pullback, sum and their identity/composition laws. For a rank-r quaternionic
   subbundle E⊂B×ℍ^N construct the continuous finite-Grassmannian classifier
   b↦E_b and its actual tautological pullback isomorphism. Pull back the
   finitely many coordinate graph charts to obtain a finite trivializing
   cover of E; this finite-type conclusion imposes no finite-CW condition
   on B. Compare the real/complex versions with TopK T1's finite embedding
   and graph-chart interfaces. Prove the finite Stiefel
   connectivity bounds and the numerable fixed-rank classification over
   paracompact Hausdorff bases. Construct `quaternionicUniversalBundle r` on
   the fixed-rank final-topology Grassmannian, its Schubert CW structure and
   compactly generated colimit comparison, following TopK T1.5–6's real/complex
   construction. Compare its Sp(r) frame classifier with CC C1.1b's join carrier via
   G2.9's general-topological extension, before requiring a smooth Sp model.
   Define `quaternionicProjectiveSpace n := QuaternionProjective n`, the
   native Projectivization ℍᵐᵒᵖ (Fin (n+1)→ℍ) carrier with AT4.6's topology.
   Upgrade native Projectivization.equivSubmodule to the homeomorphism
   with Gr_ℍ(1,n+1) carrying [v] to span(v). G4.0b later transports
   the smooth graph-chart structure onto this single HP carrier; the
   present topological construction is independent of that upgrade. Use its same inclusion
   maps to define `quaternionicProjectiveInfinity`. Construct the
   characteristic maps giving one cell in dimensions 0,4,…,4n and each 4j
   at infinity, along with the actual tautological bundle and inclusions.
   Construct the topological block homeomorphism from Hermitian unit vectors
   Σ_i ‖v_i‖²=1 in ℍ^n to the native Euclidean unit sphere S^(4n−1),
   in ordered blocks (1,i,j,k). Pin the characteristic map on the round
   closed disk in ℍ^n by x↦[x,√(1−Σ_i‖x_i‖²)], with the nonnegative
   real coordinate last; its boundary is the Hopf quotient to HP^(n−1).
   Compose with AT2.5's supBallEuclideanDiskHomeomorph orientation-preserving radial
   homeomorphism to type these characteristic/attaching maps on native
   RelCWComplex cells. For n=1 construct the actual characteristic
   quotient homeomorphism χ:D4/∂D4≃HP1 induced by that characteristic map.
   With q_AT:D4/∂D4≃S4 the actual AT4.4
   `diskQuotientSphereHomeomorph`, define the based homeomorphism
   `quaternionicHopfSphereHomeomorph := χ∘q_AT⁻¹ : S4≃HP1`.
   Prove it sends AT's positive sphere reference class to the positive
   (1,i,j,k) characteristic-cell class. Own the radial homeomorphism
   `quaternionDiskQuotientOnePointHomeomorph : D4/∂D4≃ℍ⁺`,
   x↦x/√(1−‖x‖²) on the disk interior and boundary↦∞, with inverse
   y↦y/√(1+‖y‖²). Prove continuity at∞, quotient/inverse laws and
   its degree+1 comparison in the ordered (1,i,j,k) coordinates.
   Here D4/∂D4 is AT's actual
   `ordinaryPairQuotient (TopCat.disk 4) (diskBoundarySubset 4)`,
   with the disk identified through the ordered ℍ≃ℝ4 isometry.
   Construct `quaternionicAffineOnePointHomeomorph : ℍ⁺≃HP1`,
   y↦[y:1], ∞↦[1:0], with inverse [v0:v1]↦v0*v1⁻¹ when v1≠0.
   Follow native `OnePoint.equivProjectivization` at ℍᵐᵒᵖ, transported
   by coordinate unop to the same right-H carrier, and upgrade its
   equivalence using AT4.6's quotient topology. Prove right-scalar
   normalization, continuity and the exact equation
   χ=`quaternionicAffineOnePointHomeomorph`∘
   `quaternionDiskQuotientOnePointHomeomorph`, including the collapsed
   point. This owns the positive HP1 affine-chart orientation comparison.
   Consume AT4.4's disk-quotient sphere adapter. Also consume native
   `onePointHyperplaneHomeoUnitSphere` from
   Mathlib.Topology.Compactification.OnePoint.Sphere with fixed unit
   normal e0 in ℝ5 and the ordered quaternion-to-e0-perpendicular
   linear-coordinate equivalence. Its finite chart at0 lands at−e0;
   its derivative there is the identity onto e0⊥, so the outward-first
   sphere orientation gives degree−1. Prove this signed reference-class
   comparison and construct the actual based transition homeomorphism
   between this stereographic route and q_AT. The stereographic route
   does not define `quaternionicHopfSphereHomeomorph`. The generic native
   `onePointEquivSphereOfFinrankEq` exists but its arbitrary coordinate
   choices alone do not calibrate this sign. No G4.0b smooth
   chart or Riemannian metric enters this topological comparison.
   Restrict scalars via native `Quaternion.ofComplex`, with i mapped to the
   chosen quaternion i, and via ℝ: rank r becomes complex rank 2r and real
   rank 4r. Prove coherent sum, metric, transition and Thom comparisons,
   the canonical standard real orientation using repeated ordered blocks
   (1,i,j,k). Name quaternionSpToSODirect for that direct real map;
   name quaternionSpToUComplex and its real composite quaternionSpToSOComplex
   for the right-complex basis (1,j), hence real coordinates (1,i,j,−k).
   Prove SOComplex=F_r SODirect F_r^−1 with
   F_r=diag(1,1,1,−1)^r, retaining the corresponding Spin-cover lift adapters. Consume native
   CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom
   for nonzero rank with native
   CliffordAlgebra.instCompactSpaceRealCliffordSpinGroupZero supplying its
   CompactSpace hypothesis, and SpinGeometry G4.1's frame/negative-form comparisons. For right complex restriction, use the
   complex basis (1,j) on each quaternionic block; its real basis is
   (1,i,j,−k), so the complex orientation differs by (−1)^r. Carry this
   factor into the Thom/characteristic and suspension-coordinate maps.
   Construct the Sp(r)→Spin(4r) lift using SpinGeometry G4.1's native-cover
   frame/negative-form adapters, with unit, block-sum,
   stabilization and permutation compatibility. Group-complete direct sum of
   quaternionic bundles on finite CW/compact CW-type pairs and construct
   relative/clutching groups for G5's KSp comparison; scalar forgetting gives
   the actual additive natural maps to TopK's K/KO groups. No quaternionic
   tensor product is asserted to supply a commutative unital bundle K-ring.
   This substrate uses the ordinary bundle/CW suppliers and precedes G4's
   generalized orientation proofs and G5's Thom models.


   G4.0b: construct smooth real manifold structures on the same finite
   carriers. Choose the actual complement and identity slice chart supplied by
   TauCeti.Lie.exists_isSliceChart_of_isClosed_subgroup, applied to
   isClosed_unitarySubgroup_units. Construct the named embedded-Lie data
   with Subgroup.chartedSpaceOfIsSliceChart and its native Lie-group,
   smooth-inclusion and immersion theorems. Retain this chart construction
   definitionally: native
   Subgroup.contMDiff_iff_comp_subtypeVal_chartedSpaceOfIsSliceChart
   then checks smooth maps into this chosen operator-topology subgroup
   by their ambient composite. Transport this criterion to the exported
   default-topology carrier as specified below. Its named model is
   (lieSubalgebraOfSubgroup (unitarySubgroup (Matrix … ℍ)ˣ)).toSubmodule,
   identified ℝ-linearly with skewAdjoint.submodule ℝ (Matrix … ℍ)
   by restricting native unitsLieAlgebraLieEquiv, using
   unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_skewAdjoint
   and EmbeddedLieSubgroupData.lieEquivLieSubalgebraOfSubgroup.
   The bare skewAdjoint AddSubgroup is not the real model submodule.
   Do not use the model-hidden IsEmbeddedLieSubgroup existence proposition
   as this data, or rebuild the generic closed-subgroup theorem. Consume
   SmoothBundlesConnections B1.4's proper free-action smooth G/H and
   principal-bundle/submersion theorem. The ambient group for Sp(N) is
   the native units of Matrix (Fin N) (Fin N) ℍ. Select local native
   Matrix.linftyOpNormedRing, Matrix.linftyOpNormedAlgebra,
   Matrix.linftyOpTopologicalSpace and Matrix.linftyOpContinuousStar
   instances. Prove the identity homeomorphism and norm equivalence with
   G4.0a's default entrywise matrix topology and the finite product norm
   selected by Matrix.Norms.Elementwise;
   use the explicit real block-coordinate linear equivalence to compare with
   the fixed Euclidean norm. No native quaternionic L² matrix operator norm
   is assumed; do not introduce a transported normed-ring topology or instantiate
   commutative-scalar Matrix.GeneralLinearGroup with ℍ. Pin the subgroup
   of units to unitarySubgroup (Matrix … ℍ)ˣ and transport its embedded
   Lie data to the native unitary (Matrix … ℍ) carrier through
   Unitary.toUnits and its actual inverse, with their smooth/topological
   comparisons. Compare Sp(N)'s charts with its G4.0a subspace topology.
   Identify the skew-Hermitian Lie model with real dimension N(2N+1)
   by ordering the diagonal entries in increasing index, each with
   coordinates (i,j,k), then the strict-upper pairs in lexicographic order,
   each with coordinates (1,i,j,k). Transport through those fixed
   coordinates to EuclideanSpace ℝ (Fin (N*(2N+1))). The exported
   ChartedSpace/IsManifold/LieGroup instances on QuaternionFrameGroup N
   use G4.0a's default subspace topology and this Euclidean model, by the
   explicit identity homeomorphism and model linear/homeomorphic comparison;
   they are not exported with hidden local operator-norm topology arguments.
   Export quaternionFrameGroup_contMDiff_iff: a map f:M→QuaternionFrameGroup N
   is smooth for this designated Euclidean model exactly when its actual
   ambient real-coordinate map is smooth. Use the fixed ambient
   EuclideanSpace ℝ (Fin N × Fin N × Fin 4), indexed lexicographically
   by row, column, then (re,imI,imJ,imK); it has dimension 4N².
   Derive the iff from the native chosen-slice theorem through Unitary.toUnits,
   the identity homeomorphism, norm equivalence and fixed model changes.
   Gram–Schmidt sections, block embeddings, the Sp(1) diffeomorphism and
   B1.4 quotient assembly consume this exported criterion, without requiring
   an operator-norm instance in their statements.
   For 0≤r≤N,
   identify orthonormal r-frames with Sp(N)/Sp(N−r), of dimension
   r(4N−2r+1), and right r-planes with Sp(N)/(Sp(r)×Sp(N−r)),
   of dimension 4r(N−r). Prove these finite carriers compact Hausdorff,
   second-countable and boundaryless. Construct Grassmannian graph charts in
   Hom_ℍ(V,V^⊥), identified through chosen orthonormal bases with the fixed
   real model EuclideanSpace ℝ (Fin (4r(N−r))); quaternionic Gram–Schmidt
   gives local Stiefel charts
   over each graph chart with Sp(r) fibre. Prove smooth real transitions
   and compare these structures with B1.4's quotient charts/submersions
   and G4.0a's full-rank/orthonormal-frame quotient topologies.
   Prove tautological and orthogonal-complement bundles smooth, orthogonal
   complementation a diffeomorphism Gr_ℍ(r,N)≃Gr_ℍ(N−r,N), and
   stabilization/direct-sum maps smooth. Own the smooth graph-chart upgrades
   on TopK T1.5's existing finite real/complex Grassmannian carriers, of real
   dimensions r(N−r) and 2r(N−r), comparing their existing topologies,
   including smooth orthogonal-complement diffeomorphisms and stabilization/
   sum maps on those carriers;
   reuse their bundles/classifiers. In rank one prove the diffeomorphisms
   to AT4.6's existing native RP and ComplexKahlerGeometry K7.1's native CP
   manifold structures. Own projectiveRealGrassHomeomorph and
   projectiveComplexGrassHomeomorph from native Projectivization 𝕜
   (Fin (n+1)→𝕜) to TopK T1.5's finiteGrassmannian 𝕜 1 (n+1).
   Pin their underlying equivalences directly to native equivSubmodule:
   TopK's finiteGrassmannian is this same finrank-submodule subtype.
   Pin their topologies
   to the nonzero-vector and full-frame-span quotients, before proving
   the rank-one diffeomorphisms. For the complex comparison own
   projectiveComplexRealModelComparison: consume K1's real restriction of
   K7.1's same designated projective ChartedSpace/IsManifold structure and
   its existing atlas comparison. Own only the model transport from
   Fin n→ℂ to EuclideanSpace ℝ (Fin (2*n)), ordered in interleaved
   blocks (Re z₀,Im z₀,Re z₁,Im z₁,…), matching (1,i) and K1's
   complex orientation. Prove its real smooth maps agree with the supplied
   real atlas through this linear homeomorphism. The rank-one diffeomorphism
   and TopK T6.6 use this same model transport on that real structure;
   no second projective manifold is defined. This supplies the named smooth targets
   for scalar-forgetting Gr_ℍ(r,N)→Gr_ℂ(2r,2N)→Gr_ℝ(4r,4N).
   This composite uses real coordinates (1,i,j,−k); name direct real
   forgetting using (1,i,j,k) separately and prove its comparison by
   diag(1,1,1,−1)^N on the ambient real space, carrying the (−1)^r
   fibre-orientation adapter into its Thom maps.
   Put the smooth real 4n-manifold structure on the designated native
   quaternionicProjectiveSpace n through its pinned rank-one homeomorphism, including
   the n=0 point and smooth tautological bundle. Pin a diffeomorphism from
   its rank-one Stiefel carrier to the native unit sphere in
   EuclideanSpace ℝ (Fin (4n+4)), with repeated blocks (1,i,j,k), and
   construct the smooth Hopf quotient S^(4n+3)→HP^n as the Sp(1)
   quotient submersion. Pin the acting Sp(1) to QuaternionFrameGroup 1,
   and compare it by the 1×1-entry group homeomorphism/diffeomorphism with
   unitary ℍ used in the native Spin comparisons. For HP use the last
   coordinate line: embed Sp(n)×Sp(1) in that ordered block decomposition
   and pin the cyclic coordinate permutation comparing it to the general
   first-r-plane Gr convention. Prove the Sp(n+1)/(Sp(n)×Sp(1))
   diffeomorphism and its agreement with G4.0a's actual attaching maps.
   Construct HP^1≃S⁴ as a diffeomorphism using the two affine charts,
   pinning its positive reference class by the (1,i,j,k) chart; compare
   AT's RP¹≃S¹ and K7's CP¹≃S² sphere adapters for the same exercise.
   These targets require no Riemannian metric. RiemannianGeometry R1
   consumes these carriers/submersions for normalized round Hopf quotient
   metrics, O'Neill and curvature/comparison theorems; DGFloer consumes
   the same HP carrier rather than constructing another one.

1. **Relative Leray–Hirsch.** For a numerable locally trivial bundle of CW-type
   pairs `(F,F₀)→(V,V₀)→B`, a chosen finite homogeneous free basis of
   `E*(F,F₀)` over E*(*) and classes u_i in `E^{d_i}(V,V₀)` restricting to
   that basis on every fibre, prove the graded module isomorphism
   `⊕_i E^{q−d_i}(B) → E^q(V,V₀)`,
   `(a_i)↦Σ π*a_i∪u_i` for every integer q.
   Construct its inverse and naturality under pullback, pair maps, change of
   basis and maps of theories. Prove the trivial-product step, compatibility
   of comparison maps with MV/connecting maps, finite-CW induction and
   arbitrary-CW wedge/skeletal/Milnor passage. Prove the numerable-cover
   gluing/CW-replacement extension and the countable-open-exhaustion route:
   G3.5's Dold refinement and the disjoint-union axiom supply a countable
   numerable exhaustion by finite unions of disjoint trivializing pieces.
   This argument does not require finite-CW models for those pieces. The relative F₀ is retained
   throughout; freeness or a finite basis is not inferred from numerability.
2. **Thom spaces and their comparisons.** Use CharacteristicClasses C2.1's
   disc/sphere quotient of the native bundle total space, with TopologicalKTheory
   supplying its metric finite-bundle data. Prove the comparison with TopK T5's
   compact-support/Koszul model, using that one quotient carrier; prove its convenient/simplicial cofiber adapter,
   `D(ξ)/S(ξ)` versus deleted-vector relative theory, and
   `Th(ε^r⊕ξ)≃S^r∧Th ξ=Σ^rTh ξ`. Include the zero-rank convention `Th(0_B)=B₊`.
   For compact Hausdorff B prove the bundle-total-space one-point
   compactification comparison; for noncompact B keep the disc/sphere quotient
   and distinguish support conditions. External bundles satisfy
   `Th(ξ⊠η)≃Th ξ∧Th η` with natural/coherent product maps.
3. **Orientation data and Thom isomorphism.** For a rank-r real bundle ξ an
   E-orientation is a chosen `U∈E^r(Dξ,Sξ)` whose restriction to each fibre,
   after a chosen local trivialization, is a unit in E⁰(*). State the local
   transition compatibility and the relevant orientation local system; an
   untwisted orientation is not automatic for arbitrary real bundles.
   Prove `a↦π*a∪U` is an isomorphism
   `E^q(B)→E^(q+r)(Dξ,Sξ)` for numerable CW-type bundles, in every q.
   Prove pullback, suspension, direct-sum/external multiplicativity for compatible
   orientation choices, change by units and comparison with ordinary Thom.
   Integral ordinary HZ-orientability agrees with ordinary real orientability;
   mod-2 ordinary orientation is canonical for all real bundles. For an
   E-module spectrum M, prove the cohomological and homological module Thom
   isomorphisms using the action by this E-Thom class, including cap/zero-section
   compatibility. M need not have its own unital ring structure; this is the
   interpretation used for the shifted KO-module KSp.
4. **Euler and relative-square identities.** Define e_U(ξ) by zero-section
   pullback of U, prove naturality, direct-sum multiplication, trivial-positive-
   rank vanishing and the nonzero-section consequence. Prove
   `U∪U=π*e_U(ξ)∪U` in `E^(2r)(Dξ,Sξ)` and state the zero-section and
   diagonal maps producing it. Changing U changes e accordingly. Do not
   infer that Euler vanishing alone always produces a section; ordinary
   primary obstruction hypotheses remain in CharacteristicClasses.
5. **R/C/H orientations.** Define real/complex/quaternionic orientation
   data for E to be a chosen reduced class on RP∞/CP∞/HP∞ of degree 1/2/4
   restricting to the suspension of the unit on KP¹=S¹/S²/S⁴. These data
   are hypotheses when proving orientation-dependent results; their existence
   or obstruction for each canonical theory is proved in G5.5. Use CC C1.5's RP∞/CP∞ universal line models
   and G4.0's `quaternionicProjectiveInfinity` model. Orient CP¹ by
   ℂ⁺ via (x,y)↦x+iy and HP¹ by ℍ⁺ with ordered real basis (1,i,j,k).
   For HP¹ transport the positive S4 reference class through G4.0a's
   actual `quaternionicHopfSphereHomeomorph = χ∘q_AT⁻¹`; its separate
   stereographic route has degree−1 and is not this orientation adapter.
   Prove the correspondence with normalized,
   natural coherent Thom classes for real/complex/quaternionic bundles,
   including line Thom identification, finite projective filtration, splitting
   and passage to infinite bases. Specify the tautological-versus-dual sign by
   the ordinary comparison: with γ the complex tautological line, the HZ Euler
   class restricts to − the positively oriented generator on CP¹; a chosen
   generalized normalized complex class is x_E=e_E(γ*)=e_E(O(1)); it is
   not asserted equal to −e_E(γ). In the ordinary HZ comparison explicitly
   identify x_G^HZ=−x_CC=h_AT, where CC C1.5's x_CC=c₁(γ) pairs to −1
   and AT's projectiveEMComparisons pins h_AT to pair+1.
   For a quaternionic Thom family normalized against the standard real
   (1,i,j,k) trivializations, pin for every E
   x_H^E=−e_E^std(γ_H)=−e_E^std(γ_H*)=e_E^c(γ_H), where U^c=(−1)^r U^std
   is normalized against the right-complex-induced coordinates. Here c
   denotes this coordinate normalization, not an assumed complex orientation
   of E. The
   transported right-H Riesz isomorphism γ_H≃γ_H* preserves the standard
   module orientation; duality alone does not change its Euler sign.
   The graph identification has degree−1 against U^std and degree+1
   against U^c, so for the MSp sphere-unit convention below the normalized
   projective class is graph*U^can(γ_H*). Include these signs in the
   normalized-Thom-family uniqueness comparison.
   The formal inverse relation for generalized Euler classes belongs to
   BordismFormalGroups. Prove the projective-bundle theorem for a rank-r
   K-bundle V, d=1/2/4 and supplied normalized K-orientation:
   E*(P(V)) is a free E*(B)-module on 1,x,…,x^(r−1), where x restricts
   to the chosen universal projective class. Define the coefficients a_i(V)
   by the monic relation Σ_(i=0)^r(−1)^i π*a_i(V)x^(r−i)=0, a₀=1;
   prove a_i=0 for i>r, naturality, splitting injection and Whitney sum.
   Pin their line convention a₁(L)=x_L. For quaternionic V with the chosen
   coherent standard Thom family prove e_E^std(V)=(−1)^r a_r(V) and
   e_E^c(V)=a_r(V), by the splitting injection and Euler multiplicativity;
   these use that same family and do not require E complex-orientable.
   In the complex case x_L=e_E(L*),
   so these are the dual-normalized Chern classes a_i(V)=c_i^E(V*).
   The ordinary comparison is a_i^HZ(V)=(−1)^i c_i^CC(V); standard
   generalized c₁^E(L)=e_E(L), while c₁^E(γ*)=x and c₁^E(γ) is its
   formal inverse, not x. Give the real/quaternionic dual transport and
   characteristic-class comparison using G4.0's fixed right-module signs.
   Prove E*(KP^n)=E*[x]/(x^(n+1)) with |x|=d. For KP∞ prove the
   skeletal maps are surjective, lim¹ vanishes and the completed grading is
   E^q(KP∞)≃∏_(j≥0)E^(q−dj)(*)x^j, with its continuous multiplication.
   This explicit completion calculation is here; formal laws/universality
   remain in BordismFormalGroups. Use the flag/projective splitting injection
   to prove uniqueness of normalized natural Thom families with the supplied
   projective class and Whitney coherence and the Euler
   coefficient comparisons; no uniqueness follows from fibre normalization
   alone without that comparison.
   For K=ℝ,ℂ,ℍ construct the graph homeomorphism from KP^n minus a
   chosen point to the total space of the dual tautological line over
   KP^(n−1). Pin the graph map: a line through (v,z), with v≠0, determines
   L=vK and the K-linear map f:L→K, f(vq)=zq. For right quaternionic L,
   Hom_ℍ(L,ℍ) is a left module by target multiplication; its right-module
   transport is f·q=conjugate(q)f. Retain this transport in every bundle
   and Thom map, rather than treating the left dual as a right module.
   Use a metric
   to compare the appropriate underlying real dual and tautological bundles,
   recording when this comparison is conjugate-linear and its orientation
   sign. The complex-oriented Thom identification uses O(1)=γ*, and its
   fibre generator is the chosen complex-oriented CP¹ generator. Construct
   the finite KP^n/line-Thom comparison, its stabilization
   maps and the infinite-base homotopy equivalence by the actual CW filtration;
   the compact-base compactification proof cannot be reused at infinite base.
   Prove the associated generalized characteristic classes, sum/naturality/
   line-normalization laws and quaternionic real/complex comparison factors.
   In ordinary integral cohomology, with Cξ the right-complex restriction
   and Rξ the ordered real bundle, prove c_(2j+1)(Cξ)=0,
   e(Rξ)=(−1)^r c_(2r)(Cξ). Pin x_H^HZ=−e(γ_H)=c₂(Cγ_H)=h
   for the positive HP¹ chart; the right-dual/Riesz graph comparison carries
   the fibre conjugation sign. Prove a_i^HZ(ξ)=c_(2i)(Cξ),
   p_i(Rξ)=(−1)^i Σ_(j=0)^i a_j(ξ)a_(i−j)(ξ), a₀=1,
   and w_(4i)(Rξ)=ρ₂a_i(ξ), with all other SW degrees zero.
   In particular p₁(Rξ)=−2c₂(Cξ).
   In quaternionic rank1 this is p₁=2e for the specified right-module
   orientation; translate sources using the complex-induced real orientation.
   Compute the ordinary integral universal quaternionic rings on G4.0a's
   **same** fixed-rank classifier BSp(r):
   `H*(BSp(r);Z)=Z[a_1,…,a_r]`, |a_i|=4i and
   `a_i=c_(2i)(Cγ_r)`. Give generator/restriction/Whitney maps and the
   literal comparison with CC C1's Sp(r) frame join classifier. Prove
   torsion-freeness and the polynomial presentation through the existing
   quaternionic Schubert cells and the universal sphere fibration
   `S^(4r−1)→BSp(r−1)→BSp(r)` for r≥1. Identify its total space
   with the actual associated sphere bundle S(γ_r), via G4.0a's
   first-column Sp(r−1) stabilizer fibration and universal frame/join
   comparison, retaining the bundle map to BSp(r) and ordinary
   Euler/Gysin sequence. The ordered real orientation gives
   `e^std(γ_r)=(−1)^r a_r`; prove its regularity and the graded Gysin
   induction, including r=0 with Euler1 and BSp(0)=point. Do not infer
   the ring from cellular ranks alone. Export `bspCohomologyIntegral` and
   `bspTorusRestrictionChern` on these chosen carriers. For the standard
   block subgroup Sp(1)^r and its complex-circle torus, with x_j the native
   standard-character c1, prove
   `a_i↦(−1)^i elementarySymmetric_i(x_1²,…,x_r²)` and restriction
   injective over Z and after arbitrary coefficient base change using the
   proved torsion-free cohomology/UCT comparisons. Each quaternionic
   complex restriction has weights x_j,−x_j. Prove the stable ring
   `H*(BSp;Z)=Z[a_1,a_2,…]` via the designated inclusions and
   eventual-degree/Milnor comparison. The stable torus restriction lands
   in the **degreewise inverse limit** of H*(BT^r;Z), with x_(r+1)↦0;
   a_1 restricts to the compatible sums −Σ_(j≤r)x_j², not to a
   finite-support polynomial in infinitely many degree2 variables.
   Compare HP∞=BSp(1), a_1=h and the ordinary real/symplectic classes
   already fixed above. This ordinary-ring sublane uses only the earlier
   classifier/CW, ordinary Thom/Gysin and Chern APIs; no bordism coefficient,
   odd-primary operation or formal-group universality calculation enters it.
   Do not impose these ordinary Chern/Pontryagin identities on general E.
   If E also has a chosen complex orientation, its complex roots of a
   quaternionic line are t and [−1]_F(t), rather
   than t and −t; the actual inverse-law consequences belong to
   BordismFormalGroups. For a quaternionic Thom orientation specifically
   induced from complex right restriction with the (−1)^r normalization,
   prove the corresponding top-Euler identity against that chosen E-class.
   The power-series tensor Euler laws and coefficient universality belong to
   BordismFormalGroups; a chosen orientation is not its universal coefficient
   theorem or an unspecified equivalence of categories.

## G5. Finite duality, Thom spectra and rational Hurewicz

0. **Stable Spin classifier, before Thom/ABS.** Construct
   `stableBSpin` as the actual compactly generated mapping telescope of
   G2.9's designated bar classifiers BSpin(n+3). Own the coordinate
   stabilization homomorphisms here: use the native quadratic isometry
   v↦(0,v), with the new coordinate first, and native spinGroupMap/
   CliffordAlgebra.map. Prove their continuity and compatibility with
   the corresponding SO block inclusions. Own the Spin block-sum
   homomorphism Spin(p)×Spin(q)→Spin(p+q), using the two native
   Clifford embeddings and commutation of their even images. Prove
   continuity, unit/composition/associativity and permutation coherence,
   with all associated-bundle identifications. Consume SpinGeometry G4.1's
   native covers, not a nonexistent stabilization export. Use that same
   product-preserving bar carrier for every finite rank, with its associated
   real rank-n universal bundle and comparison to CC C1's numerable join
   classifier; prove continuity and coherent stabilization of the maps and
   bundle isomorphisms. Prove these Lie groups well-pointed via actual
   unit-neighbourhood cofibrations, use item1 of GT's
   [smoothing-and-triangulation comparison](../GeometricTopology/README.md#the-smoothing-and-triangulation-comparison)
   for compact-manifold finite CW type for the finite Spin groups/products, and prove the
   proper bar realization has CW type via its degeneracy cofibrations and finite-product CW
   comparison. Supply compatible CW models/cellular approximations of
   the stabilization maps, preserving their bar comparisons and homotopies.
   Construct the telescope CW comparison, basepoint,
   cofinal-rank equivalences and finite-rank maps
   `spinClassifyingSpaceToStableBSpin`. Compose the finite native Spin→SO
   covers with TopologicalKTheory's sole stable BSO classifier/bundle
   comparison to construct `stableBSpinToBSO`. Its underlying rank-zero
   real class is the compatible diagram [γ_n]−[ε^n], not a purported
   finite-rank universal bundle on the telescope. Compare its stabilization
   with the same oriented BO model; do not build another BSO carrier.
   Prove the homotopy-cartesian finite-rank lift comparisons for n≥1
   and for the separate geometric μ2 rank0 branch, and the stable
   homotopy-fibre sequence Bμ2→stableBSpin→BSO, with the actual native
   double-cover classifying maps. At ranks1,2 include their distinct
   low-rank groups; native Spin(0) is trivial, while the geometric μ2
   rank0 structure branch has its separate map through positive-rank
   stabilization. Prove each branch's comparison rather than identifying
   these two rank0 groups.

   Export `stableSpinClassifierEquiv` on every CW base and CW pair:
   for a supplied stable oriented real classifier, the actual space of
   stable Spin lifts is its derived mapping-space fibre, with projection
   homotopies, relative boundary lifts and homotopies over that classifier.
   Prove agreement with stabilized principal Spin/frame data, pullback,
   isomorphism and stabilization; include the empty base and rank0.
   Construct the unit/block-sum maps and the compatible associativity,
   permutation homotopies from the stabilized Clifford/bundle constructions.
   Export the actual based telescope homotopy
   `stableBSpinToBSO_blockSum`:
   `stableBSpinToBSO∘μ_Spin ≃ μ_BSO∘(stableBSpinToBSO×stableBSpinToBSO)`,
   where μ_BSO is TopK T1.6c's designated
   `stableOrientedGrassmannianWhitneySum`. Build it from the specified
   finite-stage group/bundle comparisons together with their oriented
   stabilization and block-sum coherence homotopies on the two-index
   telescope, then its cofinal diagonal comparison. On the equal-rank k
   diagonal consume the proved finite restriction ε_k·Whitney,
   ε_k=(−1)^(k(k−1)/2), and retain that orientation in the actual
   tautological pullback and Spin/frame comparisons. The coordinate
   interleaving is i↦2i, j↦2j+1. Natural ordered frames for simultaneous
   prepend differ by (−1)^k; the normalized based-lift restrictions
   instead satisfy the strict oriented diagonal identity because
   ε_k ε_(k+1)(−1)^k=1. Consume TopK's actual finite rank/ambient
   squares and its comparison with the natural stable Whitney class,
   including a fresh-trivial-line rotation for k≡2,3 mod4. This path
   changes the underlying plane and is not pointwise unit-relative at
   a finite stage. Retain the based stable normalization, orientation-
   preserving stabilized bundle comparisons and parameter-boundary
   law homotopies.
   Apply their closed-CW homotopy-extension rectification and paired-
   tower/product comparison, retaining unit-relative endpoints and
   associativity/commutativity comparison prisms. The resulting based
   telescope homotopy is actual data; finite-stage agreement without
   these coherences does not rule out phantom errors.
   Prove agreement with the finite-rank
   structure operations before applying any characteristic class.
   For arbitrary CW X use actual coherent skeletal finite-rank models
   and G3.10's unstable mapping-space/Milnor comparison, including the
   appropriate component and lim1 term.
   Only for finite X identify maps into stableBSpin with the cofinal
   finite-rank colimit of [X,BSpin(n)]; a general all-CW classification
   is not obtained by this finite-source formula.
   Prove `stableBSpin_isThreeConnected` from the finite cover/LES and
   stabilization connectivity, beginning with Spin3's quaternion sphere
   and the actual lower-rank sphere fibrations. This construction and
   classification sublane uses G2.9/G3/CC finite classifiers/Spin finite
   covers/TopK's stable bundle comparison, before G5's Thom spectra, ABS,
   TB coefficient calculations and String data.

   As a separate inverse/coherence supplement, consume TopK T7.0's
   `stableOrientedGrassmannianInverse` and its left/right block-sum
   nullhomotopies. That supplier uses the based shear
   (x,y)↦(x,μ(x,y)) on AT4.5's k-CW product: its map on positive
   homotopy groups is (a,b)↦(a,a+b), and full CW Whitehead with the
   pointed upgrade supplies an actual based homotopy inverse.
   Projecting that inverse at (x,*) constructs the BO inverse and its
   cancellation homotopies; the BSO map is its based covering lift.
   These maps are constructed before any coefficient or Bott-table
   calculation. Lift its composition with
   stableBSpinToBSO using CC's actual Spin obstruction and
   stableSpinClassifierEquiv: `w2(−ξ)=w2(ξ)+w1(ξ)^2`, so it vanishes
   for this oriented Spin class. Fix the unit lift. Prove the based lift
   space contractible on the3-connected universal source. Derive BSO's
   based inverse-of-sum homotopy from TopK's left/right cancellation
   and Whitney associativity/commutativity homotopies. Compose it with
   `stableBSpinToBSO_blockSum`, and lift on the finite powers BSpin^r
   with the unit fixed. Export the resulting unit, left/right
   cancellation, double-inverse, inverse-of-sum and naturality homotopies,
   with their compatible comparison prisms from the coherent stage
   diagrams. These based lift spaces on3-connected finite powers control
   lift choices; they do not supply a missing BSO homotopy. Unbased
   lift spaces retain their automorphisms. No finite-rank complement
   over infinite BSpin is presumed. Constructor,
   classification and3-connectivity above precede this inverse
   supplement and remain independent of it.

   As a separate low-homotopy supplement, consume the independent real
   Bott/stable-O loop-chain theorem of HomotopySpheres PR284 §4B via
   TopK's exact stable bundle comparison. Export
   `stableBSpin_homotopyGroupsThroughEight`: π1,π2,π3,π5,π6,π7 vanish,
   π4≅Z and π8≅Z, with actual basepoints and stabilization maps. Pin
   π4's generator by the Spin lift of G4.0a's quaternionic Hopf line
   on its cell-characteristic/compactification HP1 carrier. Consume
   G4.0a's actual characteristic-quotient/sphere homeomorphism and
   G4.5's positive (1,i,j,k) orientation convention;
   this uses no G4.0b smooth HP diffeomorphism. Retain the actual
   tautological clutching map, calibrated Spin lift, CW/classifier
   comparisons and stabilization. Define h_S4:S4→HP1 to be the actual
   `quaternionicHopfSphereHomeomorph`, and define χ_H:HP1→stableBSpin
   from that Hopf-line Spin lift. The π4 generator is the based class
   of χ_H∘h_S4. Export `stableBSpin_hopfGenerator_cTwo` as the correctly
   typed equation `⟨c2(Cγ_H),(h_S4)_*[S4]⟩=+1` in H4(HP1;Z),
   with c2(Cγ_H) in H^4(HP1;Z), on these fixed carriers and orientations.
   Its sign is available to StringOrientation when it proves λ=−c2;
   this supplement neither defines λ nor presumes String's connected
   cover theorem. It precedes those String calculations and does not
   use MSpin/ko coefficient or ABS conclusions as a Bott proof.

1. **Finite spectra and Spanier–Whitehead duality.** Finite cell spectra are
   generated from integer suspensions of S by finitely many cofiber attachments;
   finite spectra include retracts. Construct `DP=Fᴿ(P,S)`, evaluation and
   coevaluation with both triangle identities. Prove finite spectra dualizable,
   biduality, duality of smash and suspension, natural reversal of maps and
   exact triangles. Prove `DP∧ᴸE ≃ Fᴿ(P,E)` for finite P and every spectrum E,
   without imposing connectivity on E. Derive
   `E^q(P)≃E_(−q)(DP)`, including product/pairing compatibilities.
   Prove the equivalence of finite-retract, compact and dualizable descriptions
   in the stable category. Infinite suspension spectra do not acquire duality
   merely from the existence of a function spectrum.
2. **Geometric duality adapter.** Obtain a smooth Euclidean embedding for a
   compact boundaryless smooth M from Mathlib's actual embedding theorem and
   its dimension/separation hypotheses. Use GeometricTopology's general normal
   bundle and tube, and construct the unframed collapse `S^N→Th ν` here by
   collapsing the tube complement. Prove continuity at infinity and compare
   two embeddings after stabilization via the isotopy/normal-bundle comparison.
   Construct the stable normal Thom object and the coevaluation/evaluation proving
   `DΣ∞M₊ ≃ Σ^(−N)Σ∞Th ν`. Prove independence of embedding, stabilization
   and metric, and compatibility with generalized Thom orientations and
   cap/fundamental-class duality. Do not substitute a stably trivial tangent
   framing for arbitrary ν. GeometricTopology supplies the general normal
   bundle, tube and transversality APIs; this milestone owns the unframed
   Thom collapse and stabilized embedding/normal comparison for duality.
3. **Thom spectra from diagrams.** Define the category of compatible
   numerable bundle diagrams: its objects carry actual rank-r_i bundles ξ_i over CW-type B_i with specified
   stabilization pullback isomorphisms and r_i increasing cofinally. Its
   morphisms carry base maps and compatible bundle isomorphisms; define
   identity/composition, homotopies, stabilization and cofinal reindexing.
   From a diagram form the prespectrum indexed by ranks r_i via actual
   suspension/Thom maps, and construct its prolongation to all integer
   levels: its stable object is the homotopy colimit of
   `Σ^(−r_i)Σ∞Th ξ_i` with those maps. Prove the cofinal-rank/prolongation
   comparisons with the ordinary sequential model rather than treating a
   rank jump as a single suspension. Require
   along each base map B_i→B_j, pullback ξ_j≅ε^(r_j−r_i)⊕ξ_i, with the trivial block on the left; compare
   the other order through the block-swap map and its orientation sign. Include
   arbitrary compatible maps of such diagrams, homotopies and cofinal reindexing.
   Transport it by G2's sequential/symmetric comparison into the chosen model
   and prove stable-type invariance, its finite-stage/stable-group formula and
   homology Thom comparison. A colimit of unrelated Thom spaces is not a Thom
   spectrum. For multiplicative models require a genuinely coherent
   symmetric bundle diagram with permutation actions and block-sum maps,
   rather than only multiplication on cohomology groups. Build its symmetric
   Thom ring spectrum directly and prove the module/ring diagrams on Thom
   spaces. Supply the comparison with the sequential additive model. A bare
   sequential multiplication up to homotopy retains G3's phantom ambiguity.
4. **Canonical examples and maps.** Construct S and HA as in G2. Construct
   MO, MSO, MU, MSpin and MSp as commutative symmetric Thom ring spectra
   from explicit universal structured-bundle models with their permutation
   and block-sum actions. Include the classical finite ambient Grassmannian
   models, their cofinal stabilized classifier comparison and all compatible Thom maps; transport
   across the real/complex/quaternionic suspension-coordinate comparisons
   with the positive-model monoidal/commutative-ring hypotheses from G2.
   Pin the coherent Grassmannian models in K^∞⊗_ℝ ℝ^n for K=ℝ,ℂ,ℍ,
   with Σ_n acting on the ℝ^n factor; block concatenation identifies the
   two ambient summands with K^∞⊗_ℝ ℝ^(p+q) without an arbitrary pairing
   K^∞⊕K^∞≃K^∞. Pin MSO's frame-quotient action
   f↦(1⊗P_σ)fP_σ^−1: on orientation data it is
   o↦sgn(σ)(1⊗P_σ)_*o. Prove its unit equivariance and block-swap
   commutativity; transporting the plane orientation without this twist
   fails those equations for odd permutations.
   Compare these models and bundles with CC/TopK's O/SO/U carriers and
   G4.0's Sp carrier. For Spin use G5.0's already designated finite-rank
   product-preserving bar models, associated real bundles, stabilization
   maps and stable classifier comparisons. The canonical MSpin ring uses the native Spin(0)={1} and
   MSpin₀=S⁰; for n≥1 use the chosen double-cover groups. Retain the
   geometric μ₂ rank0 branch for structured bundle diagrams and prove its
   positive-rank cofinal/stable comparison, without treating it as the ring's
   level0 unit. Spin's finite stages use the bar filtration, not a supposed
   free homogeneous finite ambient Spin quotient.
   Construct the required topological Pin(n) extension using the
   native real Clifford algebra with Q(v)=+Σ_i v_i² (Pin⁺): generate its unit subgroup by norm-one
   vectors and central−1, and use the parity-twisted conjugation on vectors.
   This is a subgroup of Clifford units, not native pinGroup for that
   positive form: star(ιv)·ιv=−Q(v), so its unitary predicate excludes
   positive unit vectors. Prove the even-part comparison with native Spin.
   For n≥1 prove the central double cover Pin(n)→O(n) and even Spin restriction;
   Prove continuity and the chosen low-rank central-kernel convention.
   Compare the positive and TopK T7 negative even algebras by
   e_i e_j↦−f_i f_j, Cl(n,0)⁰≃Cl(0,n)⁰, and identify their Spin actions
   and vector covers. Supply graded Morita comparison through the
   exterior module for Cl(n,0) graded-tensored with Cl(0,n), retaining
   the inverse degree/Clifford/Bott convention. Prove compatibility with the
   chosen SpinGeometry cover. Permutations act through conjugation by Pin(n) lifts, whose
   central-sign choices give the same conjugation; prove the action on
   bundle/Thom data and all unit/block-sum coherence. Include low-rank
   central-kernel conventions and comparison with CC's join model.
   Consume G2.5's actual Φ/L_k imaginary-loop functors and their proved
   positive commutative-ring comparisons for the S²/S⁴-indexed models. Abstract
   stable bundle classes or join classifiers alone do not provide strict
   multiplication. TangentialBordism's
   ξ-normal lifts consume these diagrams and do not supply this construction. Prove the
   spectral maps for forgetting oriented/spin/complex/symplectic structures
   commute with stabilization, product and the chosen ordinary Thom maps.
   Compare the bar SO model with the oriented-Grassmannian model by the
   mixed free space E_bar SO(n)×V_n(ℝ∞⊗ℝ^n); both projections induce
   levelwise equivalences of associated Thom spaces. Pin their twisted
   permutation/unit/block-sum diagrams, giving a commutative-ring zigzag.
   Spin→SO is a map between the bar Thom models followed by this zigzag.
   Define MU^(2)_n=Th γ_ℂ^n and MSp^(4)_n=Th γ_ℍ^n with the
   stated ambient/block models. Pin the quaternionic→complex ambient
   identification ℍ^∞⊗_ℝℝ^n→ℂ^∞⊗_ℝℝ^(2n) by
   e_m q⊗x_a↦e_m z₁⊗x_(2a)+e_m z₂⊗x_(2a+1), with q=z₁+jz₂.
   Thus labels (m,a,b) go to (m,2a+b), with b=0 the 1-component and
   b=1 the j-component. Prove this isometry's finite-stage/cofinal,
   unit, block-sum and δ_2 block-permutation diagrams; grouping by b*n+a
   would give a different action. For MSp^(4), pin its sphere-unit and
   stabilization parameter map from standard ℝ⁴ to the trivial right-H
   line by (a,b,c,d)↦a+bi+cj−dk, the real coordinates induced by the
   right-complex basis (1,j). Use this identification in every block and
   all unit/structure/permutation diagrams. Its Thom orientation relative
   to G4.0a's standard (1,i,j,k) orientation differs by (−1)^n in rank n;
   carry this conversion into universal Thom classes, coefficients and
   forget maps. Quaternionic→complex then intertwines the actual S⁴
   unit over the identity real sphere scalar, and sends pi0 unit to +1.
   A naive standard-H unit followed by complex coordinate forgetting has
   fibre degree−1 and is not this unital map. Spectral quaternionic
   real/spin forgetting, before comparison with the route through MU,
   uses quaternionSpToSOComplex and its Ad_x Spin lift, with the same
   complex-induced coordinate embedding; prove its actual conjugation/reflection adapter to G4.0a's
   standard real Sp→SO/Spin maps and its agreement with forgetting through MU.
   Complex→oriented real first gives
   MU^(2)→δ_2^(1)MSO; applying L_2
   gives MU→L_2δ_2MSO←MSO. Quaternionic→complex similarly compares
   MSp^(4)→δ_2^(2)MU^(2), then applies L_4 and χ_(2,2), giving
   MSp→L_4δ_2^(2)MU^(2)←MU. Prove G2.5's change-index
   zigzags. Prove the composition diagrams, all coordinate/orientation signs
   and equivalences; do not assert a level map MU_n→MSO_n between these
   differently indexed Thom spaces.
   Give generalized theories on **spaces and pairs**, not only coefficients at
   a point. Apply G2.8's multiplicative machine to the skeletal enriched
   topological categories: objects r≥0, endomorphism spaces
   U(r) or O(r), and no morphisms between different ranks. Block sum is
   literal r+s; tensor is rs with the lexicographic Kronecker convention,
   using basis index (i,j)↦i·s+j. The ordered block/permutation matrices
   specify symmetry. The (r+s)⊗t block distributivity is literal;
   r⊗(s+t) uses (i,j)↦i·s+j if j<s and
   (i,j)↦r·s+i·t+(j−s) otherwise, in the target block order.
   Prove every bipermutative equation and its comparison with the nonskeletal inner-product category.
   Construct connective ku/ko as commutative spectral rings and compare
   their group-completed classifying spaces with ℤ×BU/BO. Invert the
   chosen degree2/degree8 Bott classes by G2.8's commutative localization
   to construct KU/KO, with multiplication, unit, module categories and
   agreement with TopK's tensor/coefficients. Construct the actual
   spectrum structure maps and space-level Bott equivalences, consuming
   PR284 Stage 4B's real loop-space Bott chain and supplying the complex
   Ω²(ℤ×BU)≃ℤ×BU comparison with the chosen Bott class.
   Use G3.8's generic coreflection to identify τ_(≥0)KO with this ko
   and τ_(≥0)KU with this ku via their canonical maps, and compare
   positive KO-cover coordinates with the real Bott loop chain. This
   specialization follows construction of the models; it is not an
   input to the earlier generic cover functor.
   Prove agreement with TopK's bundle/compact-support/relative theories on
   finite CW pairs and compact Hausdorff pairs of CW homotopy type. For
   infinite CW spaces use represented K=[Σ∞X₊,Σ^qKU/KO], and compare
   it with finite-skeleton bundle groups through the skeletal Milnor sequence;
   for general compact Hausdorff spaces retain TopK's bundle theory and give
   comparison maps only under the stated CW hypotheses. The Cantor-set test
   distinguishes bundle K⁰ from the singular represented theory.
   Define quaternionic KSp:=Σ⁴KO as a KO-module, so KSp^q=KO^(q+4).
   Multiplication by the degree−8 real Bott unit gives the specified
   isomorphism to KO^(q−4). Pin the quaternionic rank-one generator at a
   point by [ℍ]=a·b⁻¹, with precisely TopK T7's Cl(0,4) generator
   a∈KO⁻⁴ (raw volume acts by −1 on the even part) and its
   b∈KO⁻⁸, satisfying a²=4b, c(a)=2u² and c(b)=u⁴.
   Name kspRealForget:Σ⁴KO→KO as multiplication by a, and
   kspComplexForget:Σ⁴KO→KU as multiplication by u² after Σ⁴c.
   Prove these are the actual coherent module forgetting maps in the
   quaternionic-bundle comparison, not just coefficient matches; they send
   [ℍ] to 4 and 2 respectively. Retain the Bott/Morita adapters before
   comparing a positive-Clifford model to this named negative-Clifford a.
   Build its quaternionic-bundle comparison on
   finite CW pairs with G4.0's bundle groups; it is not declared an
   independent unital ring under quaternionic tensor product.
5. **Orientation example interfaces.** Give the actual chosen canonical Thom
   orientation and comparison maps for every example in this table. Prove
   negative claims from their obstruction/coefficient computation, not a lack
   of a named map. H(A) denotes a commutative coefficient ring A.

   | Theory | Structures with the supplied Thom orientation |
   | --- | --- |
   | H(A) | oriented real, complex and quaternionic bundles; all real bundles when 2=0 in A |
   | HZ | oriented real, complex and quaternionic; the real-all-bundles orientation fails since the RP² degree-2 attachment obstructs the required unit class |
   | MO | all real, hence oriented real, complex, spin and quaternionic through forgetful maps |
   | MSO | oriented real, hence complex, spin and quaternionic through forgetful maps |
   | MU | complex and quaternionic via their underlying complex bundles |
   | MSpin | spin and quaternionic via G4.0a's direct standard-orientation lift Sp→Spin; an arbitrary complex bundle requires its actual spin lift |
   | MSp | quaternionic bundles |
   | KU | complex, hence quaternionic bundles |
   | KO and its shifted module KSp | spin, hence quaternionic bundles via G4.0a's direct standard-orientation lift, using the KO spin Thom orientation target below |

   **Structured ordinary complex augmentation and scalar change.** Use the
   single commutative Thom model MU of item4, TopK T1.5's finite complex
   Grassmannians and T1.6a's fixed-rank Gr_r∞ carriers, with their Schubert
   characteristic maps and pinned ambient/rank inclusions. Build the Thom
   CW structure by bundle trivializations over the characteristic discs;
   a base cell of real dimension d gives a Thom cell of dimension d+2r.
   Construct levelwise and cofinal comparisons with item4's ℂ^∞⊗ℝⁿ
   ambient and actual bundle/Thom structure maps, with strict compatibility
   at the bottom sphere-unit cell. Retain the stabilization, permutation,
   product and positive-flat commutative-model comparisons of these maps.
   For zero-based pivots τ₀<⋯<τ_(r−1), prove the complex Schubert-cell
   dimension is Σ_(i<r)(τ_i−i). After rank-r Thom desuspension the degree
   is 2Σ_(i<r)(τ_i−i): the bottom τ_i=i gives degree 0 and every other
   cell has degree≥2. Deduce MU connective and its unit cofiber 2-connective.
   Deduce `muCoefficientZeroIso:π₀MU≃ℤ` from this unit and G3.8's positive
   sphere-degree normalization.
   Normalize the MU Thom class in G2.5's interleaved complex coordinates
   `(e₀,ie₀,…,e_(r−1),ie_(r−1))`, matching CharacteristicClasses' canonical
   complex real orientation and G4.5's rank-one normalization.
   Prove its actual G2.5 comparison from grouped real/imaginary coordinates,
   whose permutation sign is ε_r=(−1)^(r(r−1)/2). Retain the mixed block
   shuffle in Whitney products, with
   `ε_(r+s)=ε_r ε_s (−1)^(rs)`, and the unit/stabilization diagrams.
   The chosen normalized class restricts to +Σ^(2r)1 on each ordered fibre.
   Apply G3.8's P0 to the specified connective cofibrant model cMU.
   Choose once a commutative comparison `P0(cMU)→Hℤ` between the specified
   replacements inducing `muCoefficientZeroIso`, and compose it with
   `cMU→P0(cMU)` to construct `complexThomOrientation_to_HZ`.
   Give its actual commutative-ring representative, the comparison zigzags
   to the designated MU and Hℤ, and its contractible full derived
   mapping-space uniqueness. Prove it carries the normalized MU Thom
   class to this item's ordinary Thom class over the full base, using
   the ordinary Thom isomorphism and fibre unit+1 on each component.
   Prove pullback, stabilization, external/Whitney product, zero-section
   and relative-boundary diagrams with these same coordinate comparisons.
   In particular, `x_MU=e_MU(γ*)` maps to
   `e_HZ(γ*)=−e_HZ(γ)=−c₁^CC(γ)=h_AT` under G4.5's convention.

   Construct restriction and derived extension of module scalars along
   this fixed structured map on G2's actual module categories. Prove the
   free/forgetful Quillen and coefficient-model invariance comparisons
   with compatible cofibrant/flat replacements. For a cofibrant spectrum
   E the free cMU-module cMU∧E is cofibrant; construct its balanced-tensor
   cancellation and derived-associativity comparison. Transport this to
   `freeMU_HZ_baseChange` for every spectrum E:
   `Hℤ⊗_MU^L(MU∧^LE)≃Hℤ∧^LE`.
   Prove its unit, naturality, integer shifts, cofibers and external products.
   For E=Σ∞Y₊ and actual CW-pair quotients identify its homotopy groups
   and connecting maps with G2.7's single ordinary integral homology theory.
   Scalar change of an arbitrary MU-module is not identified with ordinary
   homology of its underlying spectrum.
   Export `muHZThomEulerBaseChange`: for a numerable complex rank-r bundle
   ν over a CW-type base, scalar change carries its chosen MU Thom-module
   isomorphism and actual zero-section map to the normalized Hℤ Thom-module
   isomorphism and cap action of `c_r^CC(ν)=e_HZ(ν)`, consuming
   CharacteristicClasses C3.2's top-Chern/Euler comparison in its canonical
   complex real orientation. State the two
   homological suspensions as `MU∧B₊→Σ^(2r)(MU∧B₊)` and
   `Hℤ∧B₊→Σ^(2r)(Hℤ∧B₊)`; retain the bundle Thom object and actual
   coefficient-model maps in the derived comparison square. The target
   suspension lowers homology degree by 2r. Include r=0/Euler1, empty
   bases, all components, naturality and relative cofibers.

   **G5.5-ABS: bundle ABS orientation.** Construct the KO Thom orientation
   for a real spin bundle by the actual
   real graded Clifford-module/Koszul family, with local Spin equivariance,
   stabilization, product and the Bott unit. Consume TopK T7's algebraic ABS
   coefficient comparison and supply this missing bundle/spectrum refinement
   here. SpinGeometry G5.0/G6.0 supplies the actual real spinor bundle,
   Clifford-graded Dirac operator and analytic KO class. TangentialBordism
   B3.0 owns the geometric α map, its normalized Dirac comparison and
   complexification/Â genus; Index retains its analytical numerical
   index and Rokhlin theorems. These are consumers of this orientation,
   not inputs to its construction.
   Pin U_KO^std and U_MSpin^std on quaternionic bundles by the direct
   lift in G4.0a. The spectral MSp→MSpin→KO composite uses the
   complex-induced coordinate lift and supplies U_KO^c; prove globally
   U_KO^c=(−1)^r U_KO^std over BSp(r) and every pullback base.
   With positive Clifford generators indexed from zero, take
   x=e₃e₇⋯e_(4r−1)∈Pin⁺(4r); its twisted adjoint is F_r and
   the complex-induced lift is Ad_x of the direct lift. Prove the actual
   bundlewise ABS module isomorphism m↦x·m in the positive-Clifford
   operator model. In TopK's negative Cl(0,4r) module convention use
   x⁻=f₃f₇⋯f_(4r−1); prove its twisted adjoint is F_r and its
   Ad_(x⁻) intertwines Ad_x under eᵢeⱼ↦−fᵢfⱼ. This even-algebra
   comparison does not send an odd x to an odd element. The corresponding
   module isomorphism in each convention has grading and Clifford
   multiplication signs (−1)^r, with the grading operator correcting
   the odd-r Clifford sign. Grading reversal is additive negation in ABS,
   giving this equality of Thom classes over the whole base, with sum,
   stabilization and the chosen Morita comparisons. A fibrewise equality
   alone does not determine the global class. Apply the same actual
   conjugacy to compare the two MSpin Thom families: stabilize by one
   real line and compensate an odd reflection on that line, so the total
   map is orientation-preserving and has an actual Spin lift. Use its
   inner-conjugation homotopy and the degree−1 map on the added S¹
   suspension coordinate to prove U_MSpin^c=(−1)^r U_MSpin^std
   stably, including the even-r identity and all stabilization diagrams.
   For arbitrary bases including BSp(r), use the actual constant Pin
   operator/module isomorphism, or compose this global MSpin identity
   with the ABS ring map to obtain the global KO identity. Equality on
   separate finite skeleta is not used to discard a possible lim¹ class.
   Pin the spectral ABS route as an E∞ map, using the coherent real
   Clifford/operator model and a multiplicative comparison with G2.8's KO.
   For 𝕜=ℝ,ℂ take H_n=L²(ℝ^n;𝕜), graded by reflection, and Cl_𝕜(n,0)
   with self-adjoint positive generators. The operator C*-Clifford is a
   separate *-algebra model. In the real case construct an actual real
   algebra isomorphism to native Cl(n,0) intertwining its * with native
   reversion. In the complex case use ℂ⊗_ℝ Cl(n,0), with involution
   conjugation⊗reversion, or the complexified quadratic-form algebra with
   its corresponding conjugate-linear involution; prove the actual
   complex algebra/* comparison. Native
   CliffordAlgebra.star negates odd vector generators; do not replace that
   global instance. Construct the finite-dimensional C*-norm/matrix models
   and graded tensor isomorphisms, consuming K5 for the complex part.
   For complex compact/spatial/graded
   APIs consume CStarAlgebras C5, HilbertModules H2/H4–H6 and OperatorKTheory K5;
   build the real and finite-Clifford extensions here. Retain K5's swapped
   two-odd-factor parity reduction and its explicit sign adapter to the
   ordered geometric Clifford coordinates/Bott class.
   **G5.5-Classifiers: operator classifying spaces.** Define
   K_op,n=Hom_gr,𝕜,*(C₀(ℝ;𝕜),Cl_𝕜(n,0) graded-⊗_𝕜 K(H_n)),
   with point-norm topology and zero homomorphism as basepoint. For ℂ
   prove Cl_ℝ(n,0) graded-⊗̂_ℝ K(H_n)≅Cl_ℂ(n,0) graded-⊗̂_ℂ K(H_n),
   respecting conjugation⊗reversion and the given scalar action. Build the
   remaining graded compact-operator/spatial-tensor and odd self-adjoint
   multiplier functional-calculus adapters for these specific Hilbert/Clifford
   models. Prove the functional-calculus identification with compact-resolvent
   odd self-adjoint regular Clifford-linear operators on their essential
   support in H_n⊗Cl(n,0). Degenerate homomorphisms have a complementary
   zero representation; the zero homomorphism has empty support. Use the
   topology induced by all f(D), not an unjustified norm topology on bounded
   transforms. Construct the bounded transform and real/complex graded
   Clifford family index, with finite-rank perturbation/stabilization and
   homotopy/pullback laws; ordinary ungraded kernel dimension is insufficient.
   Compare it with TopK's finite-dimensional ABS classes and Morita degree.
   For n≥1 prove [X,K_op,n]_unbased≃KO^n(X) or KU^n(X) for finite
   CW X; the based version gives reduced groups and relative pairs are included, via stabilized Fredholm/spectral cutoffs
   and contractible Clifford-linear frame choices. Prove every positive
   adjoint K_op,n→ΩK_op,n+1 is a weak equivalence and π_iK_op,n equals
   KO^(n−i)(*) or KU^(n−i)(*) at the zero basepoint. Include π₀K_op,1=0
   and π₀K_op,4=ℤ in the real case. These give the spectral coefficients
   and Bott invertibility; K_op,0=S⁰ is the separate non-Ω unit level.
   **Mixed-signature operator classifiers.** Construct
   `realMixedCliffordOperatorClassifier p q` as the point-norm space
   `Hom_gr,ℝ,*(C₀(ℝ;ℝ),Cl(p,q) graded-⊗_ℝ K(U_(p,q)))`, using an
   infinite ample graded real Hilbert universe with both parities, also when
   p=q=0. Construct its real C*-Clifford algebra: positive generators are
   self-adjoint, negative generators are skew-adjoint; compare the underlying
   algebra to native `CliffordAlgebra (TauCeti.realCliffordForm p q)` and
   its adjoint to reversion composed with the sign change on negative
   coordinates. This adjoint equals native global Clifford star when p=0;
   for p>0 the positive generators have the opposite adjoint sign. Keep the
   C*-model on a separate `def` type synonym with an explicit underlying
   algebra equivalence; do not install this adjoint on the native abbreviation.
   For mixed signature complexification pin the involution to
   conjugation graded-⊗(β∘reverse), where β changes the negative coordinates.
   Pin the real spectral order: x≤y iff y−x is self-adjoint with nonnegative
   real spectrum; use the unitization/quasispectrum form for nonunital
   Clifford/compact/adjointable synonyms. Identify it with the pullback of
   the complex spectral order and construct their `PartialOrder` and
   nonnegative-spectrum interfaces. Construct their `StarOrderedRing`
   instances after the descended square root and real CFC below. On native real
   Hilbert operators H→L[ℝ]H retain `ContinuousLinearMap.instLoewnerPartialOrder`
   and the existing `NonnegSpectrumClass ℝ`; prove spectral positivity
   equivalent to native `IsPositive`, using `IsPositive.spectrumRestricts`
   and `realHilbertContinuousFunctionalCalculus`'s descended square root
   for the converse, after the Hilbert complexification/bounded transport
   below. After the real CFC is built, install the named global
   `realHilbertOperatorStarOrderedRing` instance using native
   `ContinuousLinearMap.instStarOrderedRingRCLike` and the existing
   Loewner order.
   Use the specified real algebra order for module pairing positivity.
   Give the actual graded compact operators, tensor/multiplier and continuous
   functional-calculus constructors. For signature addition pin the
   coordinate shuffle (x,y,x′,y′)↦(x,x′,y,y′), with positive x,x′ and
   negative y,y′. Its determinant is (−1)^(p′q); retain this reference-
   volume/Koszul sign in the graded tensor, Bott and Morita comparisons:
   ω_(p+p′,q+q′)=(−1)^(p′q)·(ω_(p,q) graded-⊗ω_(p′,q′)).
   For the neutral block Cl(c,c) specify the module Λ(ℝ^c), with its
   exterior-degree parity, e_i↦ε_i+ι_i and f_i↦ε_i−ι_i in ordered
   coordinates (e_1,…,e_c,f_1,…,f_c). Here ε_i is wedge by the ith
   positive basis vector and ι_i its adjoint contraction. The ordered
   Λ(ℝ^c) graded-⊗Λ(ℝ^c′)≃Λ(ℝ^(c+c′)) map sends vacuum⊗vacuum
   to vacuum with sign +1. Its reference-volume formula accounts for the
   coordinate shuffle once, without an extra scalar in the index product.
   Test Cl(1,1) graded-⊗Cl(1,1): the volume shuffle has determinant −1,
   while the exterior vacuum tensor map still has sign +1.
   **G5.5-Transfer: finite-Clifford modules.** Construct the real finite-Clifford
   Hilbert-module interface on native
   complete normed real vector spaces, with right A-action expressed through
   opposite scalars, an A-valued real-sesquilinear pairing with
   ⟨xa,yb⟩=a*⟨x,y⟩b, positivity, norm
   recovery ‖x‖²=‖⟨x,x⟩_A‖, and compatible module/algebra gradings.
   Here A is the finite real C*-Clifford Cl(p,q) just constructed. Native
   `CStarModule` currently requires complex scalars on both A and E; reuse
   H1's right-module form `CStarModule A_Cᵐᵒᵖ E_C`, constructed once below
   with its explicit pairing and norm comparisons, reading the pairing through
   `MulOpposite.unop`.
   Use a `WithCStarModule`-style type synonym for the trace-induced real
   Hilbert norm, with the identity linear homeomorphism and norm comparison
   to the A-module norm; competing norm/star instances stay on their
   designated synonyms. Build adjointable maps, finite-rank θ_(x,y), compact
   completion and finite matrix-factor/complexification comparisons.
   Consume SpinGeometry G1.3's `cliffordScalarTrace` and its
   normalized regular-trace formula through the explicit underlying algebra
   equivalence `realMixedCliffordCStarModelEquiv`. Pin A_C:=ℂ⊗_ℝA, with
   the conjugation⊗(β∘reverse) involution fixed above. Its τ_C is exactly
   SpinG1.3's ℂ-linear trace τ_ℂ transported along the ℂ base change of
   `realMixedCliffordCStarModelEquiv`; it is not a second trace construction.
   Consume G1.3's
   ordered-product/native-exterior-basis comparison and scalar coefficient
   pairing for the orthogonal coordinate basis of realCliffordForm p q.
   For the mixed Cartan adjoint β∘reverse above, prove this transported
   basis is orthonormal for the trace pairing, and the trace is faithful,
   positive and even, with τ(a*a)=Σ_I|a_I|². Before constructing the module
   trace norm, prove τ(a)≥0 for every spectrally positive a, with equality
   only for a=0, and the corresponding statement for τ_C on A_C. Use the
   transported normalized regular-trace formula: positive a makes L_a
   self-adjoint on the trace inner-product algebra, with spectrum spec(a),
   so its trace is nonnegative and zero only when L_a=0. Prove these
   statements over both real and complex scalars. Construct its induced real inner product and
   the uniform equivalent-norm/completion comparisons.
   Construct `realFiniteCliffordContinuousFunctionalCalculus` for these finite
   Clifford algebras and their compact/multiplier/adjointable operator
   algebras. Their trace-induced real Hilbert spaces consume the single
   native-operator instance `realHilbertContinuousFunctionalCalculus`
   constructed below. Complexify the algebra with its actual C*-norm and
   conjugation; use the single complex-module construction below to compare
   the real module with its fixed points. Descend conjugation-commuting
   real-valued functions from native complex CFC. Install the native real
   `IsometricContinuousFunctionalCalculus`
   and nonunital interfaces on the designated real models, extending the
   preceding spectral order to their compact/multiplier/adjointable models
   and proving norm, positivity, composition and tensor/compact compatibility.
   **G5.5-RealHilbert: scalar Hilbert foundations.** For a complete real
   inner-product space H construct
   `RealHilbertComplexification H` as a separate synonym of
   native `TauCeti.Complexification H`, retaining its complex linear
   structure but installing the Hilbert inner product
   ⟨x+iy,x′+iy′⟩=(x,x′)+(y,y′)+i((x,y′)−(y,x′)), with norm
   √(‖x‖²+‖y‖²). Do not install this norm on the native Taylor-norm carrier.
   Prove the real embedding is isometric, conjugation J(x+iy)=x−iy is an
   antilinear isometry, and this space is complete. Construct the identity
   complex continuous-linear equivalence with the native Taylor model,
   proving ‖z‖_T≤‖z‖_H≤√2·‖z‖_T. Transport native
   `ContinuousLinearMap.complexify` through it for bounded maps, retaining
   composition and adjoints, and prove equality of operator norms from
   the Hilbert formula. Then construct `realHilbertContinuousFunctionalCalculus`
   on native H→L[ℝ]H for every complete real inner-product space H:
   transport bounded operators to this Hilbert complexification, use native
   complex CFC and conjugation descent, and install one native real
   isometric CFC instance. Prove a bounded complex-linear S is T_C for
   a unique bounded real T exactly when S commutes with J. For self-adjoint
   T prove `(spectrum ℝ T).image Complex.ofReal = spectrum ℂ T_C`,
   using conjugation-fixed inverses at real scalars and the real spectrum
   of complex self-adjoint operators; retain the zero Hilbert space case. It precedes the native positivity converse
   and `instStarOrderedRingRCLike` above; all trace-induced real Hilbert
   spaces use this same instance. For a densely defined real `LinearPMap` D define D_C(x+iy)=Dx+iDy on the actual
   complexified domain; prove graph/closure transport and
   (D_C)†=(D†)_C, including equality of domains. For closed self-adjoint D
   this supplies the complex Hilbert operator used below.
   On this Hilbert synonym pin H1–2's transported scalar structure:
   `CStarModule ℂᵐᵒᵖ H_C` has `op z • v=z•v` and
   `unop (inner ℂᵐᵒᵖ v w)=⟨v,w⟩_ℂ`, derived from native
   `instCStarModuleComplex`; keep it local to the designated synonym.
   Export `scalarComplexHilbertModuleAdjointComparison`: for densely
   defined T, H6's representing-vector module adjoint equals native
   `LinearPMap.adjoint` with the same domain, by scalar Riesz and density.
   Hence native self-adjointness is equivalent to the H6 scalar-module
   condition. Specialize H6 to coefficient ℂ and prove scalar regularity
   from H6's symmetric-operator criterion and
   [SelfAdjointSpectralTheory SA-D15–D17](../OperatorTheory/SelfAdjointSpectralTheory/README.md)'s
   closed/dense range and nonreal resolvents. Descend H6's actual scalar
   C₀(ℝ) calculus to real-valued conjugation-intertwining functions, proving
   nondegeneracy, bounded-transform and real resolvent formulas (1+D²)⁻¹
   and D(1+D²)⁻¹. Export this real Hilbert closed descent as
   `realHilbertClosedFunctionalCalculus`. Prove J f(D_C) J=conj(f)(D_C)
   through resolvents and density, so real-valued functions preserve the
   real fixed space; also retain conjugation and domain laws for bounded
   transforms. This scalar regularity uses no real finite-Clifford module
   theorem and precedes the operator-transfer exports below.
   Export `realFiniteCliffordAdjointableComparison`: every bounded A-linear
   operator on the resulting real Hilbert space is A-adjointable, with the
   same adjoint and operator norm. Prove this using A-linearity and testing the A-valued adjoint
   identity against every right scalar through the faithful trace pairing.
   Prove the resulting injective *-homomorphism L_A(E)→B(H_τ) is isometric,
   giving equality of operator norms.
   Export `realFiniteCliffordCompactComparison`: A-linear real-compact
   operators are exactly K_A(E). Finite-rank A-operators have finite real
   rank; in the converse average real finite-rank approximants over the
   finite signed Clifford-monomial unitary group and use finite A-module
   Parseval frames to express the averages as sums of θ_(x,y).
   **G5.5-Regularity: real/complex regular operators.** Define the real
   A-module adjoint of a densely defined A-linear D on
   its actual A-invariant domain: y lies in dom(D*) exactly when there is
   z with ⟨Dx,y⟩_A=⟨x,z⟩_A for every x in dom(D), and set D*y=z.
   Prove uniqueness by density and the pairing's nondegeneracy. Define
   real semiregularity by dense domains of D and D*; define real regularity
   by semiregularity, a closed graph and dense range of 1+D*D on its
   actual composition domain. Construct the complexified pairing and
   the complete normed `CStarModule A_Cᵐᵒᵖ E_C`, with its C*-module norm
   and identity equivalent-norm comparison to the Hilbert complexification
   of E's trace-induced real Hilbert space. After `unop`, its pairing is
   ⟨x+iy,x′+iy′⟩=⟨x,x′⟩+⟨y,y′⟩+i(⟨x,y′⟩−⟨y,x′⟩),
   with the inclusions A→A_C and central complex scalar understood.
   Prove τ_C(⟨z,z⟩)=(‖z‖²_H:ℂ), and derive the uniform norm-equivalence
   constants from this identity and the faithful finite-dimensional trace.
   For the complexified operator
   prove `(D_C)*=(D*)_C` with equal domains, graph/closure and domain
   density comparisons, and `1+(D_C)*D_C=(1+D*D)_C` including composition
   domains. Prove dense-range equivalence through the real/imaginary
   projections. Preserve module grading, conjugation and the underlying
   norm-comparison maps. Export `realFiniteCliffordRegularComplexificationComparison`:
   real regularity is equivalent to H6 regularity of D_C on this actual
   complex module. These module-adjoint comparisons use the full A-valued
   pairing and its complexification, not only its scalar trace.
   Export `realFiniteCliffordRegularOperatorComparison`: a closed densely
   defined self-adjoint A-linear real operator with A-invariant domain is
   real module-regular, with the same module adjoint/domain as its real
   Hilbert adjoint; real-compact resolvent implies K_A-compact resolvent.
   Obtain (1+D²)⁻¹ and D(1+D²)⁻¹ from
   `realHilbertClosedFunctionalCalculus`, and prove they commute with every
   bounded right A-action. Transfer these bounded A-linear operators through
   `realFiniteCliffordAdjointableComparison`, and through
   `realFiniteCliffordCompactComparison` when they are real-compact,
   retaining range((1+D²)⁻¹)⊆dom(D²), range(D(1+D²)⁻¹)⊆dom(D),
   and the inverse identities on the composition domain, to prove real
   regularity.
   Then apply `realFiniteCliffordRegularComplexificationComparison` and
   construct `realFiniteCliffordClosedFunctionalCalculus`: consume H6's
   actual C₀(ℝ) calculus of the now-H6-regular D_C and descend
   its conjugation-invariant real functions. Prove equality with the preceding
   real Hilbert-space calculus, strong/strict convergence, bounded-transform,
   compact and essential-support laws, including zero representation. This
   module calculus follows regularity and precedes Spin's analytic use.
   Construct `realFiniteCliffordHilbertModuleStabilization` for every
   countably generated graded Hilbert A-module: an even A-linear unitary
   E⊕Std_A≃Std_A, where Std_A=U_(p,q) graded-⊗A is the countably infinite
   standard module with both parities. This is the real finite-Clifford
   extension of H4's stabilization. For p+q≥1 choose an odd unitary generator
   u, reduce to the even module E₀ over A₀=Cl⁰(p,q), prove
   E=E₀⊕E₀u and countable generation of E₀, then apply the real/complex/
   quaternionic matrix-factor comparisons and Gram–Schmidt to the factor
   Hilbert spaces. Do not require an A-orthonormal basis of an arbitrary
   Hilbert A-module. For p=q=0 stabilize the two real parity spaces
   separately. Give support/universe comparisons and the actual isomorphism
   K_A(Std_A)≃K(U_(p,q)) graded-⊗A, whose elementary action is
   (k⊗a)(u⊗c)=(−1)^(|a||u|)ku⊗ac. Its graded flip
   k⊗a↦(−1)^(|k||a|)a⊗k gives the displayed A graded-⊗K(U_(p,q))
   operator model; prove both action/tensor comparisons and their signs.
   Prove even-unitary frame-choice
   contractibility in the strong (equivalently strict on these unitaries)
   topology, and numerable parameter/pullback compatibility, including
   conjugation of compacts in point norm and stabilization of the
   functional-calculus essential support. These generic targets precede
   geometric section modules; Spin constructs its own A-valued L² section
   pairing and consumes these comparisons and stabilization afterward.
   The zero-signature classifier represents KO⁰ and is not the sphere-
   module's separate unit level K_op,0=S⁰. First construct
   `realMixedCliffordBottTransport`: let d=p−q and choose k with
   r=d+8k≥1. Construct the actual graded-Morita/operator comparison to
   K_op,r. Under this comparison π₀ is identified with KO^r; the forward
   coefficient identification π₀→KO^d sends its corresponding y∈KO^r
   to b^k y∈KO^d, with TopK's fixed b∈KO_8=KO^(−8). Its inverse sends
   x∈KO^d to b^(−k)x∈KO^r and then applies the inverse operator comparison.
   Prove independence of k and check these mutually inverse identifications
   against the finite ABS calibrations below, rather than presupposing the
   classifier's degree.
   Prove independence of k, ordered exterior-module cancellation for
   Cl(c,0) graded-⊗Cl(0,c), eight-periodic Morita maps, product/unit,
   Hilbert stabilization and parameter/pair naturality, including the
   normalized real/complex coefficient diagrams. Export the operator-level
   Morita insertion (p,q)→(p+c,q+c), by placing Cl(c,c) as the second
   signature summand and tensoring its specified exterior module. Pin the
   coordinate map (x,y,e,f)↦(x,e,y,f), its volume sign (−1)^(cq), and
   the even exterior-vacuum intertwiner with unit sign +1. Prove compact-
   operator/functional-calculus and index compatibility, product/unit and
   iterated insertion coherence; the signature degree p−q is unchanged. This is an algebraic/operator export, before
   any geometric embedding/excision square.
   Then construct `realMixedCliffordIndexClassification` in degree d=p−q.
   Construct `realMixedCliffordIndexClassification_map` to
   Ω^m R(KO)_(d+m) for every m≥max(0,−d),
   compatibly in m: actual Bott transport or Clifford suspension, ordered
   Morita cancellation, then the K_op/KO zigzag, with inverses constructed
   after pointed CW replacement. Prove this composite gives the stated
   coefficient identification and all parameter/pair diagrams. Here R(KO)
   is G2's ordinary stable fibrant Ω-spectrum replacement of the underlying
   KO spectrum, with an actual replacement map; d+m is a nonnegative level.
   Its level zero is the derived KO⁰ classifier, not the unchanged unit
   level of a merely positive-fibrant commutative spectrum.
   Its π_i is KO^(d−i); finite-CW based/unbased/relative maps represent
   the corresponding reduced/unreduced KO^d. Extend the derived mapping
   comparison to all CW pairs using G3.10, retaining Milnor/phantom terms.
   Establish these operator comparisons before their Dirac or geometric
   ABS consumers. In particular `realNegativeCliffordFamilyIndex n` uses
   the Cl(0,n)-affiliated classifier and takes values in KO^(−n), or KO_n
   at a point. Its parity-twisted right action has positive external
   generators; the affiliated algebra and that external action are not the
   same signature. Identify its bounded-transform/finite-kernel quotient
   with TopK's ABS modules, including nonzero spectral pairs extending the
   positive external action to Cl(n+1,0). Calibrate algebraically: an even
   or odd real line gives ±1; a free rank-one graded Cl(0,1) module, with
   positive external Cl(1,0) after the parity twist, gives η, and its graded
   square gives η². The graded Cl4 kernel module with four-dimensional even
   part and external volume −1 gives a; the Cl8 generator with external
   volume +1 on its even part gives b. Prove these finite-module comparisons
   against TopK's fixed coefficient generators, including the even/odd
   finite support at p=q=0 in the ample classifier. Spin's circle/torus
   Dirac calculations and TB's geometric squares consume these algebraic
   comparisons and Morita insertion afterward; neither is a G input.
   The multiplication is tensoring homomorphisms after the coalgebra map
   of C₀(ℝ) defined by the odd sum D⊗1+1⊗D'; prove its functional
   calculus, coassociativity/counit, graded symmetry and continuity. The
   unit/Bott family uses Clifford multiplication by v and the Gaussian
   rank-one projection in H_n. Coordinate/Hilbert tensor shuffles give
   Σ_n actions; prove all sphere-module and commutative-ring equations,
   semistability and the TopK coefficient/Bott comparison, including the
   positive/negative graded-Morita degree convention above.
   Construct the even Clifford-linear isometry groups of H_n⊗Cl(n,0)
   with strong operator topology and their Spin embeddings. Prove their
   positive-rank contractibility (consume H5's complex strong-topology
   theorem and prove the real/quaternionic Clifford-commutant cases),
   free universal-bundle comparison and
   coherent bar-to-associated-Thom zigzag; normalize level0 to the sphere
   unit and prove the positive-level commutative-ring comparison. The
   Spin-equivariant extension of the operator unit over this Thom model
   constructs the actual coherent ABS map. Compare with G5.4's bar MSpin
   through those multiplicative zigzags.
   Pin the configuration intermediary, rather than inferring a coherent
   comparison from the family index alone. For a based finite set A and
   real/complex inner-product universe U, Λ(A,U) is the tuple of mutually
   orthogonal finite-dimensional subspaces U_a for a≠*; a based map merges
   them by orthogonal sum and deletes the basepoint fibre. Give the actual
   Grassmannian/final topology. Prolong Λ to a based space T by its finite-set
   coend; collisions sum labels and a label at the basepoint disappears.
   Use U_n=Sym(𝕜^n) with z^α/√α! orthonormal, its permutation
   action and the canonical isometry U_p⊗U_q≃U_(p+q). The ring-spectrum
   levels are Λ(S^n,U_n), with coordinate/product and the constant-label
   sphere unit. Prove connectivity and their connective ko/ku comparison.
   Compare the skeletal bipermutative Γ machine to this model by the
   bar resolution over finite orthogonal subspace embeddings; positive-rank
   infinite Stiefel fibres are contractible. The resolution is an algebra
   over the topological realization |Barratt–Eccles| of G2.8's simplicial
   operad, not a strictly commutative ring.
   Permutation-translation nerves act on frame tensors by their actual
   Kronecker shuffle matrices; construct the coherent edges/operations,
   operadic substitution and unit equations. Give the Γ-machine output
   this same operad action, and restrict the strictly commutative Λ model
   along |Barratt–Eccles|→Com. Prove both resolution projections are operad-
   algebra maps and stable equivalences, including tensor, sum and sphere
   assembly. Apply the stated cofibrant operadic/positive rectification
   comparisons after SingSp in the simplicial positive-flat operadic model,
   restricting the Sing|Barratt–Eccles| action along the actual unit
   Barratt–Eccles→Sing|Barratt–Eccles|
   to obtain the commutative-ring zigzags. No strict frame
   tensor commutativity is assumed.
   Treat rank0 as the sphere unit, not a purported level map from ℤ×BU/BO
   to S⁰.
   Define a monoidal Σ_n-equivariant isometric embedding U_n→H_n^even
   by normalized monomial z^α↦the product Hermite function h_(2α).
   Construct normalized Hermite functions from native Polynomial.hermite
   by h_j(x)=π^(−1/4)(j!)^(−1/2)He_j(√2x)exp(−x²/2).
   Prove the full Hermite basis complete/orthonormal in H_n; the 2α
   subsequence gives an embedding into the even part, not an asserted
   surjection. Prove its Gaussian unit and Fubini/tensor/permutation equations. Map a configuration
   [v_j,W_j] to f↦Σ_j f(c(v_j))⊗P_(W_j), using those embedded even
   labels. Prove the *-homomorphism, grading, collision/basepoint continuity
   and all ring/unit/sphere equations. Its coefficient/classification
   comparison uses the graded family-index theorem above. Identify the
   image of the actual Bott class and its inverse. Prove the configuration
   map induces π_k isomorphisms for every k≥0 via its graded family-index
   and connective comparison, explicitly the real η,η²,α degrees1,2,4.
   Pin the complex Bott representative to TopK's β=[γ]−1 on CP¹:
   its D₀-to-D∞ clutching has s₀=z·s∞ and γ=O(−1). The positive
   tautological-dual class [γ*]−1 is −β on CP¹; retain this sign
   in the geometric/operator and normalized Thom adapters. Pin the real
   degree8 class to TopK's chosen Clifford/real-Bott generator through
   the specified Morita sign adapters.
   Apply G2.8's
   commutative localization universal property, and prove the resulting
   localized map is a stable equivalence. This supplies the commutative-ring
   equivalence between the chosen Γ/Bott KU/KO and K_op, before transporting
   ABS. Retain finite CW pairs and then use G3 for arbitrary CW.
   Compare the real orientation's necessary condition 2·1=0, the complex-line
   spin obstruction and the quaternionic lift with the given ordinary/K-theory
   conventions. For MU/KU's quaternionic orientations multiply the pulled-back
   right-complex Thom class by (−1)^r to normalize its restriction against
   the ordered quaternionic block orientation; prove this renormalization
   respects direct sum and the chosen S⁴ coordinate comparison. Carry the
   corresponding conjugacy of SO/Spin forgetting maps and signs into
   MSp→MU→MSO, MSp→MSpin→KO and the orientation comparison
   diagrams. The latter composite yields U^c, while the table's direct-lift
   KO/MSpin family is U^std; use the global Pin-twisted ABS theorem above
   when converting these conventions. A bundle class that is already spin
   may use the spin Thom
   isomorphism even when the theory has no orientation for all complex bundles.
   Construct Thom orientation ring maps to HA. Their complex/MU instance
   for A=ℤ is the same `complexThomOrientation_to_HZ` constructed above;
   for a commutative coefficient ring A compose with G2.7's coefficient
   change Hℤ→HA through the specified comparison zigzags and fibrant
   coefficient-model maps. Construct the actual unital
   multiplicative ABS map MSpin→KO, with the KO bundle Thom family and
   coefficient ABS comparisons. For supplied coherent multiplicative
   orientation data construct the generic unital spectral ring map; distinguish
   an additive orientation from those coherence hypotheses. The geometric bordism-to-homology map,
   its low-degree/rational image, ABS α comparison, MO/MSO/MU coefficient
   rings and formal-group universal theorems remain with their named consumers.
6. **Rational spectral Hurewicz.** Construct rationalization by the telescope
   inverting the positive integers, with explicit unit/map and its universal
   property. Consume DGFloer Layer 1 item 4's torsion Serre-class Hurewicz
   theorem and supply the rational sphere argument needed
   to prove `π_n S⊗ℚ=0` for n>0. Supply the required rational
   H*(K(ℤ,n);ℚ) computation, consuming DGFloer Layer1 item2's
   arbitraryCWSerreSpectralSequence/arbitraryBaseSerreSpectralSequence
   and arbitraryCWSerreCohomologySpectralSequence/
   arbitraryBaseSerreCohomologySpectralSequence, with their degreewise
   first-quadrant convergence. Its skeletal filtration and CW-approximation
   construction are owned solely by DGFloer1.2, using AT1–4, the
   AT6.0–6.2 foundational Milnor/cochain/cup portion and DG1.3,
   and precede DGFloer1.4 and this path-loop application. Consume the
   actual filtered-cochain E₂=H^p(B;H^qF), native/local tensor-cup pairings
   on E_r, Leibniz differentials and multiplicative strong convergence;
   dualizing homology pages does not construct this cohomology sequence.
   State H*(K(ℤ,n);ℚ) for n≥1 as exterior on the normalized degree-n
   generator when n is odd and polynomial when n is even. Prove the rational differential
   and convergence comparisons used by this computation.
   Pass from the rational sphere computation to the stable groups using the single Freudenthal/stable-sphere
   comparison; the n=0 group is ℚ. Prove `S_ℚ≃Hℚ` via the EM comparison,
   and hence `π_nE⊗ℚ≃H_n(E;ℚ)` naturally for every spectrum E. Prove smash,
   product and stable Hurewicz compatibility and the corresponding finite-type
   dimension/graded-dual consequences. Combine with the Thom homology
   comparison to supply the rational Hurewicz input for structured bordism.
   TangentialBordism proves its CP^(2j)/partition basis and rational oriented
   bordism polynomial ring; those calculations are not inferred from this
   generic comparison alone. Unstable rational Hurewicz requires its distinct
   connectivity and degree range, not the all-degree stable statement.
   For a (k−1)-connected pointed CW space with k≥2, combine G2's
   general Freudenthal comparison with this stable theorem to prove reduced
   rational Hurewicz is an isomorphism for 2≤i≤2k−2 and a surjection
   at i=2k−1, with the stabilization/Hurewicz diagram.

7. **Coherent module families, Borel cochains and oriented supports.**
   Start from G2's specified commutative ring-spectrum and module models for
   R=MU,Hℤ. Check their actual unit and pushout-product hypotheses, then apply
   BordismFormalGroups F6.5's unit-adjoined monoidal-localization and
   relative-adjoint constructions to build the symmetric monoidal stable
   enhancement `Mod_R∞` and its derived relative tensor `⊗_R`. Localize G2.4's
   derived function modules through F6.5's DK-localization and
   representable-pairing adjunctions to construct the internal module function
   spectrum `F_R` and prove the tensor/internal-Hom adjunction. Construct its
   unit and counit (evaluation), triangle identities, and mapping spectra,
   with associativity, unit and symmetry coherences. Dual-pair coevaluation
   is required only for the specified dualizable objects.
   Extend these constructions pointwise to
   `A_R(B)=Fun(Sing B,Mod_R∞)` for each CW-type B. The mapping object is
   `Map_{A_R(B)}(P,Q):=Γ_B F_R(P,Q)`; prove it represents module maps and
   is compatible with restriction and sections. Construct the corresponding
   relative-tensor and unit comparisons. Apply the fixed G5.5 MU→Hℤ
   representative and its ring/module comparison zigzags to obtain the
   strong-monoidal derived functor `Φ_B:A_MU(B)→A_HZ(B)`, including its
   tensor, unit, restriction and colimit maps. Verify each model hypothesis
   used by these constructions rather than treating LM fibres alone as
   symmetric monoidal.

   **Continuous action adapter.** Put T=(Circle)^ℓ, including ℓ=0.
   Use native `ContAction TopCat T` for continuous unbased T-spaces and
   equivariant maps, with CW-type convenient models for geometric comparisons
   and specified equivariant NDR/cylinder pair replacements. Within this
   adapter, define the named, instance-reducible identity witness
   `topCatIdentityForget` once in a single module:
   `HasForget₂ TopCat TopCat` with `forget₂ := 𝟭 TopCat` and
   `forget_comp := rfl`; consuming files enable its local instance attribute.
   Then obtain
   `HasForget₂ (ContAction TopCat T) TopCat` by the native `ContAction` and
   `Action` transitive forgetful instances; do not assume the identity
   instance is synthesized globally. Construct pointed-convenient and singular
   adapters, retaining product, unit and action equations. Put
   `G=Sing(T)` on native [`TopCat.toSSet`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicTopology/SingularSet.lean), with its pointwise simplicial group structure; verify the
   face, degeneracy, multiplication, inverse and unit equations. Use AT's
   [`simplicialGroupKan`](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a02281f3e7b8eff55495b3458fe266e43818f4d8/TauCetiRoadmap/AlgebraicTopology/README.md#stage-8-relative-homotopy-hurewicz-whitehead-and-ordinary-representability)
   and G2.1's Kan–Quillen geometric/singular comparison. Let `C_G` be the
   one-object simplicial category with endomorphism group G. Take
   `S=N_hc(C_G)`, on native
   [`SimplicialNerve` and its coherent simplex carriers](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicTopology/SimplicialNerve.lean).
   First derive the DK counit `ε:𝔠[S]→C_G` from F6.5's Bergner
   fibrancy of locally Kan C_G and its rigidification/nerve Quillen
   equivalence; all simplicial sets are Joyal-cofibrant. Its DK mapping
   comparison and F6.5's coherent mapping-space theorem give
   `hS≃π₀C_G`. Thus every edge of S is invertible, and the inner- and
   equivalence-edge outer-horn theorems prove S Kan. This does not assume
   S Kan to obtain the counit. Apply ε in F6.5's HTT4.2.4.4 diagram
   comparison, natural on index maps, transformations and higher simplices.

   **Principal and associated total-space comparison.** For a numerable
   locally trivial right principal T-bundle `P→B`, put `X=Sing(P)` with left
   action `g·x=x·g⁻¹`. Construct the singular Kan-fibration adapter using
   AT5.5's native locally-trivial Serre bridge and relative finite-CW
   horn lifting, and apply it to `Sing(P)→Sing(B)`. Pull back P over each
   singular simplex of B, choose a section of that
   trivial principal bundle, and use its continuous principal division map.
   This proves the actual degreewise quotient isomorphism `X/G≅Sing(B)`.
   Prove projective cofibrancy of X by filtering over the nondegenerate
   simplices of Sing(B): the chosen lifts attach free cells
   `G×∂Δ[n]→G×Δ[n]` with the boundary maps determined by division.
   This explicit free-cell filtration proves cofibrancy. The ordinary orbit
   functor
   is left Quillen for the projective G-simplicial-set model, since its
   right adjoint gives trivial action and preserves underlying Kan
   fibrations and trivial fibrations. Thus its derived value yields
   `hocolim_C_G X≃X/G≅Sing(B)`.

   Rectify X along ε to `F_X:S→Spaces`. View Kan complexes as the
   full space-valued subcategory of Cat∞ and use F6.5's marked
   coCartesian straightening over S, with projective marked diagrams on
   𝔠[S], directly. Construct its restriction to Kan-valued diagrams:
   every total edge factors as a coCartesian lift followed by an
   invertible vertical edge in a Kan fibre, so every edge is coCartesian
   and the fibration is a left fibration with those same fibres. Use the
   marked tensor strength and enriched Quillen-equivalence criterion for
   the derived mapping-space comparison. Identify the unstraightening of
   constant Z naturally with `S×Z` by base change along S→* and the
   unit/counit at the point. For Kan S and Kan-valued F, the total E_F is
   Kan. The graph and marked-straightening equivalences give
   `Map(E_F,Z)≃Map_/S(E_F,S×Z)≃Nat(F,const Z)`.
   Export the cocone as the image of id_(E_F); this constructs the natural
   equivalence `E_F≃colim_S F`, including higher parameters and actual
   fibrant/cofibrant replacements. To transport the orbit cocone, take
   projective cofibrant replacements of its entire arrow diagram,
   including its target, the trivial-action Sing(B). F6.5's naturality
   along C_G→* identifies its target rectification with constant Sing(B).
   HTT4.2.4.1 then gives the actual global comparison
   `E_X≃hocolim_C_G X→Sing(B)` from that cocone.
   For the universal bundle `ET→BT`, X is Kan and contractible; hence
   `F_X→*` is an equivalence. Apply the marked fibrewise-equivalence
   criterion to `E_X→id_S` to prove `E_X→S` is an equivalence. Export the
   actual span
   `S←E_X→Sing(BT)` of equivalences with cocones and all higher naturality,
   including its contractible space of inverse choices. For a general P
   or a finite classifier stage, retain `E_X→S` as its classifying map;
   no contractibility of X or equivalence of B with S is assumed.

   For a left T-space F put `Y=X×Sing(F)` with diagonal left action
   `g·(x,f)=(xg⁻¹,gf)`. Construct its projective free-cell filtration over
   the singular simplices of `P×_T F`: simplex lifts in P and principal
   division identify each pullback with `G×Δ[n]`. Prove the actual quotient
   `Y/G≅Sing(P×_T F)`. Under rectification and total-space comparison the
   projection Y→X gives a global map E_Y→E_X and a commutative comparison
   square with `Sing(P×_T F)→Sing(B)`, including the cocone homotopies and
   higher parameters. Under left straightening this is the associated
   action bundle pulled back along E_X→S, not just an identification of
   its separate fibres. Retain naturality in F, bundle maps and torus
   homomorphisms. Include based/sectioned objects, zero sections, relative
   cofibers and the actual Thom-line bundle maps in this same square.

   For each numerable locally trivial bundle `p:E→B`, construct the actual
   Kan fibration Sing(p), its straightening, and the global comparison
   with its unstraightening, natural in bundle maps and their higher
   parameters. Identify it with the C_G-action construction when p is the
   specified T-associated bundle. For arbitrary bundles use their own
   straightening over Sing(B). Compare the enriched module diagrams with
   `A_R(BT)` along the universal span and export
   `continuousTorusAction_coherentMUComparison`,
   `continuousTorusAction_coherentHZComparison` and
   `continuousTorusAction_coherentRComparison` for the specified models.
   Consume CC C1.5's fixed finite principal bundles
   `E_n=(S^(2n+1))^ℓ→B_n=(CP^n)^ℓ`, their inclusions and colimit universal
   comparison. Apply the nonuniversal total-space square at each n and
   compare it with the universal square along inclusions, retaining the
   entire coherent tower. The right action on each sphere factor is
   `(z_i)·(t_i)=z_i t_i`; the associated quotient for a left T-space is
   `(e·t,y)~(e,t·y)`. The diagonal left action uses the inverse as above.
   Construct `torusAction_freeMU_moduleBundle`, and its R-module version,
   sending Y to `P_R(Y)=R∧ᴸΣ∞Y₊` with that coherent action. Retain
   equivariant NDR-pair and mapping-cylinder cofibers, products, sums,
   model invariance and the actual fibre/associated-bundle comparisons.

   **Borel cochains and finite-base coefficient change.** For an equivariant
   pair (Y,A) use the cofiber of Σ∞A₊→Σ∞Y₊, comparing with Y/A under
   the stated NDR hypotheses. Define `D_R(Y,A)=F_R(P_R(Y,A),R)`, with
   contragredient transport. Construct `fibrewiseHZ_functionSpectrum_borelComparison`
   and `fibrewiseR_functionSpectrum_borelComparison` from the actual bar/Borel maps:
   `Γ_BT D_R(Y,A)≃F(Σ∞(ET×_T Y,ET×_T A),R)`. For compact supports, `Γ_BT C_c,R(U)` denotes fibrewise-supported Borel cochains from the supported finite-stage models; it is not compact-support cohomology of the total Borel space `ET×_T U`.
   Prove the corresponding finite B_n formulas, integer shifts, relative
   boundaries and cup/module action of R-cochains on the base. For Hℤ
   compare with G2.7/AT's single ordinary Borel cochain theory. Separately
   export `fibrewiseMU_to_HZ_homologyComparison`, identifying the coefficient
   change of P_MU(Y,A) with P_HZ(Y,A) and ordinary homology by G5.5;
   P and D are different objects.
   Prove `finiteBaseSectionsScalarComparison` over any specified finite CW
   base, for the actual Φ and coherent module families, by finite-cell
   section pullbacks and exactness of Φ. Construct the canonical function
   module comparison `Φ F_MU(P,Q)→F_HZ(ΦP,ΦQ)` and prove it an equivalence
   when P has a specified dual pair, including finite-cell/retract modules.
   Combine these for finite B_n mapping spectra; retain naturality on
   cofiber triangles and actual maps, not just homotopy groups.

   **Coherent Thom and Euler family.** For R=MU,Hℤ and a locally trivial
   complex vector bundle ν→C of rank m, specify a continuous T-action by
   complex-linear bundle maps covering the action on C. Form its Borel bundle
   `ET×_T ν→ET×_T C` and retain the induced maps. Construct its sphere-module
   line functor over `C_hT:=ET×_T C` and its
   actual Thom-colimit comparison. The universal normalized Thom cocone
   of G4.3–5/G5.4–5 induces an equivalence of that module-line diagram
   with constant Σ^(2m)R. Prove that the colimit adjunction sends the pointwise tensor of Thom classes to the Thom-diagonal/external product. Construct the natural transformation on the full Borel groupoid by its mapping-space adjunction; fibre class equality alone is not the construction. Push forward along C_hT→BT
   to export `fibrewiseThomOrientationComparison` and the actual natural
   zero-section map
   `e_ν:P_R(C)→Σ^(2m)P_R(C)` in A_R(BT).
   When C is T-fixed its underlying P_R(C) family is constant; e_ν still
   retains its BT-coherent information. Restrict to every B_n and retain
   ν_n over C×B_n in that case. Construct the Φ comparison on these full
   diagrams from the fixed G5.5 orientation map. Identify the Hℤ image
   with the canonical ordinary family by the full-base Thom mapping
   comparison on ν_T and its actual homotopy, then restrict the same
   homotopy to the finite tower. The standard coordinate character uses
   CC's tautological O(−1) convention, with Hℤ Euler class −h_i.
   Include m=0, empty C, pullback, products and relative maps.

   **Compact support objects and excision.** Consume CC C1.2's ordinary
   compact-support pair package and identify the Hℤ refinement with
   that same ordinary theory. For locally compact paracompact T-spaces
   define C_c,R(U) by the homotopy colimit, over invariant compact K⊂U,
   of the R-module cochains of the actual relative cofiber (U,U\K).
   Prove invariant supports cofinal by compact T-saturation.
   For a smooth T-manifold U use specified smooth T-action data, and nested
   compact T-invariant collared domains L_j with interiors covering U and
   finite CW boundary-pair models obtained from GeometricTopology's
   **The smoothing-and-triangulation comparison**, item1 **Smooth implies PL**,
   including the relative collar extension for these compact pieces. Use [SBC B1.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/791dd408dc48930060b28043245bbb1a8d82b5de/TauCetiRoadmap/SmoothBundlesConnections/README.md#b1-principal-bundles-and-descent)
   for proper free-action smooth quotients and submersion comparisons, and
   G4.0b/[CKG K7.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a452db2cfef888380d1b7b7ce00fa06d5bad1109/TauCetiRoadmap/ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples)
   for the actual smooth projective-space stage charts; these are inputs,
   not duplicated geometric owners. Prove the coherent comparison
   `C_c,R(U)≃hocolim_j F_R(R∧Σ∞(L_j/∂L_j),R)`.
   Construct the transition maps by actual support collapse/excision and
   prove cofinal-exhaustion independence. Construct the mixed support product
   `D_R(U)⊗_R C_c,R(U)→C_c,R(U)` from the relative diagonal, including
   its finite Borel base-cochain action and Hℤ/CC comparison.
   Use native `OnePoint` models for the specified tame U⁺ cases. Use AT6.4's compact-domain pair
   zigzag and GT's exterior collars to compare with relative support
   cofibers. For a vector bundle over compact C with a specified invariant
   metric, prove the radius-exhaustion identification with its Thom
   compactification; for U=int W with W compact equivariantly collared
   prove the W/∂W identification. For an open j:U→V
   construct `j_!:C_c,R(U)→C_c,R(V)` by excision on supports; for a proper
   map f construct the opposite-direction proper pullback, with its
   actual compact-preimage maps. Build the localization triangle for
   specified compactifications V=K\A, Z=L\(A∩L), U=K\(A∪L), where
   A,L⊂K form a T-invariant common CW/NDR excisive triad, by the quotient cofiber
   `L/(A∩L)→K/A→K/(A∪L)`; use `K₊` and `L₊` for empty collapsed
   subspaces, and extend through compatible compact exhaustions.
   Include corners/rounded compact-pair models, connecting maps and their
   suspension signs. The geometry supplying such presentations is data.

   **Vertical support duality.** Specify an equivariant complex bundle V of
   complex rank `(d+a)/2` over U and an equivariant real bundle isomorphism
   `TU⊕ε^a_ℝ≃V_ℝ`, with trivial T-action on the ordered trivial summand.
   Include the induced Borel construction and maps as part of the bundle data.
   Given a stable choice of N with N+a even and compatible vertical
   identifications `ν_v⊕T_v≃ε^N` and `ν_v⊕V_ℝ≃ε^(N+a)`, orient the normal
   Thom line by `L(ν_v)≃L(V)^(−1)⊗L(ε^(N+a))` using this specified
   isomorphism and G5.5's interleaved convention. Record the block-order
   conversion between `ν_v⊕T_v` and `T_v⊕ν_v`, with sign
   `(−1)^((N−d)d)`, and include the isomorphism, inverse and complement
   choices in the coherence data. Construct the oriented equivalence
   `compactSupportModuleDuality:C_c,R(U)≃Σ^(−d)P_R(U)`, d=dim U,
   for R=MU and its ordinary coefficient change. Extend G5.2's geometric
   adapter to compact collared boundary pairs by smooth doubling, relative
   normal collapse and the specified Thom orientation on the original pair.
   Obtain the finite CW models of these compact doubled families from the
   same GT smooth-triangulation item1 and relative collar extension. For each
   finite-stage proper smooth submersion with compact fibres, consume
   CC C2.5's graph embedding and fibrewise tube. Own only the stabilized relative extension over the tower and compact
   parameter simplices, and its spectral collapse comparison. Construct the
   parametric comparison
   over B_n from fibre-preserving embeddings into B_n×ℝ^N, vertical normal
   bundles with `ν_v⊕T_v≃ε^N`, and vertical tubes; prove the stable relative
   embedding/tube and collapse homotopies. The shift is vertical dimension d.
   Extend coordinate maps near the prescribed neighbourhood by the chosen
   retractions and charts; make the cutoff depend only on base and parameter
   points. Stabilization increases the real rank by an even number, appending
   the ordered complex block in the last ambient coordinates.
   For an open inclusion `j:U→V`, construct `j_!` by support excision
   independently of stable-complex compatibility. Identify it under vertical
   duality with the R-homology inclusion only when specified stable-complex
   data on V restricts under `TV|_U≃TU⊕ν` to the data on U and ν, with its
   Thom-line orientation coherence. For proper T-equivariant smooth embeddings of finite-dimensional Hausdorff
   second-countable manifolds with a specified coherent
   R-Thom orientation of the normal bundle, construct `equivariantNormalTube`:
   choose a smooth positive-definite ambient metric from DG12.1, average its pullbacks
   with RepresentationTheory/CompactGroups Layer0's normalized Haar measure,
   and prove smoothness and positive definiteness in bundle charts. Apply
   GT's metric-dependent normal-exponential tube and diffeomorphism
   naturality with the transported metric. Construct the compatible extended
   distance by native `EMetricSpace.ofRiemannianMetric` for this same
   averaged metric; use GT's T3 argument from the manifold hypotheses.
   Prove the normal complement and
   exponential map T-equivariant and choose a T-invariant positive radius
   by choosing a positive smooth minorant of the orbitwise minimum radius
   and averaging that minorant; retain shrinking on invariant compact supports. With that tube construct the
   compact-support Gysin map and its PT/cap comparison, with codimension shift. Compare its Hℤ map with CC C2.4 and AT cap/Poincaré–Lefschetz maps.
   Identify the Gysin map under duality with the covariant R-homology map only
   when the ambient stable-complex data restricts to the source data plus the
   normal Thom data with the stated orientation coherence. Prove Φ compatibility on finite boundary-pair objects using duality, then
   on their support colimit. For finite B_n identify sections with supported
   cochains of E_n×_T U using compactness and the cofinal domain exhaustion,
   and prove the filtered-colimit comparison.

   **Tower and mapping interfaces.** Construct the actual restriction
   towers of sections and mapping spectra over B_n, and prove their
   homotopy limits compute those over BT by the classifier colimit and
   coherent-diagram comparison. For supported objects retain the order
   `holim_n hocolim_j Γ_Bn D_R(L_j/∂L_j)`.
   Apply G3.8's Milnor exact sequence in every integer degree t, with kernel
   `lim¹_n π_(t+1)` and quotient `lim_n π_t`, to these section and
   mapping-spectrum towers. Construct the comparison identifying the limit
   in `Mod_R∞` with the required homotopy limit, including cofinal shifts and
   boundary diagrams; use G3.6 for the mapping-tower phantom kernel rather
   than duplicating either generic result.
   State Mittag–Leffler vanishing only with its actual degreewise hypotheses.
   Export the coefficient maps of these towers and their mapping limits.
   At BT export the canonical Φ/limit comparison map; its finite-base
   equivalences do not assert that Φ commutes with the infinite limit.
   For constant finite-free P and T-fixed C, put Q=P_R(C) and retain a
   specified finite-free presentation of Q as additional data. Construct
   `torusFiniteFreeMappingEulerInterface`: the mapping spectrum
   in A_R(BT), its restriction tower, the map induced by postcomposition
   with the coherent e_ν, and the finite-stage coefficient squares.
   Retain specified presentations as data rather than infer freeness
   from compactness of C.

   **Extensions with specified nullhomotopies.** For an actual cofiber
   triangle A→B→C→ΣA in A_R(BT), or over a finite B_n, construct
   `fibrewiseModuleExtension_classification`. Identify the space of sections
   of B→C over id_C with the path space from its connecting map δ to zero
   in the derived mapping space Map(C,ΣA). A specified path constructs
   `[i,s]:A⊕C≃B` under A and over C. Prove the mapping-space equivalence,
   dependence on the path, pullback/coefficient compatibility and its
   finite filtered-diagram form with compatible paths and finite direct sums
   formed within one common filtration level. These maps and paths use the full coherent mapping space.


## Dependency order and acceptance

G3.8's structured zeroth Postnikov construction uses G2.4's spectral SM7,
the positive-flat commutative/free-operadic models and G2.7's HA. Independently,
G5.4 constructs the single coherent MU from G2's models and its structured-bundle inputs.
G5.5 constructs that MU's TopK-compatible unit-cell comparison, then uses
it and G3.8's P0 for the fixed complex ordinary augmentation. Its normalized
Thom comparison uses G4.3–5, and its free-module scalar change uses G2's
module models.

G5.7 applies G2's models/classifiers, G4's Thom core, G5.1–2's finite/geometric
duality and G5.4–5's fixed MU/ordinary augmentation. Its coherent model and
module-family comparisons consume only BordismFormalGroups F6.5's named
generic model, enriched-diagram, coherent-stability, Kan-extension,
arbitrary-base marked-straightening with the direct coCartesian
space-valued restriction, LM module-fibre, and operator-category
unit-adjoined monoidal-localization/relative-adjunction sublanes. G5.7 owns
the `Sing(T)` action and `S=N_hc(C_G)` classifier adapter, using the
fibrant rigidification counit. It owns the projective free-cell proofs,
principal/associated quotient maps, total-space/colimit comparison and
universal span to `Sing(BT)`; finite and nonuniversal bundles retain their
own classifying maps into S. These are not supplied by generic F6.5. CC C1.2
supplies ordinary compact supports, C1.5 the finite torus classifier, C2.4
the ordinary embedding Gysin map and C2.5 the fibrewise graph embedding and
tubular comparison. AT supplies relative/CW/tower maps; GT supplies normal
bundle/collar geometry and smoothing-and-triangulation item1 with relative
collar extension for compact pieces and doubled families. SBC B1.4 supplies
smooth free quotients, and G4.0b/CKG K7.1 the projective stage charts.
CompactGroups Layer0 supplies normalized Haar averaging for the equivariant
normal-tube adapter. G5.7 owns the stabilized relative parameter/tower
extension and spectral collapse, consuming the finite-stage CC C2.5 inputs.
G5.7 applies G3.8's tower limit and Milnor sequence and G3.6's phantom
analysis, proving only the module-enhancement/section-tower identifications.
G5.7 owns the relative/vertical-duality and action/tower adapters on these
inputs before any mapping/Euler or extension application.

G3.8 first constructs derived tower limits and generic spectral covers;
G3.9 then constructs localizations/completions. G3.10's unstable mapping
continuity uses only early G2.10/CW foundations. The K-cover specialization
follows G5's K models.
G5.0 constructs the stable Spin classifier and its all-CW lift comparison
before Thom spectra and ABS. Its inverse/coherence supplement consumes TopK's based shear inverse.
Only the low-homotopy supplement consumes the independent real Bott/stable-O
supplier before StringOrientation defines λ and BString; neither supplement
uses TB coefficients or String conclusions.

G2.10's raw path/lifting construction and native Serre-predicate comparison
use G2.1. Its fibration LES application follows DGF1.2 and precedes
DGF1.4, which precedes G2.7's HA/ordinary comparison.
SpinGeometry G1.3's scalar trace precedes G5.5's mixed Cartan positivity
and real-module norm/regularity construction, with no returned input.
G1's axiomatic lane and G2's pointed/model lane start independently. G2's
represented theories use G1's comparison conventions. The foundational
G2.1 realization-product export precedes both AT EM adapters and HA. G2.8's
multiplicative machine and G2.9's general group/bar classifier precede G5. G3 Brown uses G1 and the
CW substrate; its spectrum assembly and infinite mapping comparisons use G2.
G3.4's topological telescope/Milnor construction starts after G1 and precedes
G3.1's Brown construction and G3.3's infinite comparison; its spectral version
uses G2. G3.6's mapping-tower sequence precedes the operation/product-lifting
part of G3.2. G4.0a's quaternionic and native low-rank Spin topology precedes
G2.9's GL computations, G4's orientation proofs and G5. G2.9's generic
bar/classifier construction precedes those computations and does not use them.
G4.0b's smooth carriers consume G4.0a, native embedded-unitary Lie data
and SBC B1.4 (itself consuming LieGroups L2), ComplexKahlerGeometry
K1/K7.1's real projective atlas and AT4.6's RP, with no return edge;
G2.9 and G4/G5's topological/spectral exports do not wait for G4.0b.
G4.0a/b consume TopK T1.5–6's carrier/classifier foundation; they do not
consume T6.6, which instead uses G4.0b's smooth comparison.
RiemR1 and DGFloer's smooth HP examples consume G4.0b with no returnedge.
G4's cell/cover proofs use G1 and G3; its concrete examples and infinite Thom
comparison use G2. G5 duality/Thom models use G2–G4 plus the specified geometric
and bundle-classifier suppliers. G5's rational comparison uses HA and the
rational-sphere proof and does not use rational bordism coefficients as input.

Acceptance includes all of these checks:

- The sphere coefficient sign is `Eⁿ(*)=π_(−n)E`; negative-degree groups and
  suspension inverses are tested with KU/KO Bott shifts.
- Arbitrary wedges, unbounded CW dimensions and relative pairs occur in the
  proved Brown/comparison interfaces; finite-source formulas keep their bounds.
- The S¹ reduced ideal squares to zero by its diagonal nullhomotopy.
- A nonsemistable spectrum distinguishes naïve and derived homotopy; a nonzero
  phantom example distinguishes inverse limits from mapping groups.
- Every telescope/Milnor arrow agrees with the AT tower carrier and connecting
  signs, and countable-open-exhaustion assumptions are explicit.
- Relative Leray–Hirsch retains F₀ and the graded finite free basis; the Thom
  square formula and orientation-change maps have their actual carriers.
- HZ's failed real-all-bundles orientation is compatible with RP∞/RP², and
  quaternionic/KSp examples use their actual bundles and KO-module grading.
- The generic Thom model, sphere stem, HA ordinary theory, KU/KO and geometric
  duality comparisons commute with the named suppliers' structure maps.

## References and formalization grounding

- Hovey, Shipley and Smith, [*Symmetric spectra*](https://arxiv.org/abs/math/9801077),
  JAMS 13 (2000), §§1–5: the chosen model, smash, stable equivalences, comparison
  and semistability. Adopt native Mathlib category/model/localization vocabulary.
- J. F. Adams, *Stable Homotopy and Generalised Homology*, Part III,
  Chapters 2–4 and 9–10: spectral representation, stable maps, products and
  boundary conventions. The symmetric model above supplies the point-set
  monoidal construction rather than retaining a second category of spectra.
- Mandell, May, Schwede and Shipley, [*Model categories of diagram spectra*](https://math.uchicago.edu/~may/PAPERS/mmssLMSDec30.pdf):
  positive model structures, commutative rings and multiplicative diagram comparisons.
- Brooke Shipley, [*A convenient model category for commutative ring spectra*](https://www.math.uic.edu/~bshipley/com4.pdf):
  the flat/convenient commutative model and underlying-spectrum replacements.
- Stefan Schwede, [*Symmetric spectra*](https://www.math.uni-bonn.de/~schwede/SymSpec-v3.pdf),
  Chapter I Examples1.17–1.20 and the multiplicative comparisons: canonical Thom
  models and the actual real/imaginary-coordinate loop construction.
- Elmendorf and Mandell, [*Rings, modules, and algebras in infinite loop space theory*](https://arxiv.org/abs/math/0403403):
  the multiplicative machine and comparison/rectification, beyond Segal's additive construction.
- McDuff and Segal, [*Homology fibrations and the group-completion theorem*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/mcduff-segal.pdf):
  the group-completion proof used with the Γ/permutative input.
- Michael Joachim, [*A symmetric ring spectrum representing KO-theory*](https://doi.org/10.1016/S0040-9383(99)00063-4),
  Topology40(2001),299–308: the positive-Ω operator-model homotopy type.
- Michael Joachim, [*Higher coherences for equivariant K-theory*](https://doi.org/10.1017/CBO9780511529955.006),
  §6, and Hebestreit–Sagave, [*Homotopical and operator algebraic twisted K-theory*](https://doi.org/10.1007/s00208-020-02066-6),
  §§6–7: the Clifford/operator ABS construction and multiplicative comparison
  of its Spin Thom model; G5 uses only the untwisted real/complex field models.
- Graeme Segal, [*Categories and cohomology theories*](https://ncatlab.org/nlab/files/SegalCategoriesAndCohomologyTheories.pdf):
  Γ-spaces, group completion and the infinite-loop machine; G2.8 includes
  the full multiplicative/rectification and localization targets needed here.
- Ralph L. Cohen, [*Bundles, Manifolds, and Homotopy*](https://math.stanford.edu/~ralph/bookR4.pdf),
  Chapter 10: Brown representation, represented theories, orientations and
  finite stable duality; the exact generality in this roadmap is definitive.
- Haynes Miller, [*Notes on Cobordism*](https://math.mit.edu/~hrm/papers/cobordism.pdf),
  Chapter 1 §§2–5 and Chapter 2 §§1–2: Thom/spectrum and orientation interfaces.
- Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  §§4.1, 4.3 and 4.E: CW, ordinary EM/Brown and unstable prerequisites.
- Joël Riou's [topcat-model-category project](https://github.com/joelriou/topcat-model-category)
  and Mathlib [#41744](https://github.com/leanprover-community/mathlib4/pull/41744),
  [#44464](https://github.com/leanprover-community/mathlib4/pull/44464) and
  [#41735](https://github.com/leanprover-community/mathlib4/pull/41735): follow
  their model/properness/subdivision/homotopy-pullback design, building missing
  constructions in Tau Ceti under the stated ownership.
- Native foundations: `SSet`, simplicial boundary/horn/Kan constructions,
  `CategoryTheory.Under`, `Action`, `Mon`, `Mod`, `DayFunctor`, native
  `HomotopicalAlgebra.ModelCategory` and categorical localization. The pin
  supplies these component APIs; it does not supply a category of spectra,
  the complete stable model structure or Brown representation.

Use the development direction of current Mathlib simplicial homotopy/model-
category work. The ordinary/topological/stable-sphere contracts above remain
single owners; their spectral comparison maps are work here.
