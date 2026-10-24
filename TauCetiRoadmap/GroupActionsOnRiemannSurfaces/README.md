# Roadmap: finite group actions on compact Riemann surfaces

A finite group `G` acts faithfully by biholomorphisms on a compact Riemann surface `X` of genus
`g ≥ 2` with quotient `X/G` of genus `h` and `r` branch points of orders `m₁ ≤ … ≤ m_r` exactly
when `G` has a **generating vector** of **signature** `(h; m₁, …, m_r)`: elements
`a₁, b₁, …, a_h, b_h, c₁, …, c_r` generating `G`, with `c_j` of order exactly `m_j` and

```text
⁅a₁, b₁⁆ ⋯ ⁅a_h, b_h⁆ · c₁ ⋯ c_r = 1,
```

subject to the Riemann–Hurwitz relation `2g − 2 = |G| (2h − 2 + Σ_j (1 − 1/m_j))`. The LMFDB's
*higher genus curves with automorphisms* section (`hgcwa`, the tables `hgcwa_passports`,
`hgcwa_unique_groups`, `hgcwa_complete`) is a table of these generating vectors for `2 ≤ g ≤ 15`
with `h = 0` and for `2 ≤ g ≤ 4` with `h > 0`, organized into *families* `(g, G, σ)`, *refined
passports* (the vector of conjugacy classes of the `c_j`), *braid classes* and *topological
classes*, and decorated with the quotient genus, the dimension `3h − 3 + r` of the family, whether
`G` is the full automorphism group of the generic member of the family (and if not, which group
is), whether the curves are hyperelliptic or cyclic trigonal, and the group-algebra decomposition
of the Jacobian. This roadmap makes every one of those notions a Lean definition in Tau Ceti with
the theorems that make it well defined, and proves the existence criterion itself.

The two carriers are the combinatorial object, `GenVector G σ` (Layer 0), and the geometric
object, a faithful holomorphic `MulAction G X` on a compact Riemann surface carried by the
hypothesis stack Tau Ceti's `TauCeti.Analysis.Complex.RiemannSurface.*` modules already use
(Layer 1). The bridge between them is the Riemann existence criterion of Layer 2, proved in both
directions: a generating vector is a surface-kernel epimorphism from the Fuchsian group of the
signature, whose kernel uniformizes `X`; an action yields the monodromy of the quotient map
`X → X/G` on the standard generators of the fundamental group of the punctured quotient.
Everything the LMFDB displays is then a function of the generating vector, and every invariant
is proved to depend only on the equivalence class the LMFDB intends (simultaneous conjugation,
braid, topological). Suggested home: `TauCeti/GroupTheory/GeneratingVector/` for Layers 0 and
3–7's combinatorics, `TauCeti/Analysis/Complex/RiemannSurface/GroupAction/` for Layers 1, 2 and
the analytic halves of 6 and 7.

The section headed *Writing a roadmap* of the repository [`README.md`](../../README.md) is the
standard this document is held to. The companion [`Suggested.lean`](Suggested.lean) states only
what can be stated over Mathlib and the pinned Tau Ceti: signatures, generating vectors, their
actions, the signature group, `Aut X`, and the headline theorems whose statements use nothing
else. The targets that need a supplier roadmap's definitions or a construction longer than a few
lines (0.4, 0.5, 0.7, 1.3, 1.4, 2.5, 7.6) are specified here only, each with its definition and a
**Checks** list. The file is not the specification and not exhaustive.

## Prerequisites

- **Mathlib** (at the pin): `PresentedGroup`, `FreeGroup`, `Subgroup.closure`, `commutatorElement`,
  `orderOf`, `ConjClasses`, `MulAut.conj`, `MulAction`, `FaithfulSMul`, `MulAction.stabilizer`,
  `MulAction.orbitRel`, `MulAction.fixedBy`, `Equiv.Perm`, `Representation`, `FDRep`,
  `Representation.character`, `MonoidAlgebra`, `ChartedSpace ℂ X`, `IsManifold`, `MDifferentiable`,
  `mfderiv`, `UpperHalfPlane` with its `PSL(2, ℝ)` action.
- **Tau Ceti** (at the pin): the modules listed under *What Tau Ceti supplies*.
- **Roadmaps.** [Fuchsian orbifolds](../FuchsianOrbifolds/README.md) Layers 2, 4, 4a, 5;
  [Belyi maps](../BelyiMaps/README.md) Layers 0, 1, 4–8; [algebraic curves](../AlgebraicCurves/README.md)
  Layers 11–12; [modular forms](../ModularForms/README.md) Layer 10B; [the Jacobian
  challenge](../JacobianChallenge/README.md) Layers D–F; [complex tori](../ComplexTori/README.md)
  Milestone 1; [complex curve moduli](../ComplexCurveModuli/README.md) D0; the roadmaps *Inverse
  Galois theory and arithmetic fundamental groups* (`../InverseGaloisAndArithmeticFundamentalGroups`,
  IG.3.2, IG.5.2), *Teichmüller geometry of closed surfaces* (`../TeichmullerGeometry`, T6, T7, T9)
  and *Surface topology* (`../SurfaceTopology`, Layers 7–9).
- **Siblings**, named only at their boundary: `CanonicalModelsAndGonality` (6.1–6.7),
  `HyperellipticCurves` (1.4), `FiniteGroupInvariants` (isomorphism invariants of the abstract group `G`).

## Scope and ownership

### Owned here

- **Signatures** `(h; m₁, …, m_r)` with their Riemann–Hurwitz quantity
  `μ(σ) = 2h − 2 + Σ (1 − 1/m_j)`, hyperbolicity `μ(σ) > 0`, and the genus
  `g(n, σ) = 1 + n μ(σ)/2` of an action of a group of order `n` (Layer 0).
- **Generating vectors** `GenVector G σ`: the carrier, its product relation and order conditions,
  the signature group `Γ(σ)` with its standard presentation, the equivalence between generating
  vectors and surface-kernel epimorphisms `Γ(σ) → G`, transport along group isomorphisms, the
  `Aut(G)`-action and the `Inn(G)`-action (simultaneous conjugation), the specialization to Tau
  Ceti's `TriangleGroup` and `PermutationTriple` when `h = 0`, `r = 3` (Layer 0).
- **Actions on compact Riemann surfaces**: faithful holomorphic actions of a finite group, the
  quotient Riemann surface `X/G`, branch points, stabilizer orders, the quotient genus, the
  signature of an action, Riemann–Hurwitz in signature form, the representation of `G` on
  holomorphic differentials (Layer 1).
- **The Riemann existence criterion**: `G` acts on some compact Riemann surface of genus `g ≥ 2`
  with signature `σ` iff `GenVector G σ` is nonempty and `g = g(|G|, σ)`, with the explicit
  constructions in both directions and their compatibility (Layer 2).
- **Equivalences of generating vectors**: refined passports (the conjugacy-class vector), braid
  equivalence through the Hurwitz braid action, topological equivalence through `Aut(G)` and the
  mapping class group, the theorem that topologically equivalent actions are exactly the
  `Aut(G) × Mod`-orbits, the identification of topological equivalence with `Aut(G) × B_r`
  for `h = 0`, and the finite counts of each kind of class (Layer 3).
- **Numerical invariants**: `g0`, `r`, `dim = 3h − 3 + r`, the finiteness of the set of
  `(G, σ)` of a given genus with the bounds `r ≤ 2g + 2 − 4h`, `h ≤ g`, `|G| ≤ 84(g − 1)`; the
  Hurwitz bound as a corollary of the criterion, with its equality case `σ = (0; 2, 3, 7)`;
  Harvey's criterion for cyclic groups and the Wiman bound `|G| ≤ 4g + 2` for cyclic `G` with its
  equality case (Layer 4).
- **Full automorphism groups**: the predicate that an action is the full automorphism group of
  its surface; generic fullness for a family; Singerman's list of signatures that never give a
  full action, with the index and the signature of the overgroup; the extension criterion on the
  generating vector that decides generic fullness, and the certificate interface for the
  overgroup's generating vector (Layer 5).
- **Macbeath's fixed-point formula** for an element of `G` in terms of the generating vector;
  the hyperelliptic and cyclic-trigonal predicates of a family and their decision procedures on
  the full group's generating vector (Layer 6).
- **The Eichler trace formula and the Chevalley–Weil formula** for the character of `G` on
  holomorphic differentials; the group-algebra decomposition of the Jacobian up to isogeny
  (Kani–Rosen, Lange–Recillas), the dimensions and multiplicities of its factors (Layer 7).
- **The hgcwa record semantics**: which stored field is which theorem, and the intrinsic label
  prefixes (Layer 8).

### Consumed, not redefined

- From Tau Ceti at the pin: `TauCeti.TriangleGroup a b c` (presentation
  `x ^ a, y ^ b, z ^ c, z * y * x`), `TauCeti.TriangleGroup.lift`, `homEquiv`, `rotate`,
  `orbifoldEulerChar` with its sign trichotomy (`TauCeti.GroupTheory.TriangleGroup.Signatures`);
  `TauCeti.PermutationTriple` (`σinf * σ1 * σ0 = 1`), `monodromyGroup`, `IsConnected`, `genus`,
  `PassportSpec`, `passportOf`, `PassportLabel`; `TauCeti.BraidGroup n`;
  `TauCeti.RiemannSurface.localMultiplicity`, `degree`, `FiniteHolomorphicMap`,
  `FiniteHolomorphicMap.ofMDifferentiable`, `ramificationDegree`, `ramificationDivisor`,
  `degree_eq_fiber_sum`; the Fuchsian stabilizer and linearization API
  (`Subgroup.LinearizingCoordinate`, `stabilizerRotation`, `quotientCoordinate` in
  `TauCeti.Analysis.Complex.Fuchsian.Elliptic.Linearizing`); the function-field automorphism
  theory `TauCeti.natCard_le_eighty_four_mul_genus_sub_one`, `TauCeti.hurwitz_genus_formula`,
  `IsHyperellipticFunctionField`; `TauCeti.Representation.characterSum` and the primitive central
  idempotents `e_ρ = (χ(1)/|G|) Σ_g χ(g⁻¹) g` with their orthogonality and sum
  (`TauCeti.RepresentationTheory.CharacterTable.{CentralIdempotent, IdempotentDecomposition}`).
- From Tau Ceti main, cited by module path only (not imported by `Suggested.lean`): the finiteness of the
  automorphism group of a function field of genus `≥ 2`
  (`TauCeti.finite_algEquiv_of_two_le_genus`,
  `TauCeti/FieldTheory/FunctionField/Automorphism/HigherGenus.lean`); the local normal form and
  the sphere maps `TauCeti/Analysis/Complex/RiemannSurface/{LocalNormalForm, SphereMap,
  PowerMap}.lean`; the Fuchsian fundamental polygon `TauCeti/Analysis/Complex/Fuchsian/
  {FundamentalPolygon, Elliptic/Polygon}.lean`.
- From [Fuchsian orbifolds](../FuchsianOrbifolds/README.md): Layer 2 items 3–6 (the Poincaré
  polygon theorem, the Dirichlet polygon of a cofinite group, the standard presentation with
  elliptic and parabolic cycles, hyperbolic triangle groups from reflections); Layer 4 (the
  compactified quotient as a compact Riemann surface; for a cocompact group the coarse quotient
  itself); Layer 5 items 1–3 and 6 (the topological genus `genus X` with `χ = 2 − 2 genus`, finite
  holomorphic maps and degree, the Euler-characteristic form of Riemann–Hurwitz
  `χ(X) = deg f · χ(Y) − ramificationDegree f`, the Fuchsian Riemann–Hurwitz and orbifold
  Euler characteristic). Its *Layer 4a* minimum-area theorem (`π/21` for compact orientable
  hyperbolic orbifolds) is consumed for the Hurwitz bound's constant.
- From [Belyi maps](../BelyiMaps/README.md): Layer 0 (permutation triples, relabeling, monodromy
  group, connectedness, genus), Layer 1 (passports, `N_{S_n}(G)`-orbits), Layer 4 (triangle groups
  and the trichotomy), Layer 5 (the thrice-punctured sphere and its peripheral loops), Layer 6
  (the monodromy triple of a finite cover, deck transformations, regular covers), Layer 7 (filling
  punctures, the branched covering map, uniqueness of the compactification), Layer 8 (the
  compact-Riemann-surface hypothesis stack 8.1, the local normal form 8.2, analytic Riemann
  existence 8.6). Its pinned product relation `σinf * σ1 * σ0 = 1` and its `0, 1, ∞` ordering are
  matched by the dictionary of 0.7 below.
- From the roadmap *Inverse Galois theory and arithmetic fundamental groups*
  (`../InverseGaloisAndArithmeticFundamentalGroups`): IG.3.2's `BranchTuple r G`,
  `BranchTuple.product` (the ordered product `g₁ * ⋯ * g_r`), `BranchTuple.generated`,
  `NielsenClass.inner`, `HurwitzMove.apply` (`(a, b) ↦ (a b a⁻¹, a)`) and
  `HurwitzAction.action : TauCeti.BraidGroup r →* Equiv.Perm (BranchTuple r G)` with
  `product_action`, `generated_action`, `classes_action`; IG.5.2's marked topological Hurwitz
  spaces and `HurwitzMarking.forget`. The `c`-part of a generating vector with `h = 0` is a
  branch tuple with product one, and braid equivalence (3.3) is the orbit relation of that action.
- From *Teichmüller geometry of closed surfaces* (`../TeichmullerGeometry`): T6 (mapping classes
  realizing automorphisms, stabilizers), T7 (the fixed locus in `Teich(Σ)` of a finite subgroup of
  the mapping class group, its identification with the Teichmüller space of the quotient
  orbifold, its complex dimension `3h − 3 + r`, and `r ≤ 2g + 2 − 4h`), T9 (the generic
  maximality of the uniformizing group outside Singerman's list).
- From *Surface topology* (`../SurfaceTopology`): Layer 7 (the edge-path group of a surface map
  and its standard presentation), Layer 8 (classification of compact surfaces), Layer 9 (mapping
  class groups `MappingClassGroupPlus`, Dehn twists, Lickorish generators).
- From [algebraic curves](../AlgebraicCurves/README.md) Layer 11 (automorphisms of function
  fields, rigidity, finiteness, the `84(g − 1)` bound, the characteristic-`p` caveats) and Layer
  12 (the dictionary between compact Riemann surfaces over `ℂ`, function fields and curves); from
  [modular forms](../ModularForms/README.md) 10B (the meromorphic function field `ℳ(X)` of a
  compact Riemann surface is a function field over `ℂ` of the same genus, `H⁰(X, Ω)` has dimension
  `g`, analytic Riemann–Roch).
- From [the Jacobian challenge](../JacobianChallenge/README.md): `JacobianVariety X x₀` as an
  abelian variety over `ℂ` with `dim Jac X = g` (Layer D–E), the Abel–Jacobi map and the
  Albanese property (Layer F), isogenies and `End(Jac X) ⊗ ℚ` (Layer E); from
  [complex tori](../ComplexTori/README.md) Milestone 1 the analytic Jacobian and its comparison.
- From the siblings: `CanonicalModelsAndGonality` 6.1–6.2 (quotient of a function field by a
  finite group, quotient genus in orbit form), 6.3 (fixed points of involutions), 6.6
  (`IsCyclicTrigonal k F`), 6.7 (the hgcwa booleans stated on the function field);
  `HyperellipticCurves` 1.4 (a curve of genus `g ≥ 2` is hyperelliptic iff it has an involution with
  exactly `2g + 2` fixed points, equivalently with genus-zero quotient, and the hyperelliptic
  involution is central; its uniqueness is that of the index-two subfield, consumed there in Layer 0);
  `FiniteGroupInvariants` (the isomorphism invariants of the abstract group `G`; the small-group
  identifier `n.d`, the `a-b` component of every hgcwa label, is not a target).

### Not owned here

- **Label components beyond the intrinsic prefix, orderings fixed by convention, stored lists, and
  the completeness of database tables** are not targets: the refined-passport index `x`, the vector
  index `y`, the `cc`/`braid`/`topological` representative pointers, the Magma character indices in
  `jacobian_decomp`, the stored class order, the permutation representation `G ↪ S_{|G|}` in which
  `gen_vectors`, `hyp_involution`, `cinv` are displayed, and every completeness claim about the
  stored tables. The composition of stored permutations is pinned in *Pinned conventions* 1. This
  roadmap states the intrinsic *prefix* of each label (genus, isomorphism class of `G`, quotient
  genus, sorted signature, class vector) and nothing enumerative.
- **The small-group identifier** `n.d` (not a target; the isomorphism invariants of the group it
  names are `FiniteGroupInvariants`'); `group`, `group_order`, `full_auto` are the
  isomorphism class and order of an abstract finite group.
- **Function-field predicates and quotient curves over a general field**
  (`CanonicalModelsAndGonality` Layer 6, [algebraic curves](../AlgebraicCurves/README.md) Layers
  6–7, 11). Layer 6 here proves the generating-vector criteria over `ℂ` and the agreement with
  those predicates through the meromorphic function field.
- **Weierstrass equations** (`eqn`): `HyperellipticCurves` for `y² = f(x)`; equations of
  non-hyperelliptic families are excluded below.
- **Riemann existence for covers of arbitrary curves, Nielsen classes, Hurwitz spaces, lifting
  invariants, rigidity, fields of moduli** (`../InverseGaloisAndArithmeticFundamentalGroups`);
  **Teichmüller space and the fixed-locus theorem** (`../TeichmullerGeometry`); **mapping class
  groups and the classification of surfaces** (`../SurfaceTopology`); **Fuchsian groups,
  presentations, compactification, Riemann–Hurwitz for finite holomorphic maps**
  ([Fuchsian orbifolds](../FuchsianOrbifolds/README.md)); **three-point covers and dessins**
  ([Belyi maps](../BelyiMaps/README.md)).
- **The Jacobian as a scheme, abelian varieties, isogenies, `End ⊗ ℚ`** ([Jacobian
  challenge](../JacobianChallenge/README.md)); **complex tori** ([complex tori](../ComplexTori/README.md));
  **endomorphism algebras and Sato–Tate groups** (`SatoTateGroups`). Layer 7 proves only what the
  group action adds.
- **Positive characteristic** and the failure of the Hurwitz bound there
  ([algebraic curves](../AlgebraicCurves/README.md) Layer 11). Everything here is over `ℂ`.

### The hgcwa page, column by column

| Column / search field | Meaning | Where |
| --- | --- | --- |
| `genus` | `g = genus X = g(|G|, σ)` | 0.4, 1.4, 2.5 |
| `group`, `group_order` | isomorphism class and order of `G` | invariants `FiniteGroupInvariants`, identifier not a target; `Nat.card G` |
| `signature` `[g0, m1, …, mr]`, `g0`, `r` | the signature of the action, quotient genus, number of branch points | 0.1, 1.3, 1.4 |
| `dim` | `3 g0 − 3 + r` | 4.2 |
| `gen_vectors` | a generating vector, displayed in the regular permutation representation | 0.2 (carrier); composition pinned (*Pinned conventions* 1); the display representation is not a target |
| `con`, `cc`, `passport_label` | the refined passport (class vector); its index | 3.1; index not a target |
| `braid`, `braid_class` | braid equivalence class; its representative | 3.3; representative not a target |
| `topological`, `topological_class` | topological equivalence class; its representative | 3.4–3.6; representative not a target |
| `hgcwa_unique_groups.gen_vectors / braid / topological` | numbers of classes of each kind | 3.7 |
| `full_auto`, `full_label`, `signH`, `inc_full` | the generic full automorphism group of the family, its signature | 5.1–5.5 |
| `hyperelliptic`, `hyp_involution`, `inc_hyper` | the family is hyperelliptic; the involution | 6.2–6.3 |
| `cyclic_trigonal`, `cinv`, `inc_cyc_trig` | the family is cyclic trigonal; the automorphism | 6.4 |
| `jacobian_decomp` `[a, b, c]` | `b` copies of an abelian variety of dimension `a` | 7.4–7.6; `c` is not a target |
| `label`, `total_label` | family and vector labels | prefixes 8.1; indices not targets |
| `eqn` | an equation of the family | `HyperellipticCurves`; otherwise excluded |
| `hgcwa_complete.*` | completeness of the stored tables | not a target; finiteness and the certificate interface 4.6 |

## Pinned conventions

Implementors make no choices about any of the following.

1. **Multiplication.** Products are Mathlib's: in `Equiv.Perm` and in `Aut X`, `(σ * τ) x = σ (τ x)`.
   A product `g₁ ⋯ g_r` of group elements is `(List.ofFn g).prod`, left to right. The commutator
   is Mathlib's `⁅a, b⁆ = a * b * a⁻¹ * b⁻¹` (`commutatorElement`). The LMFDB's stored vectors are
   permutations composed left to right, where `p` then `q` is Mathlib's `q * p`. Inversion turns
   that composition into Mathlib's (`(q * p)⁻¹ = p⁻¹ * q⁻¹`), so a stored vector satisfying 3
   under left-to-right composition is read (4.6) as its entrywise inverse, which satisfies 3 here
   with the same orders and the same generated subgroup. ⚠ A vector whose entries are all
   involutions cannot detect a wrong convention.
2. **Signatures.** A signature is a pair `σ = (h, m)` with `h : ℕ` and `m : Fin r → ℕ`, every
   `m j ≥ 2`, and `m` monotone (`m₁ ≤ … ≤ m_r`), as the LMFDB sorts it. `r = 0` is allowed
   (unramified actions). The orders of a generating vector are read in the order of `m`: `c_j` has
   order exactly `m j`. Riemann–Hurwitz is stated with the rational
   `μ(σ) = 2h − 2 + Σ_j (1 − 1/m_j)`, never with an unchecked natural-number subtraction; the genus of
   an action of a group of order `n` is `1 + n μ(σ)/2 : ℚ`, and the theorem that it is an integer
   `≥ 2` under the existence hypotheses is 2.5, not a definition.
3. **The product relation.** A generating vector satisfies
   `⁅a₁, b₁⁆ * ⋯ * ⁅a_h, b_h⁆ * c₁ * ⋯ * c_r = 1`, in that order, in Mathlib's multiplication.
   For `h = 0` the `c`-part is a `BranchTuple r G` of the inverse-Galois roadmap with
   `BranchTuple.product = 1`. The comparison with Tau Ceti's `TriangleGroup a b c`, whose relator
   is `z * y * x`, is the isomorphism `Γ(0; m₁, m₂, m₃) ≃* TriangleGroup m₃ m₂ m₁` sending
   `c₁ ↦ z, c₂ ↦ y, c₃ ↦ x` (0.7); the comparison with `PermutationTriple` sends `(c₁, c₂, c₃)` to
   `(σ0, σ1, σinf) = (c₃, c₂, c₁)`, so that `σinf * σ1 * σ0 = c₁ c₂ c₃ = 1`. Geometrically, the
   ordered branch points of the Belyi dictionary `0, 1, ∞` are `c₃, c₂, c₁`. No other reordering is
   introduced anywhere.
4. **Generation.** `Subgroup.closure (range a ∪ range b ∪ range c) = ⊤`. Generation is part of the
   carrier `GenVector G σ`; tuples satisfying only the relation and the orders are
   `SurfaceKernelHom`-images of subgroups and are not generating vectors.
5. **Surface-kernel epimorphisms.** `Γ(σ)` is `PresentedGroup` on `Fin h ⊕ Fin h ⊕ Fin r` with the
   relators `c_j ^ (m j)` and the product word of item 3. A homomorphism `φ : Γ(σ) →* G` is a
   *surface-kernel epimorphism* when it is surjective and `orderOf (φ (c j)) = m j` for every `j`.
   The equivalent statement "the kernel is torsion-free" is the theorem 2.2, and the torsion-free
   kernel is the surface group of genus `g`.
6. **Actions.** A `G`-action on a compact Riemann surface `X` is `[MulAction G X]` with
   `[FaithfulSMul G X]` and every `(g • ·) : X → X` holomorphic (`MDifferentiable 𝓘(ℂ) 𝓘(ℂ)`); `G` is
   `[Finite G]`. No private "group of automorphisms" structure is introduced: the full
   automorphism group of `X` is the subgroup `Aut(X) ≤ Equiv.Perm X` of holomorphic bijections, and
   a faithful action is its image `G ≃* image`. "Compact Riemann surface" is the hypothesis stack
   `[TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) n X] [T2Space X] [CompactSpace X]
   [ConnectedSpace X]` of Tau Ceti's `RiemannSurface` modules (`n = 1`) and of the Fuchsian
   orbifolds roadmap's topological genus (`n = ∞`); `g ≥ 2` is an explicit hypothesis of every
   statement that needs it.
7. **The quotient.** `X/G` is `MulAction.orbitRel.Quotient G X` with the quotient topology and
   the complex structure of 1.2, built from the linearizing coordinates at points with
   nontrivial stabilizer (the local model `z ↦ z^m`). The quotient map `π : X → X/G` is a
   `FiniteHolomorphicMap` of degree `|G|`; the branch points are the `y ∈ X/G` with fibre
   cardinality `< |G|`; the *order* of a branch point is the common order of the stabilizers of the
   points over it. The signature of the action lists those orders in nondecreasing order.
8. **Standard generators and the monodromy.** For a finite `B ⊆ Y` on a compact Riemann surface
   `Y` of genus `h` and `y₀ ∉ B`, standard generators of `π₁(Y ∖ B, y₀)` are `α_i, β_i` (`i ≤ h`)
   and `γ_j` (one counterclockwise loop around `b_j` and no other point of `B`) with the single
   relation `⁅α₁, β₁⁆ ⋯ ⁅α_h, β_h⁆ γ₁ ⋯ γ_r = 1` in Mathlib's `FundamentalGroup` multiplication. The
   monodromy of the regular cover `X ∖ π⁻¹B → Y ∖ B` is the monoid homomorphism
   `μ : π₁(Y ∖ B, y₀) →* G` with "the lift of `γ` from `x₀` ends at `μ(γ) • x₀`" (Belyi maps 6.1's
   convention). The generating vector of an action is `(μ α, μ β, μ γ)`; the dependence on the
   choice of standard generators and of `x₀` is the content of Layer 3.
9. **Rotation constants.** For `γ ∈ G` and `P ∈ X` with `γ • P = P`, the rotation constant
   `ζ_P(γ) : ℂ` is the derivative `mfderiv` of `(γ • ·)` at `P`, a primitive `|Stab(P)|`-th root
   of unity when `γ` generates the stabilizer. Eichler's trace formula (7.1) is stated with
   `ζ_P(γ)`; no `exp (2πi k/m)` is written into a statement except through `ζ_P`.
10. **The representation on differentials.** `ρ_Ω : G →* GL(H⁰(X, Ω))` is
    `ρ_Ω(γ) ω = (γ⁻¹)^* ω`, a left action; `γ^*` alone is contravariant and is never called "the
    representation". `χ_Ω` is its character. The rational representation is `H₁(X, ℚ)`, with
    character `χ_Ω + \bar χ_Ω`.
11. **Equivalences.** Simultaneous conjugation is the `Inn(G)`-action `g • v = (MulAut.conj g) ∘ v`;
    the LMFDB's "distinct generating vectors" are its orbits. A *refined passport* is `(g, G, C)` with
    `C j = ConjClasses.mk (c j)`. *Braid equivalence* (3.3) is: same `Inn(G)`-orbit after applying
    some `β : BraidGroup r` to the `c`-tuple through IG.3.2's `HurwitzAction.action`, `(a, b)`
    untouched; the LMFDB's displayed `Q_i` is the inverse of IG.3.2's generator `σ_i`, with the
    same orbits. *Topological equivalence* is 3.4's definition through `Aut(G)` and
    orientation-preserving homeomorphisms; the braid group enters only through the theorem 3.6.
12. **Hyperbolicity.** Every theorem about actions assumes `g ≥ 2`; equivalently (2.5)
    `μ(σ) > 0`. Spherical and Euclidean signatures (`μ ≤ 0`) are rejected by the predicate
    `IsHyperbolic σ`, not silently given a genus `0` or `1`.
13. **Fullness.** `IsFull (G, X)` means the image of `G` is all of `Aut(X)`. A *family* is the set of
    actions with a given generating vector up to topological equivalence; *generic fullness* (5.2)
    is fullness off a proper closed analytic subset of the fixed locus, and the LMFDB's `full_auto`
    is the full automorphism group of a generic member.
14. **Hyperelliptic and cyclic trigonal** are properties of the generic member of the family,
    decided on the generic full group: an involution with `2g + 2` fixed points, respectively an
    element of order `3` with `g + 2` fixed points. The LMFDB stores `hyp_involution` and `cinv`
    when they lie in `G`; Layer 6 proves the test gives the same answer on `G` and on the generic
    full group.
15. **The Jacobian decomposition** is an isogeny statement about `Jac X` over `ℂ` (Jacobian
    challenge Layer E) indexed by the primitive central idempotents of `ℚ[G]`. In the LMFDB's
    `[a, b, c]`, `a` and `b` are theorems here and `c` is not.

## What Mathlib supplies

Presented and free groups (`PresentedGroup`, `PresentedGroup.toGroup`, `closure_range_of`,
`FreeGroup.lift`); commutators, generation and orders (`commutatorElement`, `Subgroup.closure`,
`orderOf`, `orderOf_dvd_card`, `Nat.card`); conjugacy (`ConjClasses`, `IsConj`, `MulAut.conj`,
`Subgroup.normalizer`, `Subgroup.centralizer`); actions (`MulAction`, `FaithfulSMul`,
`MulAction.stabilizer`, `MulAction.orbitRel.Quotient`, `MulAction.fixedBy`, orbit–stabilizer);
permutations (`Equiv.Perm`, `Equiv.Perm.partition`); complex manifolds (`ChartedSpace ℂ X`,
`IsManifold 𝓘(ℂ) n X`, `MDifferentiable`, `mfderiv`, `UpperHalfPlane`, `PSL(2, ℝ)`); fundamental
groups and coverings (`FundamentalGroup`, `Path.trans`, `IsCoveringMap`, `IsCoveringMap.monodromy`);
representations (`Representation`, `FDRep`, `Representation.character`, `char_orthonormal`,
`MonoidAlgebra`, `Module.End.eigenspace`); `Finset.lcm`, `Nat.factorization`, `ZMod n`. Mathlib has
no surface groups, mapping class groups, Riemann–Hurwitz, uniformization, or holomorphic group
actions beyond `MulAction` plus pointwise differentiability.

## What Tau Ceti supplies

| Need | Tau Ceti (at the pin) |
| --- | --- |
| triangle groups, their trichotomy, lifts to permutation groups | `TauCeti.TriangleGroup`, `lift`, `homEquiv`, `hom_ext`, `rotate`, `equivTwoGenerator`, `toPerm`, `orbifoldEulerChar`, `orbifoldEulerChar_neg_iff`, `IsSphericalSignature`, `IsEuclideanSignature`, `infinite_of_inv_add_inv_add_inv_le_one` |
| permutation triples and passports | `TauCeti.PermutationTriple`, `monodromyGroup`, `IsConnected`, `eulerChar`, `genus`, `PassportSpec`, `passportOf`, `PassportLabel`, `Passport.Count`, `GeneratingCount` |
| braid groups | `TauCeti.BraidGroup n` (`ArtinGroup (CoxeterMatrix.A (n − 1))`) |
| finite holomorphic maps | `TauCeti.RiemannSurface.localMultiplicity`, `degree`, `degree_eq_fiber_sum`, `FiniteHolomorphicMap`, `ofMDifferentiable`, `comp`, `degree_comp`, `biholomorphOfDegreeEqOne`, `ramificationDegree`, `ramificationDivisor`, `card_fiber_add_sum_localMultiplicity_sub_one` |
| Fuchsian groups | `TauCeti.Analysis.Complex.Fuchsian.{ProperAction, Stabilizer, Elliptic.Basic, Elliptic.Linearizing, CoarseQuotient, Descent, MeromorphicDescent, Covolume, Compactification.*}` |
| function-field automorphisms | `TauCeti.natCard_le_eighty_four_mul_genus_sub_one`, `TauCeti.hurwitz_genus_formula`, `IsHyperellipticFunctionField`, `Automorphism.{Finite, FixedField, Rigidity, WeierstrassGaps}` |
| group algebra idempotents | `TauCeti.Representation.characterSum`, `characterSum_mem_center`, `characterSum_mul_characterSum`, `isUnit_char_one`, the primitive central idempotents and their sum in `CharacterTable.IdempotentDecomposition` |
| monodromy of three-point covers | `TauCeti.AlgebraicTopology.ThricePuncturedSphere.{MonodromyTriple, Deck, Regular, Classification, BranchPointAction}` |

## What is missing

Nothing in Tau Ceti or Mathlib names a signature with `h > 0` or `r ≠ 3`, a generating vector, a
surface-kernel epimorphism, a faithful holomorphic action of a finite group on a compact Riemann
surface with its quotient and branch data, the Riemann existence criterion in this form, braid or
topological equivalence of actions, the dimension `3h − 3 + r` as an invariant of a generating
vector, the Wiman bound or Harvey's criterion, Singerman's list, Macbeath's fixed-point formula,
the Eichler trace formula, the Chevalley–Weil formula, or the group-algebra decomposition of a
Jacobian. All of these are built here. The Fuchsian presentation of `Γ(σ)`, the topological genus,
Riemann–Hurwitz for finite holomorphic maps, mapping class groups and the fixed-locus theorem are
consumed from the roadmaps named above and are not rebuilt.

## The build, in layers

Every milestone names what it rests on: Mathlib, Tau Ceti at the pin, an earlier milestone of this
roadmap, or a cited milestone of another roadmap. Where a target has a Lean form in
[`Suggested.lean`](Suggested.lean), README names are the ones used there; the other names below are
the names the targets will take.

## Layer 0: signatures and generating vectors

Purely algebraic; nothing analytic is used. Sources: Breuer, *Characters and Automorphism Groups
of Compact Riemann Surfaces*, Chapter 3 (signatures, generating vectors, surface-kernel
epimorphisms); Broughton, *Classifying finite group actions on surfaces of low genus*, §§1–2.

### 0.1 Signatures and the Riemann–Hurwitz quantity

`Signature` is the structure of convention 2: `h : ℕ`, `r : ℕ`, `m : Fin r → ℕ`, `two_le : ∀ j, 2 ≤ m j`,
`mono : Monotone m`. Define `μ σ : ℚ := 2 h − 2 + Σ_j (1 − 1/m j)`, `IsHyperbolic σ := 0 < μ σ`,
`genusOfOrder σ (n : ℕ) : ℚ := 1 + n * μ σ / 2`, and `sortSignature (h : ℕ) (l : List ℕ) (hl : ∀ x ∈ l, 2 ≤ x) : Signature`
(sorting a list of orders, the LMFDB's `sort_sign`; an entry `< 2` is excluded by the hypothesis, not
mapped to a default). Prove: `μ σ ≥ −2`; `IsHyperbolic σ` is
decidable, holds for `h ≥ 2`, for `h = 1 ∧ r ≥ 1`, for `h = 0 ∧ r ≥ 5`, and fails for `h = 0 ∧ r ≤ 2`; for `r = 3`, `h = 0`, `μ σ = −orbifoldEulerChar m₁ m₂ m₃` (Tau Ceti), so the trichotomy of
`TauCeti.GroupTheory.TriangleGroup.Signatures` is the trichotomy of `μ`; `genusOfOrder σ n ≥ 2 ↔
n μ σ ≥ 2` for `n ≥ 1`. The minimum of `μ` over hyperbolic signatures is `1/42`, attained only at
`(0; 2, 3, 7)` (an explicit case analysis: for `h = 0, r = 3` with `m₁ ≤ m₂ ≤ m₃`, `(2, 3, m₃)` has
`μ = 1/6 − 1/m₃ ≥ 1/42` with equality only at `m₃ = 7`, `(2, 4, m₃)` has `μ ≥ 1/20`, `(2, m₂ ≥ 5, m₃)`
has `μ ≥ 1/10`, `(3, 3, m₃)` has `μ ≥ 1/12` and `m₁ ≥ 3, m₂ ≥ 4` gives `μ ≥ 1/6`; for `r ≥ 4` the
bound `μ ≥ 1/6` from `(0; 2, 2, 2, 3)`; for `h ≥ 1` the bound `μ ≥ 1/2` from `(1; 2)`). *Rests on:*
Mathlib `ℚ`; Tau Ceti `orbifoldEulerChar`.

### 0.2 The carrier

```lean
structure GenVector (G : Type*) [Group G] (σ : Signature) where
  a b : Fin σ.h → G
  c : Fin σ.r → G
  rel : (List.ofFn fun i => ⁅a i, b i⁆).prod * (List.ofFn c).prod = 1
  orderOf_c : ∀ j, orderOf (c j) = σ.m j
  closure_eq_top : Subgroup.closure (Set.range a ∪ Set.range b ∪ Set.range c) = ⊤
```

Prove `ext`, `Finite (GenVector G σ)` for finite `G`, the empty-vector case
(`GenVector G (0; ∅)` is nonempty iff `G = 1`, which is never hyperbolic), and that `GenVector G σ`
is empty when some `m j ∤ |G|`, when `h = 0` and `r = 1`, and when `h = 0 ∧ r = 2 ∧ m₁ ≠ m₂`
(in the last case `c₁ c₂ = 1` forces equal orders). *Rests on:* Mathlib.

### 0.3 Transport and the two natural actions

`GenVector.map (e : G ≃* H) : GenVector G σ ≃ GenVector H σ` (componentwise); the `Aut(G)`-action
`MulAction (MulAut G) (GenVector G σ)` by `α • v = v.map α`; the `Inn(G)`-action, i.e. the
`G`-action by simultaneous conjugation `g • v = (MulAut.conj g) • v`, with
`ConjClasses.mk ((g • v).c j) = ConjClasses.mk (v.c j)`. Define `GenVector.innClass v` as the orbit
in `MulAction.orbitRel.Quotient G (GenVector G σ)`; it is the LMFDB's "generating vector up to
simultaneous conjugation" and the set it ranges over is finite (0.2). *Rests on:* 0.2; Mathlib
`MulAut.conj`.

### 0.4 The signature group and its universal property

`SignatureGroup σ := PresentedGroup (signatureRelators σ)` on generators `Fin σ.h ⊕ Fin σ.h ⊕ Fin σ.r`
with relators `(of (inr j)) ^ (m j)` for each `j` and the product word of convention 3. Name the
generators `A i`, `B i`, `C j`. Prove the universal property as an equivalence

```lean
def SignatureGroup.homEquiv :
    (SignatureGroup σ →* G) ≃ { v : (Fin σ.h → G) × (Fin σ.h → G) × (Fin σ.r → G) //
      (List.ofFn fun i => ⁅v.1 i, v.2.1 i⁆).prod * (List.ofFn v.2.2).prod = 1 ∧
      ∀ j, (v.2.2 j) ^ (σ.m j) = 1 }
```

(`PresentedGroup.toGroup` plus `hom_ext`), that `A, B, C` generate `SignatureGroup σ`, and that
for `h = 0` the group is generated by `C₁, …, C_{r−1}` (`C_r` is the inverse of their product), so
`SignatureGroup (0; m)` is a quotient of the free group of rank `r − 1`. *Rests on:* Mathlib
`PresentedGroup`.

`SignatureGroup σ`, `A`, `B`, `C` are in `Suggested.lean`; the equivalence `homEquiv` is specified
here only: it sends `φ` to `(φ ∘ A, φ ∘ B, φ ∘ C)`, and its inverse is `PresentedGroup.toGroup` on
the generator assignment `Sum.elim a (Sum.elim b c)`. Only the power relations `c j ^ m j = 1` are
required, not exact orders and not surjectivity.

**Checks.**

- The trivial tuple corresponds to the trivial homomorphism, for every `σ`.
- `C₄` (additive) with `(0; 2, 2, 2, 2)`: the tuple `(2, 2, 2, 2)` satisfies the product relation
  and the power relations, so it is a homomorphism `Γ(σ) → C₄`, although it is not surjective
  and is rejected by `GenVector` (0.2).
- `C₂` with `(0; 2, 2, 2)`: the tuple `(ι, ι, ι)` has product `ι ≠ 1`, so no homomorphism sends
  every `C j` to `ι`.
- For `h = 0`, `r = 3`, composing with the isomorphism of 0.7 gives Tau Ceti's
  `TauCeti.TriangleGroup.homEquiv` with the three entries reversed.

### 0.5 Generating vectors are surface-kernel epimorphisms

`SurfaceKernelHom G σ := { φ : SignatureGroup σ →* G // Function.Surjective φ ∧ ∀ j, orderOf (φ (C j)) = σ.m j }`
and the equivalence `GenVector.equivSurfaceKernelHom : GenVector G σ ≃ SurfaceKernelHom G σ`,
restricting 0.4: surjectivity is `closure_eq_top` through `range_eq_closure`, and the order
condition is `orderOf_c`. Both actions of 0.3 correspond to post-composition with automorphisms of
`G`. *Rests on:* 0.2–0.4.

`SurfaceKernelHom` is in `Suggested.lean`; the equivalence `GenVector.equivSurfaceKernelHom` is
specified here only. It sends `v` to the homomorphism with `A i ↦ a i`, `B i ↦ b i`, `C j ↦ c j`.

**Checks.**

- `hyperellipticGenusTwoVector` (`C₂`, `(0; 2⁶)`) corresponds to the epimorphism `Γ(0; 2⁶) → C₂`
  sending every `C j` to the involution.
- `C₄` with `(0; 2, 2, 2, 2)` and the tuple `(2, 2, 2, 2)`: a homomorphism, not surjective, hence
  not a surface-kernel epimorphism, matching `closure_eq_top`'s rejection.
- The trivial homomorphism satisfies the power relations but is not a surface-kernel
  epimorphism when `r ≥ 1`: `orderOf 1 = 1 ≠ m j`.
- Counts transfer: `C₁₀` with `(0; 2, 5, 10)` has four surface-kernel epimorphisms, and
  `PSL₂(𝔽₇)` with `(0; 2, 3, 7)` has `336` (worked examples).

### 0.6 Quotients of an action

For a surjective `q : G →* H` and `v : GenVector G σ`, `q ∘ v` satisfies the relation and generates
`H`; `GenVector.mapSurjective q v` is the generating vector of `H` whose signature replaces each
`m j` by `orderOf (q (c j))`, drops the `j` with `q (c j) = 1`, and sorts (0.1's `sortSignature`),
defined when the result is hyperbolic. The preimage of a subgroup `K ≤ G` in `SignatureGroup σ` is a
finite-index subgroup, hence finitely generated (Mathlib's `Subgroup.FG` for finite index).
*Rests on:* 0.2–0.5.

### 0.7 The triangle case and the permutation-triple dictionary

For `σ = (0; m₁, m₂, m₃)`: `SignatureGroup σ ≃* TauCeti.TriangleGroup m₃ m₂ m₁` sending
`C₁ ↦ z, C₂ ↦ y, C₃ ↦ x` (convention 3), and hence
`GenVector G σ ≃ { t : (G × G × G) // orders exact ∧ t.1 * t.2.1 * t.2.2 = 1 ∧ closure = ⊤ }`. For
`G ≤ Equiv.Perm (Fin n)` a generating vector of signature `(0; m₁, m₂, m₃)` is a connected
`TauCeti.PermutationTriple n` with `σ0 = c₃, σ1 = c₂, σinf = c₁`, `monodromyGroup = G`, and
`orderTriple = (m₃, m₂, m₁)`; conversely every connected triple with exact orders is one. Through
Belyi maps 1.5 the vector of `S_n`-conjugacy classes of `(c₁, c₂, c₃)` is the Belyi passport with the
cycle partitions in the order `∞, 1, 0`. *Rests on:* Tau Ceti `TriangleGroup`, `PermutationTriple`;
Belyi maps Layers 0–1; 0.4–0.5.

`Signature.triangle` and `GenVector.toPermutationTriple` are in `Suggested.lean`; the isomorphism
`SignatureGroup.triangleEquiv` and the triple description of `GenVector G σ` are specified here
only.

**Checks.**

- `Γ(0; 2, 3, 7) ≃* TauCeti.TriangleGroup 7 3 2` with `C₁ ↦ z` (order `2`, the relator `z ^ 2`),
  `C₂ ↦ y`, `C₃ ↦ x`. The unreversed assignment `C₁ ↦ x` is not a homomorphism into
  `TriangleGroup 7 3 2`, where `x` has order `7`.
- The product relator `C₁ C₂ C₃` maps to `z * y * x`, Tau Ceti's relator.
- The triple description counts four triples for `C₁₀` with `(0; 2, 5, 10)` and `336` for
  `PSL₂(𝔽₇)` with `(0; 2, 3, 7)` (worked examples).

## Layer 1: finite group actions on compact Riemann surfaces

Sources: Farkas–Kra, *Riemann Surfaces*, Chapter III §7 (quotients by finite groups) and V.1;
Miranda, *Algebraic Curves and Riemann Surfaces*, Chapter III §3 (group actions, the quotient,
Riemann–Hurwitz for quotients); Breuer Chapter 3.

### 1.1 The carrier and the automorphism group

With `X` a compact Riemann surface (convention 6), `Aut X : Subgroup (Equiv.Perm X)` is the
subgroup of bijections `f` with `f` and `f⁻¹` holomorphic. A faithful holomorphic action of a
finite group `G` is `[MulAction G X] [FaithfulSMul G X]` with `hol : ∀ g, MDifferentiable 𝓘(ℂ) 𝓘(ℂ) (g • ·)`;
`toAut : G →* Aut X` is injective, and conversely every finite subgroup of `Aut X` is such an
action. Prove: for `g ≥ 2`, `Aut X` is finite — through the meromorphic function field `ℳ(X)`
(modular forms 10B), which is a function field over `ℂ` of genus `g` (10B's genus agreement) on
which `Aut X` acts faithfully by `ℂ`-algebra automorphisms, and Tau Ceti main's
`TauCeti.finite_algEquiv_of_two_le_genus` (`TauCeti/FieldTheory/FunctionField/Automorphism/
HigherGenus.lean`; its Weierstrass-gap hypothesis holds in characteristic zero). *Rests on:*
Mathlib; modular forms 10B; algebraic curves Layer 11 (the function-field statement).

### 1.2 Stabilizers and the quotient Riemann surface

For `P : X`, `MulAction.stabilizer G P` is cyclic, acting on a disc around `P` by rotations: a
linearizing coordinate exists (the finite-group version of
`TauCeti.Analysis.Complex.Fuchsian.Elliptic.Linearizing`, proved by averaging a chart over the
stabilizer), and the stabilizer embeds into `ℂˣ` through the rotation constant `ζ_P` of convention
9. Only finitely many points have nontrivial stabilizer. Construct the complex structure on
`X/G := MulAction.orbitRel.Quotient G X`: charts are the descended charts away from the exceptional
orbits and the quotient coordinate `z ↦ z^m` (the `quotientCoordinate` of the linearizing
coordinate) at an exceptional orbit of stabilizer order `m`; prove `X/G` is a compact connected
Riemann surface and `π : X → X/G` is holomorphic, hence `FiniteHolomorphicMap.ofMDifferentiable`
applies, with `localMultiplicity π P = |Stab P|` and `degree π = |G|`. *Rests on:* 1.1; Tau Ceti
`RiemannSurface.{localMultiplicity, degree, FiniteHolomorphicMap}`; the Fuchsian linearization
file as the model of the proof.

### 1.3 Branch points and the signature of an action

`branchPoints G X : Finset (X/G)` is the set of `y` with `#π⁻¹ y < |G|`; `branchOrder y` is the
stabilizer order of any point over `y` (well defined: stabilizers of points in one orbit are
conjugate); `r := #branchPoints`; `signature G X : Signature` is `(genus (X/G), sortSignature of the
branch orders)`, with `genus` the topological genus of Fuchsian orbifolds 5.1. Prove: the
branch orders are `≥ 2`, `Σ_{y} (|G| − #π⁻¹ y) = ramificationDegree π`, and `#π⁻¹ y = |G| / branchOrder y`.
*Rests on:* 1.2; Tau Ceti `ramificationDegree`, `card_fiber_add_sum_localMultiplicity_sub_one`;
Fuchsian orbifolds 5.1.

No declaration for this target is in `Suggested.lean`; it is specified here only. Its quotient genus is Fuchsian orbifolds 5.1's
topological `genus`, a target of that roadmap with no Tau Ceti declaration yet.

**Checks.**

- The hyperelliptic involution of a genus-two surface has signature `(0; 2⁶)`: six branch points
  of order `2`, quotient genus `0` (`2.2-1.0.2-2-2-2-2-2`).
- On `y² = x⁵ − 1`, the group `C₁₀` generated by `(x, y) ↦ (ζ₅ x, −y)` has signature
  `(0; 2, 5, 10)`, and its subgroup `C₅` generated by `(x, y) ↦ (ζ₅ x, y)` has `(0; 5, 5, 5)`: three
  fixed points, each with stabilizer of order `5`.
- An involution with two fixed points on a genus-two surface has signature `(1; 2, 2)`
  (`2.2-1.1.2-2`). A branch order is a stabilizer order, not a count of points.
- The trivial group has signature `(genus X; ∅)`: no point has a nontrivial stabilizer.

### 1.4 Riemann–Hurwitz in signature form

`2 genus X − 2 = |G| (2 genus (X/G) − 2 + Σ_j (1 − 1/m_j))`, i.e. `(genus X : ℚ) = genusOfOrder (signature G X) |G|`,
from Fuchsian orbifolds 5.3's `χ(X) = deg π · χ(X/G) − ramificationDegree π` and 1.3. Corollaries:
`genus (X/G) ≤ genus X`, with equality iff `G = 1`; for `genus X ≥ 2` the signature is hyperbolic;
`r ≤ 2g + 2 − 4h` (also Teichmüller geometry T7, consumed as a cross-check, proved here from the
formula and `m_j ≥ 2`); `h ≤ g`; the quotient genus `g0 := genus (X/G)` is the LMFDB's column and
agrees with `CanonicalModelsAndGonality` 6.2's orbit-form quotient genus of `ℳ(X)^G` through 10B.
*Rests on:* 1.3; Fuchsian orbifolds 5.3; `CanonicalModelsAndGonality` 6.2.

No declaration for this target is in `Suggested.lean`; it is specified here only. Its statement uses 1.3's signature and Fuchsian orbifolds
5.1's `genus`.

**Checks.**

- The Klein quartic with `PSL₂(𝔽₇)` and `(0; 2, 3, 7)`: `μ = 1/42`, so
  `1 + 168 · (1/42) / 2 = 3`, its genus.
- `C₁₀` with `(0; 2, 5, 10)`: `μ = 1/5`, so `1 + 10 · (1/5) / 2 = 2`.
- `S₃` with `(0; 2, 2, 3, 3)`: `μ = 1/3`, so `1 + 6 · (1/3) / 2 = 2`.
- Boundary, outside the hypotheses: `C₃` on `ℂ/ℤ[ω]` by `z ↦ ωz` has signature `(0; 3, 3, 3)` with
  `μ = 0`, and `2 · 1 − 2 = 0 = 3 · 0`; for genus `≥ 2` the signature is hyperbolic.

### 1.5 The representation on holomorphic differentials

`H⁰(X, Ω)` is modular forms 10B's space of holomorphic `1`-forms, of dimension `g`.
`ρ_Ω : Representation ℂ G H⁰(X, Ω)` is `γ ↦ (γ⁻¹)^*` (convention 10); `χ_Ω` its character;
`ρ_Ω` is faithful for `g ≥ 2` (an automorphism acting trivially on differentials is the identity:
through the canonical map for non-hyperelliptic `X`, through the hyperelliptic involution's
`−1`-action otherwise; algebraic curves Layer 11's rigidity supplies the function-field half). The
multiplicity of the trivial character in `χ_Ω` is `genus (X/G)` (invariant differentials descend to
`X/G` and every differential on `X/G` pulls back, with the local computation at branch points).
*Rests on:* 1.2–1.4; modular forms 10B; Mathlib `Representation`.

## Layer 2: the Riemann existence criterion

Sources: Breuer Chapter 3 (the existence theorem through Fuchsian groups); Broughton §2,
Proposition 2.1 (the criterion as the LMFDB states it); Harvey, *Cyclic groups of automorphisms of
a compact Riemann surface*, §2 (the surface-kernel formulation).

### 2.1 The Fuchsian realization of a hyperbolic signature

For hyperbolic `σ` there is a cocompact Fuchsian group `Γ_σ ≤ PSL(2, ℝ)` with a Dirichlet polygon
whose side pairings give `Γ_σ ≅ SignatureGroup σ` and whose elliptic elements are exactly the
conjugates of the nontrivial powers of the `C j`, with `⟨C j⟩` of order `m j` and hyperbolic area
`2π μ(σ)` (Fuchsian orbifolds Layer 2 items 3, 5–6: the Poincaré polygon theorem applied to the
standard `4h + 2r`-gon with angle sums `2π/m_j` at the elliptic cycles; for `h = 0, r = 3` item 6's
triangle groups, identified with `TauCeti.TriangleGroup` through 0.7). Name the isomorphism
`fuchsianModel σ : SignatureGroup σ ≃* Γ_σ` and prove that `SignatureGroup σ` is infinite and that
its torsion elements are the conjugates of powers of the `C j` (so the exact-order condition of 0.5
is the torsion-free-kernel condition, 2.2). *Rests on:* 0.4; Fuchsian orbifolds Layer 2; Tau Ceti
`infinite_of_inv_add_inv_add_inv_le_one` for the triangle case.

### 2.2 Surface kernels

For `φ : SignatureGroup σ →* G` surjective with `G` finite, `ker φ` is torsion-free iff
`orderOf (φ (C j)) = m j` for all `j` (2.1's description of torsion). A torsion-free finite-index
subgroup `K` of `Γ_σ` acts freely and properly on `ℍ`, so `ℍ/K` is a compact Riemann surface
(Fuchsian orbifolds Layer 4 with no elliptic points and no cusps) of genus `g` with
`2g − 2 = [Γ_σ : K] μ(σ)` (Fuchsian orbifolds 5.6's Fuchsian Riemann–Hurwitz, or area), and `K` is
isomorphic to `SignatureGroup (g; ∅)`, the surface group. *Rests on:* 2.1; Fuchsian orbifolds
Layers 4–5.

### 2.3 From a generating vector to an action

Given `v : GenVector G σ` with `σ` hyperbolic, let `φ = equivSurfaceKernelHom v`, `K = ker (φ ∘ fuchsianModel⁻¹)`,
`X_v := ℍ/K`. Then `G ≅ Γ_σ/K` acts faithfully and holomorphically on `X_v` (deck transformations
of `ℍ/K → ℍ/Γ_σ`), `X_v/G ≅ ℍ/Γ_σ` has genus `h`, the branch points are the images of the elliptic
fixed points with orders `m_j`, so `signature G X_v = σ`, and `genus X_v = genusOfOrder σ |G|`.
Name the construction `GenVector.toAction v`. *Rests on:* 2.1–2.2; 1.2–1.4; Fuchsian orbifolds
Layers 4–5 (`X(Γ)` as a Riemann surface, the degree of `X(K) → X(Γ)`).

### 2.4 From an action to a generating vector

Given a faithful holomorphic action of `G` on `X` with `genus X ≥ 2`, `Y := X/G`,
`B := branchPoints`, `y₀ ∉ B`, `x₀ ∈ π⁻¹ y₀`: the restriction `X ∖ π⁻¹ B → Y ∖ B` is a regular
covering with deck group `G` (Belyi maps 6.4–6.5 generalized from the thrice-punctured sphere to
`Y ∖ B`, through the same `IsCoveringMap.monodromy`), and its monodromy
`μ : π₁(Y ∖ B, y₀) →* G` (convention 8) is surjective since `X ∖ π⁻¹ B` is connected. A choice of
standard generators `α_i, β_i, γ_j` of `π₁(Y ∖ B, y₀)` (Surface topology Layer 7's presentation of
the edge-path group of the punctured surface of genus `h`; the standard generators satisfy exactly
the relation of convention 8) gives `v := (μ α, μ β, μ γ) : GenVector G (signature G X)`: the
relation is the single relation of `π₁`, the orders are exact because `γ_j` lifts to a loop around
a point of stabilizer order `m_j` acting as the rotation `ζ` of 1.2, and generation is
surjectivity. Name it `GenVector.ofAction` (it depends on the choice of standard generators and of
`x₀`). *Rests on:* 1.2–1.4; Belyi maps Layers 5–6; Surface topology Layers 7–8.

### 2.5 The criterion

**Theorem (Riemann existence, LMFDB form).** For a finite group `G`, a signature `σ` and `g ≥ 2`:
there is a compact Riemann surface `X` of genus `g` with a faithful holomorphic `G`-action of
signature `σ` iff `GenVector G σ` is nonempty and `(g : ℚ) = genusOfOrder σ |G|`. Consequently
`genusOfOrder σ |G|` is an integer whenever `GenVector G σ ≠ ∅` and `σ` is hyperbolic (so the LMFDB's
`genus` column is `genusOfOrder` read in `ℕ`), and `IsHyperbolic σ` is necessary. *Rests on:* 2.3,
2.4, 1.4.

The left side is the existence of a *genus-`g` action of `G` with signature `σ`*: a type `X : Type`
(the universe of `ℍ/K`) carrying the compact-Riemann-surface stack of convention 6 with both
`IsManifold 𝓘(ℂ) 1 X` and `IsManifold 𝓘(ℂ) ∞ X`, a faithful `MulAction G X` with every `(γ • ·)`
holomorphic, signature (1.3) equal to `σ`, and Fuchsian orbifolds 5.1's `genus X = g`. The
integrality half is `GenVector.exists_genus_eq` in `Suggested.lean`; the criterion itself is
specified here only, since its left side needs 1.3 and the supplier's `genus`.

**Checks.**

- `C₂`, `(0; 2⁶)`, `g = 2`: both sides hold (`hyperellipticGenusTwoVector`, and
  `1 + 2 · 1/2 = 2`).
- `PSL₂(𝔽₇)`, `(0; 2, 3, 7)`: both sides hold for `g = 3` and both fail for `g = 4`, although
  `GenVector G σ` is nonempty.
- `A₅`, `(0; 2, 3, 7)`: `GenVector G σ` is empty (no element of order `7`) and
  `1 + 60 · (1/42) / 2 = 12/7` is not an integer, so both sides fail for every `g`.
- `C₄`, `(0; 2, 2, 2, 2)`: `μ = 0`, so `genusOfOrder = 1 < 2` and the signature is not hyperbolic;
  `GenVector G σ` is also empty (0.2's boundary check). Both sides fail for every `g ≥ 2`.

### 2.6 Compatibility of the two constructions

`GenVector.toAction (GenVector.ofAction X)` is `G`-equivariantly biholomorphic to `X`: the
uniformization of `X` by `ℍ/K`, `K = π₁(X)`, taken from
[complex curve moduli](../ComplexCurveModuli/README.md) D0 item 4 (closed surfaces of negative
Euler characteristic), plus the identification of the deck group with `G`. The signature of the
preimage subgroups of 0.6 is proved here: for `K ≤ G`, `h_K = genus (X/K)` and the periods of `K`
are the orders `m_j / gcd` read off the orbits of `K` on `G/⟨c_j⟩` (Singerman's formula). *Rests
on:* 2.3–2.5; complex curve moduli D0.

## Layer 3: refined passports, braid classes, topological classes

Sources: Broughton §2 (Proposition 2.2: topological equivalence is `Aut(G) × Mod`), §3;
Breuer §3 and Appendix; the inverse-Galois roadmap IG.3.2 for the Hurwitz action; Teichmüller
geometry T6; Surface topology Layer 9.

### 3.1 Refined passports

`RefinedPassport G σ := Fin σ.r → ConjClasses G`; `GenVector.refinedPassport v j := ConjClasses.mk (v.c j)`.
It is invariant under `Inn(G)` (0.3) and under braid moves that fix the class vector; `Aut(G)` acts
on refined passports and `refinedPassport (α • v) = α • refinedPassport v`. The refined passport of
`(g, G, v)` is the LMFDB's `(g, G, 𝒞)`; the set of refined passports realized by `GenVector G σ` is
finite and computable (0.2). For `h = 0, r = 3` and `G ≤ S_n` it determines the Belyi passport (0.7).
*Rests on:* 0.2–0.3, 0.7.

### 3.2 The class-vector count

The number of generating vectors with refined passport `𝒞` and `h = 0` is the Frobenius count of
solutions of `c₁ ⋯ c_r = 1` with `c_j ∈ C_j`, `(Π |C_j| / |G|) Σ_χ Π χ(C_j) / χ(1)^{r−2}`, corrected
to generating tuples by Möbius inversion over subgroups: Belyi maps 3.2–3.4 and Tau Ceti
`Passport.Count`, `GeneratingCount`, extended from `r = 3` to arbitrary `r`. *Rests on:* 0.2; Belyi
maps 3.2–3.4.

### 3.3 Braid equivalence

For `v, w : GenVector G σ`, `BraidEquiv v w :↔ ∃ β : TauCeti.BraidGroup σ.r, ∃ g : G,
HurwitzAction.action β (v.c) = (MulAut.conj g) ∘ w.c ∧ v.a = w.a ∧ v.b = w.b` (IG.3.2's action on the
`c`-part as a `BranchTuple σ.r G`). Prove it is an equivalence relation; that `HurwitzAction.action β v.c`
has product one, generates `G` with `v.a, v.b`, and has the same multiset of orders and classes
(IG.3.2's `product_action`, `generated_action`, `classes_action`); and that it is again a
generating vector of `σ` exactly when its order sequence is `m` (a braid orbit passes through
tuples whose orders are a permutation of `m`). `BraidClass v` is the class; the set of braid classes
with a given refined passport is finite. For `h = 0, r = 3` the pure braid group acts by inner
automorphisms (`σ_i²` conjugates `(c_i, c_{i+1})` by `c_i c_{i+1}` and fixes the third entry, which
`c_i c_{i+1}` centralizes exactly because `c₁ c₂ c₃ = 1`); so when the three periods are distinct
braid classes are `Inn(G)`-classes, while a repeated period lets the half-twist `σ_i` swapping the
two equal-order entries identify `Inn(G)`-classes (`(0; 3, 15, 15)` below: 192 `Inn`-classes, 96 braid
classes). For `h > 0` the pure braid group does not act by inner automorphisms. *Rests on:* 0.2–0.3;
IG.3.2; Tau Ceti `BraidGroup`.

### 3.4 Topological equivalence of actions

Two faithful holomorphic actions `φ₁, φ₂ : G →* Aut X` (or on two surfaces `X₁, X₂` of the same
genus) are *topologically equivalent* when there are `ω : MulAut G` and an orientation-preserving
homeomorphism `t : X₁ ≃ₜ X₂` with `φ₂ (ω γ) = t ∘ φ₁ γ ∘ t⁻¹` for all `γ`. Prove it is an equivalence
relation and that it preserves the signature and the quotient genus. For generating vectors:
`TopEquiv v w :↔ ∃ ω : MulAut G, ∃ ψ : MappingClassGroupPlus (S_{h,r}), ω • (ψ • v) = w`, where
`S_{h,r}` is the compact surface of genus `h` with `r` marked points (Surface topology Layer 9's
`MappingClassGroupPlus` for the surface with the marked points deleted and the action on
`π₁(Y ∖ B)`-generating systems: a mapping class carries one standard system of generators to a word
in another, hence acts on `Hom(SignatureGroup σ, G)` through `Out(SignatureGroup σ)`), and the
theorem that `TopEquiv v w ↔` the actions `toAction v`, `toAction w` are topologically equivalent
(Broughton Proposition 2.2; the proof lifts `t` to `ℍ` normalizing `Γ_σ`, as the LMFDB's knowl
states it). The compatibility of the two constructions of Layer 2 is stated here:
`TopEquiv (GenVector.ofAction (GenVector.toAction v)) v` for every choice of standard generators
and base point in 2.4 (two choices differ by a mapping class and an inner automorphism).
*Rests on:* 1.1, 2.3–2.6; Surface topology Layers 7–9; Teichmüller geometry T6.

### 3.5 Braid classes refine topological classes

`BraidEquiv v w → TopEquiv v w` (a Hurwitz move is the action of a half-twist about an arc joining
two punctures, an orientation-preserving mapping class, and simultaneous conjugation is `Inn(G)`).
Hence `BraidClass` refines the LMFDB's `topological` partition: every topological class is a
finite union of braid classes, which is what the `hgcwa-topological-action` page lists. *Rests on:*
3.3–3.4; Surface topology Layer 9 (half-twists as mapping classes).

### 3.6 Topological equivalence for quotient genus zero

**Theorem.** For `h = 0`: `TopEquiv v w ↔ ∃ ω : MulAut G, BraidEquiv (ω • v) w`. The mapping class
group of the `r`-punctured sphere is generated by half-twists (Surface topology Layer 9's
Lickorish-type generation for the punctured sphere, i.e. the image of `BraidGroup r` in
`MappingClassGroupPlus`), so its action on generating systems is the Hurwitz action up to inner
automorphisms. This is the theorem that lets the LMFDB compute `topological` from `braid` and
`Aut(G)` when `g0 = 0`. *Rests on:* 3.3–3.5; Surface topology Layer 9.

### 3.7 The three counts

For finite `G` and hyperbolic `σ`: `numInnClasses G σ`, `numBraidClasses G σ`,
`numTopClasses G σ : ℕ` are the cardinalities of the finite quotients of 0.3, 3.3, 3.4, with
`numTopClasses ≤ numBraidClasses ≤ numInnClasses`, and `numRefinedPassports G σ` the number of
realized class vectors. These are `hgcwa_unique_groups.gen_vectors`, `braid`, `topological` and
`hgcwa_complete.num_refined_pp` per `(g, G, σ)`. *Rests on:* 0.3, 3.1, 3.3, 3.4.

## Layer 4: quotient genus, dimension, finiteness, and the Hurwitz and Wiman bounds

Sources: Harvey 1966 (Theorem 4, the cyclic criterion; the bound `4g + 2`); Wiman 1895;
Farkas–Kra V.1 (Hurwitz's theorem); Teichmüller geometry T7 (the fixed locus and `3h − 3 + r`);
Breuer Chapter 3.

### 4.1 The quotient genus and the number of branch points as invariants of the vector

For `v : GenVector G σ`, `g0 v := σ.h` and `r v := σ.r`; by 2.3 these are `genus (X_v / G)` and
`#branchPoints` of the realized action, and by 3.4 they are invariants of the topological class.
`g0 = 0 ↔ X_v/G ≅ ℙ¹` (Fuchsian orbifolds 5.2's degree-one theorem applied to a degree-one map
to the sphere, or the genus-zero classification of Belyi maps 8); `g0 = genus X` never happens for
`g ≥ 2` (1.4). *Rests on:* 1.4, 2.3, 3.4.

### 4.2 The dimension of the family

`dim v := 3 σ.h − 3 + σ.r : ℤ`, and the theorem that it is `≥ 0` for hyperbolic `σ` (so the LMFDB's
column is a natural number) with `dim = 0 ↔ h = 0 ∧ r = 3` (the triangle signatures: rigid
actions). Its meaning is Teichmüller geometry T7: the fixed locus of the finite subgroup
`toAction v` of the mapping class group in `Teich(Σ_g)` is biholomorphic to the Teichmüller space
of the orbifold `X_v/G` with its `r` marked points, of complex dimension `3h − 3 + r`; the image of
that locus in `M_g` is the family of the LMFDB, of the same dimension, and `dim ≤ 3g − 3`: from
`r ≤ 2g + 2 − 4h` (1.4), `dim ≤ 2g − 1 − h`, so for `G ≠ 1` equality holds only for `g = 2, h = 0,
r = 6`, i.e. `C₂` with `(0; 2⁶)`, the hyperelliptic family that is all of `M₂`. The comparison with the Hurwitz-space dimension of IG.5.2 (`r` for the
configuration of branch points on `ℙ¹`, less `3` for `PGL₂`) is the case `h = 0`. *Rests on:* 0.1,
2.3; Teichmüller geometry T7.

### 4.3 The Hurwitz bound from the criterion

For `v : GenVector G σ` with `σ` hyperbolic and `g = genusOfOrder σ |G|`: `|G| = (2g − 2)/μ(σ) ≤ 84 (g − 1)`
by 0.1's `μ(σ) ≥ 1/42`, with equality iff `σ = (0; 2, 3, 7)` (a *Hurwitz group*). Through 2.5 this is
`|Aut X| ≤ 84 (genus X − 1)` for every compact Riemann surface of genus `≥ 2`, the LMFDB's
`curve.highergenus.hurwitz_bound`; it agrees with Tau Ceti's
`natCard_le_eighty_four_mul_genus_sub_one` applied to `ℳ(X)` (every place of a characteristic-zero
function field is tame) through 10B, and that agreement is a bridge check in `Suggested.lean`.
An action has `|G| > 4 (g − 1)` ("large automorphism group") iff `μ(σ) < 1/2`; such a signature
has `h = 0` and `r ≤ 4`, and for `r = 4` it is `(0; 2, 2, 2, m)` with `m ≥ 3` or one of
`(0; 2, 2, 3, 3), (0; 2, 2, 3, 4), (0; 2, 2, 3, 5)` (`Σ 1/m_j > 3/2` forces `m₁ = m₂ = 2` and
`1/m₃ + 1/m₄ > 1/2`); the set of such signatures is infinite. *Rests on:* 0.1,
2.5; Fuchsian orbifolds 4a; Tau Ceti `natCard_le_eighty_four_mul_genus_sub_one`.

### 4.4 Harvey's criterion for cyclic groups

For `G = ZMod n` (cyclic of order `n`) and `σ = (h; m₁, …, m_r)`, `GenVector G σ ≠ ∅` iff, with
`M := lcm (m₁, …, m_r)`: (i) `M ∣ n`, and `M = n` if `h = 0`; (ii) `lcm` of any `r − 1` of the `m_j`
equals `M`; (iii) `r ≠ 1`, and `r ≥ 3` if `h = 0`; (iv) if `M` is even, the number of `m_j` divisible
by the maximal power of `2` dividing `M` is even (Harvey, Theorem 4). The proof is elementary
number theory on `ZMod n`: the product relation is `Σ c_j = 0` and the orders are `n / gcd(c_j, n) = m_j`.
*Rests on:* 0.2; Mathlib `ZMod`, `Nat.lcm`.

### 4.5 The Wiman bound

For cyclic `G` acting on `X` of genus `g ≥ 2`: `|G| ≤ 4g + 2`, with equality iff
`σ = (0; 2, 2g + 1, 4g + 2)`; and every cyclic group of order `4g + 2` acts in genus `g`
(`ZMod (4g+2)` with `c = (2g + 1, 2, 2g − 1)` in additive notation: orders `2, 2g + 1, 4g + 2` since
`gcd (2g − 1, 4g + 2) = 1`, sum `4g + 2 ≡ 0`, generating; the curve `y² = x^{2g+1} − 1` with
`(x, y) ↦ (ζ_{2g+1} x, −y)`). Proof: by 4.4 and 1.4 with `r ≥ 3`, `h = 0`, `M = n`, the minimum of
`μ` over signatures satisfying Harvey's conditions with `lcm = n` is attained at
`(2, 2g + 1, 4g + 2)`; for `h ≥ 1`, `μ ≥ 1/2` gives `n ≤ 4g − 4`. Consequently every
element of `Aut X` has order `≤ 4g + 2`, and every `m_j ≤ 4g + 2` (used in 4.6). *Rests on:* 4.4,
1.4, 2.5.

### 4.6 Finiteness in a given genus

For each `g ≥ 2` the set of `(n, σ)` with `genusOfOrder σ n = g`, `σ` hyperbolic and `n ≥ 1` is
finite, with the explicit bounds `n ≤ 84 (g − 1)` (4.3), `h ≤ g`, `r ≤ 2g + 2 − 4h` (1.4) and
`m_j ≤ 4g + 2` (4.5 applied to `⟨c_j⟩`). Hence the set of isomorphism classes of `(G, σ, v)` with
`genus = g` is finite and `numFamilies g`, `numRefinedPassports g`, `numInnClasses g : ℕ` (the
`hgcwa_complete` counts) are well defined. For `g = 2` and `g = 3` the complete lists of `(G, σ)`
(Broughton's Tables 4 and 5) are theorems proved by running 0.2's decidable predicate over the
groups of order `≤ 84 (g − 1)` within these bounds. For larger `g` the list is a stored table;
the theorem here is the certificate interface: a stored `(G, σ, v)` is
accepted by 0.2's predicate, and the list is complete iff the bounded search finds nothing else.
*Rests on:* 0.1–0.2, 1.4, 4.3, 4.5.

## Layer 5: full automorphism groups and Singerman's list

Sources: Singerman, *Finitely maximal Fuchsian groups*, Theorem 1 (the list); Ries,
*Subvarieties of moduli space determined by finite groups acting on surfaces*, §3; Bujalance–Cirre–
Conder, *On extendability of group actions on compact Riemann surfaces*, §§3–4 (the extension
conditions on generating vectors); Teichmüller geometry T9.

### 5.1 Full actions

`IsFull G X := Function.Surjective (toAut : G →* Aut X)`. For `v : GenVector G σ` and an overgroup
datum — a group `G'`, an injective `ι : G →* G'` and `w : GenVector G' σ'` — `Extends v ι w` means the
action `toAction w` restricted to `ι G` is topologically equivalent to `toAction v` (3.4). Prove: if
`Extends v ι w` with `ι` not surjective then `toAction v` is not full on `X_w`; `|G'| μ(σ') = |G| μ(σ)`
(same genus, 2.5), so `[G' : G] = μ(σ)/μ(σ')`; and the signature of the restriction is given by the
subgroup formula of 2.6. *Rests on:* 1.1, 2.3–2.6, 3.4.

### 5.2 Generic fullness and the family

A generating vector `v` is *generically full* when the set of points of the fixed locus of 4.2
(Teichmüller geometry T7) whose uniformizing surface has `Aut X ≠ G` is a proper closed analytic
subset; by T9 (the uniformizing group of a generic point of a Teichmüller fixed locus is maximal
among Fuchsian overgroups unless its signature is in Singerman's list) and 5.1, `v` is generically
full iff no overgroup datum `(G', ι, w)` with `[G' : G] > 1` extends it. The LMFDB's `full_auto` is
the group `G'` of a maximal such datum, `signH` its signature, `full_label` its family. *Rests on:*
4.2, 5.1; Teichmüller geometry T7, T9.

### 5.3 Singerman's list

**Theorem.** If `v : GenVector G σ` is not generically full then `(σ, σ')` for the overgroup's
signature is one of the pairs below, with the stated index `d = [G' : G]`; conversely each pair
occurs for some `(G, v)`.

| `σ` | `σ'` | `d` | normal |
| --- | --- | --- | --- |
| `(2; −)` | `(0; 2, 2, 2, 2, 2, 2)` | 2 | yes |
| `(1; t, t)` | `(0; 2, 2, 2, 2, t)` | 2 | yes |
| `(1; t)` | `(0; 2, 2, 2, 2t)` | 2 | yes |
| `(0; t, t, t, t)` | `(0; 2, 2, 2, t)` | 4 | yes |
| `(0; t₁, t₁, t₂, t₂)` | `(0; 2, 2, t₁, t₂)` | 2 | yes |
| `(0; t, t, t)` | `(0; 3, 3, t)` | 3 | yes |
| `(0; t, t, t)` | `(0; 2, 3, 2t)` | 6 | yes |
| `(0; t₁, t₁, t₂)` | `(0; 2, t₁, 2t₂)` | 2 | yes |
| `(0; 7, 7, 7)` | `(0; 2, 3, 7)` | 24 | no |
| `(0; 2, 7, 7)` | `(0; 2, 3, 7)` | 9 | no |
| `(0; 3, 3, 7)` | `(0; 2, 3, 7)` | 8 | no |
| `(0; 4, 8, 8)` | `(0; 2, 3, 8)` | 12 | no |
| `(0; 3, 8, 8)` | `(0; 2, 3, 8)` | 10 | no |
| `(0; 9, 9, 9)` | `(0; 2, 3, 9)` | 12 | no |
| `(0; 4, 4, 5)` | `(0; 2, 4, 5)` | 6 | no |
| `(0; n, 4n, 4n)` | `(0; 2, 3, 4n)` | 6 | no |
| `(0; n, 2n, 2n)` | `(0; 2, 4, 2n)` | 4 | no |
| `(0; 3, n, 3n)` | `(0; 2, 3, 3n)` | 4 | no |
| `(0; 2, n, 2n)` | `(0; 2, 3, 2n)` | 3 | no |

(Singerman's Theorem 1; `t, t₁, t₂, n ≥ 2` with the hyperbolicity of both signatures assumed.) The
proof is Riemann–Hurwitz arithmetic: `μ(σ) = d μ(σ')` with `σ'` having `≤ r` periods each dividing
a period of `σ` in a pattern forced by the subgroup formula of 2.6, a finite case analysis in `ℚ`.
The index entries `d` are checked by `μ(σ) = d μ(σ')` (worked examples). *Rests on:* 0.1, 2.6, 5.1.

### 5.4 The extension criterion

For each row of 5.3 with `normal = yes`, `v` extends to an overgroup of index `d` iff an explicit
condition on `v` holds: an automorphism `θ` of `G` of order dividing `d` carrying the vector to a
specified rearrangement — for `(0; t₁, t₁, t₂) ⊂ (0; 2, t₁, 2t₂)`: `θ(c₁) = c₂, θ(c₂) = c₁`; for
`(1; t, t) ⊂ (0; 2, 2, 2, 2, t)`: `θ(a) = a⁻¹, θ(b) = b⁻¹ … ` with `θ(c₁) = c₂` (the Bujalance–Cirre–Conder
tables, one condition per row, each an equation in `MulAut G` and the entries of `v`); for the
non-normal rows the condition is the existence of `w : GenVector G' σ'` for a group `G'` containing
`G` with the prescribed restriction, decided by a finite search over the overgroups of index `d`.
State each row's condition as a decidable predicate `extendsAlong row v` and prove
`extendsAlong row v ↔ ∃ (G', ι, w), Extends v ι w ∧ [G' : G] = d ∧ signature w = σ'`. The LMFDB's
Ries-based algorithm is this theorem run over the rows. *Rests on:* 3.4, 5.1–5.3.

### 5.5 The generic full group as a certificate

`FullAutoCertificate v` bundles `(G', ι, w)` with `Extends v ι w` and a proof that `w` is generically
full (no row of 5.3 applies to `σ'`, or every applicable row's 5.4 condition fails). Prove
uniqueness up to isomorphism of the maximal overgroup for the generic member (Teichmüller geometry
T9's maximality plus 5.3), so `full_auto`, `signH`, `full_label`'s prefix are well-defined functions of
the topological class of `v`. *Rests on:* 5.2–5.4.

## Layer 6: fixed points, hyperelliptic and cyclic-trigonal families

Sources: Macbeath, *Action of automorphisms of a compact Riemann surface on the first homology
group*, §2 (the fixed-point formula); Breuer Chapter 3 (Lemma on fixed points); Farkas–Kra III.7;
Swinarski's criterion (arXiv:1607.04778) as the LMFDB's source; `CanonicalModelsAndGonality` 6.3,
6.6–6.7; `HyperellipticCurves` 1.4.

### 6.1 Macbeath's fixed-point formula

For `v : GenVector G σ` realized on `X_v` and `1 ≠ γ ∈ G`:
`#Fix(γ) = |N_G ⟨γ⟩| · Σ_{j=1}^{r} ε_j(γ) / m_j`, where `ε_j(γ) = 1` if `γ` is conjugate to an element
of `⟨c_j⟩` and `0` otherwise; equivalently `|C_G(γ)| · Σ_j #(cl(γ) ∩ ⟨c_j⟩) / m_j`, the form
`Suggested.lean` uses. The sum is in `ℚ` and the result is a natural number. Proof: the fixed
points of `γ` lie over branch points; the fibre over `y_j` is the `G`-set `G/⟨c_j⟩` (1.2–1.3 and 2.3),
`γ` fixes the coset `x⟨c_j⟩` iff `x⁻¹ γ x ∈ ⟨c_j⟩`, and a cyclic group contains at most one subgroup
of each order, so the number of fixed cosets is `|C_G(γ)| · #(cl(γ) ∩ ⟨c_j⟩) / m_j = |N_G ⟨γ⟩| ε_j(γ)/m_j`.
Corollaries: `#Fix(γ) ≤ 2g + 2` (Riemann–Hurwitz for `⟨γ⟩`), `#Fix(γ)` depends only on the
topological class of `v`, and `#Fix(γ) = #Fix(γ^k)` for `k` coprime to `orderOf γ`. *Rests on:*
1.2–1.4, 2.3, 3.4.

### 6.2 The hyperelliptic criterion on a group

`IsHyperellipticVector v :↔ ∃ ι : G, orderOf ι = 2 ∧ #Fix(ι) = 2g + 2`. Prove: such `ι` has
`genus (X_v / ⟨ι⟩) = 0` (Riemann–Hurwitz for `⟨ι⟩`), so `X_v` is hyperelliptic and `ι` is its
hyperelliptic involution, central in `Aut X_v` and unique (`HyperellipticCurves` 1.4 through `ℳ(X_v)`
and 10B); conversely if `X_v` is hyperelliptic and its involution lies in `G` then the predicate
holds. The predicate is decidable from `v` by 6.1 and invariant under topological equivalence.
*Rests on:* 6.1, 1.4; `HyperellipticCurves` 1.4; modular forms 10B.

### 6.3 The hyperelliptic family

`hyperelliptic v :↔ IsHyperellipticVector (fullCertificate v).w` (convention 14): the generic member
of the family is hyperelliptic. Prove: if `IsHyperellipticVector v` then `hyperelliptic v` (the
involution of `G` is the involution of `G'`); `hyperelliptic v ↔` every surface in the family is
hyperelliptic (hyperellipticity is closed and the involution is unique, so it is constant on the
connected fixed locus); for `g = 2` every `v` is hyperelliptic; and agreement with
`CanonicalModelsAndGonality` 6.7's `hyperelliptic` on `ℳ(X_v)`. `hypInvolution v : G` is the
involution when it lies in `G` (the LMFDB's `hyp_involution`), and `hyperelliptic v ∧ hypInvolution ∉ G`
is possible exactly when `v` is not generically full (worked example `2.2-1.1.2-2`). *Rests on:*
5.5, 6.2; `CanonicalModelsAndGonality` 6.7.

### 6.4 Cyclic trigonal families

`IsCyclicTrigonalVector v :↔ ∃ τ : G, orderOf τ = 3 ∧ #Fix(τ) = g + 2` (Riemann–Hurwitz for `⟨τ⟩`
with genus-zero quotient: `2g − 2 = −6 + 2 #Fix`), `cyclic_trigonal v :↔ IsCyclicTrigonalVector
(fullCertificate v).w`, `cyclicTrigonalAutomorphism v : G` when it lies in `G` (the LMFDB's `cinv`).
Prove the analogues of 6.2–6.3, with the uniqueness statement in the form `CanonicalModelsAndGonality`
6.6 provides (for `g ≥ 5` the cyclic trigonal subgroup is unique and normal, Accola), and the
agreement with its `IsCyclicTrigonal ℂ (ℳ X_v)`. For `g ≤ 4` a surface can be cyclic trigonal in
more than one way, and the predicate is still well defined (existential). *Rests on:* 6.1, 5.5;
`CanonicalModelsAndGonality` 6.6–6.7.

## Layer 7: differentials, the Eichler trace formula, and the Jacobian decomposition

Sources: Farkas–Kra V.2.9 (Eichler's trace formula); Chevalley–Weil 1934 with Weil's correction,
in Breuer's formulation (Chapter 3, the Chevalley–Weil formula); Kani–Rosen 1989, Theorems A–C;
Lange–Recillas 2004, §§2 and 5; Paulhus 2008 (the LMFDB's `jacobian_decomp` source).

### 7.1 The Eichler trace formula

For `1 ≠ γ ∈ G` acting on `X` of genus `g ≥ 2`:
`Tr (γ^* | H⁰(X, Ω)) = 1 + Σ_{P ∈ Fix γ} ζ_P(γ) / (1 − ζ_P(γ))`, with `ζ_P(γ)` the rotation constant
of convention 9; hence `χ_Ω(γ) = 1 + Σ_P \overline{ζ_P(γ)} / (1 − \overline{ζ_P(γ)})` for the
representation of convention 10 (`Fix γ⁻¹ = Fix γ`, `ζ_P(γ⁻¹) = \overline{ζ_P(γ)}`). Proof through the
holomorphic Lefschetz fixed-point formula or, as Farkas–Kra, through the Riemann–Roch count of
the eigenspaces of `γ` on `H⁰(X, Ω)`, i.e. the differentials on `X/⟨γ⟩` with prescribed orders at
the branch points (10B's Riemann–Roch on `X/⟨γ⟩`). *Rests on:* 1.2, 1.5; modular forms 10B.

### 7.2 The Chevalley–Weil formula

For `v : GenVector G σ` realized on `X_v` and an irreducible `ρ` of `G` over `ℂ` with character `χ`:
`⟨χ, χ_Ω⟩ = χ(1) (h − 1) + Σ_{j=1}^{r} Σ_{k=1}^{m_j − 1} N_{j,k}(ρ) · k/m_j + [χ = 1]`, where
`N_{j,k}(ρ)` is the multiplicity of `ζ_{m_j}^k` as an eigenvalue of `ρ(c_j)`, and `ζ_{m_j}` is the
rotation constant `ζ_{P_j}(c_j)` at a fixed point `P_j` of `c_j` over the `j`-th branch point, which
convention 8 (counterclockwise `γ_j`, lifted through the local model `z ↦ z^{m_j}`) makes
`exp(2πi/m_j)`. Proof: average 7.1 over `G` using 6.1 for the fixed points of each `c_j^k` and their
rotation constants. The formula determines `χ_Ω` from `v` alone; its total `Σ_χ χ(1) ⟨χ, χ_Ω⟩ = g`
is 1.4. The weight `k/m_j` is forced by conventions 8–10: the same formula with weight
`(m_j − k)/m_j` computes the multiplicities for the contravariant action `γ ↦ γ^* = ρ_Ω(γ⁻¹)`, i.e.
reads `N_{j,k}` on `ρ(c_j)⁻¹`, and a source's convention is identified by the checks `y² = x⁵ − 1`
and `(0; 3, 3, 3)` in the worked examples, where the two weights give different answers. *Rests on:*
1.5, 6.1, 7.1.

### 7.3 The homology representation and `End(Jac X) ⊗ ℚ`

`H₁(X, ℚ)` as a `ℚ[G]`-module has character `χ_Ω + \bar χ_Ω` (Hodge decomposition
`H¹(X, ℂ) = H⁰(Ω) ⊕ \overline{H⁰(Ω)}`, or Lefschetz on the topological side), and the action of `G` on
`Jac X` (Jacobian challenge Layer E, by functoriality of `Pic⁰`; complex tori Milestone 1 gives the
analytic model `H⁰(X,Ω)^∨ / H₁(X, ℤ)`) induces `ρ_J : ℚ[G] →ₐ[ℚ] End(Jac X) ⊗ ℚ` whose composite
with the rational representation `End(Jac X) ⊗ ℚ → End_ℚ H₁(X, ℚ)` is the homology representation.
*Rests on:* 1.5, 7.2; Jacobian challenge Layers E–F; complex tori Milestone 1.

### 7.4 Kani–Rosen

**Theorem A.** For idempotents `ε₁, …, ε_s, ε'₁, …, ε'_t ∈ ℚ[G]` with `Σ ε_i = Σ ε'_j` (an idempotent
relation), `Π ε_i(Jac X) ∼ Π ε'_j(Jac X)` (isogeny), where `ε(Jac X)` is the image abelian
subvariety of `n ε` for an integer `n` clearing denominators. **Theorem B.** For subgroups
`H₁, …, H_s, H'₁, …, H'_t ≤ G` with `Σ ε_{H_i} = Σ ε_{H'_j}` in `ℚ[G]` (`ε_H = |H|^{-1} Σ_{h ∈ H} h`),
`Π Jac(X/H_i) ∼ Π Jac(X/H'_j)`, since `ε_H(Jac X) ∼ Jac(X/H)` with `dim = genus (X/H)` (1.4). **Theorem C** (the form used for the LMFDB's genus-2 records): for subgroups `H₁, …, H_t ≤ G`
with `Σ_i ε_{H_i} = 1 + (t − 1) ε_G` in `ℚ[G]` (an identity checked coefficientwise; Kani–Rosen's
sufficient condition is `H_i H_j = G` for `i ≠ j` together with `Σ_i 1/|H_i| = 1 + (t − 1)/|G|`),
`Jac X × Jac(X/G)^{t−1} ∼ Π_i Jac(X/H_i)`. For `G = C₂ × C₂` with `genus (X/G) = 0` and its three
subgroups of order two this is `Jac X ∼ Jac(X/H₁) × Jac(X/H₂) × Jac(X/H₃)`.
*Rests on:* 7.3; Jacobian challenge Layer E (isogenies, images of endomorphisms, `dim`), 1.4.

### 7.5 The group-algebra decomposition (Lange–Recillas)

Let `e₁, …, e_s` be the primitive central idempotents of `ℚ[G]` (one per irreducible `ℚ`-character
`W_i`, i.e. per Galois orbit of irreducible `ℂ`-characters; Tau Ceti's `CharacterTable` idempotents
over `ℂ` summed over Galois orbits, with their orthogonality and `Σ e_i = 1`). Then
`Jac X ∼ B₁ × ⋯ × B_s` with `B_i := e_i(Jac X)` (7.4 Theorem A), and each `B_i ∼ A_i^{n_i}` with
`n_i = χ_i(1) / s_i` (`χ_i` an irreducible constituent of `W_i`, `s_i` its Schur index over `ℚ`), the
*group-algebra decomposition*. Dimensions: `dim B_i = ½ · dim_ℚ (e_i H₁(X, ℚ)) = ½ |Gal-orbit of χ_i| · χ_i(1) · (⟨χ_i, χ_Ω⟩ + ⟨\bar χ_i, χ_Ω⟩)`,
computed from 7.2, and `dim A_i = dim B_i / n_i`; `B_i = 0` iff `⟨χ_i, χ_Ω⟩ = 0 = ⟨\bar χ_i, χ_Ω⟩`;
the trivial character gives `B₁ ∼ Jac(X/G)` of dimension `h`. The factors `A_i` need not be
simple and distinct `A_i` may be isogenous (the LMFDB's note); nothing here asserts otherwise.
*Rests on:* 7.3–7.4; Tau Ceti `CharacterTable.{CentralIdempotent, IdempotentDecomposition}`.

### 7.6 The LMFDB's decomposition record

`jacobianDecomp v : List (ℕ × ℕ)` lists `(dim A_i, n_i)` over the `i` with `B_i ≠ 0`, computed from
`v` through 7.2 and 7.5; prove `Σ dim A_i · n_i = g` and invariance under topological equivalence
(the character `χ_Ω` is). The LMFDB's third entry `c` (a Magma character index) is not a
target. For `h = 0`, `B₁ = 0` (no trivial constituent), and when `G` is
abelian every `n_i = 1`. *Rests on:* 7.2, 7.5, 3.4.

No declaration for this target is in `Suggested.lean`; it is specified here only. The list is compared up to permutation; its order is the
LMFDB's character order, a database convention, not a target.

**Checks.**

- `2.2-1.0.2-2-2-2-2-2` (`C₂`, `(0; 2⁶)`): `[(2, 1)]`, and `2 · 1 = 2 = g`.
- `2.2-1.1.2-2` (`C₂`, `(1; 2, 2)`): `[(1, 1), (1, 1)]`, one entry from the trivial
  character (`h = 1`); `1 + 1 = 2 = g`.
- `3.168-42.0.2-3-7` (Klein quartic): `[(1, 3)]`, so `Jac ∼ E³` and `1 · 3 = 3 = g`.
- For `h = 0` no entry comes from the trivial character; for abelian `G` every `n_i = 1`.

## Layer 8: the hgcwa record

### 8.1 Label prefixes

The family prefix is `(g, [G], h, m)`: genus (2.5), the isomorphism class of `G` (displayed as its
small-group identifier, which is not a target; its invariants `FiniteGroupInvariants`), the
quotient genus and the sorted periods (0.1).
The refined-passport prefix adds the class vector `refinedPassport v` as a function
`Fin r → ConjClasses G` (3.1); the suffix `x` ordering those vectors, and the generating-vector suffix
`y`, are not targets. Prove: two generating vectors with different prefixes are
not topologically equivalent (3.4 preserves `g, [G], σ`; `Aut(G)` may move the class vector, so two
refined passports can be topologically equivalent — the worked example `3.168-42.0.2-3-7` — and the
prefix is a refinement of the topological class only when `Aut(G)` fixes the classes). *Rests on:*
0.1, 2.5, 3.1, 3.4.

### 8.2 The record as theorems

`FamilyRecord` and `PassportRecord` structures collect `genus, group, group_order, g0, r, signature,
dim, gen_vectors (an innClass), refinedPassport, braidClass, topClass, hyperelliptic, hypInvolution,
cyclic_trigonal, cyclicTrigonalAutomorphism, fullCertificate, jacobianDecomp` with each field a
function of `v` defined in 0.1–7.6, and the theorem that every field except `gen_vectors`,
`refinedPassport`, `braidClass` is an invariant of the topological class, every field except
`gen_vectors` and `braidClass` an invariant of the refined passport's `Aut(G)`-orbit, and
`gen_vectors` an invariant of simultaneous conjugation. The composition of stored permutations is
pinned in *Pinned conventions* 1; the regular representation and the class numbering are database
conventions, not targets. *Rests on:* every earlier layer.

## Explicit scope exclusions

- Actions in positive characteristic, wild ramification, and the automorphism groups of curves
  over fields other than `ℂ` ([algebraic curves](../AlgebraicCurves/README.md) Layer 11 and its
  exclusions).
- Non-orientable quotients, anticonformal automorphisms, real forms and symmetric Riemann surfaces
  (Bujalance–Etayo–Gamboa–Gromadzki); the full (orientation-reversing) mapping class group's
  action.
- Hurwitz spaces as algebraic varieties, their components and their fields of definition, lifting
  invariants and rigidity (`../InverseGaloisAndArithmeticFundamentalGroups` IG.3.3, IG.5.3–IG.5.6).
- Teichmüller space itself, Fenchel–Nielsen coordinates, the fixed-locus theorem's proof
  (`../TeichmullerGeometry` T0–T7), and the structure of the moduli space `M_g` (complex curve
  moduli).
- Equations of the families other than through `HyperellipticCurves`; the Shimura-variety
  dimension of a family; the Frediani–Ghigi–Penegini code.
- Fields of moduli and definition of a curve with a given action (Belyi maps Layer 11 for
  three-point covers; nothing in general).
- The classification of large automorphism groups beyond the finite lists of 4.3 and 5.3
  (Hurwitz groups in general, Macbeath's and Conder's genus spectra, Accola–Maclachlan's `8g + 8`
  theorem); the Accola–Maclachlan and Kulkarni surfaces appear only as worked examples.
- Automorphisms of Jacobians that do not come from the curve, the Hodge structure beyond the
  homology character, and endomorphism algebras as such (`SatoTateGroups`).

## Worked examples (acceptance criteria)

Every number below was recomputed (GAP's small-group library through Sage, and the `μ` arithmetic
by hand); counts of vectors are over all generating vectors, then up to simultaneous conjugation
(0.3), refined passports (3.1), braid classes (3.3) and topological classes (3.4). For a triangle
signature with three distinct periods the pure braid group acts by inner automorphisms (`Q_i²` is
conjugation by `c_i c_{i+1}`), so braid classes equal `Inn(G)`-classes there (3.3); `(0; 3, 15, 15)`
below shows the repeated-period case.

- **`2.2-1.0.2-2-2-2-2-2`** (`C₂`, `(0; 2⁶)`): `μ = 1`, `g = 2`, `dim = 3`. One generating vector,
  one class of every kind. `#Fix(ι) = 2 · 6 · ½ = 6 = 2g + 2`: hyperelliptic with `hypInvolution = ι`
  (6.2); not cyclic trigonal; generically full (no Singerman row has `σ = (0; 2⁶)` as the
  subgroup); Chevalley–Weil: the nontrivial character has multiplicity `−1 + 6 · ½ = 2`, so
  `jacobianDecomp = [(2, 1)]`.
- **`2.10-2.0.2-5-10`** (`C₁₀`, `(0; 2, 5, 10)`): `μ = 1/5`, `g = 2`, `dim = 0`; the Wiman bound
  `4g + 2 = 10` is attained (4.5). Four generating vectors, four `Inn`-classes (abelian), four
  refined passports, four braid classes, one topological class (`Aut(C₁₀) ≅ (ℤ/10)ˣ` of order `4`
  permutes them transitively). The involution `5` has `#Fix = 10 (½ + 1/10) = 6`: hyperelliptic;
  the curve is `y² = x⁵ − 1`, full automorphism group `C₁₀`. The sign check of 7.2 on the subgroup
  `C₅ = ⟨γ⟩`, `γ : (x, y) ↦ (ζ₅ x, y)`, signature `(0; 5, 5, 5)`: the branch points are `x = 0` (two
  points, local coordinate `x`, so the monodromy with rotation constant `ζ₅` is `γ`) and `∞` (local
  coordinate `x²/y`, multiplied by `ζ₅²`, so the monodromy there is `γ³`), vector `(1, 1, 3)` in
  `ℤ/5`. `γ^*` acts on `dx/y, x dx/y` by `ζ₅, ζ₅²`, so `ρ_Ω(γ) = (γ⁻¹)^*` has eigenvalues `ζ₅⁴, ζ₅³`
  and `χ_Ω = χ₃ + χ₄` (`χ_k(γ) = ζ₅^k`); 7.2 gives `χ₃ : −1 + 2 · 3/5 + 4/5 = 1`,
  `χ₄ : −1 + 2 · 4/5 + 2/5 = 1`, `χ₁ = χ₂ : 0`, while the weight `(m_j − k)/m_j` would give `χ₁ + χ₂`.
- **`2.6-1.0.2-2-3-3`** (`S₃`, `(0; 2, 2, 3, 3)`): `μ = 1/3`, `g = 2`, `dim = 1`. Twelve generating
  vectors, two `Inn`-classes; for `((23), (23), (132), (123))`, Macbeath gives `#Fix((123)) = 6 · (⅓ + ⅓) = 4`
  (quotient genus `0`) and `#Fix((23)) = 2 · (½ + ½) = 2` (quotient genus `1`). Cyclic trigonal
  with `τ = (123)` (`#Fix = g + 2 = 4`). Not generically full: Singerman's row
  `(0; t₁, t₁, t₂, t₂) ⊂ (0; 2, 2, t₁, t₂)`, index `2` (`μ(0; 2, 2, 2, 3) = 1/6`); the generic full
  group is `S₃ × ⟨hyperelliptic involution⟩ ≅ D₆` of order `12` with `signH = (0; 2, 2, 2, 3)`,
  the family `2.12-4.0.2-2-2-3`. Hyperelliptic (every genus-two curve is) with the involution
  outside `G` (convention 14).
- **`2.2-1.1.2-2`** (`C₂`, `(1; 2, 2)`): `μ = 1`, `g = 2`, `dim = 2`. Four generating vectors
  (`a, b ∈ C₂` free, `c₁ = c₂ = ι`), four `Inn`-classes, one refined passport. `#Fix(ι) = 2 (½ + ½) = 2`,
  quotient genus `1`. Not generically full: row `(1; t, t) ⊂ (0; 2, 2, 2, 2, t)` with `t = 2`,
  index `2`; the generic full group is `C₂ × C₂`, family `2.4-2.0.2-2-2-2-2` (`dim 2` as well).
  Chevalley–Weil: trivial character multiplicity `h = 1`, nontrivial `0 + 2 · ½ = 1`, so
  `jacobianDecomp = [(1, 1), (1, 1)]`; Kani–Rosen Theorem C with the three subgroups of `C₂ × C₂`
  gives `Jac X ∼ E × E'`.
- **`3.168-42.0.2-3-7`** (`PSL₂(𝔽₇)`, `(0; 2, 3, 7)`, the Klein quartic): `μ = 1/42`, `g = 3`,
  `dim = 0`, `|G| = 168 = 84 (g − 1)`: the Hurwitz bound is attained (4.3). `336` generating
  vectors, two `Inn`-classes, two refined passports (the two classes of elements of order `7`),
  two braid classes, **one** topological class (`Aut(G) = PGL₂(𝔽₇)` swaps the two classes), so the
  two refined passports `.1`, `.2` are topologically equivalent (8.1). Full. Not hyperelliptic:
  an involution has `|N_G⟨ι⟩| = 8` and `#Fix = 8 · ½ = 4 ≠ 8`; not cyclic trigonal:
  `#Fix(τ) = 6 · ⅓ = 2 ≠ 5`. Chevalley–Weil: for the two `3`-dimensional characters (values in
  `ℚ(√−7)`; `ρ(c₁)` has eigenvalues `1, −1, −1`, `ρ(c₂)` has `1, ζ₃, ζ₃²`, `ρ(c₃)` has `ζ₇, ζ₇², ζ₇⁴`
  for one and `ζ₇³, ζ₇⁵, ζ₇⁶` for the other), `−3 + 2·½ + (⅓ + ⅔) + (1 + 2 + 4)/7 = 0` and
  `−3 + 1 + 1 + (3 + 5 + 6)/7 = 1`, so `H⁰(Ω)` is the second; the `ℚ`-character of degree `6` has
  `n = 3`, `dim B = 3`, and
  `jacobianDecomp = [(1, 3)]`: `Jac ∼ E³`.
- **`4.120-34.0.2-4-5`** (`S₅`, `(0; 2, 4, 5)`, Bring's curve): `μ = 1/20`, `g = 4`, `dim = 0`;
  `120` generating vectors, one class of every kind; full; `|G| = 120 = 40 (g − 1) > 4 (g − 1)`.
- **`10.9-2.0.3-3-3-3-3-3`** (`C₃ × C₃`, `(0; 3⁶)`): `μ = 2`, `g = 10`, `dim = 3`; `29040`
  generating vectors, each its own `Inn`-class and refined passport. For `(x, x, x², x², y, y²)`:
  `#Fix(x) = 9 · 4 · ⅓ = 12 = g + 2` (cyclic trigonal with `τ = x`), `#Fix(y) = 6`, `#Fix(xy) = 0`.
- **`13.45-2.0.3-15-15`** (`C₃ × C₁₅`, `(0; 3, 15, 15)`): `μ = 8/15`, `g = 13`, `dim = 0`; `192`
  generating vectors, `192` `Inn`-classes and refined passports (abelian, `c₂ ≠ c₃` always), `96`
  braid classes (`Q₂` swaps `c₂, c₃`), one topological class (`|Aut G| = 192` acts freely and
  transitively). Not generically full: row
  `(0; t₁, t₁, t₂) ⊂ (0; 2, t₁, 2t₂)` with `(t₁, t₂) = (15, 3)`, index `2`
  (`μ(0; 2, 6, 15) = 4/15`), overgroup of order `90` with `signH = (0; 2, 6, 15)`; the extension
  condition of 5.4 (an automorphism swapping `c₂` and `c₃`) holds for every vector.
- **Hurwitz curves** `7.504-156.0.2-3-7` (`PSL₂(𝔽₈)`, `504 = 84 · 6`) and `14.1092-25.0.2-3-7`
  (`PSL₂(𝔽₁₃)`, `1092 = 84 · 13`); **`5.192-181.0.2-3-8`** (`μ = 1/24`, `g = 5`, `192 = 48 (g − 1)`).

### Boundary and off-hypothesis checks

- `C₂` with `(0; 2, 2, 2)`: no generating vector (three involutions never multiply to `1`): 0.2
  rejects. `C₄` with `(0; 2, 2, 2, 2)`: `(2, 2, 2, 2)` satisfies the relation and the orders but
  generates `⟨2⟩`: rejected by `closure_eq_top`. `A₅` with `(0; 2, 3, 7)`: no element of order `7`:
  rejected (`A₅` is not a Hurwitz group).
- `(0; 2, 2, 2, 2)`, `(0; 2, 3, 6)`, `(0; 2, 4, 4)`, `(0; 3, 3, 3)`, `(1; ∅)` have `μ = 0`;
  `(0; 2, 3, 5)` has `μ < 0`: `IsHyperbolic` rejects them, and `genusOfOrder` is `1` or `< 1`.
- The Singerman indices: `μ(0; 7, 7, 7)/μ(0; 2, 3, 7) = (4/7)/(1/42) = 24`, `(0; 2, 7, 7)`: `9`,
  `(0; 3, 3, 7)`: `8`, `(0; 4, 8, 8)/(0; 2, 3, 8) = (½)/(1/24) = 12`, `(0; 3, 8, 8)`: `10`,
  `(0; 9, 9, 9)/(0; 2, 3, 9) = (⅔)/(1/18) = 12`, `(0; 4, 4, 5)/(0; 2, 4, 5) = (3/10)/(1/20) = 6`,
  `(0; t⁴)/(0; 2, 2, 2, t) = 4`, `(0; t, t, t)/(0; 3, 3, t) = 3`, `(0; t, t, t)/(0; 2, 3, 2t) = 6`.
- `μ` minima: `(0; 2, 3, 7): 1/42`, `(0; 2, 3, 8): 1/24`, `(0; 2, 4, 5): 1/20`, `(0; 2, 3, 9): 1/18`,
  `(0; 2, 2, 2, 3): 1/6`, `(0; 2⁵): ½`, `(1; 2): ½`.
- The sign convention of 7.2: `C₃` with `c = (1, 1, 1)` on a genus-one curve (`μ = 0`, outside the
  roadmap's hypotheses but a valid check of 7.1–7.2): on `ℂ/ℤ[ω]` with `γ : z ↦ ωz` the three fixed
  points have `ζ_P = ω`, Eichler's formula gives `Tr γ^* = 1 + 3ω/(1 − ω) = ω`, matching
  `γ^* dz = ω dz` directly, so `ρ_Ω(γ) = (γ⁻¹)^*` acts by `\bar ω = ζ₃²`; 7.2 gives the character
  with `χ(c_j) = ζ₃²` multiplicity `−1 + 3 · ⅔ = 1` and the one with `χ(c_j) = ζ₃` multiplicity
  `−1 + 3 · ⅓ = 0`, as it must; the weight `(m_j − k)/m_j` would exchange them.

## Ordering

```text
Layer 0 (signatures, generating vectors, Γ(σ))          Mathlib; Tau Ceti TriangleGroup, PermutationTriple
Layer 1 (actions, quotient, signature, differentials)   Tau Ceti RiemannSurface; Fuchsian orbifolds L5; modular forms 10B
Layer 2 (existence criterion)                            0, 1; Fuchsian orbifolds L2, L4; Belyi maps L5–L6; Surface topology L7–L8; complex curve moduli D0
Layer 3 (refined passports, braid, topological)          0, 2; IG.3.2; Surface topology L9; Teichmüller geometry T6
Layer 4 (g0, dim, finiteness, Hurwitz, Harvey, Wiman)    0, 1, 2; Fuchsian orbifolds 4a; Teichmüller geometry T7
Layer 5 (full groups, Singerman)                         2, 3, 4; Teichmüller geometry T9
Layer 6 (Macbeath, hyperelliptic, cyclic trigonal)       1, 2, 3, 5; CanonicalModelsAndGonality L6; HyperellipticCurves 1.4
Layer 7 (Eichler, Chevalley–Weil, Jacobian)              1, 6; Jacobian challenge D–F; complex tori M1; Tau Ceti CharacterTable
Layer 8 (record semantics)                               all
```

Layer 0 and Layer 1 are independent of each other. Within Layer 0, 0.1–0.5 are sequential and 0.6,
0.7 depend only on 0.5. Layer 4's 4.4–4.5 need only Layer 0 and 1.4; 4.2 needs T7; 4.6 needs 4.3
and 4.5. Layers 5, 6 and 7 are mutually independent once 2–4 exist, except that 6.3–6.4 use 5.5.

## References

- T. Breuer, *Characters and Automorphism Groups of Compact Riemann Surfaces*, LMS Lecture Note
  Series 280, Cambridge University Press, 2000. Chapter 3 (signatures, generating vectors, the
  existence theorem, the Chevalley–Weil formula), Appendix (the genus-`≤ 48` data the LMFDB
  derives from).
- S. A. Broughton, *Classifying finite group actions on surfaces of low genus*, J. Pure Appl.
  Algebra 69 (1991), 233–270. §1 (signatures and Riemann–Hurwitz), §2 (Propositions 2.1–2.2:
  existence through surface-kernel epimorphisms; topological equivalence through `Aut(G) × Mod`),
  Tables 4–5 (genus `2` and `3`).
- W. J. Harvey, *Cyclic groups of automorphisms of a compact Riemann surface*, Quart. J. Math.
  Oxford (2) 17 (1966), 86–97. Theorem 4 (the cyclic criterion), and the bound `4g + 2`.
- A. Wiman, *Über die hyperelliptischen Curven und diejenigen vom Geschlechte p = 3 …*, Bihang
  Kongl. Svenska Vet.-Akad. Handlingar 21 (1895). The bound `4g + 2`.
- A. M. Macbeath, *Action of automorphisms of a compact Riemann surface on the first homology
  group*, Bull. London Math. Soc. 5 (1973), 103–108. §2 (the fixed-point formula).
- D. Singerman, *Finitely maximal Fuchsian groups*, J. London Math. Soc. (2) 6 (1972), 29–38.
  Theorem 1 (the list of 5.3).
- E. Bujalance, F.-J. Cirre, M. D. E. Conder, *On extendability of group actions on compact Riemann
  surfaces*, Trans. Amer. Math. Soc. 355 (2003), 1537–1557. §§3–4 (the extension conditions
  of 5.4).
- J. F. X. Ries, *Subvarieties of moduli space determined by finite groups acting on surfaces*,
  Trans. Amer. Math. Soc. 335 (1993), 385–406. §3 (generic full automorphism groups).
- H. M. Farkas, I. Kra, *Riemann Surfaces*, 2nd ed., GTM 71, Springer, 1992. III.7 (quotients by
  finite groups), V.1 (Hurwitz's theorem), V.2.9 (the Eichler trace formula).
- R. Miranda, *Algebraic Curves and Riemann Surfaces*, GSM 5, AMS, 1995. III.3 (group actions,
  the quotient, Riemann–Hurwitz for quotients).
- C. Chevalley, A. Weil, *Über das Verhalten der Integrale 1. Gattung bei Automorphismen des
  Funktionenkörpers*, Abh. Math. Sem. Univ. Hamburg 10 (1934), 358–361; with Weil's correction,
  as stated in Breuer, Chapter 3.
- E. Kani, M. Rosen, *Idempotent relations and factors of Jacobians*, Math. Ann. 284 (1989),
  307–327. Theorems A, B, C.
- H. Lange, S. Recillas, *Abelian varieties with group action*, J. reine angew. Math. 575 (2004),
  135–155. §2 (the isotypical decomposition), §5 (dimensions of the factors).
- J. Paulhus, *Decomposing Jacobians of curves with extra automorphisms*, Acta Arith. 132 (2008),
  231–244; *A database of group actions on Riemann surfaces*, in *Birational geometry,
  Kähler–Einstein metrics and degenerations*, Springer Proc. Math. Stat. 409 (2023), 693–708
  (the LMFDB's data and its conventions).
- D. Swinarski, *Equations of Riemann surfaces with automorphisms*, arXiv:1607.04778 (the LMFDB's
  hyperelliptic and cyclic-trigonal tests).
- The LMFDB knowls `curve.highergenus.aut.*` and `lmfdb/higher_genus_w_automorphisms/main.py`.
