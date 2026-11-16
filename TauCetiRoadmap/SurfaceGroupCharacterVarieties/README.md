# Roadmap: surface group character varieties

**Summary.** This roadmap builds the interface between the mapping class groups of punctured
surfaces and the representation theory of their fundamental groups into real reductive groups.
It starts from the abstract group theory of outer automorphisms (the action of TeichmullerGeometry's
outer automorphism group `Out(Γ)` of an arbitrary group on conjugacy classes of homomorphisms
`Hom(Γ, H)/H`), completes the
punctured-surface mapping class group of MordellLawrenceVenkatesh Layer LV.5 by the group of ambient
isotopy classes of an arbitrary space, the comparison of punctures with marked points, the
permutation of the punctures underlying MappingClassGroupsAndCanonicalRepresentations' pure mapping
class group and the standard model of a closed surface, and constructs the outer action
`Ψ : Mod_{g,n} → Out(π₁(Σ_{g,n}, x))`
with all its laws. It then builds the representation scheme `Hom(Γ, G)` of a finitely generated
group, the real reductive groups `G^ℝ` (open subgroups of the real points of a connected reductive
`ℝ`-group, given by its coordinate Hopf algebra in Tau Ceti's library of affine groups, among them
RealSemisimpleLieGroups' real forms given by antiholomorphic involutive automorphisms, together with
the uniqueness of the `ℝ`-form such an automorphism determines), the real
Kempf–Ness theory of minimal vectors, the six equivalent characterizations of reductive
representations, and the character variety `𝒳(Γ, G^ℝ) = Hom^red(Γ, G^ℝ)/G^ℝ` of a finitely
generated group `Γ`. The end theorems are:
`𝒳(Γ, G^ℝ)` is Hausdorff, locally compact and second countable and is homeomorphic to the space of
minimal vectors modulo a maximal compact subgroup; for complex groups it is homeomorphic to the
complex points of the affine quotient `Hom(Γ, G)//G`, which is the universal Hausdorff quotient of
`Hom(Γ, G(ℂ))/G(ℂ)`; and `Out(Γ)`, hence `Mod_{g,n}` through `Ψ`, acts on it by homeomorphisms
(the action of `Out(Γ)` for every group `Γ` and every subgroup of the points of an affine group),
compatibly with change of basepoint and with the action on conjugacy classes of all
representations. `Suggested.lean` states, against the pinned libraries, the non-descent theorem of
§1.3, the extension over punctures of §2.2, the outer action of §3.3, the real Kempf–Ness theorem of
§5.4, four of the six characterizations of §6.7, the topology of `𝒳(Γ, G^ℝ)` of §7.1, the universal
Hausdorff quotient of §7.2 and the outer action of §7.4; its module docstring names the headline
clauses that the pins cannot state and what each lacks.

## Scope and ownership

This roadmap owns:

- for an arbitrary group `Γ`, the identification `Inn(Γ) ≃* Γ ⧸ Z(Γ)` and the transport of
  TeichmullerGeometry §4.2's `Out(Γ)` along isomorphisms `Γ ≃* Γ'`, the set
  `Rep(Γ, H) = Hom(Γ, H)/H` of conjugacy classes of homomorphisms into a group `H`, and the left
  action `[φ]·[ρ] = [ρ ∘ φ⁻¹]` of `Out(Γ)` on it, together with the theorem that the action of
  `Aut(Γ)` on `Hom(Γ, H)` itself factors through `Out(Γ)` exactly when every homomorphism
  `Γ → H` has abelian image (Layer 1);
- the group `Mod^±(X)` of ambient isotopy classes of self-homeomorphisms of a topological space,
  which differs from TeichmullerGeometry §0.0h's `MappingClassGroupFull X` by requiring the
  level-preserving total map of an isotopy to be a homeomorphism, the relation that extends over
  punctures, together with its comparison homomorphism onto `MappingClassGroupFull X`; the
  extension theorem identifying homeomorphisms and isotopies of `Σ ∖ P` with those of `Σ` preserving
  the finite set `P`, the permutation homomorphism `Mod_{g,n} → Sym(P)` given by the extension and
  its identification with the permutation of the punctures that defines
  MappingClassGroupsAndCanonicalRepresentations §0.2's pure mapping class group, the homeomorphism of
  `Σ_g` with TeichmullerGeometry §0.0f's standard orientable model of genus `g`, which gives `Σ_g` its
  genus and orientability in that roadmap's sense, and the change-of-model isomorphisms (Layer 2);
- the automorphism `f_δ` of `π₁(X, x)` induced by a homeomorphism and a path, its laws, the lemma
  that a homeomorphism isotopic to the identity induces an inner automorphism, the outer action
  `Ψ_x : Mod^±(X) → Out(π₁(X, x))` and its canonicity under change of basepoint, its
  identification for closed surfaces of genus at least one with TeichmullerGeometry §5.4's
  Dehn–Nielsen–Baer isomorphism and the description of the image of the orientation-preserving
  classes by the action on `H₂`, its comparison with the outer class of
  MordellLawrenceVenkatesh §5.9, the action of `Mod^±_{g,n}` on conjugacy classes of homomorphisms,
  defined as `Ψ_x` followed by Layer 1's action of `Out`, and its agreement with
  MordellLawrenceVenkatesh §5.9's action on finite coverings, its compatibility with basepoint change
  and with homomorphisms of the target group, the comparison of finite orbits under finite-index
  subgroups, and the non-descent theorem for the based action of the marked-point group `Mod(S*)` on
  homomorphisms (Layer 3);
- the representation scheme `Hom(Γ, G)` of a finitely generated group into an affine group scheme
  over a commutative ring, its topologies on real and complex points, and the surface-group
  instances (Layer 4);
- real reductive data, the uniqueness, up to unique isomorphism over the identity, of the `ℝ`-form
  of a complex reductive group whose conjugation is a given antiholomorphic involutive automorphism,
  and the converse that the conjugation of every `ℝ`-form is one, Cartan-compatible realizations of
  the conjugation action, and the real Kempf–Ness theorem for linear actions of real reductive groups
  (Layer 5);
- reductive representations and the equivalence of the six conditions (adjoint semisimplicity over
  `ℝ` and over `ℂ`, reductive Zariski closure, `G`-complete reducibility, closed complex orbit,
  closed real orbit) (Layer 6);
- the character variety `𝒳(Γ, G^ℝ)` of a finitely generated group, its topology, the affine
  quotient `Hom(Γ, G)//G` of the representation scheme by a connected reductive group over any
  field, its closed immersion into `G^S//G` over fields of characteristic zero and its complex
  comparison, functoriality and the action of `Out(Γ)` (both for every group `Γ`, on the quotient of
  its reductive homomorphisms by conjugation), the action of `Mod_{g,n}`, and the standard examples
  (Layer 7).

It leaves to named owners, never planned again here; the sections a target uses are listed under
*Exact supplier contracts* and in the *Needs:* lines:

- surfaces with boundary and punctures as topological data, `Mod(S)` (orientation-preserving,
  boundary fixed, punctures permuted) and its action, through `Out(π₁ S)`, on isomorphism classes of
  finite coverings, `[p] ↦ [f ∘ p]`, which on monodromy is precomposition with `(f⁻¹)_*`, the
  marked-point group `Mod(S*)`, `Forget`, the classification of compact surfaces by type
  `(g, b, n)`, the fundamental class and duality, the homology of a surface of given type,
  asphericity, trivial centre for `χ(S) < 0`, the evaluation fibration, Hamstrom's theorem, point
  pushing, the Birman exact sequence, capping, Dehn twists, the symplectic representation and the
  configuration fibration: MordellLawrenceVenkatesh §§5.1, 5.4–5.6, 5.9–5.12, 5.15–5.23;
- the mapping class group `Mod(F)` of a compact smooth surface, whose single owner it is:
  GeometricTopology Layer 1.7.2;
- the identification of the presented surface group with the fundamental group of a surface of type
  `(g, b, p)`, freeness of rank `2g + b + p − 1` for `b + p ≥ 1`, the pure mapping class group
  `PMod(g, b, p)` of index `p!` with every permutation of the punctures realized, and the pure Birman
  exact sequence for `χ(Σ_{g,b,p}) < 0`: MappingClassGroupsAndCanonicalRepresentations §§0.1–0.3,
  used here with `b = 0`;
- topological surfaces charted on the half-plane model, invariance of the boundary, Radó's theorem
  that a compact surface carries a PL structure, the compatible smoothings of PL structures,
  Epstein's isotopy theorem for closed surfaces, the comparison of the boundaryless and half-plane
  models of a smooth surface without boundary, polygon schemas, their realizations and the standard
  models, the classification of compact surfaces by these models and the genus and orientability
  predicates it defines, the topological mapping class group `MappingClassGroupFull`
  of a space (homeomorphisms modulo isotopy through embeddings), the outer automorphism group
  `OuterAut` of an arbitrary group, written `Out` here (`Suggested.lean` restates it as `Out`, with
  the normality instance `innerAut_range_normal`, only because the pins have no outer automorphism
  group of an abstract group), with the normality of the inner
  automorphisms (`innerAut_normal`) and its comparison with `TauCeti.ContinuousOut`, the geometric
  group `Π = π₁ᵒᵖ` and its inversion equivalence, the attaching word of the polygon model, the
  Euler number, the uniformizing holonomy, the topological Dehn–Nielsen–Baer theorem
  `dehn_nielsen_baer` for closed orientable surfaces of genus at least one, the mapping class groups
  of the sphere and the torus, and the converse marked representation comparison:
  TeichmullerGeometry §§0.0b, 0.0d, 0.0e, 0.0f, 0.0h, 4.2–4.5, 5.4, 5.4a, 6.1;
- the presented surface groups `S±(g, m)` and the freeness of `S±(g, m)` for `m ≥ 1`:
  FreeGroupsAndLimitGroups §§6.1–6.2; cellular homology and its comparison with singular homology:
  AlgebraicTopology §§4.2–4.3;
  the singular homology of a `K(G, 1)` CW complex as group homology: ClassifyingSpaces
  Stage 4;
- affine groups of finite type over a field as finite-type commutative Hopf algebras
  (`TauCeti.FiniteTypeCommHopfAlgCat`), connected reductive groups
  (`TauCeti.reductiveCommHopfAlgProperty`: smooth, geometrically connected, with trivial geometric
  unipotent radical) and their characteristic-zero linear reductivity
  (`TauCeti.reductiveCommHopfAlgProperty.linearlyReductive`,
  `TauCeti.reductiveCommHopfAlgProperty_iff_linearlyReductive`), the convolution groups of points
  (`AlgHom.convGroupOfSemiring`, functorial by `AlgHom.mapValue`) with their point topology
  (`TauCeti.PointTopology.instTopologicalSpaceWithConv`, a topological group by
  `TauCeti.PointTopology.isTopologicalGroup` for a commutative topological semiring `R` of values,
  and locally compact for a finite-type algebra over a commutative ring and a commutative
  topological ring `R` of values that is T1 and locally compact
  (`[IsTopologicalSemiring R] [T1Space R] [LocallyCompactSpace R]`) by
  `TauCeti.PointTopology.locallyCompactSpace_of_finiteType`), the Lie algebra as
  counit derivations with the adjoint action of the points (`Derivation.adRepresentation`), the
  points of Weil restrictions (`TauCeti.Algebra.WeilRestriction.pointsMulEquiv`), comodule algebras
  (`TauCeti.ComoduleAlgebra`) with their invariant subalgebras
  (`TauCeti.ComoduleAlgebra.coinvariants`) and the finite generation of these over a linearly
  reductive bialgebra (`TauCeti.ComoduleAlgebra.finiteType_coinvariants`), and closed
  connected surfaces (`TauCeti.IsClosedConnectedSurface`): Tau Ceti at the pin;
- representations as comodules and their invariants, Lie algebras of closed subgroups, closed
  orbits in orbit closures, unipotent radicals, the centre of a reductive group, Levi
  decompositions, parabolics and cocharacters: ReductiveGroups Layers 1, 2, 3A, 5, 6, 7;
- the point topology on `X(R)` for a topological algebra `R`, its closed embeddings given by finite
  presentations, and Weil restriction of affine group schemes: ReductiveGroupsPartII §§RG2.0.1,
  RG2.0a.2, read on the pinned declarations above; the classical topology on the complex points of a
  complex scheme locally of finite type: ReductiveGroups §3A.5c;
- the affine quotient of an integral affine variety by a connected reductive group, the unique
  closed orbit in each fibre, `G`-complete reducibility of closed subgroups, the `GL(V)` comparison,
  the closed-tuple criterion and the cocharacter limit into the closed orbit:
  ArithmeticGaloisRepresentations §1.11, paragraphs **Reductive quotients over fields and DVRs**
  and **Complete reducibility and closed tuples**; scalar extension of semisimple representations
  over a perfect field: ArithmeticGaloisRepresentations §1.7;
- the extension of the reductive quotient to arbitrary affine schemes of finite type over a field,
  reducible and nonreduced ones included (finite generation of invariants, closed images and
  separation of invariant closed subsets, a unique closed orbit in every geometric fibre):
  LanglandsParameterStacks §2.2;
- the algebra `C_n` of functions on `Hⁿ` invariant under simultaneous conjugation, for a
  commutative Hopf algebra over any commutative ring: IntegralHeckeAndGaloisDeterminants §0.7,
  **Invariant coordinate algebras under conjugation**; it is the coordinate algebra of the
  target `G^S//G` of §7.2's closed immersion (`n = |S|`), and §7.2's `Hom(Γ, G)//G` differs from
  `Spec C_n` by the relations of `Γ`;
- real points of linear algebraic groups as Lie groups, transpose-stable realizations, maximal
  compact subgroups, polar decomposition, and algebraic Cartan involutions:
  ArithmeticLocallySymmetricSpaces §§ALS.F.1, ALS.0.1;
- for a connected complex reductive group `H` and an antiholomorphic involutive automorphism `τ` of
  `H(ℂ)`, the connected reductive `ℝ`-group whose complex conjugation is `τ`, with real points
  `H(ℂ)^τ`, the identification of the Cartan involutions for `τ` with the complexifications of
  ArithmeticLocallySymmetricSpaces §ALS.0.1's Cartan involutions of that `ℝ`-group, their existence
  and conjugacy under `(H(ℂ)^τ)°`, and the maximal compact subgroup `K = H(ℂ)^τ ∩ H(ℂ)^σ` with the
  Cartan decomposition `K × 𝔭 → H(ℂ)^τ`: RealSemisimpleLieGroups §2.5. §5.3's polar decompositions
  are a kept variant: they are stated for every open subgroup `G^ℝ ⊆ 𝐆(ℝ)` of a real reductive datum
  in a transpose-stable realization, and for `G(ℂ) = U exp(i𝔲)`, where RealSemisimpleLieGroups §2.5
  treats the full fixed group `H(ℂ)^τ`;
- the Cartan decomposition and the `K A K` decomposition, and the global matrix models of real
  reductive Lie groups (closed transpose-stable subgroups of `GL_N(ℝ)` with finitely many
  components, with a finite central covering): LieGroups Layer 9; §5.4's real reductive linear
  groups are a kept variant, the polar condition `G = K exp(𝔭)` on a subgroup of `GL(V)`;
- flat connections on a closed surface modulo gauge for compact `K` and their comparison with
  `Hom(π₁Σ, K)/K`: SymplecticGeometry/HamiltonianReduction R5, used here only as a Check.

The outer action of `Out(F_r)` on
exterior epimorphisms onto a finite group is InverseGaloisAndArithmeticFundamentalGroups §IG.3.2;
it is the case `Γ = F_r`, `H` finite, restricted to surjections, of Layer 1 here. The
mapping-class action of GroupActionsOnRiemannSurfaces §3.4 on classes of surface-kernel
epimorphisms, taken there from MordellLawrenceVenkatesh §5.9, is, through the quotient of the
punctured surface group onto the Fuchsian group of the signature, the restriction of §3.5's action
with `H` finite to the classes of epimorphisms of the prescribed peripheral orders and to the
subgroup preserving the cone-order colours. Three objects of
MappingClassGroupsAndCanonicalRepresentations are special cases of targets here: its §0.2 outer
action of `PMod(g, 0, n)` on `π₁(Σ_{g,n}, x)` is
the restriction of `Ψ_x` (§3.3), which is defined on all of `Mod^±(X)` for every path-connected
space `X`; its §2.1 MCG-finiteness of `ρ : π₁(Σ_{g,n}, x) → GL_r(ℂ)` is finiteness of the orbit of
`[ρ]` under §3.5's action for `H = GL_r(ℂ)`, which is stated for every group `H`; and its §1.4
`R_r(Γ)` and `M_r(Γ)` of a finitely presented `Γ` are the case `G = GL_r`, `k = ℂ` of §4.1's
representation scheme and §7.2's affine quotient, which are stated for every affine group scheme
over a commutative ring and every connected reductive group over a field. The rank-two character
scheme of `F₂` of NonabelianLevelStructures §5.1, `Spec` of the `GL₂`-conjugation invariants of
`O(SL₂ × SL₂)`, is over a field `k` the case `Γ = F₂`, `G = SL₂` of §7.2's affine quotient: the
coaction invariants of `SL₂` and of `GL₂` agree, both conjugation actions factoring through the
faithfully flat quotient maps onto `PGL₂`. It is stated there over every commutative ring, with the
explicit trace coordinates `(tr A, tr B, tr AB)` that §7.2 does not give, and NonabelianLevelStructures
§5.2 gives the right action `ρ ↦ ρ ∘ φ` of `Aut(F₂)` in these coordinates; §5.1 is used here only in
Checks of §§7.2 and 7.5, and §5.2 only in §7.5.

Not owned and not planned here: the smooth model `Diff⁺(Σ, P)/smooth isotopy` of the punctured
mapping class group and the Dehn–Nielsen–Baer theorem for punctured surfaces, which extend
TeichmullerGeometry's closed theory and belong to a TeichmullerGeometry, Part II; Teichmüller space
and its mapping class action (TeichmullerGeometry Layers 1–3, 7–8); the nonabelian Hodge
correspondence, Higgs bundles, Hitchin and `Θ`-positive components; Goldman's symplectic form and
the tangent-space theory of character varieties; the Kirwan–Ness stratification of the null cone.

## Conventions

- **Fundamental groups and paths.** `π₁(X, x)` is Mathlib's `FundamentalGroup X x`. For paths
  `α : x ⟶ y` and `β : y ⟶ z`, `α ⬝ β` is `α.trans β` (first `α`); `ᾱ` is `α.symm`. The native
  product is `[α] * [β] = [β ⬝ α]` (`FundamentalGroup.mul_def`), so `MulAut.conj [u] [γ] =
  [u] * [γ] * [u]⁻¹` is the class of `ū ⬝ γ ⬝ u`. Mathlib's `fundamentalGroupMulEquivOfPath σ`, for
  `σ : x ⟶ x'`, sends `[γ]` to `[σ̄ ⬝ γ ⬝ σ]`; for a loop `σ` at `x` it is `MulAut.conj [σ]`.
  Witness: on the wedge of two circles with loops `a, b` at the wedge point, `[a] * [b]` is the class
  of `b ⬝ a`, and `MulAut.conj [a] [b]` is the class of `ā ⬝ b ⬝ a`; this is the convention of
  MordellLawrenceVenkatesh §5.19, where `Push(α)` acts by `γ ↦ α * γ * α⁻¹`.
- **Outer automorphisms.** `Inn(Γ)` is the range of `MulAut.conj : Γ →* MulAut Γ`, and `Out(Γ)` is
  TeichmullerGeometry §4.2's `OuterAut Γ = MulAut Γ ⧸ Inn(Γ)`, for every group `Γ`; the class of
  `φ ∈ MulAut Γ` is written `[φ]`.
- **Commutators and surface groups.** The presented surface group is FreeGroupsAndLimitGroups
  §6.1's `S⁺(g, m)`, with relator `[a₁, b₁] ⋯ [a_g, b_g] p₁ ⋯ p_m` and `[x, y] = x⁻¹ y⁻¹ x y`.
  TeichmullerGeometry §4.3 uses `[a, b] = a b a⁻¹ b⁻¹` in the geometric group `Π`; the substitution
  `x ↦ x⁻¹` exchanges the two commutators, so both relators define isomorphic groups and isomorphic
  representation schemes `{(A_i, B_i) : ∏ [A_i, B_i] = 1}`. Witness: for `g = 1` both read
  `A B = B A`; for `g = 2` the choice is detected as in TeichmullerGeometry §4.3's Check.
  MappingClassGroupsAndCanonicalRepresentations §0.1's `surfaceGroup g n`, with
  `[x, y] = x y x⁻¹ y⁻¹` and peripheral loops `c_j`, is `S⁺(g, n)` transported along the inversion
  `aᵢ ↦ aᵢ⁻¹`, `bᵢ ↦ bᵢ⁻¹`, `p_j ↦ c_j` of the handle generators. Witness: for `(g, n) = (1, 1)` the
  inversion carries `a⁻¹ b⁻¹ a b p₁` to `a b a⁻¹ b⁻¹ c₁`.
- **Actions.** Automorphisms of `ℤ²` are read as matrices acting on column vectors, the matrix `M`
  sending the `j`-th basis vector to the `j`-th column of `M`; this is the reading of
  `MulAut ℤ² = Out(ℤ²) = GL₂(ℤ)` everywhere below. `Aut(Γ)` acts on the left on `Hom(Γ, H)` by
  `φ · ρ = ρ ∘ φ⁻¹`. Witness: for `Γ = ℤ²`,
  `ρ` the first coordinate, `φ = [[1,1],[0,1]]`, `ψ = [[1,0],[1,1]]`: `(φψ)·ρ` is the first row of
  `(φψ)⁻¹ = [[1,−1],[−1,2]]`, namely `(1, −1)`, which equals `φ·(ψ·ρ)`, while `ψ·(φ·ρ)` is the first
  row of `(ψφ)⁻¹ = [[2,−1],[−1,1]]`, namely `(2, −1)`. The inner automorphism `c_γ = MulAut.conj γ`
  acts by `c_γ · ρ = MulAut.conj (ρ γ)⁻¹ ∘ ρ`.
- **Isotopy.** Two homeomorphisms `f, g` of a space `X` are isotopic when they are ambient isotopic
  in Tau Ceti's sense (`TauCeti.AmbientIsotopic`): some `TauCeti.AmbientIsotopy X`, a homotopy from
  the identity whose level-preserving total map `I × X → I × X` is a homeomorphism, has final map
  `g ∘ f⁻¹`. Isotopies of a surface with punctures never move the punctures, because the punctures
  are not points of the space. TeichmullerGeometry §0.0h's isotopy (`TauCeti.Isotopic`, homotopies
  through embeddings) is weaker in general and agrees with this one on compact connected manifolds
  without boundary (§2.1). MordellLawrenceVenkatesh §5.9's isotopies of `S = Σ_g ∖ P`, which
  §§5.17–5.19 there handle as paths in `Homeo⁺(S, ∂S)` with the compact-open topology, are
  homotopies through homeomorphisms (by the exponential law, `S` being locally compact Hausdorff),
  and on the boundaryless surface `S` these are exactly the ambient isotopies (§2.1).
- **Surfaces.** `Σ_g` is a closed connected oriented topological surface of genus `g`
  (MordellLawrenceVenkatesh §5.1 with empty boundary, the genus of MordellLawrenceVenkatesh §5.4); by
  §2.4 it is homeomorphic to TeichmullerGeometry §0.0f's model of `StandardSurface.orientable g 0`, so
  `Surface.IsOrientable Σ_g` and `Surface.genus Σ_g = g`. `P ⊂ Σ_g` is a finite set of `n` points,
  `Σ_{g,n} = Σ_g ∖ P`, `x ∈ Σ_{g,n}`. `Mod_{g,n}` is MordellLawrenceVenkatesh §5.9's `Mod(Σ_{g,n})`,
  the orientation-preserving homeomorphisms modulo isotopy, punctures permuted; `Mod^±_{g,n}`
  allows orientation reversal. `PMod_{g,n}` is MappingClassGroupsAndCanonicalRepresentations §0.2's
  `PMod(g, 0, n)`, the classes fixing each puncture, which §2.3 identifies with the kernel of the
  permutation homomorphism `σ` given by the extension over `P`. No target here assumes
  `2g − 2 + n > 0`; a hypothesis on the genus is stated where it is used.
- **Notation shared with suppliers.** `Ψ_x` is the outer action of §3.3; MordellLawrenceVenkatesh's
  `Ψ` (§§5.9, 5.22 there) is the symplectic representation, written here as the action on `H₁`.
  `Mod^±(X)` is §2.1's group of ambient isotopy classes of self-homeomorphisms of a topological
  space `X`, an abstract group on which no topology is put; TeichmullerGeometry §3.1's `Mod±(Σ) = π₀ Diff(Σ)` of
  a smooth closed surface is another carrier, which that section identifies with
  `MappingClassGroupFull Σ` through TeichmullerGeometry §0.0h, and so with `Mod^±(Σ)` by §2.1.
  Witness: on the torus both groups are `GL₂(ℤ)`, and the shear `(u, v) ↦ (u, u + v)` goes to
  `[[1,0],[1,1]]` under `Ψ_x` (§3.3) and under the action on `H₁`.
- **Affine groups and their points.** An affine group `𝐆` of finite type over a field `k` is given
  by its coordinate algebra `O(𝐆)`, a finite-type commutative Hopf `k`-algebra
  (`TauCeti.FiniteTypeCommHopfAlgCat k`); it is connected reductive when `O(𝐆)` satisfies
  `TauCeti.reductiveCommHopfAlgProperty k`. Its points over a commutative `k`-algebra `R` are the
  convolution group `𝐆(R) = WithConv (O(𝐆) →ₐ[k] R)`, with the point topology when `R` is
  topological. Its Lie algebra with coefficients in `R` is the module of counit derivations
  `Derivation k O(𝐆) (TauCeti.Bialgebra.CounitAlgebra k O(𝐆) R)`, on which `𝐆(R)` acts by Tau Ceti's
  `Derivation.adRepresentation`; `adjointRepresentation k O(𝐆) R` is this action read on
  `R`-valued points. Witness: for `𝐆 = 𝔾_m`, `O(𝐆) = k[t, t⁻¹]`, a point `λ ∈ 𝐆(R) = R^×` is the
  evaluation `t ↦ λ`, the Lie algebra is `R`, spanned by the derivation `t ↦ 1`, and `Ad` is trivial,
  `𝔾_m` being commutative.
- **Real reductive data.** A real reductive datum `(𝐆, G^ℝ)` is a connected reductive group `𝐆`
  over `ℝ` (ReductiveGroups Layer 6; Tau Ceti `TauCeti.reductiveCommHopfAlgProperty ℝ`) and an open
  subgroup `G^ℝ ⊆ 𝐆(ℝ)`; `G := 𝐆_ℂ`, `τ` is complex
  conjugation on `G(ℂ)`, `𝔤^ℝ = Lie(𝐆)` (a real Lie algebra), `𝔤 = 𝔤^ℝ ⊗_ℝ ℂ = Lie(G)`, the module of
  `ℂ`-valued counit derivations, and `Ad` is
  the adjoint representation. `G^ℝ` may be disconnected (`SO(p, q)`, `GL_n(ℝ)`) or the identity
  component (`PSL₂(ℝ) = PGL₂(ℝ)⁰`). A complex reductive group `H` enters as `𝐆 = Res_{ℂ/ℝ} H`
  (ReductiveGroupsPartII §RG2.0a.2), with `𝐆(ℝ) = H(ℂ)`. Witness: for `𝐆 = GL₂`, `G^ℝ = GL₂(ℝ)` has
  two components and `𝔤^ℝ = M₂(ℝ)`; for `𝐆 = Res_{ℂ/ℝ} GL₁`, `G^ℝ = ℂ^×` and `𝔤^ℝ = ℂ` is
  two-dimensional over `ℝ`.
- **Cartan-compatible realization.** A closed embedding `𝐆 ⊆ GL_N` over `ℝ` with `G^ℝ`
  transpose-stable (ArithmeticLocallySymmetricSpaces §ALS.F.1); `K = G^ℝ ∩ O(N)`,
  `𝔨 = 𝔤^ℝ ∩ 𝔰𝔬(N)`, `𝔭 = 𝔤^ℝ ∩ Sym_N(ℝ)`; `U = G(ℂ) ∩ U(N)`, `i𝔲 = 𝔭 ⊕ i𝔨` the hermitian part of
  `𝔤`. The inner product on `M_N(ℝ)` is `⟨A, B⟩ = tr(A Bᵀ)`, with its hermitian extension to `M_N(ℂ)`.
  Witness: for `SL₂(ℝ)`, `K = SO(2)` and `𝔭` is the traceless symmetric matrices; the conjugation
  orbit of `A = [[1,1],[0,1]]` contains `diag(t, t⁻¹) A diag(t, t⁻¹)⁻¹ = [[1, t²],[0,1]]`, of squared
  norm `2 + t⁴`; as `t → 0` it tends to the identity, of squared norm `tr(1) = 2`, a point of the
  closure outside the orbit, while as `t → ∞` the squared norm grows without bound.
- **Topologies.** `Hom(Γ, G^ℝ)` and `Hom(Γ, G(ℂ))` carry the topology of pointwise convergence
  (`pointwiseTopology`), the topology induced from the product `(G^ℝ)^Γ`; it equals the point topology
  of Tau Ceti's `TauCeti.PointTopology.topology` on the real or complex points of the representation
  scheme and, over `ℂ`, the classical topology of ReductiveGroups §3A.5c.
- **Universes.** Groups and spaces live in one universe; `Hom(Γ, G)` is a scheme in the universe of
  the coefficient ring, and the coordinate algebra of an affine group over `ℝ` or `ℂ` lives in the
  universe of `ℝ`.

## Exact supplier contracts

### From Mathlib

`FundamentalGroup`, `FundamentalGroup.mul_def`, `FundamentalGroup.map`, `FundamentalGroup.mapOfEq`,
`FundamentalGroup.fundamentalGroupMulEquivOfPath` (conjugation by the class of a path, read as in
the Conventions), `FundamentalGroupoidFunctor.homotopicMapsNatIso` (a homotopy `H : f ≃ g` gives a
natural transformation whose component at `x` is the class of the track `t ↦ H(t, x)`), `Path`,
`Path.Homotopic`, `Homeomorph`, `ContinuousMap.Homotopy`, `ContinuousMap.compactOpen`, `MulAut`,
`MulAut.conj` (`conj g h = g * h * g⁻¹`), `MulAut.congr`, `QuotientGroup`,
`QuotientGroup.quotientKerEquivRange` (`G ⧸ ker φ ≃* range φ`), `QuotientGroup.congr` (an
isomorphism carrying one normal subgroup onto another descends to the quotients), `Subgroup.center`,
`MonoidHom.range`, `Subgroup.fg_of_index_ne_zero` (Schreier's lemma: a finite-index subgroup of a
finitely generated group is finitely generated), `ConjAct`, `ConjClasses`, `MulAction.orbitRel`,
`Matrix.GeneralLinearGroup`, `Matrix.orthogonalGroup`, `Matrix.unitaryGroup`, `PresentedGroup`,
`FreeGroup`, `FreeGroup.lift`, `groupHomology` (the homology of the inhomogeneous chains of a
representation), `groupHomology.map` (functoriality in the group and the module),
`Representation.IsSemisimpleRepresentation` (every subrepresentation has a complement),
`IsSemisimpleModule`, `ProperSMul`, `t2Space_quotient_mulAction_of_properSMul` (the orbit space of a
proper action is Hausdorff), `IsProperMap`, `IsCompact`, `IsConnected`, `IsPreconnected`,
`Directed`, `T2Space`, `TopologicalSpace.Opens.instChartedSpace` (an open subset of a charted space is
charted on the same model by the restricted charts), `Filter.HasBasis`, `Homeomorph` with its group
structure (`f * g = f ∘ g`), `NormedSpace.exp` (the exponential of a Banach algebra, here of
`V →L[ℝ] V`), `LinearMap.IsSymmetric`, `Group.FG`, `List.TFAE`, `HopfAlgebra`, `WithConv`,
`Derivation`. Assumed: these exist at the pin with the stated
meaning; no outer
automorphism group, mapping class group, representation scheme, topology on a set of homomorphisms
`Γ →* G`, minimal vector or character variety exists in Mathlib.

### From Tau Ceti

`TauCeti.AmbientIsotopy` (a homotopy from the identity whose total level-preserving map is a
homeomorphism), `TauCeti.AmbientIsotopy.trans`, `TauCeti.AmbientIsotopy.symm`,
`TauCeti.AmbientIsotopy.finalHomeomorph`, `TauCeti.AmbientIsotopy.conj` and
`TauCeti.AmbientIsotopy.finalHomeomorph_conj` (conjugating an ambient isotopy by a homeomorphism
`h` conjugates its final map by `h`), `TauCeti.AmbientIsotopic` and
`TauCeti.AmbientIsotopic.setoid`; `TauCeti.Isotopic` (homotopic through embeddings);
`TauCeti.AmbientIsotopic.isotopic` (ambient isotopic maps, the first an embedding, are isotopic);
`TauCeti.isotopic_iff_ambientIsotopic` (for a compact connected Hausdorff space `Y` charted on a
finite-dimensional real normed space and a homeomorphism `f₀ : X ≃ₜ Y`, a map `X → Y` is isotopic
to `f₀` exactly when it is ambient isotopic to it); `Continuous.isOpenEmbedding_of_injective`
(invariance of domain: a continuous injection between topological manifolds without boundary,
charted on finite-dimensional real normed spaces of the same dimension, is an open embedding);
`TauCeti.ConnectedCoveringSpace.monodromyEquivalence` (over a path-connected, locally path-connected,
semilocally simply connected base, monodromy is an equivalence from connected covering spaces to
fibrewise transitive actions of the fundamental groupoid) and
`TauCeti.FundamentalGroupoidAction.basepointMulAction` (the action of `π₁(X, x₀)` on the value of
such an action at `x₀`); `TauCeti.isPreconnected_iInter_of_directed` (in a
Hausdorff space, the intersection of a nonempty family of compact preconnected sets directed by
reverse inclusion is preconnected); `TauCeti.PointTopology.topology` (the point topology on
`A →ₐ[k] R`, the initial topology of the evaluations) and
`TauCeti.PointTopology.instTopologicalSpaceWithConv`; `TauCeti.Coalgebra.IsLinearlyReductive` and
`TauCeti.Comodule.Hom.fixedMap_surjective_of_isLinearlyReductive` (a surjective comodule map over a
linearly reductive coalgebra is surjective on invariants, without finiteness);
`TauCeti.ComoduleAlgebra` (a right comodule algebra `A` over a bialgebra `H`, whose coaction
`A → A ⊗ H` is an algebra map: for commutative `A` and `H` the coordinate form of a right action of
`Spec H` on `Spec A`), `TauCeti.ComoduleAlgebra.coinvariants` (the subalgebra of the `a` with
`coact a = a ⊗ 1`, the invariant functions) and `TauCeti.ComoduleAlgebra.range_le_coinvariants_iff`
(an algebra map into `A` has image in the coinvariants exactly when its composites with the coaction
and with `a ↦ a ⊗ 1` agree), `Algebra/Bialgebra/ComoduleAlgebra.lean`;
`TauCeti.ComoduleAlgebra.finiteType_coinvariants` (over a field `k`, the coinvariants of a
finite-type commutative comodule algebra over a commutative bialgebra satisfying
`TauCeti.Coalgebra.IsLinearlyReductive` form a finite-type `k`-algebra, with no smoothness,
connectedness, reducedness or characteristic hypothesis),
`Algebra/Bialgebra/ComoduleAlgebra/LinearlyReductive.lean`;
`ContRepresentation.IsUnitary.isSemisimpleRepresentation` (a finite-dimensional unitary
continuous representation of any group is semisimple);
`Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` (the Fricke identity: for `A, B` in
`SL(2, R)` over a commutative ring `R`,
`tr(A B A⁻¹ B⁻¹) = (tr A)² + (tr B)² + (tr AB)² − tr A · tr B · tr AB − 2`).

Singular cohomology: `TopCat.singularCup_naturality` (naturality of the singular cup product,
`f^*α ⌣ f^*β = f^*(α ⌣ β)`, `AlgebraicTopology/Cohomology/Cup.lean`), with its integral case
`TopCat.integralCup_naturality` (`AlgebraicTopology/Cohomology/IntegralCup.lean`);
`TopCat.singularCap_naturality` (the projection formula `f_*(x ⌢ f^*α) = f_*x ⌢ α` for the cap
product, `AlgebraicTopology/Cohomology/Cap/Basic.lean`); `TopCat.singularKronecker_naturality`
(`⟨f^*α, x⟩ = ⟨α, f_*x⟩` for the Kronecker pairing, `AlgebraicTopology/Cohomology/Kronecker.lean`).

Affine groups: `TauCeti.FiniteTypeCommHopfAlgCat` and `TauCeti.FiniteTypeCommHopfAlgCat.of`
(finite-type commutative Hopf algebras, `Algebra/AlgebraicGroup/FiniteType/CommHopfAlgCat.lean`);
`TauCeti.reductiveCommHopfAlgProperty` (connected reductive: smooth, geometrically connected, and
every connected normal smooth unipotent closed subgroup of the geometric fibre trivial,
`Algebra/AlgebraicGroup/Reductive/Basic.lean`); `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive`
and `TauCeti.reductiveCommHopfAlgProperty_iff_linearlyReductive` (over a field of characteristic
zero a reductive group is linearly reductive, and a geometrically connected linearly reductive one
is reductive, `Algebra/AlgebraicGroup/Reductive/CompleteReducibility.lean`);
`TauCeti.reductiveCommHopfAlgProperty.of_injective` (over a field of characteristic zero, a
finite-type affine group receiving a homomorphism with injective coordinate map from a connected
reductive group is connected reductive, `Algebra/AlgebraicGroup/Reductive/Image.lean`);
`AlgHom.convGroupOfSemiring` (the points `WithConv (H →ₐ[R] A)` of a Hopf algebra form a group under
convolution) and `AlgHom.mapValue` (functoriality in the value algebra,
`Algebra/AlgebraicGroup/FunctorOfPoints.lean`); `TauCeti.PointTopology.isTopologicalGroup` and
`TauCeti.PointTopology.locallyCompactSpace_of_finiteType` (the points with the point topology form a
topological group for a commutative topological semiring of values, locally compact for a
finite-type algebra over a commutative ring and a commutative topological value ring `R` that is T1
and locally compact, `[IsTopologicalSemiring R] [T1Space R] [LocallyCompactSpace R]`,
`Topology/Algebra/PointTopology/Group.lean` and `Topology/Algebra/PointTopology/Basic.lean`);
`TauCeti.Bialgebra.CounitAlgebra` and `TauCeti.Bialgebra.CounitAlgebra.algEquivSelf` (the value
algebra regarded as a module over the coordinate algebra through the counit), and
`Derivation.adRepresentation` (the adjoint action `g ⋆ d ⋆ g⁻¹` of the points on the counit
derivations, `Algebra/AlgebraicGroup/Tangent/Adjoint.lean`);
`TauCeti.Algebra.WeilRestriction.pointsMulEquiv` (the points of a Weil restriction,
`Algebra/HopfAlgebra/WeilRestriction.lean`). Surfaces: `TauCeti.IsClosedConnectedSurface`
(compact, connected, Hausdorff, second countable and charted on `EuclideanSpace ℝ (Fin 2)`,
`Geometry/Manifold/Basic.lean`). Assumed: these
declarations have the signatures displayed in their files at the pin; the pins have no genus of a
topological surface, no orientation-preserving homeomorphisms of one (the orientations of
`Geometry/Manifold/Orientation/Basic.lean` are those of smooth manifolds with corners), no Zariski
closure of a set of points of an affine group, no `G`-complete reducibility and no representation
algebra of a finitely generated group with its conjugation coaction; the invariant subalgebra of a
comodule algebra, from which §7.2 builds the affine quotient, is
`TauCeti.ComoduleAlgebra.coinvariants`.

### From TauCetiRoadmap.MordellLawrenceVenkatesh

§5.1 (surfaces `Σ ∖ P` with boundary charts and orientation as data), §5.4 (a closed connected
orientable surface is a connected sum of a sphere with `g` tori for a unique `g`, its genus, and two
surfaces are homeomorphic by an orientation-preserving homeomorphism exactly when they have the same
type `(g, b, n)`), §5.5 (the fundamental class `[S] ∈ H₂(S, ∂S; ℤ)` of a compact oriented surface,
Lefschetz duality by cap product with `[S]`, and the intersection form `î` on `H₁(S; ℤ)`, which for
`∂S = ∅` is `î(u, v) = ⟨D⁻¹u ∪ D⁻¹v, [S]⟩` with `D : H¹(S; ℤ) ≅ H₁(S; ℤ)` the duality isomorphism:
alternating, perfect for `∂S = ∅`, invariant under orientation-preserving homeomorphisms, and equal
on transverse oriented simple closed curves to the signed count of intersection points), §5.6 (for
a surface of type `(g, b, n)` with `b + n = 0`, `H₁(S; ℤ) ≅ ℤ^{2g}`), §5.9 (`Mod(S)`, `Mod(S*)`,
`Forget`, surjective for every surface, and the action of `Mod(S)`, through `Out(π₁ S)`, on
isomorphism classes of finite coverings, `[p] ↦ [f ∘ p]`, which on monodromy is precomposition with
the outer automorphism `(f⁻¹)_*`), §5.15 (asphericity), §5.17 (the evaluation
fibration of `Homeo⁺(S, ∂S)` with the compact-open topology, equivalently isotopy extension for
moving one interior point of a surface with punctures), §5.19 (for every surface,
`Push : π₁(S, x) →* Mod(S*)`, acting on `π₁(S, x)` by `MulAut.conj`, with `Forget(Push α) = 1`),
§5.22 (for `g ≥ 1` the symplectic representation `Mod(S_g) → Sp(2g, ℤ)` is surjective). Used: the isotopies of §5.9 on `S = Σ_g ∖ P`, which §§5.17–5.19 handle as paths in
`Homeo⁺(S, ∂S)` with the compact-open topology, are homotopies through homeomorphisms; by §2.1 these
are exactly the ambient isotopies of
the boundaryless surface `S`, so `Mod(S)` is the same group whether §5.9's isotopies are read as
such paths or as ambient isotopies. Assumed: the surfaces of §5.1 include `Σ_g ∖ P` with empty
boundary.

### From TauCetiRoadmap.TeichmullerGeometry

§0.0b (a topological surface is a space charted on the half-plane model `𝓡∂ 2`, compact when it is
moreover compact Hausdorff; a homeomorphism of surfaces carries boundary onto boundary,
`image_boundary`; by Radó's theorem every compact surface carries a PL structure), §0.0e (every PL
structure is compatible with some smooth structure on its space; for smooth surfaces, a smooth
`𝓡∂ 2` surface with empty boundary has an atlas on the boundaryless model `𝓡 2` with the same smooth
maps, and a smooth `𝓡 2` surface is a smooth `𝓡∂ 2` surface with empty boundary), §0.0f (the
realization `schemaRealization w` of a
polygon schema, the quotient of the closed unit disc whose boundary arcs are glued by the letters of
`w`, with the cell structure of one open disc, one open edge per class of sides and one vertex per
vertex class on which `StandardSurface.eulerChar_model` is counted; the standard surfaces
`StandardSurface.orientable g b` and `StandardSurface.nonorientable k b` with their canonical words
and models `StandardSurface.model`, every model being a compact connected Hausdorff surface,
orientable exactly in the orientable family (`StandardSurface.isSurface_model`); homeomorphic models
are equal (`StandardSurface.homeomorph_unique`); every compact connected surface is homeomorphic to
exactly one model (`classification_of_surfaces`); orientability `Surface.IsOrientable` is invariant
under homeomorphisms, and the genus `Surface.genus M`, the genus of the standard model homeomorphic
to `M`, is constant on homeomorphism classes by its definition), §0.0h (`isotopicToIdSubgroup M`,
the homeomorphisms of a topological space `M` isotopic to the identity through embeddings in the
sense of `TauCeti.Isotopic`, a normal subgroup, and `MappingClassGroupFull M`, the quotient group),
§4.2 (`OuterAut G := MulAut G ⧸ (MulAut.conj : G →* MulAut G).range` for every group `G`, with
`innerAut_normal`, the quotient map surjective with kernel the inner automorphisms, and
`OuterAut G = MulAut G` for abelian `G`; the geometric group `Π = π₁ᵒᵖ`, `ι : Π ≃* π₁`, and the induced
identification `OuterAut Π ≃* OuterAut π₁`), §4.3 (the attaching word of the polygon model, its
first-traverse relator `∏ [aᵢ, bᵢ]` with `[a, b] = a b a⁻¹ b⁻¹`, and the comparison with the native
reading of the same word in `π₁`), §§4.4–4.5 (the Euler number and the uniformizing holonomy,
discrete, faithful and cocompact, unique up to `PSL₂(ℝ)`-conjugacy), §5.4 (`dehn_nielsen_baer`: for
a compact connected orientable surface `S` without boundary, of genus at least one, and `x₀ ∈ S`, an
isomorphism `MappingClassGroupFull S ≃* OuterAut (FundamentalGroup S x₀)` sending the class of a
homeomorphism `f` fixing `x₀` to the outer class of `FundamentalGroup.mapOfEq f`), §5.4a
(`mcg_sphere_full`: the mapping class group of `S²` has two elements, the class of a reflection
being the nontrivial one; `mcg_torus_full`: `A ↦ [torusLinearHomeomorph A]` is an isomorphism of
`GL₂(ℤ)` onto the mapping class group of `T²`, inverse to the action on `π₁(T², 0) = ℤ²`), §6.1 (the
inverse of the holonomy on marked equivalence classes).

### From TauCetiRoadmap.GeometricTopology

Layer 1.7.2 (for a compact connected smooth surface `F`, the mapping class group `Mod(F)` of
diffeomorphisms fixing `∂F` pointwise modulo isotopies fixing `∂F` pointwise, the single owner of the
mapping class groups of compact surfaces; for closed `F` it is identified with
`MappingClassGroupFull F` by TeichmullerGeometry §0.0h's forgetful isomorphism).

### From TauCetiRoadmap.MappingClassGroupsAndCanonicalRepresentations

§0.1 (for MordellLawrenceVenkatesh §5.1's surface `Σ_{g,b,p}` of type `(g, b, p)` and a base point
`x`, based loops `aᵢ, bᵢ, c_j` inducing an isomorphism `surfaceGroup g (b + p) ≃* π₁(Σ_{g,b,p}, x)`,
each `c_j` freely homotopic to the positively oriented boundary of a small neighbourhood of the
`j`-th puncture or boundary circle; `surfaceGroup g n` is FreeGroupsAndLimitGroups §6.1's
`S⁺(g, n)` transported along the inversion of the handle generators; `π₁(Σ_{g,b,p}, x)` free of rank
`2g + b + p − 1` for `b + p ≥ 1`), §0.2 (`PMod(g, b, p)`, the subgroup of MordellLawrenceVenkatesh
§5.9's `Mod(Σ_{g,b,p})` of classes fixing each puncture, the kernel of the permutation action on
the `p` punctures, of index `p!`, every permutation being realized; the based action of
`PMod(g, b, p + 1)` on `π₁(Σ_{g,b,p}, x)` by functoriality and the induced outer action of
`PMod(g, b, p)`), §0.3 (for `χ(Σ_{g,b,p}) < 0`, the exact sequence
`1 → π₁(Σ_{g,b,p}, x) → PMod(g, b, p + 1) → PMod(g, b, p) → 1` of `Push` and forgetting `x`). Used
with `b = 0`, where `Σ_{g,0,n} = Σ_g ∖ P` and `Mod(Σ_{g,0,n}) = Mod_{g,n}`. Assumed: the permutation
action of §0.2 is the action on the punctures of homeomorphisms of `Σ_g ∖ P`, read on the ends of
`Σ_g ∖ P` or on `P` through homeomorphisms of `Σ_g` preserving `P`; §§2.2–2.3 show that the two
readings agree.

### From TauCetiRoadmap.NonabelianLevelStructures

§5.1 (`integral_trace_coordinates`: for every commutative ring `R`, the map `R[x, y, z] → O(SL₂ × SL₂)`
sending `x, y, z` to `tr A`, `tr B`, `tr AB` is an isomorphism onto the invariants of the `GL₂`-scheme
coaction by simultaneous conjugation, compatibly with every base change `R → S`), §5.2 (over every
commutative ring, precomposition by `Aut(F₂)` acts on `𝔸³` by polynomial automorphisms through
`Out(F₂)`: `(a, b) ↦ (a⁻¹, b)`, `(b, a)` and `(a⁻¹, a b)` act by `(x, y, z) ↦ (x, y, x y − z)`,
`(y, x, z)` and `(x, z, y)`, and `(a, b) ↦ (a⁻¹, b⁻¹)` acts trivially). §5.2's map is the right
action `ρ ↦ ρ ∘ φ`, an anti-homomorphism; §7.4's left action of `[φ]` is §5.2's automorphism of
`φ⁻¹`. The four automorphisms listed are involutions, so their moves are the same in both. §5.1 is
used only in Checks of §§7.2 and 7.5, and §5.2 only in §7.5, with `R = ℂ`. Assumed: over a field
the `GL₂`-invariants of §5.1 are the `SL₂`-invariants of §7.2, as the Scope explains.

### From TauCetiRoadmap.FreeGroupsAndLimitGroups

§6.1 (`S±(g, m)` as `PresentedGroup` with peripheral elements `p_j`, `SurfaceGroup.lift`), §6.2
(`S±(g, m)` free of rank `1 − χ` on `a₁, b₁, …, a_g, b_g, p₁, …, p_{m−1}` for `m ≥ 1`; closed surface
groups with `χ ≤ 0` not free).

### From TauCetiRoadmap.AlgebraicTopology

§4.2 (the cellular differential, its matrix
entries as degrees of attaching maps, naturality for cellular maps) and §4.3 (the comparison of
cellular with singular homology, natural on homology for cellular maps, with oriented cell
generators negated by reversing the cell orientation).

### From TauCetiRoadmap.ClassifyingSpaces

Stage 4 item 17 (for a `K(G, 1)` CW complex, its singular homology with integer coefficients is
Mathlib's `groupHomology` of the trivial module, naturally in `G`), with Stage 3 item 11 (a
homomorphism of fundamental groups of `K(G, 1)` CW complexes is induced by a pointed map, unique up
to pointed homotopy) and item 15 (homotopy functoriality: the classifying space is a functor from
groups to the pointed homotopy category). Used in §3.4. Assumed: the identification of item 17 is
compatible with the maps of item 11.

### From TauCetiRoadmap.ReductiveGroups

Layer 1
(representations as comodules; §1.1, the comodule invariants are the vectors fixed by every point
over every algebra), Layer 2 (Lie algebras of closed subgroups, the adjoint representation of a
closed subgroup on `Lie(G)`, characteristic-zero smoothness), Layer 3 (closed subgroups, the image
of a homomorphism as a closed subgroup receiving a faithfully flat map from the source, identity
components, quotients by normal closed subgroups with their faithfully flat quotient maps), Layer 3A
(orbits are open in their closures, 3A.2; the orbits in the boundary of an orbit have strictly smaller
dimension, 3A.3; every orbit closure contains a closed orbit, 3A.4; for a complex scheme `X` locally
of finite type, the classical topology on `X(ℂ)`, which on an affine `X = Spec A` is the evaluation
topology of `A →ₐ[ℂ] ℂ`, that is Tau Ceti's point topology, with morphisms acting continuously,
closed immersions inducing closed embeddings, `X(ℂ)` Hausdorff for separated `X`, locally compact,
and second countable for `X` of finite type, 3A.5c), Layer 4
(the Jordan decomposition of points, compatible with homomorphisms), Layer 5
(unipotent groups, the unipotent radical, fixed vectors of unipotent groups, the decomposition
`B = B_u ⋊ T` of a smooth connected solvable group), Layer 5P (the polynomial exponential and
logarithm of unipotent points in characteristic zero), Layer 6 (the centre of a connected reductive
group is of multiplicative type; in characteristic zero an affine group is linearly reductive exactly
when its identity component is reductive), Layer 7 (Borel subgroups, completeness of `G/B`,
parabolic subgroups, Levi
decompositions, cocharacter parabolics `P_λ`, `L_λ`, the limit map `c_λ`). Affine groups as Hopf
algebras with their groups of points, the adjoint action of the points on the Lie algebra,
reductivity and its characteristic-zero equivalence with linear reductivity are consumed from the
pinned Tau Ceti declarations of the previous subsection.

What ReductiveGroups must provide (gap:borel-tits): the Borel–Tits theorem, that for a closed
unipotent subgroup `U` of a connected reductive group `G` over an algebraically closed field there is
a parabolic subgroup `P` of `G` with `U ⊆ R_u(P)` and `N_G(U) ⊆ P`. Supplier section: Layer 7.

What ReductiveGroups must provide (gap:adjoint-kernel): for a connected affine group `G` of finite
type over a field of characteristic zero, the kernel of the adjoint representation
`Ad : G → GL(Lie G)` is the centre `Z(G)`. Supplier section: Layer 2. Used in §6.3 and in Layer 6's
Examples; the connectedness is needed (`O₂`, §6.3's Check).

### From TauCetiRoadmap.ReductiveGroupsPartII

§RG2.0.1 (the point topology on `Hom_k(A, R)`, embeddings and closed embeddings given by finite
presentations, local compactness for finite-type `A` and locally compact Hausdorff `R`), §RG2.0a.2
(Weil restriction of affine group schemes, `Res_{k'/k}(G')(R) ≅ G'(k' ⊗_k R)`). Both are read on the
pinned Tau Ceti declarations (`TauCeti.PointTopology.topology`,
`TauCeti.PointTopology.locallyCompactSpace_of_finiteType`,
`TauCeti.Algebra.WeilRestriction.pointsMulEquiv`); the sections are cited for the closed
embeddings given by finite presentations, which §§4.1–4.2 use.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§1.7, **Semisimplicity over a perfect field** (for `k` perfect and any extension `k'/k`, a
finite-dimensional semisimple representation of any monoid stays semisimple over `k'`). §1.11,
**Reductive quotients over fields and DVRs** (for a connected reductive `G` acting on an integral
affine variety `X` over a field, `X//G = Spec O(X)^G` is of finite type with the universal property
for invariant morphisms; over an algebraically closed field the quotient map is surjective on
points, each fibre contains a unique closed orbit, two points have the same image exactly when their
orbit closures meet, invariant closed subsets have closed images). §1.11, **Complete reducibility
and closed tuples** (`IsGCompletelyReducible` for closed subgroups of a connected reductive `G` over
an algebraically closed field; for `G = GL(V)` it is semisimplicity of `V`; a tuple in `G(k)^m` has
closed simultaneous-conjugation orbit exactly when the Zariski closure of the generated subgroup is
`G`-completely reducible; projection to a Levi of a minimal parabolic is a cocharacter limit lying in
the unique closed orbit of the orbit closure).

What ArithmeticGaloisRepresentations must provide (gap:gcr-reductive-identity-component): a proof
that a `G`-completely reducible closed subgroup `H` of a connected reductive group `G` over an
algebraically closed field has reductive identity component `H⁰` (BateMartinRohrle2005 line 263,
attributed there to Serre). Supplier section: §1.11, **Complete reducibility and closed tuples**. A
route: gap:borel-tits places `H ⊆ N_G(R_u(H⁰))` in a parabolic `P` with `R_u(H⁰) ⊆ R_u(P)`;
complete reducibility puts `H` in a Levi subgroup `L` of `P`, and `L ∩ R_u(P) = 1` forces
`R_u(H⁰) = 1`.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

§0.7, **Invariant coordinate algebras under conjugation** (for a commutative Hopf algebra `C` over a
commutative ring `R` and `n ≥ 0`, the subalgebra `C_n` of the `n`-th tensor power of `C` of the
functions unchanged by simultaneous conjugation over every commutative `R`-algebra). Used in §7.2,
with `R = k` a field and `C = O(G)`: `G^S//G = Spec C_{|S|}`. Assumed: invariance over every
commutative `R`-algebra is invariance under the conjugation coaction, as evaluation at the universal
point shows.

### From TauCetiRoadmap.LanglandsParameterStacks

§2.2, **Reductive quotients over fields and DVRs** (for a connected reductive group `G` over a field
`k` acting on an affine `k`-scheme `X` of finite type, with no integrality or reducedness hypothesis:
`O(X)^G` is a finitely generated `k`-algebra, so `X//G = Spec O(X)^G` is of finite type; invariant
closed subsets of `X` have closed images in `X//G`, and disjoint ones have disjoint images; every
geometric fibre of `X → X//G` contains a unique closed orbit; the quotient map is universally
submersive). Used for the representation schemes `Hom(Γ, G)` of §7.2, which can be reducible and
nonreduced.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

§ALS.F.1 (for a reductive `ℝ`-group `H ⊆ GL_N`, `H(ℝ)` is a real Lie group with finitely many
components and Lie algebra `Lie(H)`; some conjugate of `H` is transpose-stable; then
`K = H(ℝ) ∩ O(N)` is maximal compact, `H(ℝ) = K · (H(ℝ) ∩ exp Sym_N(ℝ))`, compact subgroups lie in
conjugates of `K`). §ALS.0.1 (`IsCartanInvolution`, existence and conjugacy by real points).

### From TauCetiRoadmap.RealSemisimpleLieGroups

§2.5, **Real forms of complex reductive groups** (for a connected complex reductive Lie group
`H = 𝐇(ℂ)`, `𝐇` a connected reductive `ℂ`-group, and an antiholomorphic involutive automorphism `τ`
of `H`: `H^τ` is a closed real Lie subgroup of `H` with finitely many components; `τ` is the complex
conjugation of a real form `𝐇₀` of `𝐇`, a connected reductive `ℝ`-group with `𝐇₀ ⊗_ℝ ℂ = 𝐇` and
`𝐇₀(ℝ) = H^τ`; the Cartan involutions for `τ`, the holomorphic involutive automorphisms `σ` of `H`
commuting with `τ` with `H^{στ}` compact, are the complexifications of the Cartan involutions of
`𝐇₀` in the sense of ArithmeticLocallySymmetricSpaces §ALS.0.1, exist, and are conjugate under
`(H^τ)°`; `K = H^τ ∩ H^σ` is a maximal compact subgroup of `H^τ` meeting every component, and
`K × 𝔭 → H^τ` is a diffeomorphism). Used in §5.2. Assumed: `𝐇₀ ⊗_ℝ ℂ = 𝐇` is an isomorphism of
`ℂ`-groups under which the complex conjugation of `𝐇₀(ℂ)` is `τ`, which is what §5.2 calls an
`ℝ`-form with conjugation `τ`.

### From TauCetiRoadmap.RepresentationTheory/LieGroups

Layer 9 (the Cartan decomposition
`K × 𝔭 → G`, `(k, X) ↦ k exp X`, a diffeomorphism for a real reductive group with Cartan
involution), and its paragraph **Restricted roots and KAK** (for a maximal abelian `𝔞 ⊆ 𝔭`,
`Ad(K)𝔞 = 𝔭` and `G = K exp(𝔞₊) K` for the closed positive chamber `𝔞₊ ⊆ 𝔞`, `kakDecomposition`),
both for the global matrix models of that layer: a closed transpose-stable subgroup of `GL_N(ℝ)` with
finitely many components, with Cartan involution `g ↦ (gᵀ)⁻¹`, and its finite central covers.

### From TauCetiRoadmap.SymplecticGeometry/HamiltonianReduction

R5 (for compact `K` and a principal `K`-bundle `P` over a closed oriented surface, smooth flat
connections modulo gauge are homeomorphic to the locus of `Hom(π₁Σ, K)/K` of topological type `P`).
Used only in a Check.

## How to read the build

Layer 1 is pure group theory: inner automorphisms and the transport of TeichmullerGeometry's
`Out(Γ)` along isomorphisms, conjugacy classes of homomorphisms, and the outer action on them. Layer
2 completes the punctured-surface mapping class group of MordellLawrenceVenkatesh: the group of
isotopy classes for any space, punctures versus marked points, the permutation map that defines
MappingClassGroupsAndCanonicalRepresentations' pure group, the standard model of a closed surface
and changes of model. Layer 3 constructs the automorphisms `f_δ` and the outer
action `Ψ`, identifies it on closed surfaces with TeichmullerGeometry's Dehn–Nielsen–Baer
isomorphism, compares it with MordellLawrenceVenkatesh, defines the action of `Mod^±_{g,n}` on
conjugacy classes of representations as `Ψ` followed by Layer 1's action, and compares it with
MordellLawrenceVenkatesh's action on finite coverings. Layer 4 builds the
representation scheme, its topologies and its surface-group instances. Layer 5 fixes real reductive
data, attaches one to every real form of a complex reductive group through RealSemisimpleLieGroups
§2.5 and proves that the `ℝ`-form is unique, realizes the conjugation action compatibly with a
Cartan involution and proves the real Kempf–Ness theorem. Layer 6 proves the six-way characterization of reductive representations. Layer
7 defines the character variety, proves its topological properties and the complex comparison with
the affine quotient, and makes `Out(Γ)` and `Mod_{g,n}` act. Layers 1–3 and Layers 4–6 are
independent; Layer 7 uses both. Every `*Needs:*` line lists what a target's statement and route use,
item by item.

## Layer 1: Outer automorphisms and conjugacy classes of homomorphisms

### 1.1 Inner automorphisms and the transport of outer automorphisms

For an arbitrary group `Γ`, `Out(Γ)` is TeichmullerGeometry §4.2's `OuterAut Γ`, the quotient of
`MulAut Γ` by the normal subgroup `Inn(Γ)` (Conventions); `Suggested.lean` restates it as `Out`, with
the instance `innerAut_range_normal` (`φ ∘ MulAut.conj g ∘ φ⁻¹ = MulAut.conj (φ g)`), to state its
headlines. Prove that the kernel of
`MulAut.conj : Γ →* MulAut Γ` is the centre `Z(Γ)`, so that `MulAut.conj` induces an isomorphism
`Γ ⧸ Z(Γ) ≃* Inn(Γ)`. Prove that an isomorphism `e : Γ ≃* Γ'` induces `Out(Γ) ≃* Out(Γ')`,
`[φ] ↦ [e ∘ φ ∘ e⁻¹]`, by descending `MulAut.congr e`; that this is functorial in `e`, the identity
inducing the identity and `e' ∘ e` the composite of the induced maps; and that an inner
automorphism `e = MulAut.conj g` of `Γ` induces the identity of `Out(Γ)` (FarbMargalit2012, Ch. 8,
§8.1, where `Out(π₁ S)` is the target of the mapping class group).

*Proof sketch.* `MulAut.conj g` is the identity exactly when `g` commutes with every element of `Γ`,
and `QuotientGroup.quotientKerEquivRange` gives the isomorphism. `MulAut.congr e` sends
`MulAut.conj g` to `MulAut.conj (e g)`, so it carries `Inn(Γ)` onto `Inn(Γ')` and descends by
`QuotientGroup.congr`. For `e = MulAut.conj g`,
`e ∘ φ ∘ e⁻¹ = φ ∘ MulAut.conj (φ⁻¹(g) g⁻¹)`, which has the class of `φ`.

**Checks.**

- `Γ = Q₈`: `Z(Q₈) = {±1}` and `Inn(Q₈) ≅ Q₈/{±1}` is the Klein four-group, of order `4`; a statement
  `Inn(Γ) ≅ Γ` would give `8`, and with `|MulAut Q₈| = 24` the quotient has TeichmullerGeometry
  §4.2's value `|Out(Q₈)| = 6`.
- `Γ = ℤ`: `Z(ℤ) = ℤ` and `Inn(ℤ)` is trivial; `Γ = S₃`: `Z(S₃) = 1` and `Inn(S₃) ≅ S₃` has order `6`.
- An inner `e` acts trivially on `Out` but not on `MulAut`: for `Γ = Q₈` and `e = MulAut.conj i`,
  `MulAut.congr e` is conjugation in `MulAut Q₈ ≅ S₄` by a nontrivial element of the Klein
  four-group `Inn(Q₈)`, nontrivial because `S₄` has trivial centre, and trivial on
  `Out(Q₈) ≅ S₄/V₄ ≅ S₃`.
- An outer `e` need not act trivially: for `Γ = Γ' = ℤ²` and `e = diag(1, −1)`, the induced
  automorphism of `Out(ℤ²) = GL₂(ℤ)` is conjugation by `diag(1, −1)`, which sends `[[1,1],[0,1]]` to
  `[[1,−1],[0,1]]`.

*Needs:* TeichmullerGeometry §4.2; Mathlib `MulAut`, `MulAut.conj`, `MulAut.congr`,
`Subgroup.center`, `QuotientGroup.quotientKerEquivRange`, `QuotientGroup.congr`.

### 1.2 Conjugacy classes of homomorphisms

For groups `Γ` and `H` define `Rep(Γ, H)` as the quotient of `Γ →* H` by the orbit relation of
`ConjAct H` acting by postcomposition: `ρ ∼ ρ'` when `ρ' = MulAut.conj h ∘ ρ` for some `h ∈ H`
(LandesmanLitt2024 line 42, conjugacy classes of representations).

The quotient has the following API.

- Two homomorphisms have the same class exactly when they are conjugate by an element of `H`.
- A homomorphism `β : H →* H'` induces `Rep(Γ, H) → Rep(Γ, H')`, `[ρ] ↦ [β ∘ ρ]`, functorially.
- A homomorphism `α : Γ' →* Γ` induces `Rep(Γ, H) → Rep(Γ', H)`, `[ρ] ↦ [ρ ∘ α]`, contravariantly
  functorially.
- For commutative `H` the quotient map `Hom(Γ, H) → Rep(Γ, H)` is a bijection.
- `Rep(ℤ, H)` is in bijection with Mathlib's `ConjClasses H` through `[ρ] ↦ [ρ 1]`.

**Checks.**

- `Rep(ℤ, S₃)` has three elements (the conjugacy classes of `S₃`) while `Hom(ℤ, S₃)` has six; a
  definition without the quotient would count six.
- `Rep(Γ, 1)` is a single point for every `Γ`, including the trivial group.
- `Rep(ℤ/2, GL₂(ℂ))` has three elements, the classes of `diag(1, 1)`, `diag(1, −1)`, `diag(−1, −1)`:
  an involution is diagonalizable and determined up to conjugacy by its eigenvalue multiset, while
  `Hom(ℤ/2, GL₂(ℂ))` is infinite.

*Needs:* Mathlib `ConjAct`, `MulAction.orbitRel`, `MulAut.conj`, `ConjClasses`.

### 1.3 The outer action on conjugacy classes

Prove that `φ · ρ = ρ ∘ φ⁻¹` is a left action of `MulAut Γ` on `Γ →* H` commuting with conjugation
in `H`, that it descends to `Rep(Γ, H)`, and that inner automorphisms act trivially on classes:
`MulAut.conj γ · ρ = MulAut.conj (ρ γ)⁻¹ ∘ ρ`. Hence `Out(Γ)` acts on `Rep(Γ, H)` by
`[φ] · [ρ] = [ρ ∘ φ⁻¹]`, naturally in `H` and compatibly with the isomorphisms of §1.1 in `Γ`. Prove
the non-descent theorem: the action of `Inn(Γ)` on `Γ →* H` is trivial if and only if every
homomorphism `Γ → H` has commutative image; in particular for nonabelian `H` and any `Γ` admitting a
homomorphism to `H` with nonabelian image, the action of `MulAut Γ` on `Γ →* H` does not factor
through `Out(Γ)` (LandesmanLitt2024 lines 41–50, Definition 1.1.1 and the paragraph after it).
`Suggested.lean` states it as `exists_outAction_iff_commute`: a homomorphism
`Out(Γ) → Perm(Γ →* H)` with `[φ] · ρ = ρ ∘ φ⁻¹` exists exactly when `ρ(a)` and `ρ(b)` commute for
every `ρ : Γ →* H` and all `a, b ∈ Γ`.

*Proof sketch.* The action law is `(φψ)⁻¹ = ψ⁻¹ φ⁻¹`. For the inner case,
`ρ(γ⁻¹ δ γ) = ρ(γ)⁻¹ ρ(δ) ρ(γ)`. The class action is well defined because the two actions commute.
For non-descent, `MulAut.conj γ · ρ = ρ` holds for all `γ` exactly when each `ρ(γ)` centralizes
`ρ(Γ)`.

**Checks.**

- The Conventions witness on `ℤ²` distinguishes the left action from the right action `ρ ∘ φ`.
- For `Γ = H = F₂` free on `a, b` and `ρ = id`, `MulAut.conj a · id = MulAut.conj a⁻¹ ≠ id`, while its
  class is the class of `id`.
- For commutative `H` every homomorphism has commutative image and `Inn(Γ)` acts trivially on
  `Γ →* H`, so the action of `Out(Γ)` on `Hom(Γ, H)` is defined; this is the case of the action on
  `H¹` with constant coefficients.

*Needs:* §1.1; §1.2; TeichmullerGeometry §4.2.

### Examples

- `Out(ℤ) = ℤ/2` acts on `Rep(ℤ, H) = ConjClasses H` by `[h] ↦ [h⁻¹]`; for `H = S₃` it fixes all three
  classes, for `H = ℤ/3` it swaps the two generators.

### Dependencies

Mathlib's automorphism, quotient and conjugation API; TeichmullerGeometry §4.2. Layer 1 supplies
Layers 3 and 7.

## Layer 2: Isotopy classes, punctures and marked points, and the standard model

### 2.1 Isotopy classes of homeomorphisms of a space

For a topological space `X` define `Homeo₀(X)` as the set of final homeomorphisms of the ambient
isotopies of `X` (`TauCeti.AmbientIsotopy.finalHomeomorph`) and prove that it is a normal subgroup
of `X ≃ₜ X`: closure under composition and inverses is `TauCeti.AmbientIsotopy.trans` and `symm`,
and normality is `TauCeti.AmbientIsotopy.conj` with `TauCeti.AmbientIsotopy.finalHomeomorph_conj`.
Define `Mod^±(X) := (X ≃ₜ X) ⧸ Homeo₀(X)`; two homeomorphisms have the same class exactly when they
are ambient isotopic, and isotopy is a congruence for composition. It differs from
TeichmullerGeometry §0.0h's `MappingClassGroupFull X` by requiring the level-preserving total map of
an isotopy to be a homeomorphism, the relation that extends over punctures (§2.2). For locally
compact Hausdorff `X`, give `X ≃ₜ X` the topology induced by `f ↦ (f, f⁻¹)` into `C(X, X) × C(X, X)`
with the compact-open topology; prove that it is a group topology and that `Homeo₀(X)` is the path
component of the identity (FarbMargalit2012, Ch. 1, §1.4).

*Proof sketch.* A path `t ↦ f_t` in this topology uncurries, by the exponential law for locally
compact `X`, to continuous maps `(t, x) ↦ f_t(x)` and `(t, x) ↦ f_t⁻¹(x)`, which are the total map of
an ambient isotopy and its inverse; conversely an ambient isotopy curries to such a path.

The group of isotopy classes has the following API.

- `Homeo₀(X)` is a normal subgroup, and `Mod^±(X)` is a group whose multiplication is induced by
  composition.
- A homeomorphism `e : X ≃ₜ Y` induces `Mod^±(X) ≃* Mod^±(Y)`, `[f] ↦ [e f e⁻¹]`, using
  Tau Ceti's transport of ambient isotopies.
- For compact Hausdorff `X`, every homotopy through homeomorphisms starting at the identity is an
  ambient isotopy, because its total map is a continuous bijection from a compact space to a
  Hausdorff space.
- For locally compact Hausdorff `X`, `Homeo₀(X)` is the identity path component of `X ≃ₜ X`.
- A closed surface `Σ_g` carries a smooth structure `F`: a PL structure by Radó's theorem
  (TeichmullerGeometry §0.0b) and a smooth structure compatible with it (TeichmullerGeometry
  §0.0e). The half-plane atlas of `F` has empty boundary, because the identity of `Σ_g` is a
  homeomorphism from `Σ_g` with its given atlas, of empty boundary, and carries boundary onto
  boundary (`image_boundary`, TeichmullerGeometry §0.0b). So TeichmullerGeometry §0.0e's comparison
  of the two models, stated for smooth surfaces, gives the topological space `Σ_g` an atlas on the
  boundaryless model `𝓡 2`, that is on the finite-dimensional real normed space
  `EuclideanSpace ℝ (Fin 2)`, and every open subset, in particular `Σ_{g,n} = Σ_g ∖ P` (`P` is finite,
  hence closed), inherits one (Mathlib `TopologicalSpace.Opens.instChartedSpace`).
- The identity of `X ≃ₜ X` induces a surjective homomorphism `Mod^±(X) → MappingClassGroupFull X`,
  because the final map of an ambient isotopy is isotopic to the identity through embeddings
  (`TauCeti.AmbientIsotopic.isotopic`); it is an isomorphism when `X` is compact, connected,
  Hausdorff and charted on a finite-dimensional real normed space
  (`TauCeti.isotopic_iff_ambientIsotopic`), in particular for a closed surface `Σ_g`, charted on
  `𝓡 2` by the previous bullet; composed with TeichmullerGeometry §0.0h's forgetful isomorphism, it
  identifies `Mod^±(Σ_g)` with GeometricTopology Layer 1.7.2's `Mod(F)` for the smooth structure `F`
  of the previous bullet, the owner of the mapping class groups of compact surfaces.
- For a topological manifold `X` without boundary, charted on a finite-dimensional real normed
  space, every homotopy `I × X → X` through homeomorphisms starting at the identity is an ambient
  isotopy: extended by its end maps to `ℝ × X`, its level-preserving total map is a continuous
  bijection of `ℝ × X`, a manifold without boundary charted on a space of one more dimension, onto
  itself, hence open by invariance of domain (`Continuous.isOpenEmbedding_of_injective`). This
  applies to `Σ_{g,n}`, charted on `𝓡 2` as above.
- For a connected oriented surface `X`, the orientation-preserving homeomorphisms contain
  `Homeo₀(X)` and their image `Mod(X)` has index at most two in `Mod^±(X)`.

**Checks.**

- `Mod^±(ℝ)` has two elements: a homeomorphism of `ℝ` is monotone, monotonicity type is constant
  along an ambient isotopy, and every increasing homeomorphism is joined to the identity by the
  straight-line isotopy `(1 − t) x + t f(x)`.
- On the discrete two-point space the swap is not in `Homeo₀`: the slices of an ambient isotopy
  depend continuously on `t` in a discrete set of maps, so `Mod^±` has two elements; for a one-point
  space `Mod^±` is trivial.
- `Mod^±(S¹)` has two elements: rotations are joined to the identity, and reflection reverses the
  degree, which is constant along a homotopy.
- Connectedness is needed in the index bullet: an ambient isotopy of `X = S² ⊔ S²` preserves each
  sphere, so `Mod^±(X) = (Mod^±(S²) × Mod^±(S²)) ⋊ ℤ/2` has order `2 · 2 · 2 = 8` (reverse either
  sphere, swap them), and its orientation-preserving classes are the identity and the swap, of
  index `8/2 = 4`; for the connected `S²` the index is `2/1 = 2`.

*Needs:* Tau Ceti `TauCeti.AmbientIsotopy`, `TauCeti.AmbientIsotopy.trans`,
`TauCeti.AmbientIsotopy.symm`, `TauCeti.AmbientIsotopy.conj`,
`TauCeti.AmbientIsotopy.finalHomeomorph_conj`, `TauCeti.AmbientIsotopic.setoid`,
`TauCeti.Isotopic`, `TauCeti.AmbientIsotopic.isotopic`, `TauCeti.isotopic_iff_ambientIsotopic`,
`Continuous.isOpenEmbedding_of_injective`; TeichmullerGeometry §0.0b; TeichmullerGeometry §0.0e;
TeichmullerGeometry §0.0h; GeometricTopology Layer 1.7.2; Mathlib `ContinuousMap.compactOpen`,
`Homeomorph`, `QuotientGroup`, `TopologicalSpace.Opens.instChartedSpace`.

### 2.2 Punctures and marked points

Prove the extension theorem. Let `Σ` be a compact Hausdorff space and `P ⊆ Σ` a finite set such that
every `p ∈ P` has a neighbourhood basis of compact sets `U` with `U ∖ {p}` nonempty and connected
(true for interior points of a surface, with closed disc neighbourhoods). Then restriction is a
group isomorphism from `Homeo(Σ, P) = {h ∈ Σ ≃ₜ Σ : h(P) = P}` to `(Σ ∖ P) ≃ₜ (Σ ∖ P)`; every ambient
isotopy of `Σ ∖ P` extends uniquely to an ambient isotopy of `Σ` fixing `P` pointwise; hence
`Mod^±(Σ ∖ P)` is isomorphic to `Homeo(Σ, P)` modulo ambient isotopies of `Σ` fixing `P` pointwise.
For `Σ = Σ_g` oriented, orientation is preserved by the extension, so `Mod_{g,n}` of
MordellLawrenceVenkatesh §5.9, whose isotopies (paths in the group `Homeo⁺(Σ_{g,n})` of
MordellLawrenceVenkatesh §5.17) are the ambient isotopies of the boundaryless surface `Σ_{g,n}` by
§2.1, is the orientation-preserving
subgroup of `Mod^±(Σ_{g,n})` and is isomorphic to `Homeo⁺(Σ_g, P)` modulo isotopy fixing `P`
pointwise (FarbMargalit2012, Ch. 2, §2.1). `Suggested.lean` states the two extension clauses, with
the hypothesis on `P` as a neighbourhood basis of compact neighbourhoods `U` with `U ∖ {p}`
connected and nonempty, as `existsUnique_homeomorph_extension` (every homeomorphism of `Σ ∖ P`
extends uniquely to a homeomorphism of `Σ`) and `existsUnique_ambientIsotopy_extension` (every
ambient isotopy of `Σ ∖ P` extends uniquely to an ambient isotopy of `Σ`, and the extension fixes `P`
pointwise at every time).

*Proof sketch.* Fix `p ∈ P` and let `𝒰` be the members `U` of the given basis with `U ∩ P = {p}`,
again a neighbourhood basis of `p`. The closures in `Σ` of the connected sets `h(U ∖ {p})`,
`U ∈ 𝒰`, form a family of nonempty compact connected sets directed by reverse inclusion; its
intersection is nonempty by compactness and preconnected
(`TauCeti.isPreconnected_iInter_of_directed`). It lies in `P`: a point `h(y)` with `y ∈ Σ ∖ P` has
the open neighbourhood `h(Σ ∖ (P ∪ U))`, disjoint from `h(U ∖ {p})`, for any `U ∈ 𝒰` not containing
`y`. Hence it is a single point `q`, and setting `h̄(p) = q` gives a continuous extension, since
every neighbourhood of `q` contains a member of the family; `h⁻¹` gives its inverse, and density of
`Σ ∖ P` gives uniqueness. For an ambient isotopy the same argument, applied to the closures of the
images of `I × (U ∖ {p})` under the level-preserving total map, gives a nonempty preconnected subset
of `I × P` meeting every slice `{t} × Σ`, hence equal to `I × {q}`, and `q = p` because the isotopy
starts at the identity.

**Checks.**

- `Σ = S²`, `P = {N, S}`: `Σ ∖ P` is the cylinder `S¹ × ℝ`, and the end-swapping map
  `(θ, s) ↦ (−θ, −s)` extends to the rotation by `π` about an equatorial axis, which exchanges `N`
  and `S`; so `Mod_{0,2}` has two elements and `PMod_{0,2}` is trivial.
- The hypothesis is needed: for `Σ = S¹` and `P` two points, `Σ ∖ P` is two open arcs, and the map
  that is the identity on one arc and reverses the other sends the two ends at `p` to ends at `p` and
  at `q`, so it has no continuous extension; the punctured neighbourhoods of `p` are disconnected.
- With `P` empty the theorem is the identity of `Mod^±(Σ)`.

*Needs:* §2.1; MordellLawrenceVenkatesh §5.1; MordellLawrenceVenkatesh §5.9; MordellLawrenceVenkatesh
§5.17; Tau Ceti `TauCeti.isPreconnected_iInter_of_directed`; Mathlib `IsCompact`, `IsConnected`,
`IsPreconnected`, `Directed`, `T2Space`.

### 2.3 The permutation of the punctures

Prove that for every `g, n ≥ 0`, `[h] ↦ h̄|_P` is a well-defined homomorphism
`σ : Mod_{g,n} → Sym(P)`, where `h̄` is §2.2's extension over `P` of a homeomorphism `h` of
`Σ_{g,n}`: `h̄` preserves `P`, `(h ∘ k)‾ = h̄ ∘ k̄` by uniqueness of the extension, and the extension
of an ambient isotopy fixes `P` pointwise. Prove that `σ` is the permutation action on the punctures
that defines MappingClassGroupsAndCanonicalRepresentations §0.2's `PMod(g, 0, n)`: `h` carries the
punctured neighbourhoods `U ∖ {p}` of `p` onto the punctured neighbourhoods `h̄(U) ∖ {h̄(p)}` of
`h̄(p)`, so it sends the end of `Σ_{g,n}` at `p` to the end at `h̄(p)`. Hence `PMod_{g,n}` is the
kernel of `σ`, the classes whose extensions fix `P` pointwise, and by
MappingClassGroupsAndCanonicalRepresentations §0.2 `σ` is surjective and `PMod_{g,n}` has index
`n!` (LandesmanLitt2024 line 474; FarbMargalit2012, Ch. 4, §4.2).

*Proof sketch.* Well-definedness is §2.2's isotopy clause: isotopic homeomorphisms of `Σ_{g,n}` have
extensions joined by an ambient isotopy of `Σ_g` fixing `P` pointwise, so they agree on `P`. The
homomorphism property and the comparison of ends are the uniqueness and the continuity of the
extension.

**Checks.**

- `n = 0`: `Sym(∅)` is trivial, so `PMod_{g,0} = Mod_{g,0}` and the index is `1 = 0!`; `n = 1`:
  `Sym(P)` is trivial and the index is `1 = 1!`.
- `(g, n) = (0, 3)`: `Mod_{0,3} ≅ S₃` and `PMod_{0,3}` is trivial (MordellLawrenceVenkatesh §5.9),
  so `σ` is an isomorphism onto `Sym(P) ≅ S₃`, consistent with index `6 = 3!`; identifying
  `Mod_{0,3}` with `PMod_{0,3}` would contradict the index.
- `(g, n) = (0, 2)`: the end-swapping map `(θ, s) ↦ (−θ, −s)` of §2.2's Check extends to the
  rotation by `π` exchanging `N` and `S`, so `σ` sends its class to the transposition of
  `P = {N, S}`; `Mod_{0,2}` has order two, so `σ` is an isomorphism, `PMod_{0,2}` is trivial and the
  index is `2 = 2!`.

*Needs:* §2.2; MordellLawrenceVenkatesh §5.9; MappingClassGroupsAndCanonicalRepresentations §0.2.

### 2.4 The standard model of a closed surface

Prove that for every `g ≥ 0` the closed surface `Σ_g`, with its half-plane atlas of empty boundary,
is homeomorphic to TeichmullerGeometry §0.0f's model `StandardSurface.model` of
`StandardSurface.orientable g 0`, the realization `schemaRealization` of the canonical word (`a a⁻¹`
for `g = 0`, the handle blocks `aᵢ bᵢ aᵢ⁻¹ bᵢ⁻¹`, `1 ≤ i ≤ g`, for `g ≥ 1`); hence `Σ_g` satisfies
`Surface.IsOrientable` and `Surface.genus Σ_g = g`, so that the genus of MordellLawrenceVenkatesh
§5.4 and the genus of TeichmullerGeometry §0.0f agree on `Σ_g` (FarbMargalit2012, Ch. 1, §1.1,
Theorem 1.1).

*Proof sketch.* By `classification_of_surfaces` (TeichmullerGeometry §0.0f), `Σ_g` is homeomorphic to
one standard model `S`. Give the realization of a word of length `m` the cell structure with one open
disc, one open edge per class of sides and one vertex per vertex class, the images of the cells of the
closed disc whose boundary circle is cut into the `m` arcs (the cell structure on which §0.0f counts
`StandardSurface.eulerChar_model`). The cellular boundary of the disc is the sum of the letters of the
word with their exponents (AlgebraicTopology §4.2): a hole block `cⱼ hⱼ cⱼ⁻¹` contributes its
free side `hⱼ` once and a crosscap block `aᵢ aᵢ` contributes `2aᵢ`, so `H₂(S; ℤ) = 0` unless
`S = orientable g' 0`; for `orientable g' 0` the boundary vanishes, `H₂(S; ℤ) = ℤ` and
`H₁(S; ℤ) = ℤ^{2g'}` (the `2g'` edges for `g' ≥ 1` share one vertex; for `g' = 0` the edge `a` joins
two vertices). AlgebraicTopology §4.3 identifies these groups with singular homology. On the
other side, `H₂(Σ_g; ℤ) = ℤ[Σ_g]` by duality with `∂Σ_g = ∅` (MordellLawrenceVenkatesh §5.5) and
`H₁(Σ_g; ℤ) ≅ ℤ^{2g}` (MordellLawrenceVenkatesh §5.6). Singular homology is invariant under
homeomorphisms, so `S = orientable g 0`. The model is orientable (`StandardSurface.isSurface_model`)
and orientability is invariant under homeomorphisms (§0.0f); `Surface.genus` is constant on
homeomorphism classes by its definition, and on `orientable g 0` it is `g`, the only standard model
homeomorphic to it being itself (`StandardSurface.homeomorph_unique`).

**Checks.**

- Torus, `g = 1`: the word `a b a⁻¹ b⁻¹` has one vertex class and zero boundary map, so `H₂ = ℤ` and
  `H₁ = ℤ²`, the homology of `Σ_1`; hence `Surface.genus Σ_1 = 1`.
- The Klein bottle `nonorientable 2 0`, word `a a b b`, has boundary map `2a + 2b`, so `H₂ = 0` and
  `H₁ = ℤ ⊕ ℤ/2`. It has the Euler characteristic `0` of the torus and no boundary, so a comparison by
  Euler characteristic and boundary count alone would not exclude it; `H₂(Σ_1; ℤ) = ℤ` does.
- Genus two: comparing only the rank of `H₁` would accept `nonorientable 5 0`, with
  `H₁ = ℤ⁴ ⊕ ℤ/2`, as a model of `Σ_2`; its `H₂ = 0` excludes it, and `orientable 2 0` is the model,
  with `Surface.genus Σ_2 = 2`.
- Sphere, `g = 0`: the word `a a⁻¹` has two vertex classes, boundary maps `d₁(a) = v₁ − v₀ ≠ 0` and
  `d₂ = a − a = 0`, so `H₁ = 0` and `H₂ = ℤ`, and `Surface.genus Σ_0 = 0`; the projective plane `a a`
  has `d₂ = 2` and `H₂ = 0` (AlgebraicTopology §4.3's Check), and is excluded.

*Needs:* TeichmullerGeometry §0.0b; TeichmullerGeometry §0.0e; TeichmullerGeometry §0.0f;
AlgebraicTopology §4.2; AlgebraicTopology §4.3; MordellLawrenceVenkatesh §5.1;
MordellLawrenceVenkatesh §5.5;
MordellLawrenceVenkatesh §5.6.

The fundamental group of `Σ_g ∖ P` is presented by MappingClassGroupsAndCanonicalRepresentations
§0.1 with `b = 0`; its `surfaceGroup g n` is FreeGroupsAndLimitGroups §6.1's `S⁺(g, n)` transported
along the inversion of the handle generators (Conventions), so that for every enumeration of `P`
there is an isomorphism `S⁺(g, n) ≃* π₁(Σ_g ∖ P, x)` carrying `p_j` to a loop around the `j`-th
puncture.

### 2.5 Changes of model

Prove that a homeomorphism of pairs `e : (Σ_g, P) → (Σ'_g, P')` preserving orientation induces
`Mod_{g,n}(Σ_g, P) ≃* Mod_{g,n}(Σ'_g, P')`, `[f] ↦ [e f e⁻¹]`, intertwining the permutation
homomorphisms through `e|_P`; that isotopic `e` induce the same isomorphism; and that any two choices
of `e` induce isomorphisms differing by an inner automorphism. Any two pairs `(Σ_g, P)` with
`|P| = n` are related by such an `e`: `Σ_g ∖ P` and `Σ'_g ∖ P'` are surfaces of the same type
`(g, 0, n)`, so an orientation-preserving homeomorphism joins them (MordellLawrenceVenkatesh §5.4),
and it extends over the punctures by the argument of §2.2 (FarbMargalit2012, Ch. 2, §2.1).

**Checks.**

- For `e` the identity the induced isomorphism is the identity.
- For `e ∈ Homeo⁺(Σ_g, P)` itself the induced automorphism is conjugation by `[e]`, inner and in
  general nontrivial (for `Mod_{0,3} ≅ S₃` and `e` a transposition of punctures it is conjugation by a
  transposition).
- An orientation-reversing `e` induces an automorphism of `Mod_{g,n}` that need not be inner: for
  `Mod_{1,0} ≅ SL₂(ℤ)` and `e = diag(1, −1)` it is conjugation by `diag(1, −1)`, an outer automorphism
  of `SL₂(ℤ)`.

*Needs:* §2.1; §2.2; §2.3; MordellLawrenceVenkatesh §5.4.

### Examples

- `Mod_{0,0}` and `Mod_{0,1}` are trivial (FarbMargalit2012, Ch. 2, §2.2), `Mod_{0,2} ≅ ℤ/2` (§2.2's
  Check), `Mod_{0,3} ≅ S₃` with `PMod_{0,3}` trivial (MordellLawrenceVenkatesh §5.9),
  `Mod_{1,0} ≅ SL₂(ℤ)` (TeichmullerGeometry §5.4a, `mcg_torus_full` restricted to the
  orientation-preserving subgroup, read through §2.1); the pure Birman sequence for `(0, 3)`
  (MappingClassGroupsAndCanonicalRepresentations §0.3) makes `PMod_{0,4}` free of rank two.

### Dependencies

Tau Ceti's isotopies, ambient isotopies, invariance of domain and directed intersections of
continua; MordellLawrenceVenkatesh §§5.1, 5.4, 5.5, 5.6, 5.9, 5.17;
MappingClassGroupsAndCanonicalRepresentations §§0.1–0.3; FreeGroupsAndLimitGroups §6.1;
AlgebraicTopology §§4.2–4.3; TeichmullerGeometry §§0.0b, 0.0e, 0.0f, 0.0h, 5.4a; GeometricTopology
Layer 1.7.2; Mathlib's charted spaces on open subsets. Layer 2 supplies Layers 3 and 7.

## Layer 3: The outer action of the mapping class group

### 3.1 The automorphism induced by a homeomorphism and a path

For a space `X`, a homeomorphism `f` and a path `δ : x ⟶ f(x)`, define `f_δ : π₁(X, x) ≃* π₁(X, x)`
as `FundamentalGroup.map f x` followed by the inverse of `fundamentalGroupMulEquivOfPath δ`; it
sends `[γ]` to `[δ ⬝ (f ∘ γ) ⬝ δ̄]` (FarbMargalit2012, Ch. 8, §8.1).

The induced automorphism has the following API.

- Evaluation: `f_δ [γ] = [δ ⬝ (f ∘ γ) ⬝ δ̄]`.
- Change of path: for a second path `δ' : x ⟶ f(x)`, `f_{δ'} = MulAut.conj [δ ⬝ δ̄'] ∘ f_δ`, where
  `δ ⬝ δ̄'` is a loop at `x`.
- Composition: for homeomorphisms `f, g` and paths `δ : x ⟶ f(x)`, `ε : x ⟶ g(x)`,
  `(f ∘ g)_{δ ⬝ (f ∘ ε)} = f_δ ∘ g_ε`.
- Inverse: `(f⁻¹)_{rev(f⁻¹ ∘ δ)} = (f_δ)⁻¹`, where `rev(f⁻¹ ∘ δ) : x ⟶ f⁻¹(x)`.
- Identity: `id_{const} = 1`, and for a loop `σ` at `x`, `id_σ = MulAut.conj [σ]⁻¹`.
- Homeomorphisms fixing `x` with the constant path give the based homomorphism to `MulAut(π₁(X, x))`.

**Checks.**

- Convention witness: for `f = id` and `δ` a loop `σ`, `f_δ [γ] = [σ ⬝ γ ⬝ σ̄] = MulAut.conj [σ]⁻¹ [γ]`;
  the change-of-path law with `δ = const`, `δ' = σ` gives `MulAut.conj [σ̄]`, the same map; the
  opposite reading of `fundamentalGroupMulEquivOfPath` would give `MulAut.conj [σ]`.
- On `S¹ ⊂ ℂ` with `x = 1`, complex conjugation fixes `x` and acts by `−1` on `π₁ ≅ ℤ` with the
  constant path; the rotation by `π` with the arc `δ` from `1` to `−1` acts by `+1`.
- Without a path no automorphism of `π₁(X, x)` is defined when `f(x) ≠ x`: `FundamentalGroup.map f x`
  lands in `π₁(X, f x)`.

*Needs:* Mathlib `FundamentalGroup.map`, `FundamentalGroup.fundamentalGroupMulEquivOfPath`,
`FundamentalGroup.mul_def`, `MulAut.conj`.

### 3.2 Homotopy invariance and the inner-automorphism lemma

Prove that if `H : f ≃ g` is a homotopy between homeomorphisms with track `η(t) = H(t, x)` from `f(x)`
to `g(x)`, then `g_{δ ⬝ η} = f_δ`. Consequently, if `f ∈ Homeo₀(X)` with an ambient isotopy whose
track of `x` is `η : x ⟶ f(x)`, then for every `δ : x ⟶ f(x)`, `f_δ = MulAut.conj [η ⬝ δ̄]`, an inner
automorphism (FarbMargalit2012, Ch. 8, §8.1; the based form of MordellLawrenceVenkatesh §5.19).

*Proof sketch.* `FundamentalGroupoidFunctor.homotopicMapsNatIso` gives `[f ∘ γ] ⬝ [η] = [η] ⬝ [g ∘ γ]` for
loops `γ` at `x`. With `f = id`, `f_η = 1`, and the change-of-path law of §3.1 gives the formula.

**Checks.**

- Point pushing: for the isotopy pushing `x` once around a loop `α`, `f(x) = x`, `η = α`, and
  `f_{const} = MulAut.conj [α]`, which is MordellLawrenceVenkatesh §5.19's `γ ↦ α * γ * α⁻¹`.
- On the torus a translation isotopy induces the identity, as every inner automorphism of `ℤ²` is
  trivial.
- The hyperelliptic involution of a genus-two surface fixes a Weierstrass point `x` and acts by `−1`
  on the abelianization; `−1` is not induced by an inner automorphism, so the involution is not
  isotopic to the identity.

*Needs:* §3.1; §2.1; MordellLawrenceVenkatesh §5.19; Mathlib
`FundamentalGroupoidFunctor.homotopicMapsNatIso`, `ContinuousMap.Homotopy`.

### 3.3 The homomorphism Ψ and change of basepoint

For a path-connected space `X` and `x ∈ X`, define `Ψ_x : Mod^±(X) → Out(π₁(X, x))`,
`[f] ↦ [f_δ]` for any path `δ : x ⟶ f(x)`. Prove that it is well defined (by §3.1's change-of-path
law and §3.2) and a homomorphism (by §3.1's composition law). Prove that for `x'` and `σ : x ⟶ x'` the
isomorphism `Out(π₁(X, x)) ≃* Out(π₁(X, x'))` induced by `fundamentalGroupMulEquivOfPath σ` does not
depend on `σ` and carries `Ψ_x` to `Ψ_{x'}`. For `X = Σ_{g,n}` restrict to `Mod_{g,n}` and prove
that `Ψ_x[f]` is the outer class of `f_*` through which MordellLawrenceVenkatesh §5.9 lets
`Mod(Σ_{g,n})` act on finite coverings: the outer automorphism `(f⁻¹)_*` by which that section
precomposes monodromies is `Ψ_x[f]⁻¹`. On the stabilizer `Mod(S*)` of `x` (MordellLawrenceVenkatesh
§5.9) the based homomorphism `[f] ↦ f_{const}` to `MulAut(π₁(S, x))` lifts `Ψ_x`; by
MordellLawrenceVenkatesh §5.19, `Push(α)` acts by `MulAut.conj [α]`, which is `f_{const}` for its end
map by §3.2 (FarbMargalit2012, Ch. 8, §8.1; LandesmanLitt2024 lines 41–42). `Suggested.lean` states
the existence and well-definedness of `Ψ_x` as `exists_outerAction`: a homomorphism from the group of
homeomorphisms of `X` to `Out(π₁(X, x))` whose value at `f` is the class of `f_δ` for every path `δ`
from `x` to `f(x)`, and which is trivial on every homeomorphism ambient isotopic to the identity, so
that it factors through `Mod^±(X)`.

**Checks.**

- `X = S¹`: `Mod^±(S¹)` has two elements (§2.1) and `Ψ` is an isomorphism onto `Out(ℤ) = ℤ/2`.
- `X = T²`: the shear `(u, v) ↦ (u, u + v)` fixes the base point, sends `(1, 0)` to `(1, 1)` and
  `(0, 1)` to `(0, 1)`, and so maps to `[[1,0],[1,1]]` in `Out(ℤ²) = GL₂(ℤ)` (columns, as in the
  Conventions); its transpose `[[1,1],[0,1]]` is a different element, the image of the shear
  `(u, v) ↦ (u + v, v)`.
- `Ψ` is not injective in general: for `X = [0, 1]`, `π₁` is trivial while the flip `t ↦ 1 − t` is not
  isotopic to the identity (an ambient isotopy moves each endpoint continuously within `{0, 1}`), so
  `Mod^±([0, 1])` has two elements.

*Needs:* §1.1; §2.1; §3.1; §3.2; TeichmullerGeometry §4.2; MordellLawrenceVenkatesh §5.9;
MordellLawrenceVenkatesh §5.19.

### 3.4 Closed surfaces: the Dehn–Nielsen–Baer isomorphism and the action on `H₂`

Prove that for a closed connected oriented surface `Σ = Σ_g` of genus `g ≥ 1` and `x ∈ Σ`, `Ψ_x`
corresponds, under §2.1's isomorphism `Mod^±(Σ) ≃* MappingClassGroupFull Σ`, to TeichmullerGeometry
§5.4's `dehn_nielsen_baer`, hence is an isomorphism `Mod^±(Σ) ≃* Out(π₁(Σ, x))`; for `g = 0` it is the
map from the group of order two (TeichmullerGeometry §5.4a, `mcg_sphere_full`) to the trivial group.
For genus `g ≥ 1`, prove that `Out(π₁(Σ, x))` acts on `H₂(π₁(Σ, x); ℤ)`, Mathlib's `groupHomology` of
the trivial module `ℤ` in degree two, through `groupHomology.map`, inner automorphisms acting
trivially; that `H₂(π₁(Σ, x); ℤ) ≅ H₂(Σ; ℤ) ≅ ℤ`, because `Σ` is aspherical; and that `Ψ_x` maps
`Mod(Σ)` onto the subgroup of index two acting trivially on `H₂(π₁(Σ, x); ℤ)`. This subgroup,
transported along TeichmullerGeometry §4.2's `ι : Π ≃* π₁`, is the group that TeichmullerGeometry
§5.4 writes `Out⁺(Π)`, the image of the orientation-preserving classes; its description by the
action on `H₂` is stated here. For `g = 0`,
`Out(π₁(Σ, x))` is trivial and so is the image of `Mod(Σ)`, of index one (FarbMargalit2012, Ch. 8,
§8.1, Theorem 8.1).

*Proof sketch.* For the comparison, `Surface.IsOrientable Σ_g` and `Surface.genus Σ_g = g ≥ 1`
(§2.4) are the hypotheses of `dehn_nielsen_baer`, which is stated for the half-plane atlas of `Σ_g`
with empty boundary; the boundaryless atlas that `Σ_g` carries by TeichmullerGeometry §§0.0b and
0.0e (§2.1) enters only the proof that §2.1's comparison is bijective; both are atlases of the same
topological space `Σ_g`, and `Mod^±(Σ)` and `MappingClassGroupFull Σ` depend on that space alone.
Every class of `Mod^±(Σ)` has a representative `f` fixing `x`, the point
`f(x)` being moved back to `x` by isotopy extension along a path (MordellLawrenceVenkatesh §5.17),
and both `Ψ_x` (§3.3, with the constant path) and
`dehn_nielsen_baer` send its class to the outer class of `FundamentalGroup.mapOfEq f`. For `g ≥ 1`,
`Σ` is aspherical (MordellLawrenceVenkatesh §5.15) and is homeomorphic (§2.4) to the realization of
the canonical word, a finite CW complex with one vertex, `2g` edges and one open disc (§2.4's cell
structure, TeichmullerGeometry §0.0f), so its singular homology is the group homology of `π₁(Σ, x)`,
naturally (ClassifyingSpaces Stage 4 item 17). Hence `Ψ_x[f]` acts on `H₂(π₁(Σ, x); ℤ)` as `f` acts on
`H₂(Σ; ℤ) = ℤ[Σ]`, by the sign `ε_f = ±1` with `f_*[Σ] = ε_f [Σ]`. Naturality of cup and cap products
(Tau Ceti `TopCat.singularCup_naturality`, `TopCat.singularCap_naturality`) gives
`î(f_* u, f_* v) = ε_f î(u, v)` for `u, v ∈ H₁(Σ; ℤ)` and the intersection form `î` of
MordellLawrenceVenkatesh §5.5: writing `u = a ∩ [Σ]` and `v = b ∩ [Σ]`, the projection formula
(`TopCat.singularCap_naturality` for the class `(f⁻¹)^* a`, whose pull-back along `f` is `a`) gives
`f_* u = ε_f (f⁻¹)^* a ∩ [Σ]`, so, by naturality of the cup product and of the Kronecker pairing
(`TopCat.singularCup_naturality`, `TopCat.singularKronecker_naturality`),
`î(f_* u, f_* v) = ε_f² ⟨a ∪ b, (f⁻¹)_*[Σ]⟩ = ε_f î(u, v)`. If `f` preserves the orientation, `î` is
invariant under `f` (§5.5), and it is nonzero, being perfect (§5.5) on
`H₁(Σ; ℤ) ≅ ℤ^{2g} ≠ 0` (MordellLawrenceVenkatesh §5.6); hence `ε_f = 1`. If `f` reverses it,
`ε_f = −1`, since `f = (f ∘ r) ∘ r` with `f ∘ r` orientation-preserving (§2.1, index two), where `r`
corresponds, under §2.4's homeomorphism of `Σ` with the realization of the canonical word, to the map
induced by `z ↦ e^{2πi/g} z̄` on the closed unit disc. This map sends the point of parameter `t` on the
arc in position `j` to the point of parameter `1 − t` on the arc in position `3 − j` modulo `4g`, so it
respects the side gluing of the word `a₁ b₁ a₁⁻¹ b₁⁻¹ ⋯ a_g b_g a_g⁻¹ b_g⁻¹`: the glued pair
`(4i, t) ∼ (4i + 2, 1 − t)` goes to `(4j + 3, 1 − t) ∼ (4j + 1, t)` with `j ≡ −i` modulo `g`, and the
pair `(4i + 1, t) ∼ (4i + 3, 1 − t)` to `(4j + 2, 1 − t) ∼ (4j, t)`. It is cellular and maps the open
disc to itself by a reflection, so it acts by `−1` on cellular `H₂`, hence on singular `H₂`
(AlgebraicTopology §§4.2–4.3). An inner automorphism `MulAut.conj [α]` is `f_{const}` for
the push of `x` around `α` (§3.2), which is isotopic to the identity (MordellLawrenceVenkatesh
§5.19), so it acts trivially. Since `r` acts by `−1`, the action of `Out` is onto `{±1}`; an outer class acting by `+1` is `Ψ_x[f]`
for some `f`, `Ψ_x` being onto, and that `f` cannot reverse orientation.

**Checks.**

- Torus: `Ψ` is the isomorphism `Mod^±(T²) ≅ GL₂(ℤ)` on the action on `H₁ = ℤ²`, the inverse of
  TeichmullerGeometry §5.4a's `mcg_torus_full` read through §2.1; `A ∈ GL₂(ℤ)` acts on
  `H₂(ℤ²; ℤ) = Λ²ℤ² ≅ ℤ` by `det A`, so the image of `Mod(T²)` is `SL₂(ℤ)`, of index two. The sign
  agrees with the intersection form: `î(Au, Av) = det(A) î(u, v)`, so the shear `[[1,0],[1,1]]` has
  `ε = 1` and the reflection `diag(1, −1)` has `ε = −1`.
- Sphere: `Out(1)` is trivial while `Mod^±(S²)` has two elements (the antipodal map has degree `−1`,
  an isotopy invariant; TeichmullerGeometry §5.4a); so `Ψ_x` is an isomorphism for `g ≥ 1` and not
  injective for `g = 0`. Here `H₂(π₁(S², x); ℤ) = H₂(1; ℤ) = 0` while `H₂(S²; ℤ) = ℤ`, and `î = 0` on
  `H₁(S²; ℤ) = 0`: the sphere is not aspherical and the sign argument has no nonzero form to use,
  which is why the `H₂` clause is stated for `g ≥ 1`.
- Genus two: the hyperelliptic class maps to the outer class acting by `−1` on the abelianization
  (the genus-two example of TeichmullerGeometry Layer 5).

*Needs:* §2.1; §2.4; §3.2; §3.3; TeichmullerGeometry §0.0b; TeichmullerGeometry §0.0e;
TeichmullerGeometry §0.0f;
TeichmullerGeometry §0.0h; TeichmullerGeometry §4.2; TeichmullerGeometry §5.4;
TeichmullerGeometry §5.4a; MordellLawrenceVenkatesh §5.1; MordellLawrenceVenkatesh §5.5;
MordellLawrenceVenkatesh §5.6; MordellLawrenceVenkatesh §5.15; MordellLawrenceVenkatesh §5.17;
MordellLawrenceVenkatesh §5.19; AlgebraicTopology §§4.2–4.3; ClassifyingSpaces Stage 3 item
11; ClassifyingSpaces Stage 3 item 15; ClassifyingSpaces Stage 4 item 17; Mathlib `groupHomology`, `groupHomology.map`,
`FundamentalGroup.mapOfEq`; Tau Ceti `TopCat.singularCup_naturality`,
`TopCat.singularCap_naturality`, `TopCat.singularKronecker_naturality`.

### 3.5 The mapping class action on conjugacy classes of representations

For every group `H`, define the action of `Mod^±_{g,n}` on `Rep(π₁(Σ_{g,n}, x), H)` as `Ψ_x`
(§3.3) followed by §1.3's action of `Out`, `[f] · [ρ] = [ρ ∘ Ψ_x[f]⁻¹]`. Prove that for
`H = Sym(d)`, on the classes of transitive homomorphisms and on `Mod_{g,n}`, it is
MordellLawrenceVenkatesh §5.9's action `[p] ↦ [f ∘ p]` on isomorphism classes of connected
coverings of degree `d`, under the monodromy correspondence
(`TauCeti.ConnectedCoveringSpace.monodromyEquivalence`, read at `x` through
`TauCeti.FundamentalGroupoidAction.basepointMulAction`, a fibre being identified with
`{1, …, d}` up to `Sym(d)`). Prove that the action is compatible with the basepoint isomorphisms of §3.3
and with homomorphisms `H → H'`; that for a subgroup `M ≤ Mod^±_{g,n}` of finite index (in particular
`PMod_{g,n}`, of index `n!` in `Mod_{g,n}` by MappingClassGroupsAndCanonicalRepresentations §0.2
and §2.3) an orbit is finite under `M` exactly when it is finite
under `Mod^±_{g,n}`. Prove the non-descent theorem, for every `(g, n)`: let `S = Σ_{g,n}` marked at
`x`, and `Mod(S*)` the group of classes fixing `x` with the surjection `Forget : Mod(S*) → Mod_{g,n}`
(MordellLawrenceVenkatesh §5.9). The based action `[f] · ρ = ρ ∘ (f_{const})⁻¹` of `Mod(S*)` on
`Hom(π₁(S, x), H)`, given by §3.3's based homomorphism and §1.3, makes the quotient map
`Hom(π₁(S, x), H) → Rep(π₁(S, x), H)` equivariant for `Mod(S*)` acting on `Rep(π₁(S, x), H)`
through `Forget`; and it factors through `Forget` if and only if every homomorphism `π₁(S, x) → H`
has commutative image (LandesmanLitt2024 lines 41–50, Definition 1.1.1 and the remark after it that
`Mod_{g,n}` does not naturally act on the representation variety; lines 473–475 for `PMod_{g,n}` of
index `n!`).

*Proof sketch.* Coverings: the fibre of `f ∘ p` over `x` is the fibre of `p` over `f⁻¹(x)`, and a
loop `γ` at `x` lifts through `f ∘ p` as `f⁻¹ ∘ γ` lifts through `p`; so the monodromy of `f ∘ p`
is that of `p` at `f⁻¹(x)` precomposed with `FundamentalGroup.map f⁻¹`. Transport along a path
`δ' : x ⟶ f⁻¹(x)` conjugates it, by the bijection of fibres that `δ'` induces, into
`ρ_p ∘ (f⁻¹)_{δ'}` (§3.1), whose class is `[ρ_p ∘ Ψ_x[f]⁻¹]`. Equivariance: `Ψ_x[Forget f]` is the
class of `f_{const}`, the constant path joining `x` to `f(x) = x` (§3.3). Non-descent: `Forget` being
surjective, the action factors through it exactly when its kernel acts trivially. If it does, each
`Push(α)` acts trivially, since `Forget(Push α) = 1` (MordellLawrenceVenkatesh §5.19), and `Push(α)`
acts by `ρ ↦ ρ ∘ (MulAut.conj [α])⁻¹ = MulAut.conj (ρ [α])⁻¹ ∘ ρ` (§1.3; MordellLawrenceVenkatesh
§5.19), so `ρ[α]` commutes with `ρ(π₁(S, x))` for every `α`. Conversely a class in the kernel of
`Forget` is represented by a homeomorphism `f` fixing `x` and ambient isotopic to the identity in
`S` (Conventions, §2.1); the track `η` of `x` is a loop at `x`, and `f_{const} = MulAut.conj [η]`
(§3.2), which fixes every `ρ` with commutative image. No exactness of the Birman sequence is used.

**Checks.**

- The trivial representation and every class with finite image have finite orbit: the orbit of `[ρ]`
  with finite image `F` lies in the finite set of classes of homomorphisms from the finitely
  generated `π₁` onto subgroups of `F`.
- On a closed genus-two surface, `ρ(γ) = [[1, f(γ)],[0, 1]] ∈ GL₂(ℂ)` with `f(a₁) = 1` and
  `f(b₁) = f(a₂) = f(b₂) = 0` has infinite orbit: classes of such `ρ` correspond to lines `ℂ f` in
  `H¹(Σ₂; ℂ)`, and `Mod_{2,0}` moves the primitive class `f` through infinitely many lines
  (MordellLawrenceVenkatesh §5.22).
- For commutative `H` the action on `Hom(π₁, H) = Hom(H₁(Σ_{g,n}), H)` is the action through
  `H₁`, and the based action of `Mod(S*)` factors through `Forget`, consistently with §1.3.
- Non-descent on `(g, n) = (0, 3)`, `π₁ = F₂ = ⟨a, b⟩`, `H = S₃`: for the surjection `ρ` with
  `ρ(a) = (1 2)`, `ρ(b) = (2 3)`, `Push(a) · ρ` sends `b` to `(1 2)(2 3)(1 2) = (1 3) ≠ (2 3)`, so a
  class in the kernel of `Forget` moves `ρ`.
- Non-descent on the torus `(g, n) = (1, 0)`, where `χ = 0` and `Push` is trivial
  (MordellLawrenceVenkatesh §5.19), so the Birman sequence is not exact on the left: a class in the
  kernel of `Forget` acts on `π₁ = ℤ²` by an inner automorphism, the identity, so the based action
  factors through `Forget`, and every homomorphism from `ℤ²` has commutative image; both sides
  hold. The same holds for `(0, 0)`, `(0, 1)` and `(0, 2)`, with `π₁ = 1, 1, ℤ`; a statement
  restricted to `2g − 2 + n > 0` would omit these true cases.
- The theorem is about the based action, not about lifts of sets: as an action on sets, the action
  of `Mod_{g,n}` on `Rep(π₁, H)` always lifts along `Hom(π₁, H) → Rep(π₁, H)`, because the fibres
  over one orbit are conjugation orbits `H · ρ`, pairwise in bijection through `ρ ↦ ρ ∘ φ⁻¹`, and
  transporting one fibre along chosen bijections gives an equivariant action. For `(0, 3)` and
  `H = S₃` this lifts the action on the `11` classes of `Rep(F₂, S₃)` (Burnside's count
  `(36 + 3 · 4 + 2 · 9)/6`) to the `36` points of `Hom(F₂, S₃)`; a statement that no lift exists
  would be false.
- Agreement with MordellLawrenceVenkatesh §5.9's action on coverings, which fixes the direction of
  the definition: on the torus, for the shear
  `f` with `Ψ[f] = M = [[1,0],[1,1]]` (§3.3) and the triple cover `p` with monodromy
  `ρ(u, v) = v mod 3`, the cover `f ∘ p` has subgroup `M(ker ρ) = {(a, b) : b ≡ a mod 3}`, the kernel
  of `ρ ∘ M⁻¹ : (a, b) ↦ b − a mod 3`, as the formula `[ρ ∘ Ψ[f]⁻¹]` predicts; the right action
  `ρ ∘ M : (a, b) ↦ a + b mod 3` has kernel `{b ≡ −a mod 3}`, a different cover.

*Needs:* §1.3; §2.1; §2.3; §3.1; §3.2; §3.3; MappingClassGroupsAndCanonicalRepresentations §0.2;
MordellLawrenceVenkatesh §5.9; MordellLawrenceVenkatesh §5.19;
MordellLawrenceVenkatesh §5.22; Tau Ceti
`TauCeti.ConnectedCoveringSpace.monodromyEquivalence`,
`TauCeti.FundamentalGroupoidAction.basepointMulAction`; Mathlib `FundamentalGroup.map`.

### Examples

- `Ψ` for `(g, n) = (0, 3)`: `Mod_{0,3} ≅ S₃` acts on `F₂ = ⟨p₁, p₂⟩` with `p₃ = (p₁p₂)⁻¹` by permuting
  the three peripheral conjugacy classes; the transposition of the first two punctures maps to the
  outer class of `p₁ ↦ p₂`, `p₂ ↦ p₂⁻¹ p₁ p₂`.

### Dependencies

Layers 1 and 2; Mathlib's fundamental group and groupoid and `groupHomology`; Tau Ceti's
classification of connected coverings by monodromy; Tau Ceti's naturality of the singular cup and
cap products and of the Kronecker pairing (`TopCat.singularCup_naturality`,
`TopCat.singularCap_naturality`, `TopCat.singularKronecker_naturality`, §3.4);
MordellLawrenceVenkatesh §§5.1, 5.5, 5.6, 5.9, 5.15, 5.17, 5.19, 5.22; MappingClassGroupsAndCanonicalRepresentations §0.2;
TeichmullerGeometry §§0.0b, 0.0e, 0.0f, 0.0h, 4.2, 5.4, 5.4a; AlgebraicTopology §§4.2–4.3;
ClassifyingSpaces Stages 3–4. Layer 3 supplies Layer 7.

## Layer 4: Representation schemes

### 4.1 The representation scheme of a finitely generated group

Let `k` be a commutative ring, `G` an affine group scheme over `k` with coordinate Hopf algebra `A`
(a commutative Hopf `k`-algebra, Mathlib `HopfAlgebra`, whose points form Tau Ceti's convolution
groups, `AlgHom.convGroupOfSemiring`), and `Γ` a group with a finite generating family `s : S → Γ`. Construct the
representation scheme `Hom(Γ, G)`: the functor `R ↦ Hom(Γ, G(R))` on commutative `k`-algebras, with
`G(R)` the convolution group of points, is represented by the quotient of `A^{⊗S}` by the ideal
generated by `w^*(a) − ε(a)` for `a ∈ A` and `w` in the kernel `N` of `FreeGroup S → Γ`, where `w^*`
is the coproduct-word map of `w`. Prove that the representing algebra does not depend on `s` up to
unique isomorphism, is of finite type when `A` is, and is functorial (contravariantly in `Γ`,
covariantly in `G`), commutes with base change `k → k'`, and that conjugation `ρ · g = g⁻¹ ρ g` is a
right action of `G` by scheme automorphisms, given by a `TauCeti.ComoduleAlgebra` structure of the
representing algebra over `A` whose coaction `δ` satisfies `(δ f)(ρ, g) = f(g⁻¹ ρ g)` on points
(Sikora2012 lines 459–468, Lemma 26, the universal representation algebra and
its uniqueness over `ℂ`; Sikora2012 line 584, `Hom(Γ, G)` a closed subset of `Hom(F, G)`;
BCGGO2024 lines 2706–2708, the conjugation action on `Hom(π₁Σ, G^ℝ)`).

The representation scheme has the following API.

- Points: `Hom(Γ, G)(R) = Hom(Γ, G(R))`, naturally in `R`.
- Generators: evaluation on `s` is a closed immersion `Hom(Γ, G) → G^S`, equivariant for
  conjugation; for `Γ = FreeGroup S` it is an isomorphism.
- Surjections `Γ' ↠ Γ` induce closed immersions `Hom(Γ, G) → Hom(Γ', G)`.
- For a closed embedding `G ⊆ GL_N`, `ρ ↦ (ρ(s_i), ρ(s_i)⁻¹)_i` is a closed equivariant immersion into
  the affine space `(M_N × M_N)^S` with `G` acting by simultaneous conjugation.
- Base change: `Hom(Γ, G)_{k'} = Hom(Γ, G_{k'})`.
- Orbits: on points, the conjugation orbit of `ρ : Γ →* G(R)` is
  `conjOrbit ρ = {MulAut.conj g ∘ ρ : g ∈ G(R)}`, and two homomorphisms lie in one orbit exactly when
  they are conjugate.

**Checks.**

- `Γ = ℤ`: `Hom(ℤ, G) = G`; `Γ = F_m`: `Hom = G^m`; `Γ` trivial: `Hom = Spec k`.
- `Γ = ℤ/2`, `G = 𝔾_m` over `𝔽₂`: `Hom = Spec 𝔽₂[t]/(t² − 1) = Spec 𝔽₂[t]/((t − 1)²)` is a nonreduced
  point; a definition by points over a field alone would see only `t = 1` and lose the nilpotent.
- `Γ = ℤ²`, `G = GL_n`: the points are pairs of commuting invertible matrices; omitting the relator
  `[a, b]` would give `GL_n × GL_n`.
- Direction of the conjugation coaction: for `Γ = ℤ` and `G = GL₂`, `Hom(ℤ, GL₂) = GL₂` with
  coordinates `x_{ij}` of `ρ(1)`, and at `g = diag(λ, 1)` one has
  `g⁻¹ ρ g = [[x₁₁, λ⁻¹ x₁₂],[λ x₂₁, x₂₂]]`, so `δ(x₁₂)` evaluates at `g` to `λ⁻¹ x₁₂` and `δ(x₂₁)` to
  `λ x₂₁`; the left action `g ρ g⁻¹` read as a coaction would give `λ x₁₂`. The trace `x₁₁ + x₂₂` is
  fixed by `δ`, `x₁₂` is not.

*Needs:* Mathlib `HopfAlgebra`, `FreeGroup`, `FreeGroup.lift`, `PresentedGroup`; Tau Ceti
`AlgHom.convGroupOfSemiring`, `AlgHom.mapValue`, `TauCeti.ComoduleAlgebra`.

### 4.2 Real and complex points and their topologies

Prove that for `k = ℂ` and `G` of finite type, the point topology (`TauCeti.PointTopology.topology`,
ReductiveGroupsPartII §RG2.0.1) on `Hom(Γ, G)(ℂ) = Hom(Γ, G(ℂ))` equals the classical topology of
ReductiveGroups §3A.5c and the topology of pointwise convergence; `Hom(Γ, G(ℂ))` is closed in
`G(ℂ)^S`, Hausdorff and locally compact. For an affine group scheme `𝐆` of finite type over `ℝ` and
an open subgroup `G^ℝ ⊆ 𝐆(ℝ)` (in particular for every real reductive datum `(𝐆, G^ℝ)` of the
Conventions), prove that `Hom(Γ, 𝐆(ℝ)) = Hom(Γ, 𝐆)(ℝ)` is the fixed set of complex conjugation on
`Hom(Γ, 𝐆)(ℂ)`, that `Hom(Γ, G^ℝ)` is an open and closed subset of it, being the finite intersection
over `s ∈ S` of the preimages of the open and closed subgroup `G^ℝ` under `ρ ↦ ρ(s)`, and that `G^ℝ`
acts continuously by conjugation (BCGGO2024 lines 2706–2708). For any group `G` with a topology,
`pointwiseTopology` is the topology of pointwise convergence on `Γ →* G`, induced from the product
topology on `Γ → G`; the point topology of `G(R)` is Tau Ceti's
`TauCeti.PointTopology.instTopologicalSpaceWithConv`.

**Checks.**

- `Hom(ℤ, GL₁(ℝ)) = ℝ^×` has two components and `Hom(ℤ, GL₁(ℝ)⁰) = ℝ_{>0}` is one of them.
- `Hom(ℤ/2, SO(2)) = {±1}` is discrete, while `Hom(ℤ, SO(2)) = SO(2)` is a circle.
- For `Γ = F₂`, the pointwise topology on `Hom(F₂, G(ℂ))` is the product topology of `G(ℂ)²`; a
  discrete topology on `Hom` would make every orbit closed.
- The real clause uses neither reductivity nor connectedness: for the unipotent `𝐆 = 𝔾_a`,
  `G^ℝ = ℝ` and `Γ = ℤ/2`, `Hom(ℤ/2, 𝔾_a) = Spec ℝ[t]/(2t)` is the single point `0`, fixed by
  conjugation and equal to `Hom(ℤ/2, ℝ) = {0}`; for the disconnected `𝐆 = μ₂` and `Γ = ℤ`,
  `Hom(ℤ, μ₂)(ℂ) = {±1}` is fixed pointwise by conjugation and equals `Hom(ℤ, μ₂(ℝ))`, and the open
  subgroup `G^ℝ = {1}` gives the open and closed point `{1}`.

*Needs:* §4.1; ReductiveGroupsPartII §RG2.0.1; ReductiveGroups §3A.5c; Tau Ceti
`TauCeti.PointTopology.topology`.

### 4.3 Surface groups

Prove that, through the isomorphism `S⁺(g, n) ≃* π₁(Σ_g ∖ P, x)` given by
MappingClassGroupsAndCanonicalRepresentations §0.1 with `b = 0` and the inversion of the handle
generators (Conventions), `Hom(π₁(Σ_g, x), G)` is isomorphic, equivariantly for conjugation, to the
closed subscheme `{(A_i, B_i) ∈ G^{2g} : ∏_i [A_i, B_i] = 1}` of `G^{2g}`, and that for `n ≥ 1`,
`Hom(π₁(Σ_{g,n}, x), G) ≅ G^{2g+n−1}`, with the peripheral evaluations `ρ ↦ ρ(p_j)` given by the
relator (FreeGroupsAndLimitGroups §§6.1–6.2 for the presentation and the freeness; Sikora2012
lines 420–421, Remark 24, for `Hom(F_m, G) = G^m`; BCGGO2024 lines 2706–2708 for `Hom(π₁Σ, G^ℝ)`
with its conjugation action).

**Checks.**

- `g = 1`, `n = 0`: the commuting variety; for `G = GL₁` it is `𝔾_m²`.
- `(g, n) = (0, 3)`: `G²`, with `ρ(p₃) = (ρ(p₁)ρ(p₂))⁻¹`.
- `(g, n) = (0, 0)`: a point; `(g, n) = (1, 1)`: `G²`, not the commuting variety.

*Needs:* §4.1; MappingClassGroupsAndCanonicalRepresentations §0.1; FreeGroupsAndLimitGroups §6.1;
FreeGroupsAndLimitGroups §6.2.

### Examples

- `Hom(F₂, SL₂)` is `SL₂ × SL₂`, of dimension six; `Hom(π₁(Σ₂), SL₂)` is the fibre over `1` of the
  commutator-product map `SL₂⁴ → SL₂`.

### Dependencies

Tau Ceti's groups of points and their point topology; Tau Ceti `TauCeti.ComoduleAlgebra` (the
conjugation coaction, §4.1); ReductiveGroupsPartII §RG2.0.1;
ReductiveGroups §3A.5c; MappingClassGroupsAndCanonicalRepresentations §0.1;
FreeGroupsAndLimitGroups §§6.1–6.2. Layer 4
supplies Layers 6 and 7.

## Layer 5: Real reductive groups and minimal vectors

### 5.1 Real reductive data

Define a real reductive datum as in the Conventions: a connected reductive `ℝ`-group `𝐆` and an open
subgroup `G^ℝ ⊆ 𝐆(ℝ)`. Record that `G^ℝ` is a real Lie group with finitely many components and Lie
algebra `𝔤^ℝ` (ArithmeticLocallySymmetricSpaces §ALS.F.1), that complex reductive groups are the
case `𝐆 = Res_{ℂ/ℝ} H` (ReductiveGroupsPartII §RG2.0a.2), and that `Ad : G^ℝ → GL(𝔤^ℝ)` is the
restriction of the algebraic adjoint representation (Tau Ceti `Derivation.adRepresentation`, read on
real points as `adjointRepresentation`) (BCGGO2024 lines 466–472; Knapp2002, Ch. VI, §§1–2).

The datum has the following API.

- `G^ℝ` contains the identity component of `𝐆(ℝ)` and has finite index in `𝐆(ℝ)`.
- For `𝐆 = Res_{ℂ/ℝ} H`, `G^ℝ = H(ℂ)` and `𝔤^ℝ` is `Lie(H)` regarded as a real Lie algebra.
- A morphism of `ℝ`-groups mapping `G^ℝ` into `G'^ℝ` is a morphism of data.

**Checks.**

- `𝐆 = SO(p, q)`, `p, q ≥ 1`: `𝐆(ℝ)` has two components, and both `𝐆(ℝ)` and its identity
  component are data; `𝐆 = PGL₂`: `PSL₂(ℝ) = PGL₂(ℝ)⁰` is a datum, the group of BCGGO2024's
  Example 8.2.
- `𝐆 = Res_{ℂ/ℝ} GL_n`: `G^ℝ = GL_n(ℂ)`, `dim_ℝ 𝔤^ℝ = 2n²`.
- Non-examples: the universal cover of `SL₂(ℝ)` is not an open subgroup of the real points of any
  linear algebraic group (it has no faithful finite-dimensional representation), and the additive
  group `ℝ = 𝔾_a(ℝ)` is excluded because `𝔾_a` is unipotent, not reductive.

*Needs:* Tau Ceti `TauCeti.reductiveCommHopfAlgProperty`, `Derivation.adRepresentation`,
`TauCeti.PointTopology.isTopologicalGroup`, `TauCeti.Algebra.WeilRestriction.pointsMulEquiv`;
ArithmeticLocallySymmetricSpaces §ALS.F.1; ReductiveGroupsPartII §RG2.0a.2.

### 5.2 Real forms given by antiholomorphic involutive automorphisms

Let `H` be a connected reductive group over `ℂ` and `τ` an antiholomorphic involutive automorphism
of the complex Lie group `H(ℂ)`: a group automorphism that is antiholomorphic and satisfies `τ² = 1`.
An `ℝ`-form of `H` is a pair `(𝐆₀, φ)` of an affine group scheme `𝐆₀` over `ℝ` and an isomorphism
`φ : (𝐆₀)_ℂ ≅ H` of `ℂ`-groups; its conjugation is `φ ∘ c ∘ φ⁻¹` on `H(ℂ)`, where `c` is the complex
conjugation of `𝐆₀(ℂ)`. RealSemisimpleLieGroups §2.5 supplies an `ℝ`-form `(𝐆_τ, φ_τ)` with
conjugation `τ`, `𝐆_τ` connected reductive, so that `φ_τ` identifies `𝐆_τ(ℝ)` with `H(ℂ)^τ`,
possibly disconnected. It also supplies, for a Cartan involution `σ` for `τ` (a holomorphic
involutive automorphism of `H(ℂ)` commuting with `τ` with `H(ℂ)^{στ}` compact, BCGGO2024 lines
475–481), that `σ` is the complexification of a Cartan involution of `𝐆_τ` in the sense of
ArithmeticLocallySymmetricSpaces §ALS.0.1 and that `K = H(ℂ)^τ ∩ H(ℂ)^σ` is a maximal compact
subgroup of `𝐆_τ(ℝ)`. So `(𝐆_τ, 𝐆_τ(ℝ))` and `(𝐆_τ, 𝐆_τ(ℝ)°)` are real reductive data (§5.1).
Prove the two statements that make `τ ↦ (𝐆_τ, φ_τ)` a bijection (BCGGO2024 lines 466–481; Knapp2002,
Ch. VI, §§1–2):

- *Uniqueness.* Two `ℝ`-forms `(𝐆₁, φ₁)` and `(𝐆₂, φ₂)` of `H` with the same conjugation are
  isomorphic by exactly one isomorphism `α : 𝐆₁ ≅ 𝐆₂` of `ℝ`-groups with `φ₂ ∘ α_ℂ = φ₁`. In
  particular the identity is the only automorphism of an `ℝ`-form over the identity of `H`.
- *Converse.* The conjugation of every `ℝ`-form of `H` is an antiholomorphic involutive
  automorphism of `H(ℂ)`.

Hence `τ ↦ (𝐆_τ, φ_τ)` is a bijection from the antiholomorphic involutive automorphisms of `H(ℂ)` to
the isomorphism classes of `ℝ`-forms of `H`, isomorphisms being taken over the identity of `H`: an
isomorphism `α` over the identity is defined over `ℝ`, so `α_ℂ` commutes with the conjugations and
the two forms have the same conjugation, and every form is `(𝐆_τ, φ_τ)` for its own conjugation `τ`
by the converse and uniqueness.

*Proof sketch.* The pullback `φᵢ^* : O(H) → O(𝐆ᵢ) ⊗_ℝ ℂ` is an isomorphism of complex Hopf
algebras, and its inverse carries `O(𝐆ᵢ) ⊗ 1` onto the fixed space `F = {f ∈ O(H) : f = f^τ}` of
the antilinear involution `f ↦ f^τ = conj ∘ f ∘ τ`; functions on `H` are determined by their values
at `ℂ`-points, `H` being reduced and of finite type over `ℂ`. A function defined over `ℝ` takes
conjugate values at conjugate points, so `W = (φᵢ^*)⁻¹(O(𝐆ᵢ) ⊗ 1)` lies in `F`. Conversely
`O(H) = F ⊕ iF`, since `f` is the sum of `(f + f^τ)/2 ∈ F` and `i · (f − f^τ)/(2i)` with
`(f − f^τ)/(2i) ∈ F`; for `f ∈ F` write `f = w₁ + i w₂` with `wⱼ ∈ W ⊆ F` (`O(H) = W + iW`, the
inverse of `φᵢ^*` being `ℂ`-linear), so that `f − w₁ = i w₂ ∈ F ∩ iF = 0` and `f ∈ W`. Hence
`(φ₁^*)⁻¹(O(𝐆₁) ⊗ 1) = F = (φ₂^*)⁻¹(O(𝐆₂) ⊗ 1)`, and the isomorphism of complex Hopf algebras
`φ₁^* ∘ (φ₂^*)⁻¹ : O(𝐆₂) ⊗_ℝ ℂ → O(𝐆₁) ⊗_ℝ ℂ` carries `O(𝐆₂) ⊗ 1` through `F` onto `O(𝐆₁) ⊗ 1`, so
it restricts to an isomorphism of real Hopf algebras `O(𝐆₂) ≅ O(𝐆₁)`, the pullback of `α`.
It is the only one: `α_ℂ = φ₂⁻¹ ∘ φ₁` is forced, and `α` is determined by `α_ℂ` because
`O(𝐆ᵢ) → O(𝐆ᵢ) ⊗_ℝ ℂ` is injective. For the converse, `c` is the map on points induced by the
`ℝ`-algebra automorphism `conj` of `ℂ`, so it is a group automorphism of `𝐆₀(ℂ)` with `c² = 1`; in a
closed embedding of `𝐆₀` into an affine space over `ℝ` it is coordinatewise complex conjugation,
hence antiholomorphic; and `φ` is holomorphic, so `φ ∘ c ∘ φ⁻¹` has the same three properties.

**Checks.**

- `H = GL_n`, `τ(g) = ḡ`: `𝐆_τ = GL_n` over `ℝ`, `H(ℂ)^τ = GL_n(ℝ)` with two components;
  `σ(g) = (gᵀ)⁻¹` is a Cartan involution for `τ`, since `στ(g) = (ḡᵀ)⁻¹` has the compact fixed group
  `U(n)`, and `K = GL_n(ℝ) ∩ U(n) = O(n)`. For `τ(g) = (ḡᵀ)⁻¹` the form is the compact `U(n)`, with
  Cartan involution `σ = 1`.
- `H = GL₂`, `τ(g) = J ḡ J⁻¹` with `J = [[0, −1],[1, 0]]`: `τ² = 1` because `J` is real with
  `J² = −1`; the fixed points are the matrices `[[a, −b̄],[b, ā]]`, the group `ℍ^×` of nonzero
  quaternions, a non-split real form. Conversely, through `ℍ ⊗_ℝ ℂ ≅ M₂(ℂ)` the conjugation of the
  `ℝ`-form `ℍ^×` is the antilinear map fixing these matrices, and `J ḡ J⁻¹` is antilinear and fixes
  them (`ḡ = [[ā, −b],[b̄, a]]` and `J ḡ J⁻¹ = [[a, −b̄],[b, ā]]`), so it is this `τ`.
- Uniqueness holds only over the identity of `H`: for `H = GL₁` and `τ(z) = z̄`, the forms `(𝔾_m, id)`
  and `(𝔾_m, z ↦ z⁻¹)` both have conjugation `τ`, the inversion commuting with `conj`, and the only
  isomorphism between them over the identity of `H` is `α(z) = z⁻¹`; the `ℝ`-group `𝔾_m` alone has the
  two automorphisms `z ↦ z^{±1}`, so isomorphisms not taken over `H` are not unique.
- Non-examples. The holomorphic involutive automorphism `g ↦ (gᵀ)⁻¹` of `GL_n(ℂ)` has fixed group
  `O_n(ℂ)`, a complex subgroup, not a real form. On `GL₁`, `z ↦ 2/z̄` is an antiholomorphic involution
  of the manifold `ℂ^×` (`2/conj(2/z̄) = z`) but no automorphism, since it sends `1` to `2`, and its
  fixed set `{|z|² = 2}` is no subgroup: the word "automorphism" in the hypothesis cannot be dropped.

*Needs:* §5.1; RealSemisimpleLieGroups §2.5; ArithmeticLocallySymmetricSpaces §ALS.0.1;
Mathlib `HopfAlgebra`.

### 5.3 Cartan-compatible realizations of the conjugation action

Prove that every real reductive datum admits a closed embedding `𝐆 ⊆ GL_N` over `ℝ` with `G^ℝ`
transpose-stable (ArithmeticLocallySymmetricSpaces §ALS.F.1), and that for it `G^ℝ = K exp(𝔭)` with
`K = G^ℝ ∩ O(N)` and `𝔭 = 𝔤^ℝ ∩ Sym_N(ℝ)`, and `G(ℂ) = U exp(i𝔲)` with `U = G(ℂ) ∩ U(N)` and
`i𝔲 = 𝔭 ⊕ i𝔨`, both decompositions unique. Prove that `U` and `i𝔲` are stable under complex
conjugation and that `i𝔲 ∩ 𝔤^ℝ = 𝔭`. For a finite set `S`, the conjugation action of `G^ℝ` (of
`G(ℂ)`) on `V = (M_N × M_N)^S` over `ℝ` (over `ℂ`) with the inner product `Σ tr(A_i B_iᵀ)` (its
hermitian extension) satisfies the hypothesis of a real reductive linear group in the sense of
BohmLafuente2021 lines 52–62: the image is closed, `K` (`U`) acts orthogonally (unitarily) and `𝔭`
(`i𝔲`) acts by symmetric (hermitian) endomorphisms.

*Proof sketch.* If `exp(S) ∈ 𝐆(ℝ)` with `S` symmetric, then `exp(tS) ∈ 𝐆(ℝ)` for all real `t`: in an
eigenbasis of `S` the defining polynomials of `𝐆` evaluated on `exp(tS)` are exponential polynomials
in `t` with real exponents vanishing at all integers, hence identically. Combined with
ArithmeticLocallySymmetricSpaces §ALS.F.1's polar decomposition this gives `G^ℝ = K exp(𝔭)`; the
complex case applies the same to `Res_{ℂ/ℝ} G` (LieGroups Layer 9). For `X ∈ 𝔭`, `ad X` is symmetric
for the trace form.

**Checks.**

- `SL₂(ℝ)`: `K = SO(2)`, `𝔭` the traceless symmetric matrices, `U = SU(2)`; the minimal vectors of
  `M₂(ℝ)` under conjugation are the normal matrices (BohmLafuente2021 line 193).
- `GL₁(ℝ)` acting on `ℝ` by `λ · v = λv`: `𝔭 = ℝ` and only `0` minimizes the norm on its orbit.
- Transpose-stability depends on the embedding: the circle `𝐆 = SO(2)` embedded by
  `r_θ ↦ u r_θ u⁻¹` with `u = [[1,1],[0,1]]` has image `{[[c + s, −2s],[s, c − s]]}` (`c = cos θ`,
  `s = sin θ`), and the transpose `[[1,1],[−2,−1]]` of its element `[[1,−2],[1,−1]]` (`θ = π/2`) is
  not of this form. Here `K = G^ℝ ∩ O(2) = {±1}` (the squared lengths of the two columns are
  `1 + s(2c + s)` and `1 + 2s(2s − c)`, so columns of length one force `s(2c + s) = 0` and
  `s(2s − c) = 0`, hence `s = 0`, since `s ≠ 0` would give `s = −2c = −4s`) and `𝔭 = 0` (the Lie algebra
  `ℝ·[[1,−2],[1,−1]]` contains no nonzero symmetric matrix), so `K exp(𝔭) = {±1} ≠ G^ℝ`; the compact
  group `G^ℝ` does not even preserve the norm of `ℝ²`, since `[[1,−2],[1,−1]] e₁ = (1, 1)` has squared
  norm `2`. Conjugating `SL₂(ℝ)` by the same `u` gives no non-example: `u ∈ SL₂(ℝ)`, so the image is
  `SL₂(ℝ)` itself, transpose-stable with `K = SO(2)`.

*Needs:* §5.1; ArithmeticLocallySymmetricSpaces §ALS.F.1; LieGroups Layer 9; ReductiveGroupsPartII
§RG2.0a.2.

### 5.4 The real Kempf–Ness theorem

Let `V` be a real inner product space and `G` a subgroup of `GL(V) = (V →L[ℝ] V)ˣ`. The four
definitions of this paragraph use no finiteness of `V` and are made, in `Suggested.lean` too, for
every real inner product space; every theorem of this section, and every Check below, takes `V`
finite-dimensional. Define its symmetric part `symmetricPart G` as the set of symmetric
endomorphisms `A` (`LinearMap.IsSymmetric`) with `exp(tA) ∈ G` for every real `t`; for closed `G`
this is `𝔭 = 𝔤 ∩ Sym(V)`, the Lie algebra of `G` being `𝔤 = {A : exp(tA) ∈ G for all t}`. Call `G`
a real reductive linear group, `IsRealReductiveLinearGroup G`, when `G` is closed in `GL(V)` and every
`g ∈ G` is `k exp(A)` with `k ∈ K = G ∩ O(V)` and `A ∈ 𝔭` (BohmLafuente2021 lines 52–62, condition
(1)). This is a kept variant of LieGroups Layer 9's global matrix models, which that roadmap owns as
data of an abstract Lie group with a finite central covering: for finite-dimensional `V`, in an
orthonormal basis a real reductive linear group is closed, stable under transpose
(BohmLafuente2021 lines 1021–1022) and has
finitely many components (it is the image of `K × 𝔭` with `K` compact), so it is a global matrix
model with the identity covering; the variant is the polar condition on a subgroup of `GL(V)`, the
form in which the Kempf–Ness theorem is stated. Define the minimal vectors `minimalVectors G = {v : ⟨A v, v⟩ = 0 for all A ∈ 𝔭}` and the orbit
`linearOrbit G v = {g v : g ∈ G}`.

The definitions have the following API.

- `𝔭` contains `0` and is stable under real scalars; `K exp(𝔭) ⊆ G` for every subgroup, and equality
  is the second clause of real reductivity.
- `minimalVectors G` is a closed cone, and it is the whole of `V` when `𝔭 = 0`.
- `linearOrbit G (g v) = linearOrbit G v` for `g ∈ G`, and `K` preserves the norm on every orbit.

**Checks.**

- `G = GL(V)`: `𝔭` is all of `Sym(V)`, the polar decomposition `g = k exp(A)` makes `G` real
  reductive, and `A = 1` gives `‖v‖² = 0` for a minimal vector, so `minimalVectors G = {0}`.
- `G = SO(V)`: a symmetric `A` with `exp(tA)` orthogonal for all `t` is `0`, so `𝔭 = 0`, `K = G` and
  `minimalVectors G = V`; every orbit is compact, hence closed, as (ii) predicts.
- The upper unitriangular group `N` of `GL₂(ℝ)` is closed but not real reductive: its intersection
  with `O(2)` is `{1}` and its Lie algebra, the strictly upper triangular matrices, contains no
  nonzero symmetric matrix, so `K exp(𝔭) = {1} ≠ N`. A definition of `𝔭` as the whole Lie algebra,
  without the symmetry condition, would accept `N`, which is the exponential of its Lie algebra.
- Closedness is needed: on `V = ℂ² = ℝ⁴`, the line `{diag(e^{it}, e^{i√2 t})}` satisfies
  `G = K exp(𝔭)` with `K = G` and `𝔭 = 0`, but it is not closed in `GL(V)`, and its orbit of
  `(1, 1)` is a dense non-closed curve in the torus, although every vector is minimal.

Let `G ⊆ GL(V)` be a closed subgroup of a real finite-dimensional inner product space with
`G = K exp(𝔭)`, `K = G ∩ O(V)`, `𝔭 = 𝔤 ∩ Sym(V)`. Prove: (i) the set
`M = {v : ⟨A v, v⟩ = 0 for all A ∈ 𝔭}` of minimal vectors is a closed cone and is exactly the set of
`v` with `‖v‖ ≤ ‖g v‖` for all `g ∈ G`; (ii) an orbit `G v` is closed if and only if it meets `M`, and
then `G v ∩ M = K w` for any `w ∈ G v ∩ M`; (iii) if `G v` is not closed there is `α ∈ 𝔭` such that
`w = lim_{t→∞} exp(tα) v` exists and `G w` is closed, so that `w ∉ G v`; (iv) the closure of every
orbit contains exactly one closed orbit, and it contains the norm minimizers of that closure; (v) for
every abelian subspace `𝔱` of `Sym(V)`, its elements commuting pairwise, and `T = exp(𝔱)`, any two
disjoint closed `T`-invariant subsets of `V` are separated by a continuous `T`-invariant function
`V → [0, 1]`; this is used for a maximal abelian `𝔱 ⊆ 𝔭` (BohmLafuente2021 Theorem 1.1, lines
77–88, with the proof of its clause (ii) at lines 580–583; Lemma 5.1, line 417; Corollary 5.5, lines
445–447, for `T = exp(𝔱)` with `𝔱 ⊂ Sym(V)` abelian as set at line 425; Lemma 6.2, line 504;
Lemma 6.3, line 518; Corollary 6.4, line 562; Lemma 6.5, line 568; §4 of
RichardsonSlodowy1990). The decomposition `G = K T K` used throughout is LieGroups Layer 9,
**Restricted roots and KAK**: `Ad(K)𝔱 = 𝔭`, and `G = K exp(𝔱₊) K` for the closed positive chamber
`𝔱₊ ⊆ 𝔱` (`kakDecomposition`), so `G = K T K` (BohmLafuente2021 Corollary A.2, line 1050).
`Suggested.lean` states (i) without its cone clause as `minimalVectors_eq_normMinimizers`, (ii) as
`isClosed_linearOrbit_iff` and `linearOrbit_inter_minimalVectors`, (iii) as
`exists_tendsto_closed_linearOrbit`, and (iv) without its clause on norm minimizers as
`existsUnique_closed_linearOrbit`, all for `IsRealReductiveLinearGroup G`.

*Proof sketch.* Along `t ↦ exp(tA) v` with `A ∈ 𝔭` the squared norm is
`Σ e^{2tλ_i} ‖v_i‖²` in an eigenbasis of `A`, convex with derivative `2⟨A v, v⟩` at `0`; this gives (i)
with `G = K exp(𝔭)`. In an orthonormal basis of `V`, `G` is a global matrix model of LieGroups
Layer 9 with covering `π = id`: it is closed in `GL(V)`, transpose-stable because
`(k exp X)ᵀ = exp(X) k⁻¹` for `k ∈ K`, `X ∈ 𝔭`, and has finitely many components, being the image of
`K × 𝔭` with `K = G ∩ O(V)` compact and `𝔭` connected; its Cartan involution `g ↦ (gᵀ)⁻¹` has fixed
group `K` and `−1`-eigenspace `𝔭` on `𝔤`, which is how Layer 9 gives `G = K T K`. For an abelian `T`,
choose an orthonormal basis `e_1, …, e_N` of `V` of simultaneous eigenvectors of `𝔱` and write
`α_i(λ)` for the eigenvalue of `λ ∈ 𝔱` on `e_i`, a linear form on `𝔱`; then `exp(λ)` multiplies the
`i`-th coordinate by `e^{α_i(λ)} > 0`, so a `T`-orbit is the image of the vector group `𝔱` under
`λ ↦ exp(λ) v`, homeomorphic to a real vector space through the logarithms of the absolute values of
its nonzero coordinates, and it keeps the sign of every coordinate (BohmLafuente2021 lines 261–267).
Closed `T`-orbits are separated by finitely many continuous `T`-invariant functions: for a nonempty
set `I` of coordinates and exponents `w_i > 0` for `i ∈ I` with `Σ_{i ∈ I} w_i = 1` and
`Σ_{i ∈ I} w_i α_i = 0`, the function equal to `∏_{i ∈ I} v_i^{w_i}` on the vectors whose
coordinates in `I` are all positive and to `0` elsewhere, together with its composites with the
coordinate sign changes (BohmLafuente2021 lines 353–364, Lemma 4.6, lines 382–386, and Proposition
4.8, line 396). The exponents must be positive on `I` for continuity and must satisfy
`Σ w_i α_i = 0` for invariance. Their joint map `Φ : V → ℝ^L` is continuous, `T`-invariant and
satisfies `‖v‖ ≤ C ‖Φ(v)‖` on the minimal vectors of `T` (Lemma 5.3, line 437); since every
`T`-orbit closure contains a closed `T`-orbit (Corollary 4.2, line 300), `Φ` maps two disjoint closed
`T`-invariant subsets of `V` to disjoint closed subsets of `ℝ^L`, and Urysohn's lemma on `ℝ^L` gives
(v) (proof of Corollary 5.5, lines 448–460). A non-closed orbit `G v` has a closed invariant subset `Y` of its closure disjoint from
it; separating `Y` from the `T`-orbits of `K v` and using compactness of `K` produces `α ∈ 𝔭` such
that `lim_{t→∞} exp(tα) v` exists and lies in `Y`, hence outside `G v`. Convexity then shows that a
minimal vector cannot have a non-closed orbit, which is (ii). For (iii) the same argument is run with
`Y = G v̄` for a norm minimizer `v̄` of the closure of `G v`: the closure is invariant, so `v̄` is
minimal in its own orbit and `G v̄` is closed by (ii), and `G v̄` is disjoint from `G v` because `G v`
is not closed. The same separation gives the uniqueness in (iv).

**Checks.**

- `ℝ_{>0}` on `ℝ²` by `λ · (x, y) = (λx, λ⁻¹y)`: `M = {|x| = |y|}`, the hyperbola branches and `0` are
  the closed orbits, and the four half-axes are non-closed orbits with `0` in their closure
  (BohmLafuente2021 lines 172–176).
- Separation (v) for an abelian `𝔱` that is not maximal in `𝔭`: `𝔱 = ℝ·diag(1, −1)` on `ℝ²` gives the
  action of the previous Check, and `𝔱` is a line in the three-dimensional `𝔭 = Sym₂` of `GL₂(ℝ)`,
  strictly inside the maximal abelian diagonal plane. The two branches `{xy = 1, x > 0}` and
  `{xy = 1, x < 0}` are closed, disjoint and `T`-invariant, and are separated by the `T`-invariant
  function equal to `1/2 − min(xy, 1)/2` on the open first quadrant, `1/2 + min(xy, 1)/2` on the open
  third quadrant and `1/2` elsewhere: it takes the value `0` on the first branch and `1` on the
  second, it is continuous because both formulas tend to `1/2` as `xy → 0`, and it is constant on the
  orbits `(λx, λ⁻¹y)`, which preserve `xy` and each quadrant. No function of the invariant `xy` alone
  separates them, both branches lying in `{xy = 1}`; a statement restricted to maximal abelian `𝔱`
  would not cover this case of BohmLafuente2021 Corollary 5.5. In the sketch's terms the weights are
  `α_1(s·diag(1, −1)) = s` and `α_2 = −α_1`; a single coordinate admits no exponent (`w_1 α_1 = 0`
  forces `w_1 = 0`), matching the non-closed half-axis orbits, and `I = {1, 2}` forces
  `w = (1/2, 1/2)`. The resulting functions `(xy)^{1/2}` on the open first quadrant and its composite
  with `(x, y) ↦ (−x, −y)`, each zero elsewhere, take the values `(1, 0)` and `(0, 1)` on the two
  branches. The orbit of `(1, 1)` is `{(e^s, e^{−s})}`, a line rather than a torus; the exponent
  `(1, 0)` on `I = {1, 2}`, that is `x` on the open first quadrant and `0` elsewhere, is neither
  `T`-invariant nor continuous at `(1, 0)`.
- `SL_n(ℝ)` on `M_n(ℝ)` by conjugation: an orbit is closed exactly when the matrix is diagonalizable
  over `ℂ`, and `[[1,1],[0,1]]` has the closed orbit of the identity in its closure
  (BohmLafuente2021 lines 179–193).
- `ℝ_{>0}` acting on `ℝ` by scaling: `𝔭 = ℝ` and `M = {0}`; every nonzero orbit is a half-line, not
  closed, with `α = −1` giving `lim exp(−t) v = 0` as in (iii), and `{0}` is the unique closed orbit
  in each orbit closure as in (iv). For compact `G` (`𝔭 = 0`) instead `M = V` and every orbit is
  closed.
- `(ℝ_{>0})²` acting diagonally on `ℝ²` (`K = 1`, `𝔭` the diagonal matrices, `M = {0}`), `v = (1, 1)`:
  the orbit is the open quadrant, not closed. `α = diag(−1, 0)` gives the limit `(0, 1)`, outside the
  orbit but with the non-closed orbit `{0} × ℝ_{>0}`; `α = diag(−1, −1)` gives `0`, whose orbit is
  closed, as (iii) asks; `diag(a, b)` gives a limit exactly when `a, b ≤ 0`, with closed orbit exactly
  when `a, b < 0`. `{0}` is the only closed orbit in the closed quadrant, as (iv) says. A clause asking
  only for a limit outside the orbit would accept `diag(−1, 0)`.

*Needs:* Mathlib inner product spaces, `Matrix.orthogonalGroup`, compactness; LieGroups Layer 9,
**Restricted roots and KAK**.

### Examples

- For `SL₂(ℝ)` acting on pairs `(A, B)` of matrices by simultaneous conjugation, a pair of commuting
  normal matrices is minimal, and the pair `([[1,1],[0,1]], 1)` is not.

### Dependencies

Tau Ceti's reductive groups, groups of points and adjoint action; ReductiveGroupsPartII §RG2.0a.2;
ArithmeticLocallySymmetricSpaces §§ALS.F.1, ALS.0.1; RealSemisimpleLieGroups §2.5; LieGroups Layer 9.
Layer 5 supplies Layers 6 and 7.

## Layer 6: Reductive representations

### 6.1 Reductive representations

For a real reductive datum `(𝐆, G^ℝ)` and a group `Γ`, call `ρ : Γ → G^ℝ` reductive when
`Ad ∘ ρ : Γ → GL(𝔤^ℝ)` is semisimple, `Representation.IsSemisimpleRepresentation` over `ℝ`
(BCGGO2024 lines 2708–2711). Write `Hom^red(Γ, G^ℝ)`. The definition is made for every field `k`,
every commutative Hopf `k`-algebra `O(𝐆)` and every subgroup `G` of `𝐆(k)`: `IsReductiveRep G ρ`
says that `Ad ∘ ρ` is semisimple over `k` on `Derivation k O(𝐆) (TauCeti.Bialgebra.CounitAlgebra k
O(𝐆) k)`, `Ad` being `adjointRepresentation k O(𝐆) k`. For a connected reductive group `G` over `ℂ`,
`IsReductiveRep` with `k = ℂ` is the reductivity of the complex representations of §§7.2 and 7.4;
by §6.2 it agrees with the real notion for the real datum `(Res_{ℂ/ℝ} G, G(ℂ))`.

The predicate has the following API.

- Reductivity depends only on the subgroup `ρ(Γ)`: the `Γ`-stable subspaces of `𝔤^ℝ` are the
  `ρ(Γ)`-stable ones.
- `Hom^red(Γ, G^ℝ)` is stable under conjugation by `G^ℝ` and under precomposition with automorphisms
  of `Γ`, and more generally under precomposition with surjections `Γ' ↠ Γ`.

**Checks.**

- The trivial representation is reductive: `Ad ∘ ρ` is trivial, hence semisimple.
- `Γ = ℤ`, `G^ℝ = SL₂(ℝ)`, `ρ(1) = [[1,1],[0,1]]`: `Ad ∘ ρ` is a nontrivial unipotent automorphism of
  `𝔰𝔩₂(ℝ)`, not semisimple, so `ρ` is not reductive.
- For a torus every representation is reductive, `Ad` being trivial. For `Γ = ℤ`,
  `G^ℝ = GL₂(ℝ)` and `ρ(1) = diag(2, 3)`, `Ad ∘ ρ` has eigenvalues `1, 1, 2/3, 3/2` on `M₂(ℝ)` with an
  eigenbasis of matrix units, so `ρ` is reductive.

- Over `k = ℂ` and `𝐆 = GL₁`, `IsReductiveRep` holds for every `ρ`, `Ad` being trivial; over `ℂ` and
  `𝐆 = GL₂`, `ρ(1) = [[1,1],[0,1]]` again fails, `Ad ∘ ρ` being a nontrivial unipotent of `𝔤𝔩₂(ℂ)`.

*Needs:* Mathlib `Representation.IsSemisimpleRepresentation`; Tau Ceti `Derivation.adRepresentation`,
`AlgHom.mapValue`, `TauCeti.Bialgebra.CounitAlgebra.algEquivSelf`; §5.1.

### 6.2 Scalar extension

Prove that for every field extension `k'/k` and every finite-dimensional representation `V` of a
monoid over `k`, if `V ⊗_k k'` is semisimple then `V` is semisimple, and that the converse holds for
perfect `k` (ArithmeticGaloisRepresentations §1.7). Hence `Ad ∘ ρ` is semisimple on `𝔤^ℝ` if and only
if it is semisimple on `𝔤` (Sikora2012 lines 262–266, complete reducibility as semisimplicity of the
representation). Deduce that for `𝐆 = Res_{ℂ/ℝ} H` and `ρ : Γ → H(ℂ)`, the representation `Ad ∘ ρ`
on `Lie(H)` regarded as a real vector space is semisimple over `ℝ` if and only if the complex
representation `Ad ∘ ρ` on `Lie(H)` is semisimple.

*Proof sketch.* Let `B` be the image of the monoid algebra in `End_k(V)`; `V` is semisimple exactly
when `B` is a semisimple algebra. The image over `k'` is `B ⊗_k k'`, and `rad(B) ⊗_k k'` is a nilpotent
ideal of it, so semisimplicity of `B ⊗_k k'` forces `rad(B) = 0`. For the Weil restriction, a complex
representation `W` regarded over `ℝ` satisfies `W_ℝ ⊗_ℝ ℂ ≅ W ⊕ W̄` by `w ⊗ z ↦ (z w, z̄ w)`, with `W̄`
the complex conjugate representation, whose subrepresentations are those of `W`; so `W_ℝ` is
semisimple exactly when `W` is, by the two directions above with `k = ℝ` perfect.

**Checks.**

- `ℤ` acting on `ℝ²` by the rotation `[[0, −1],[1, 0]]` is irreducible over `ℝ` and splits into two
  characters over `ℂ`; both are semisimple.
- `ℤ` acting on `ℝ²` by `[[1,1],[0,1]]` is not semisimple over `ℝ` nor over `ℂ`.
- The perfectness hypothesis in the converse is needed: for `k = 𝔽_p(s)` and `k' = k(s^{1/p})` the
  example of ArithmeticGaloisRepresentations §1.7 is simple over `k` and not semisimple over `k'`.
- Weil restriction: for `H = GL₂`, `Γ = ℤ` and `ρ(1) = [[1,1],[0,1]]`, `Ad ∘ ρ` is a nontrivial
  unipotent on `𝔤𝔩₂(ℂ)` and on its underlying `ℝ⁸`, semisimple on neither; for `ρ(1) = diag(2, 3)` it
  is diagonalizable with real eigenvalues `1, 1, 2/3, 3/2` on `𝔤𝔩₂(ℂ)`, each of multiplicity two on
  `ℝ⁸`, semisimple on both.

*Needs:* ArithmeticGaloisRepresentations §1.7; §5.1; Mathlib `IsSemisimpleModule`.

### 6.3 Adjoint semisimplicity and reductive Zariski closure

Prove that for a connected reductive group `G` over an algebraically closed field of characteristic
zero and a closed subgroup `Z`, the adjoint representation of `Z` on `𝔤` is semisimple if and only if
`Z⁰` is reductive; applied to the Zariski closure `Z` of `ρ(Γ)` in `G`, `Ad ∘ ρ` is semisimple on `𝔤`
if and only if `Z⁰` is reductive (BateMartinRohrle2005 Corollary 3.42, line 814, for the adjoint
criterion, semisimplicity of `Lie G` as a `Z`-module against `G`-complete reducibility, stated there
for `p > 2h − 2` and holding in characteristic zero by lines 183–187; line 263 for the
characteristic-zero equivalence of `G`-complete reducibility with reductivity of `Z⁰`; Sikora2012
line 228, Proposition 8, completely reducible subgroups as those with linearly reductive closure).

*Proof sketch.* A subspace is `ρ(Γ)`-stable exactly when it is `Z`-stable, its stabilizer being
closed. If `Z⁰` is reductive then `Z` is linearly reductive (ReductiveGroups Layer 6, the corollary
for groups that need not be connected: in characteristic zero an affine group is linearly reductive
exactly when its identity component is reductive), so `𝔤` is semisimple. Conversely if
`𝔤` is a semisimple `Z`-module, the unipotent radical `R_u(Z⁰)`, normal in `Z`, has nonzero fixed
vectors on each simple summand (ReductiveGroups Layer 5), which form a `Z`-submodule, so it acts
trivially; so `R_u(Z⁰) ⊆ ker(Ad) = Z(G)` (gap:adjoint-kernel, `G` being connected and `k` of
characteristic zero), which is of multiplicative type (ReductiveGroups Layer 6) and contains no
nontrivial unipotent subgroup (ReductiveGroups Layer 5).

**Checks.**

- `Z` a torus: reductive, and `𝔤` splits into weight spaces.
- `Z` the upper unipotent subgroup of `SL₂`: `Ad` acts by a nontrivial unipotent on `𝔰𝔩₂`, not
  semisimple, and `Z⁰ = Z` is not reductive.
- `Z = N(T)` in `SL₂` (disconnected, `Z⁰ = T`): reductive identity component and `𝔤` semisimple; a
  definition requiring `Z` connected would reject it.
- The kernel of `Ad` is what the converse uses: for `G = SL₂`, `ker(Ad) = {±1} = Z(SL₂)` contains no
  unipotent element other than `1`, so the upper unipotent subgroup, whose `Ad`-image is a
  nontrivial unipotent of `𝔰𝔩₂`, is not in it; for the disconnected `G = O₂` over `ℂ`, `Ad` is
  the determinant on `Lie(O₂) = 𝔰𝔬₂`, one-dimensional, and its kernel `SO₂` is not the centre
  `{±1}`, which is why `G` is connected.

*Needs:* ReductiveGroups Layer 2; ReductiveGroups Layer 5; ReductiveGroups Layer 6;
gap:adjoint-kernel.

### 6.4 Complete reducibility

Prove that for `G` as in §6.3 and every closed subgroup `Z` of `G`, `Z` is `G`-completely reducible
(ArithmeticGaloisRepresentations §1.11, `IsGCompletelyReducible`) if and only if `Z⁰` is reductive
(BateMartinRohrle2005 lines 263–264, for every closed subgroup, the converse in characteristic zero;
Lemma 2.6, line 267; Theorem 3.46, line 861; Sikora2012 line 228, Proposition 8). Prove on the way
that every closed subgroup `Z` is topologically finitely generated: `Z` is the Zariski closure of
the subgroup generated by finitely many elements `z₁, …, z_m` (BateMartinRohrle2005 Remark 2.9,
lines 300–309, for subgroups with reductive identity component over a field transcendental over its
prime field). The Zariski closure of the image of a finitely generated group is topologically
generated by the images of its generators, which is the case §6.7 uses.

*Proof sketch.* Finite generation: the identity components of the Zariski closures of the finitely
generated subgroups of `Z(k)` are connected closed subgroups of `Z⁰` (ReductiveGroups Layer 3),
directed under inclusion, since the closure for `⟨F, F'⟩` contains those for `F` and `F'`; by
dimension one of them, `C`, the identity component of the closure of a finitely generated `F`,
contains all the others, and `zCz⁻¹`, the identity component of the closure of `zFz⁻¹`, lies in
`C` for every `z ∈ Z(k)`, so `C` is normal in `Z`. If `C ≠ Z⁰`, the quotient `Z⁰/C` (ReductiveGroups
Layer 3) is connected of positive dimension and has a point of infinite order: a point `y` with
unipotent part `y_u ≠ 1` (ReductiveGroups Layer 4) gives `y_u^n = exp(n log y_u) ≠ 1` for `n ≠ 0`,
`k` having characteristic zero (ReductiveGroups Layer 5P); if every point is semisimple, a Borel
subgroup `B` of `Z⁰/C` is nontrivial, since otherwise `Z⁰/C = (Z⁰/C)/B` would be complete
(ReductiveGroups Layer 7) as well as affine and connected, hence a point, and `B = B_u ⋊ T` with
`B_u = 1` (ReductiveGroups Layer 5) is a nontrivial torus, which has the point `(2, 1, …, 1)`. A lift
`z ∈ Z⁰(k)` of that point, which exists over the algebraically closed `k`, makes the closure of
`⟨F, z⟩` contain `C` and infinitely many cosets `zⁿC`, so its identity component is strictly larger
than `C`, a contradiction. Hence `C = Z⁰`, and adding to the generators of `F` one point of each of
the finitely many components of `Z` gives `z₁, …, z_m`.

Complete reducibility: if `Z⁰` is reductive, `𝔤` is a semisimple `Z`-module (§6.3) and every subgroup
is separable in characteristic zero (ReductiveGroups Layer 2), so the argument of BateMartinRohrle2005
Theorem 3.46 applies to the tuple `(z₁, …, z_m)`: if `Z` were not `G`-completely reducible, this
tuple would have a non-closed orbit in `G^m` (ArithmeticGaloisRepresentations §1.11). A cocharacter
limit `z' = (z'₁, …, z'_m)` in the closed orbit of its orbit closure (ArithmeticGaloisRepresentations
§1.11) lies in the orbit boundary, so its orbit has strictly smaller dimension (ReductiveGroups
3A.3) and its centralizer strictly larger dimension. Writing `𝔤^z` for the common fixed space of
`Ad z₁, …, Ad z_m` on `𝔤`, `Lie C_G(z') ⊆ 𝔤^{z'}` always and `Lie C_G(z) = 𝔤^z` by separability of
`Z`, so `dim 𝔤^{z'} ≥ dim C_G(z') > dim C_G(z) = dim 𝔤^z`. But `Ad` carries `z'` into the closure of
the `GL(𝔤)`-orbit of `(Ad z₁, …, Ad z_m)`, which is closed by the `GL(𝔤)` case of the same criterion,
`𝔤` being a semisimple `Z`-module; so the two adjoint tuples are `GL(𝔤)`-conjugate and their fixed
spaces have the same dimension, a contradiction. Conversely a `G`-completely reducible `Z` has reductive
identity component by gap:gcr-reductive-identity-component, whose route uses gap:borel-tits.

**Checks.**

- A subgroup not contained in any proper parabolic is `G`-completely reducible, hence has reductive
  identity component: for `SL₂` an irreducible finite subgroup such as the binary dihedral group.
- The Borel subgroup `B` of `SL₂` lies in the parabolic `B` with no Levi containing it, and
  `R_u(B) ≠ 1`; its centralizer is the centre `{±1}`, so a criterion "centralizer finite modulo the
  centre" would wrongly accept it.
- For `G = GL(V)`, complete reducibility of `Z` is semisimplicity of `V`
  (ArithmeticGaloisRepresentations §1.11), and `Z⁰` reductive gives semisimplicity in characteristic
  zero.
- Direction of the dimension count: in `SL₂` the tuple `(diag(2, 1/2), [[1,1],[0,1]])` has
  centralizer `{±1}` and orbit dimension `3`; conjugation by `diag(t, t⁻¹)`, `t → 0`, tends to
  `(diag(2, 1/2), 1)`, of centralizer the diagonal torus `T` and orbit dimension `2`, and the common
  fixed space on `𝔰𝔩₂` grows from `0` to `𝔱`. The limit has the larger centralizer, not the smaller;
  and no contradiction arises, because the tuple generates a dense subgroup of the Borel subgroup,
  for which `𝔰𝔩₂` is not semisimple (`𝔟` has no stable complement).
- `Z = N(T)` in `SL₂` over `ℂ` is topologically generated by `diag(2, 1/2)` and `[[0,−1],[1,0]]`: the
  first generates an infinite subgroup of the one-dimensional torus `T`, dense in it, and the second
  lies in `N(T) ∖ T`. The tuple of these two elements has closed orbit, `Z⁰ = T` is reductive, and `Z`
  fixes no line of `ℂ²` (`T` fixes only the two coordinate lines, which the second generator
  exchanges), so it lies in no Borel subgroup and is `SL₂`-completely reducible; a statement
  requiring `Z` connected would exclude it.
- Topological finite generation in characteristic zero: `𝔾_a^n` is topologically generated by its
  `n` basis vectors, the closure of `ℤv` being the line `kv` because `ℤv` is infinite, and `𝔾_m` by
  the single point `2`, of infinite order. Over the algebraic closure of `𝔽_p` every finitely
  generated subgroup of `G(k)` is finite (BateMartinRohrle2005 lines 302–303), so `𝔾_a` is not
  topologically finitely generated there: the finite-generation step uses the characteristic.

*Needs:* §6.3; ArithmeticGaloisRepresentations §1.11; ReductiveGroups Layer 2; ReductiveGroups
Layer 3; ReductiveGroups Layer 3A; ReductiveGroups Layer 4; ReductiveGroups Layer 5; ReductiveGroups
Layer 5P; ReductiveGroups Layer 7; gap:gcr-reductive-identity-component; gap:borel-tits.

### 6.5 Closed complex orbits

Prove that for a finitely generated `Γ`, a connected reductive `G` over `ℂ` and `ρ ∈ Hom(Γ, G(ℂ))`,
the following are equivalent: the Zariski closure of `ρ(Γ)` is `G`-completely reducible; the
`G`-orbit of `ρ` in `Hom(Γ, G)` is Zariski closed; the `G(ℂ)`-orbit of `ρ` is closed in the classical
topology (Sikora2012 lines 572–586, Theorem 30; BateMartinRohrle2005 Corollary 3.7, line 510;
Richardson1988 Theorem 3.6).

*Proof sketch.* `Hom(Γ, G)` is closed and invariant in `G^S` (§4.1), so orbit closures in it are orbit
closures in `G^S`; the first two conditions are equivalent by ArithmeticGaloisRepresentations §1.11's
closed-tuple criterion. A Zariski-closed set is classically closed, closed immersions inducing closed
embeddings on complex points (ReductiveGroups §3A.5c). Conversely the closure of the orbit contains a
closed orbit reached by a cocharacter limit (ArithmeticGaloisRepresentations §1.11), and
`t ↦ λ(t) · ρ` extends to a morphism from `𝔸¹`, continuous in the classical topology (ReductiveGroups
§3A.5c); a classically closed orbit therefore meets the closed orbit and equals it.

**Checks.**

- `Γ = ℤ`, `G = GL_n`: the orbit of `ρ(1) = g` is the conjugacy class of `g`, closed exactly when `g` is
  semisimple; for `g = [[1,1],[0,1]]` the identity lies in its classical closure.
- A representation with values in a torus has closed orbit.
- `Γ = F₂`, `G = SL₂`, `ρ(a) = diag(2, 1/2)`, `ρ(b) = [[1,1],[0,1]]`: the image is Zariski dense in the
  Borel subgroup, and conjugation by `diag(t, t⁻¹)` with `t → 0` tends to `(diag(2, 1/2), 1)`, outside
  the orbit.

*Needs:* §4.1; §4.2; ArithmeticGaloisRepresentations §1.11; ReductiveGroups Layer 3A
(3A.4 and 3A.5c).

### 6.6 Closed real orbits

Prove that for a real reductive datum `(𝐆, G^ℝ)`, a finitely generated `Γ` and `ρ ∈ Hom(Γ, G^ℝ)`, the
`G^ℝ`-orbit of `ρ` is closed in `Hom(Γ, G^ℝ)` if and only if the `G(ℂ)`-orbit of `ρ` is closed in
`Hom(Γ, G(ℂ))` (§7 of RichardsonSlodowy1990).

*Proof sketch.* Realize the conjugation action on `V = (M_N × M_N)^S` as in §5.3. If `G^ℝ ρ` is
closed, its norm minimizer `w` is a real minimal vector (§5.4); for hermitian `Z = X + iY ∈ i𝔲` with
`X ∈ 𝔭`, `Y ∈ 𝔨`, `Re⟨Z w, w⟩ = ⟨X w, w⟩ = 0` because `⟨Y w, w⟩ = 0` for skew `Y` and real `w`; so `w`
is minimal for `G(ℂ)` and `G(ℂ)ρ = G(ℂ)w` is closed by §5.4 applied to `G(ℂ)`. Conversely, if
`G(ℂ)ρ` is closed, pick `g₀` with `g₀ρ` minimal for `G(ℂ)`; complex conjugation `τ` preserves the
norm, `U` and `i𝔲`, so `τ(g₀)ρ` is minimal too. Write `τ(g₀)g₀⁻¹ = u exp(Z)` with `u ∈ U`,
`Z ∈ i𝔲`. The function `t ↦ log‖exp(tZ) g₀ ρ‖` is convex and takes its minimum at `t = 0` and
`t = 1`, hence at `t = 1/2`; uniqueness of polar decomposition gives `τ(U exp(Z/2) g₀) =
U exp(Z/2) g₀`, so this coset contains `exp(Y)` with `Y ∈ i𝔲 ∩ 𝔤^ℝ = 𝔭`. Then `exp(Y) ρ ∈ G^ℝ ρ` is a
real minimal vector and `G^ℝ ρ` is closed by §5.4.

**Checks.**

- `Γ = ℤ`, `G^ℝ = SL₂(ℝ)`: the rotation `[[0, −1],[1, 0]]` has closed real and complex orbits; the
  matrix `[[1,1],[0,1]]` has neither.
- `G^ℝ = ℝ^×` acting on `Hom(ℤ, ℝ^×) = ℝ^×` by trivial conjugation: every orbit is a point, closed
  over `ℝ` and over `ℂ`.
- The real orbit of `diag(2, 1/2) ∈ SL₂(ℝ)` is closed although `diag(2, 1/2)` is not in the compact
  `K`; a criterion by compactness of the image would reject it.

*Needs:* §5.3; §5.4; §6.5; §4.2.

### 6.7 The six characterizations

Prove that for a real reductive datum `(𝐆, G^ℝ)`, a finitely generated `Γ` and `ρ : Γ → G^ℝ`, the
following are equivalent: (a) `ρ` is reductive; (b) `Ad ∘ ρ` is semisimple on `𝔤`; (c) the Zariski
closure `Z` of `ρ(Γ)` in `G` has reductive identity component; (d) `Z` is `G`-completely reducible;
(e) the `G`-orbit of `ρ` in `Hom(Γ, G)` is Zariski closed; (f) the `G^ℝ`-orbit of `ρ` in
`Hom(Γ, G^ℝ)` is closed (BCGGO2024 lines 2708–2713; Sikora2012 line 228 and lines 572–586;
§7 of RichardsonSlodowy1990). Derive: a representation with values in a compact subgroup is reductive;
a representation whose image is Zariski dense in a reductive subgroup is reductive; a `G`-irreducible
representation (image in no proper parabolic) is reductive; for reductive `ρ`, `ρ` is `G`-irreducible
if and only if its centralizer is finite modulo the centre (BateMartinRohrle2005 Proposition 2.13,
line 379; Sikora2012 lines 363–364, Corollary 17); and for `G^ℝ = GL_r(ℝ)` or `GL_r(ℂ)`, `ρ` is
reductive if and only if the defining representation on `ℂ^r` is semisimple. By §6.5, (e) is
equivalent to (e') the `G(ℂ)`-orbit of `ρ` in `Hom(Γ, G(ℂ))` is closed for the classical topology.
`Suggested.lean` states the equivalence of (a), (b), (e') and (f) as `isReductiveRep_tfae`, with
`G(ℂ) = WithConv (O(𝐆) →ₐ[ℝ] ℂ)`, `ρ` regarded as complex through `AlgHom.mapValue`, and orbits
`conjOrbit`.

*Proof sketch.* (a) ⇔ (b) is §6.2, (b) ⇔ (c) is §6.3, (c) ⇔ (d) is §6.4 for `Z` topologically
generated by the `ρ(s)`, `s` in a finite generating set of `Γ`, (d) ⇔ (e) and the
classical closedness are §6.5, and (e) ⇔ (f) is §6.6. A compact image preserves an inner product on
`𝔤^ℝ`, so `Ad ∘ ρ` is unitary and semisimple. The `GL_r(ℝ)` case is the `GL(V)` clause of
ArithmeticGaloisRepresentations §1.11 with (d); for `GL_r(ℂ)`, `G = (Res_{ℂ/ℝ} GL_r)_ℂ ≅ GL_r × GL_r`
and complete reducibility in a product is complete reducibility of both projections
(BateMartinRohrle2005 Lemma 2.12(i), line 355), the second projection being the complex conjugate
of `ρ`.

**Checks.**

- `Γ = π₁(Σ₂)` with `ρ(a₁) = [[1,1],[0,1]]` and the other generators trivial into `SL₂(ℝ)`: the relator
  holds, the orbit closure contains the trivial representation, and all six conditions fail.
- The Borel-dense representation of §6.5's Check has centralizer equal to the centre and is not
  reductive, so the finite-centralizer criterion needs the reductivity hypothesis.
- Compact `G^ℝ = SO(n)`: every representation is reductive and every orbit is closed.

*Needs:* §6.1; §6.2; §6.3; §6.4; §6.5; §6.6; Tau Ceti
`ContRepresentation.IsUnitary.isSemisimpleRepresentation`; ArithmeticGaloisRepresentations
§1.11; ReductiveGroupsPartII §RG2.0a.2.

### Examples

- `Γ = ℤ`: `ρ(1) = g` is reductive exactly when `g` is semisimple (`Ad(g)` semisimple forces the
  unipotent part of `g` into `ker(Ad)`, which is the centre by gap:adjoint-kernel and has no
  unipotent elements).
- `Γ = π₁(Σ_g)`, `g ≥ 2`, `G^ℝ = PSL₂(ℝ)`: the uniformizing holonomy (TeichmullerGeometry §4.5) has
  Zariski-dense image and is reductive.

### Dependencies

Layers 4 and 5; ReductiveGroups Layers 2, 3, 3A, 4, 5, 5P, 6, 7; ArithmeticGaloisRepresentations
§§1.7, 1.11; ReductiveGroups §3A.5c; the supplier gaps gap:adjoint-kernel,
gap:gcr-reductive-identity-component and gap:borel-tits. Layer 6 supplies Layer 7.

## Layer 7: Character varieties

### 7.1 The character variety and its topology

For a real reductive datum `(𝐆, G^ℝ)` and a finitely generated group `Γ`, define
`𝒳(Γ, G^ℝ) := Hom^red(Γ, G^ℝ)/G^ℝ` with the quotient topology of the subspace topology on
`Hom^red(Γ, G^ℝ)` (BCGGO2024 lines 2712–2713, Definition 8.1; Goldman1984, §1, for the topology
of `Hom(π, G)/G` for a surface group `π`). Prove that, in a Cartan-compatible
realization (§5.3), the inclusion of `M ∩ Hom(Γ, G^ℝ)` induces a homeomorphism
`(M ∩ Hom(Γ, G^ℝ))/K ≅ 𝒳(Γ, G^ℝ)`; hence `𝒳(Γ, G^ℝ)` is Hausdorff, locally compact and second
countable. Prove that every `G^ℝ`-orbit closure in `Hom(Γ, G^ℝ)` contains exactly one closed orbit,
which gives a map of sets `Hom(Γ, G^ℝ) → 𝒳(Γ, G^ℝ)` extending the quotient map
(§§4 and 9 of RichardsonSlodowy1990; BohmLafuente2021 Theorem 1.1). The definition is made for every
field `k` with a topology, every commutative Hopf `k`-algebra and every subgroup `G` of its
`k`-points: `CharacterVariety Γ G` is the quotient of `{ρ : Γ →* G // IsReductiveRep G ρ}` by the
conjugation relation `reductiveConjSetoid G` (`ρ' ∈ conjOrbit ρ`), with the quotient topology of the
subspace topology of `pointwiseTopology`; for a connected reductive group `G` over `ℂ`, the complex
character variety `𝒳(Γ, G(ℂ))` is `CharacterVariety Γ ⊤` with `k = ℂ`. `Suggested.lean` states the
topological conclusion for real reductive data as
`characterVariety_t2_locallyCompact_secondCountable`.

*Proof sketch.* By §6.7, `Hom^red` is the set of points with closed orbit, and by §5.4 each closed
orbit meets `M` in one `K`-orbit, so the map from `(M ∩ Hom)/K` is a continuous bijection. For its
inverse, let `v_n → v` in `Hom^red`, `w_n ∈ G^ℝ v_n ∩ M` (bounded by `‖v_n‖`) and `w` a limit point.
If `G^ℝ w ≠ G^ℝ v`, separate these closed orbits by a `T`-invariant function `f` (§5.4 (v)) and
write `w_n = g_n v_n` with `g_n = k_n t_n k'_n` (`G^ℝ = K T K`, §5.4); along a subsequence `k_n → k`,
`k'_n → k'`, and `f(k'_n v_n) = f(t_n k'_n v_n) = f(k_n⁻¹ w_n)` tends both to `f(k' v) = 0` and to
`f(k⁻¹ w) = 1`. `K` is compact, so its action on the closed set `M ∩ Hom` is proper, and the orbit
space is Hausdorff (`t2Space_quotient_mulAction_of_properSMul`), locally compact and second
countable.

The character variety has the following API.

- The quotient map from `Hom^red` is continuous, open and `G^ℝ`-invariant.
- Every continuous `G^ℝ`-invariant map from `Hom^red(Γ, G^ℝ)` to a topological space factors uniquely
  through `𝒳(Γ, G^ℝ)`.
- `𝒳(Γ, G^ℝ) ≅ (M ∩ Hom(Γ, G^ℝ))/K`, and two realizations give homeomorphic identifications.
- Every orbit closure contains exactly one closed orbit, of minimal norm.

**Checks.**

- Compact `G^ℝ` (`𝐆(ℝ)` compact, for example `SO(n)` or `U(n)`): every vector is minimal, so
  `𝒳(Γ, G^ℝ) = Hom(Γ, G^ℝ)/G^ℝ`, a compact Hausdorff space; for a closed oriented surface and
  connected `G^ℝ` its points of each topological type are SymplecticGeometry/HamiltonianReduction
  R5's flat connections modulo gauge.
- `G^ℝ = 𝐆(ℝ)` a torus: conjugation is trivial and `𝒳(Γ, G^ℝ) = Hom(Γ^{ab}, G^ℝ)`; for
  `Γ = π₁(Σ_g)` and `G^ℝ = U(1)` it is the torus `U(1)^{2g}`.
- `Γ = ℤ`, `G^ℝ = SL₂(ℝ)`: `𝒳(ℤ, SL₂(ℝ))` is the set of semisimple conjugacy classes; the classes of
  `[[1,1],[0,1]]` and `1` are distinct in `Hom/G^ℝ` but only `1` is a point of `𝒳`, so the naive orbit
  space `Hom(ℤ, SL₂(ℝ))/SL₂(ℝ)` is not Hausdorff while `𝒳` is.
- Finite generation is needed: for `Γ` free of countably infinite rank and `G^ℝ = GL₁(ℝ) = ℝ^×`,
  `Ad` is trivial, so every representation is reductive and conjugation is trivial, and the quotient
  is `(ℝ^×)^ℕ` with the product topology, which is not locally compact (a basic open set restricts
  finitely many coordinates, and its closure projects onto the non-compact `ℝ^×` in every other
  one); for `Γ` free of rank `m` the same computation gives the locally compact `(ℝ^×)^m`, and the
  realization `V = (M_N × M_N)^S` of §5.3 needs the finite generating set `S`.

*Needs:* §5.3; §5.4; §6.7; Mathlib `ProperSMul`, `t2Space_quotient_mulAction_of_properSMul`,
`IsProperMap`.

### 7.2 The affine quotient and the complex comparison

For a field `k`, a connected reductive group `G` over `k` and a group `Γ` with a finite generating
family `s : S → Γ`, define `Hom(Γ, G)//G := Spec O(Hom(Γ, G))^G`, where `O(Hom(Γ, G))^G` is
`TauCeti.ComoduleAlgebra.coinvariants k O(G) O(Hom(Γ, G))` for §4.1's comodule-algebra structure of
the conjugation action `ρ · g = g⁻¹ ρ g`, with the quotient map induced by the inclusion of the
invariants. `Hom(Γ, G)` is an affine `k`-scheme of finite type, reducible or nonreduced in general
(§4.1), so LanglandsParameterStacks §2.2 gives: `O(Hom(Γ, G))^G` is finitely generated, so
`Hom(Γ, G)//G` is of finite type (in characteristic zero this is the pinned
`TauCeti.ComoduleAlgebra.finiteType_coinvariants`, with linear reductivity from
`TauCeti.reductiveCommHopfAlgProperty.linearlyReductive`); invariant closed subsets have closed
images and disjoint ones have disjoint images; and
each geometric fibre of the quotient map contains a unique closed orbit. Prove that every
`G`-invariant morphism from `Hom(Γ, G)` to an affine `k`-scheme factors uniquely through the quotient
map, and that over an algebraically closed `k` the quotient map is surjective on `k`-points, its
`k`-points correspond bijectively to the closed `G(k)`-orbits in `Hom(Γ, G(k))`, and two points of
`Hom(Γ, G(k))` have the same image exactly when their orbit closures meet (Sikora2012 lines 823–837,
§11). For `k` of characteristic zero, prove that the restriction `O(G^S)^G → O(Hom(Γ, G))^G` along
§4.1's closed immersion is surjective, so that `Hom(Γ, G)//G → G^S//G` is a closed immersion into the
affine quotient of the integral variety `G^S` (ArithmeticGaloisRepresentations §1.11). For `k = ℂ`,
prove that the inclusion of the reductive locus induces a homeomorphism
`𝒳(Γ, G(ℂ)) ≅ (Hom(Γ, G)//G)(ℂ)` for the classical topology, and that the quotient map
`Hom(Γ, G(ℂ)) → (Hom(Γ, G)//G)(ℂ)` is the universal Hausdorff quotient of `Hom(Γ, G(ℂ))/G(ℂ)`:
every continuous `G(ℂ)`-invariant map to a Hausdorff space factors uniquely and continuously through
it. Composed with the inverse of the homeomorphism, the quotient map is the closed-orbit map
`Hom(Γ, G(ℂ)) → 𝒳(Γ, G(ℂ))` of §7.1, which sends `ρ` to the class of the unique closed orbit in the
closure of its orbit; `Suggested.lean` states this topological content, that `𝒳(Γ, G(ℂ))` is
Hausdorff and the closed-orbit map is continuous, constant on orbits, equal to the quotient map on
`Hom^red` and the universal Hausdorff quotient, as `characterVariety_universalHausdorffQuotient`.

*Proof sketch.* The universal property is the adjunction between `Spec` and global sections: an
invariant morphism to `Spec B` is a `k`-algebra map `B → O(Hom(Γ, G))` whose composites with the
coaction and with `f ↦ f ⊗ 1` agree, that is, one with image in the invariants
(`TauCeti.ComoduleAlgebra.range_le_coinvariants_iff`). Over an algebraically closed `k`, the image
of the quotient map is closed
(LanglandsParameterStacks §2.2, for the invariant closed set `Hom(Γ, G)` itself) and dense, the map
of coordinate rings being injective; so every fibre over a `k`-point is a nonempty `k`-scheme of
finite type and has a `k`-point. Invariant functions are constant on orbit closures, and two orbit
closures in one fibre each contain a closed orbit (ReductiveGroups Layer 3A), hence its unique closed
orbit. Surjectivity on invariants in
characteristic zero is `TauCeti.Comodule.Hom.fixedMap_surjective_of_isLinearlyReductive`, with linear
reductivity from `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive`. For the comparison, realize `Hom(Γ, G(ℂ))` in `V` as in
§5.3; the same surjectivity for the closed immersion of `Hom(Γ, G)` into `V` (§4.1) makes the quotient
map of `Hom(Γ, G(ℂ))` the restriction of that of `V`, given by homogeneous generators of `ℂ[V]^G`. On
the cone of minimal vectors this map is proper (a sequence of minimal vectors with bounded invariants
and norms tending to infinity rescales to a unit minimal vector in the null cone, whose orbit closure
contains `0`), surjective (each fibre contains a closed orbit, which contains a minimal vector) and
injective modulo `U` (§5.4 (ii) and uniqueness of the closed orbit in a fibre). A proper continuous
bijection `(M ∩ Hom)/U → (Hom//G)(ℂ)` is a homeomorphism, and §7.1 identifies its source with `𝒳`.
The quotient map is a topological quotient map, because its restriction to the minimal vectors is
proper and surjective; and a continuous invariant map to a Hausdorff space is constant on each fibre,
since every point of a fibre has the closed orbit in its closure, so it factors continuously.

**Checks.**

- The invariants are the coinvariants of a right coaction: for `𝔾_m` acting on `𝔸¹ = Spec k[x]` by
  `x · λ = λ x`, the coaction is `x ↦ x ⊗ t`, so `x^n ↦ x^n ⊗ t^n` and the coinvariants are the
  constants `k`, over every field `k` (`t^n ≠ 1` for `n ≥ 1`); `𝔸¹//𝔾_m` is a point, while on the
  points over an algebraic closure `k̄` there are the two orbits `{0}` and `k̄^×`, the second dense in
  `k̄`, so the quotient identifies two orbits whose closures meet. For the conjugation action of a
  commutative `G` the coaction is `f ↦ f ⊗ 1` and the coinvariants are all of `O(Hom(Γ, G))`, as in
  the `𝔽₂` Check below.
- `Γ = ℤ`, `G = GL_n`: `Hom//G = 𝔸^{n−1} × 𝔾_m` by the characteristic polynomial, and
  `𝒳(ℤ, GL_n(ℂ))` is the set of semisimple classes, matching ArithmeticGaloisRepresentations §1.11's
  `Conj_{GL_n}`.
- `Γ = F₂`, `G = SL₂`: `(Hom//G)(ℂ) ≅ ℂ³` through `(tr ρ(a), tr ρ(b), tr ρ(ab))` (Sikora2012 lines
  844–845, Example 48; NonabelianLevelStructures §5.1, which proves the isomorphism over every
  commutative ring).
- A nonreduced representation scheme in positive characteristic: for `Γ = ℤ/2` and `G = 𝔾_m` over
  `𝔽₂`, `Hom(Γ, G) = Spec 𝔽₂[t]/((t − 1)²)` (§4.1's Check) and conjugation is trivial, `𝔾_m` being
  commutative, so `Hom//G = Hom`, of finite type with the single closed orbit `{t = 1}`, as
  LanglandsParameterStacks §2.2 gives; the integral case of ArithmeticGaloisRepresentations §1.11
  does not apply to it. Here `G^S = 𝔾_m` with trivial action and `𝔽₂[t^{±1}] → 𝔽₂[t]/((t − 1)²)` is
  surjective, consistently with the closed-immersion clause, `𝔾_m` being linearly reductive in every
  characteristic.
- Linear reductivity, which characteristic zero gives every connected reductive group, is what the
  closed-immersion clause uses: for the group `C₂` over `𝔽₂` swapping the coordinates of `𝔸²`, which
  is not linearly reductive, the invariants `𝔽₂[x + y, xy]` restrict to the invariant closed line
  `Y = {x = y}`, on which `C₂` acts trivially, as `𝔽₂[2x, x²] = 𝔽₂[x²]`, while
  `O(Y)^{C₂} = 𝔽₂[x]`; the invariant `x` of `Y` lifts only after squaring. Over `ℚ` the average
  `(F + F ∘ swap)/2` of any lift `F` of an invariant of `Y` is an invariant lift.
- Free groups: for `Γ = F_S`, `Hom(Γ, G) = G^S` (§4.1) and `O(Hom(Γ, G))^G` is
  IntegralHeckeAndGaloisDeterminants §0.7's `C_{|S|}` for `C = O(G)`, so the closed immersion
  `Hom(Γ, G)//G → G^S//G` is an isomorphism. For `G = GL₂` and `|S| = 1` the trace `x₁₁ + x₂₂` and
  the determinant are invariant and `x₁₂` is not, as in §4.1's coaction Check; invariants of the
  diagonal torus alone would contain `x₁₁`, which conjugation by `[[0,1],[1,0]]` sends to `x₂₂`.

*Needs:* §4.1; §4.2; §5.3; §5.4; §6.7; §7.1; IntegralHeckeAndGaloisDeterminants §0.7;
LanglandsParameterStacks §2.2;
ArithmeticGaloisRepresentations §1.11; ReductiveGroups Layer 1; ReductiveGroups Layer 3A; Tau Ceti
`TauCeti.ComoduleAlgebra.coinvariants`, `TauCeti.ComoduleAlgebra.range_le_coinvariants_iff`,
`TauCeti.ComoduleAlgebra.finiteType_coinvariants`,
`TauCeti.reductiveCommHopfAlgProperty.linearlyReductive`, `TauCeti.Coalgebra.IsLinearlyReductive`,
`TauCeti.Comodule.Hom.fixedMap_surjective_of_isLinearlyReductive`; ReductiveGroups §3A.5c.

### 7.3 Functoriality

Prove that for a homomorphism of real reductive data `φ : (𝐆, G^ℝ) → (𝐆', G'^ℝ)` and every group
`Γ`, postcomposition with `φ` maps reductive representations to reductive representations and
induces a continuous map `CharacterVariety Γ G^ℝ → CharacterVariety Γ G'^ℝ`; that a surjection
`π : Γ' ↠ Γ` of groups induces, by precomposition, a closed embedding
`CharacterVariety Γ G^ℝ → CharacterVariety Γ' G^ℝ`; and that restriction to a finite-index subgroup
`Γ' ≤ Γ` maps reductive representations to reductive representations and induces a continuous map
`CharacterVariety Γ G^ℝ → CharacterVariety Γ' G^ℝ` (Sikora2012 line 268, Corollary 9, for the image of
a completely reducible subgroup under a homomorphism of reductive groups). For finitely generated
groups these are maps of the spaces `𝒳(Γ, G^ℝ)` of §7.1: a quotient of a finitely generated group is
finitely generated, and a finite-index subgroup of one is finitely generated by Schreier's lemma.

*Proof sketch.* By §§6.2 and 6.3, which use no finite generation, `ρ : Γ → G^ℝ` is reductive exactly
when the Zariski closure `Z` of `ρ(Γ)` in `G = 𝐆_ℂ` has reductive identity component. The image
`φ(Z)` is a closed subgroup of `G'` (ReductiveGroups Layer 3), so it is the Zariski closure of
`φ(ρ(Γ))`, which is dense in it. If `ρ` is reductive, the image `φ(Z⁰)` of the connected reductive
`Z⁰` is connected, closed and of finite index in `φ(Z)`, hence its identity component
(ReductiveGroups Layer 3), and it is reductive (Tau Ceti
`TauCeti.reductiveCommHopfAlgProperty.of_injective`, the coordinate map of
`Z⁰ → φ(Z⁰)` being injective and `ℂ` of characteristic zero); so `φ ∘ ρ` is reductive. For a
finite-index `Γ' ≤ Γ` with coset representatives `γ₁, …, γ_m`, the Zariski closure of `ρ(Γ)` is the
finite union of the translates `ρ(γ_i) Z'` of the Zariski closure `Z'` of `ρ(Γ')`, so `Z'` has finite
index in it and the same identity component. Postcomposition with `φ` and restriction are continuous
for the topology of pointwise convergence, each coordinate of the image being a coordinate followed
by the continuous `φ`, or a coordinate, and they commute with conjugation, so they descend to the
quotients. For a surjection `π`, precomposition is a homeomorphism of `Hom(Γ, G^ℝ)` onto the set of
homomorphisms trivial on `ker π`, which is closed, `G^ℝ` being Hausdorff, and conjugation invariant;
`ρ ∘ π` has the image of `ρ`, so it is reductive exactly when `ρ` is (§6.1). The quotient maps by
conjugation are open, so the induced map of orbit spaces is injective, has closed image (its
preimage is the closed invariant set above) and is open onto its image (an invariant open subset
`W ∩ C` of the closed invariant set `C` equals `(G^ℝ · W) ∩ C`).

**Checks.**

- The inclusion `SO(2) ⊆ SL₂(ℝ)` maps `𝒳(Γ, SO(2))` into `𝒳(Γ, SL₂(ℝ))`: for `Γ = ℤ` and `ρ(1)` a
  rotation of infinite order, the Zariski closure of `ρ(ℤ)` in `SO(2)_ℂ ≅ 𝔾_m` is the whole
  one-dimensional torus, `ρ(ℤ)` being infinite and the proper closed subgroups of `𝔾_m` finite, and
  its image in `SL₂` is the torus `SO(2)_ℂ`, reductive, consistently with `ρ(1)` being semisimple in
  `SL₂(ℝ)`.
- Restriction to an arbitrary subgroup is not functorial: for `Γ = F₂` and a Zariski-dense
  `ρ : F₂ → SL₂(ℝ)` with `ρ(a) = [[1,1],[0,1]]`, the restriction to `⟨a⟩ ≅ ℤ` is not reductive.
- `Γ = ℤ/2 ↞ ℤ`: `𝒳(ℤ/2, G^ℝ)` is the closed subset of `𝒳(ℤ, G^ℝ)` of classes of semisimple elements of
  order dividing two.
- No finite generation is used: for `Γ` free of countably infinite rank, `G^ℝ = G'^ℝ = ℝ^×` and `φ`
  the squaring map of `GL₁`, `CharacterVariety Γ ℝ^× = (ℝ^×)^ℕ` (§7.1's Check) and the induced map
  squares each coordinate, continuous although the space is not locally compact; the surjection
  `Γ ↠ ℤ` sending every basis element to `1` induces the diagonal embedding `ℝ^× → (ℝ^×)^ℕ`, whose
  image is closed and whose inverse on the image is the first coordinate. A statement restricted to
  finitely generated groups would omit both maps.

*Needs:* §6.1; §6.2; §6.3; §7.1; ReductiveGroups Layer 3; Tau Ceti
`TauCeti.reductiveCommHopfAlgProperty.of_injective`; Mathlib `Subgroup.fg_of_index_ne_zero`.

### 7.4 The outer action and the mapping class action

Prove that for every group `Γ`, every field `k` with a topology, every commutative Hopf `k`-algebra
`O(𝐆)` and every subgroup `G` of `𝐆(k)`, precomposition with automorphisms of `Γ` preserves
reductivity and `Out(Γ)` acts on `CharacterVariety Γ G` by homeomorphisms,
`[φ] · [ρ] = [ρ ∘ φ⁻¹]`; in particular, for a real reductive datum and a finitely generated `Γ`,
`Out(Γ)` acts on `𝒳(Γ, G^ℝ)` by homeomorphisms, and this is the restriction of §1.3's action on
`Rep(Γ, G^ℝ)`; no reductivity of `𝐆` and no finite generation of `Γ` is used. For
`Γ = π₁(Σ_{g,n}, x)`, prove that a path `σ : x ⟶ x'` induces a homeomorphism
`𝒳(π₁(Σ_{g,n}, x'), G^ℝ) ≅ 𝒳(π₁(Σ_{g,n}, x), G^ℝ)` independent of `σ`, so that `𝒳(Σ_{g,n}, G^ℝ)` is
well defined, and that `Mod^±_{g,n}` acts on it by homeomorphisms through `Ψ_x` (§3.3), compatibly
with these identifications and with §3.5's action on all conjugacy classes (BCGGO2024 lines
2712–2713; LandesmanLitt2024 lines 47–50). `Suggested.lean` states the first clause, at the
generality of `CharacterVariety`, as `exists_outAction_characterVariety`: precomposition with an
automorphism preserves reductivity, and a homomorphism from `Out(Γ)` to the homeomorphism group of
`CharacterVariety Γ G` sends `[φ]` to `[ρ] ↦ [ρ ∘ φ⁻¹]`.

*Proof sketch.* Precomposition with `φ⁻¹` permutes the coordinates of `G^Γ`, so it is continuous
for the pointwise topology, with continuous inverse the precomposition with `φ`; it commutes with
conjugation and preserves reductivity, which depends only on `ρ(Γ)` (§6.1), and `ρ ∘ φ⁻¹` has the
same image as `ρ`; inner automorphisms act trivially on classes (§1.3). Two choices of `σ` differ by
an inner automorphism.

**Checks.**

- For `G^ℝ = GL_r(ℂ)` the action on `𝒳` is the action of §3.5 on semisimple classes
  (LandesmanLitt2024 lines 47–50); the infinite orbit of §3.5's unipotent example lies outside `𝒳`,
  while its semisimplification is the trivial point, fixed by `Mod`.
- `Γ = ℤ`: `Out(ℤ)` acts on `𝒳(ℤ, G^ℝ)` by `[g] ↦ [g⁻¹]`; on `𝒳(ℤ, SO(2)) = SO(2)` it is complex
  conjugation, with fixed points `±1`.
- The first clause uses neither reductivity of `𝐆` nor finite generation of `Γ`: for the unipotent
  `𝐆 = 𝔾_a` over `ℝ`, `G = ℝ` and `Γ = ℤ`, `Ad` and conjugation are trivial, `CharacterVariety ℤ G`
  is `ℝ` through `ρ ↦ ρ(1)`, and the class of `−1 ∈ Aut(ℤ)` acts by `x ↦ −x`; for `Γ` free of
  countably infinite rank and `G = ℝ^×`, `CharacterVariety Γ G = (ℝ^×)^ℕ` (§7.1's Check), on which
  each automorphism acts through `Γ^{ab}` by a homeomorphism, each coordinate of `ρ ∘ φ⁻¹` being a
  product of finitely many coordinates of `ρ` and their inverses, although the space is not locally
  compact.
- `g ≥ 2`, `G^ℝ = PSL₂(ℝ)`: the classes of discrete faithful representations of Euler number
  `2 − 2g` form a subset `Fuch⁺` of `𝒳(π₁(Σ_g), PSL₂(ℝ))` in bijection with `Teich(Σ_g)` through
  TeichmullerGeometry §§4.5 and 6.1 (via `ι` of TeichmullerGeometry §4.2), equivariantly for
  `Mod_{g,0}`; the reflection-conjugate classes have Euler number `2g − 2` and correspond to the
  conjugate surface. `Fuch⁺` is one of the two connected components that make up BCGGO2024's
  `Fuch(PSL₂ℝ)`, the set of all classes of discrete faithful representations, which corresponds to
  the Teichmüller spaces of both orientations of `Σ_g` (BCGGO2024 lines 2714–2718, Example 8.2), so
  `Fuch(PSL₂ℝ)` is two copies of `Teich(Σ_g)`, not one.

*Needs:* §1.3; §3.3; §3.5; §6.1; §7.1; TeichmullerGeometry §4.2; TeichmullerGeometry §4.4;
TeichmullerGeometry §4.5; TeichmullerGeometry §6.1.

### 7.5 Examples and comparisons

The following computed examples pin the definitions of Layer 7 against small groups, each with its
value (Sikora2012 lines 844–845, Example 48).

**Checks.**

- `𝒳(Γ, G^ℝ)` for `Γ` trivial is a point; for `Γ = F_m` and compact `G^ℝ` it is `(G^ℝ)^m/G^ℝ`.
- `𝒳(ℤ, GL₁(ℝ)) = ℝ^×` (two points of `π₀`), `𝒳(ℤ, PSL₂(ℝ))` is the set of elliptic and hyperbolic
  classes together with the identity, with the parabolic classes absent.
- `𝒳(π₁(Σ₁), GL₁(ℂ)) = (ℂ^×)²` and `𝒳(π₁(Σ_{0,3}), SL₂(ℂ)) ≅ ℂ³` (§7.2; NonabelianLevelStructures
  §5.1, which proves the isomorphism over every commutative ring), through
  `(tr ρ(a), tr ρ(b), tr ρ(ab))` for a free basis `a, b` of `π₁(Σ_{0,3}) ≅ F₂`. On it §7.4's action
  of `Out(F₂)` is by polynomial automorphisms (NonabelianLevelStructures §5.2): the class of the
  involution `(a, b) ↦ (a⁻¹, b)` acts by the Vieta move `(x, y, z) ↦ (x, y, x y − z)`, since
  `tr(A⁻¹B) = tr A · tr B − tr AB` for `A ∈ SL₂`, and the class of `(a, b) ↦ (a⁻¹, b⁻¹)` acts
  trivially, since `tr A⁻¹ = tr A` and `tr(A⁻¹B⁻¹) = tr(BA) = tr(AB)`, so the action is not
  faithful. Both moves preserve the commutator trace `x² + y² + z² − x y z − 2` (Tau Ceti
  `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`): under the Vieta move
  `z² − x y z` becomes `(x y − z)² − x y (x y − z) = z² − x y z`. At `(2, 2, 3)`, the triple of
  `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]`, the commutator trace is `4 + 4 + 9 − 12 − 2 = 3`, and the
  Vieta move gives `(2, 2, 1)`, again of commutator trace `4 + 4 + 1 − 4 − 2 = 3`. The direction
  matters off the involutions: for `ρ = (A, B)` and `φ : (a, b) ↦ (a, a⁻¹ b)`, `ρ ∘ φ⁻¹ = (A, A B)`
  and §7.4's `[φ]` acts by `(x, y, z) ↦ (x, z, x z − y)`, since `tr(A² B) = tr A · tr AB − tr B`,
  while §5.2's move of `φ`, read on `ρ ∘ φ = (A, A⁻¹ B)`, is `(x, x y − z, y)`. At `(2, 2, 3)` these
  give `(2, 3, 4)`, the triple of `(A, A B)` with `A · A B = [[3,2],[1,1]]`, and `(2, 1, 2)`, the
  triple of `(A, A⁻¹ B)` with `A⁻¹ B = [[0,−1],[1,1]]`; both have commutator trace `3`
  (`4 + 9 + 16 − 24 − 2` and `4 + 1 + 4 − 4 − 2`).

*Needs:* §7.1; §7.2; §7.4; NonabelianLevelStructures §5.1; NonabelianLevelStructures §5.2; Tau Ceti
`Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`.

### Examples

- The locus `Fuch⁺` of §7.4 for genus two; the character variety `𝒳(F₂, SL₂(ℂ)) ≅ ℂ³`
  (NonabelianLevelStructures §5.1) with `Out(F₂)` acting by polynomial automorphisms, `[φ]` by
  NonabelianLevelStructures §5.2's automorphism of `φ⁻¹` (§7.4's left action), the class of
  `(a, b) ↦ (a⁻¹, b⁻¹)` trivially, preserving `x² + y² + z² − xyz − 2 = tr ρ([a, b])` for `[a, b] = a b a⁻¹ b⁻¹` (the Fricke identity, Tau Ceti
  `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`; the commutator `a⁻¹ b⁻¹ a b` is
  conjugate to it and has the same trace) (§7.5).

### Dependencies

Layers 1–6; LanglandsParameterStacks §2.2; ArithmeticGaloisRepresentations §1.11;
IntegralHeckeAndGaloisDeterminants §0.7 (§7.2); ReductiveGroups
Layers 1, 3 (images and identity components, §7.3), 3A; Tau Ceti's reductive groups and their
characteristic-zero linear reductivity; Tau Ceti `TauCeti.reductiveCommHopfAlgProperty.of_injective`
(§7.3); ReductiveGroups §3A.5c; TeichmullerGeometry §§4.2, 4.4, 4.5, 6.1;
NonabelianLevelStructures §§5.1–5.2 (Checks of §§7.2 and 7.5); Tau Ceti
`Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` (§7.5);
SymplecticGeometry/HamiltonianReduction R5 (a Check of §7.1); Tau Ceti's linearly reductive
comodules; Tau Ceti `TauCeti.ComoduleAlgebra.coinvariants`,
`TauCeti.ComoduleAlgebra.range_le_coinvariants_iff` and
`TauCeti.ComoduleAlgebra.finiteType_coinvariants` (§7.2); Mathlib's proper actions.

## Downstream consumers

- A nonabelian Hodge and higher Teichmüller roadmap (real forms, `G^ℝ`-Higgs bundles, Fuchsian and
  Hitchin loci) and a Goldman symplectic form roadmap consume §§5.1–5.2 and Layers 6–7 for general
  finitely generated `Γ`; GeometricTopology, Part II (Culler–Shalen theory on `𝒳(π₁ M, SL₂(ℂ))`)
  consumes §§4.1 and 7.2.

## References

- **LandesmanLitt2024.** A. Landesman, D. Litt, *Canonical representations of surface groups*, Ann.
  of Math. 199 (2024); arXiv:2205.15352v4.
- **BCGGO2024.** S. Bradlow, B. Collier, O. García-Prada, P. Gothen, A. Oliveira, *A general Cayley
  correspondence and higher Teichmüller spaces*, Ann. of Math. 200 (2024); arXiv:2101.09377v2.
- **Sikora2012.** A. S. Sikora, *Character varieties*, Trans. Amer. Math. Soc. 364 (2012), 5173–5208;
  arXiv:0902.2589v3.
- **BateMartinRohrle2005.** M. Bate, B. Martin, G. Röhrle, *A geometric approach to complete
  reducibility*, Invent. Math. 161 (2005), 177–218; arXiv:math/0408109v2.
- **BohmLafuente2021.** C. Böhm, R. A. Lafuente, *Real geometric invariant theory*, in *Differential
  Geometry in the Large*, LMS Lecture Note Ser. 463 (2021); arXiv:1701.00643v3.
- **Richardson1988.** R. W. Richardson, *Conjugacy classes of n-tuples in Lie algebras and algebraic
  groups*, Duke Math. J. 57 (1988), 1–35 (cited by its locator).
- **RichardsonSlodowy1990.** R. W. Richardson, P. J. Slodowy, *Minimum vectors for real reductive
  algebraic groups*, J. London Math. Soc. (2) 42 (1990), 409–429 (cited by its locator).
- **FarbMargalit2012.** B. Farb, D. Margalit, *A Primer on Mapping Class Groups*, Princeton (2012)
  (cited by its locator).
- **Knapp2002.** A. W. Knapp, *Lie Groups Beyond an Introduction*, 2nd ed., Birkhäuser (2002) (cited by
  its locator).
- **Goldman1984.** W. M. Goldman, *The symplectic nature of fundamental groups of surfaces*, Adv. Math.
  54 (1984), 200–225 (background for `Hom(π, G)/G`; cited by its locator).
