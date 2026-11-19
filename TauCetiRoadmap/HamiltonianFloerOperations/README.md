# Roadmap: Hamiltonian Floer operations: the geometric pair-of-pants product and multiplicative PSS

**Summary.** Let `(X, ω)` be a closed connected symplectic manifold of dimension `2n ≥ 2`, and let
`H` be a period-one Hamiltonian on `X` all of whose contractible one-periodic orbits are
nondegenerate. Its capped Floer complex is a module over the Floer Novikov ring `Λ`, the completed
group ring of the period group `Γ`: the spherical classes of `X` modulo those of zero area and zero
first Chern number. This roadmap constructs the pair-of-pants product on that complex, by counting
maps from the thrice-punctured sphere to `X` that solve a Cauchy–Riemann equation perturbed by a
Hamiltonian one-form equal to the Floer data on the three cylindrical ends, together with its unit,
the homotopies behind its identities, and its comparison with the quantum product.

The counts come in two branches. On the classical branch, where `X` is positively spherically
monotone (`ω = τ c₁` on spherical classes for some `τ > 0`) or spherically `c₁`-zero, the moduli
spaces are cut out transversally and counted with signs, so the product exists over `ℤ` and every
commutative ring. On the rational virtual branch, for every closed `X`, the counts are rational
virtual counts from implicit atlases.

The headline theorems are these. First, on both branches, the product makes the Floer cohomology
`HF^*(H)`, the cohomology of the complex regraded by `C^k = CF_(n−k)`, an associative, graded
commutative, unital algebra over `Λ`, whose unit is the image of the fundamental class under the
Piunikhin–Salamon–Schwarz (PSS) map, and continuation maps between two Hamiltonians are
isomorphisms of algebras. Second, over `ℚ`, the composite of Poincaré duality and the PSS map is
an isomorphism of unital rings from the small quantum cohomology of `X`, with its coefficients
carried to `Λ` by `q^A ↦ e^(−A)`, to `HF^*(H)`, proved through a geometric one-parameter family
joining the pair-of-pants product to the three-point Gromov–Witten correspondence. Third, as computations: on a symplectically aspherical
`X` the product is the cup product, and on `ℂPⁿ` the `(n+1)`-st power of the hyperplane class is the
Novikov monomial of minus the line class times the unit.

The roadmap sits on four neighbours. DGFloer §7.C supplies the capped Floer complexes, continuation
maps, orientation conventions and the module PSS isomorphism on the classical branch;
GromovWittenTheory Layer 7 supplies the quantum product that Layer 7 here compares with;
ImplicitAtlases supplies the virtual-class engine for the rational branch; AnalyticStableMaps
Layer 3 and HeegaardFloer Layers 1–4 supply stable-map compactness, Fredholm theory and the Morse
comparison. Tau Ceti already has the coefficient algebra (period group, caps, Floer Novikov ring,
the coefficient comparison) and the algebraic shell of the product: bilinear maps given by
supported coefficient kernels, with the chain-homotopy consequences of kernel identities.

The build has eight layers, described below: Layer 1 fixes coefficients, caps and degrees; Layer 2
the punctured domains and perturbation data; Layer 3 energy, support and raw compactness; Layer 4
the classical transversality, gluing and orientations; Layer 5 the rational virtual counts on every
closed target; Layer 6 the product, its unit and its homotopies; Layer 7 the multiplicative PSS
comparison; Layer 8 the computations that test the whole construction.

## How to read the build

The layers are in construction order. The cap, coefficient and orientation data and the raw domain
data (Layers 1–2) come first; then energy, raw compactness and conditional linear and thickened
gluing (Layer 3 and the conditional parts of Layers 4–5); then either the joint selection of end,
core, sphere and relative-family data on the classical branch (Layer 4) or the atlas and trace
systems on the rational branch (Layer 5); then the supported complexes and counts and the geometric
product with its homotopies and unit (Layer 6); then the Gromov–Witten Morse-incidence comparison
family and multiplicative PSS (Layer 7); and last the computations (Layer 8). Closed
Gromov–Witten theory, the generic index theory, the Novikov completion and the virtual engine are
independent lower suppliers, and the module PSS isomorphism of DGFloer does not consume this
product. No PSS or ring equation is a premise of raw regularity, of support or of the generic
virtual construction. Raw data, conditional estimates, selected classical problems and virtual
thickenings are kept as distinct objects throughout. Each section's *Needs:* line lists its inputs,
so that a target proved by another route is not blocked behind an unrelated section.

## Conventions

1. **Target.** `X` is a closed connected boundaryless smooth manifold of dimension `2n`, `n ≥ 1`,
   Hausdorff and second countable, with a smooth closed nondegenerate two-form `ω`
   (`TauCeti.SmoothTwoForm.IsSymplectic`). A disconnected target is treated componentwise. The
   zero-dimensional target is the point, whose Floer complex is the coefficient ring with one
   generator and whose product is multiplication (§8.1).
2. **Hamiltonians and orbits.** A Hamiltonian is a smooth function `H : ℝ × X → ℝ` of period one in
   the first variable; `X_H` is fixed by `ι_(X_H) ω = dH`, and `{F, G} = ω(X_F, X_G)`. The
   generators are the contractible one-periodic orbits of `X_H`, all nondegenerate; there are finitely
   many, by the open-and-closed contractible sector argument of DGFloer §7.C.1. A degenerate
   Hamiltonian never generates a complex: its Floer cohomology and product are those of a
   nondegenerate perturbation, identified across perturbations by continuation (DGFloer §7.C.4 and
   §6.3 below), and never a count of unperturbed generators.
3. **Floer equation and ends.** Almost complex structures are `ω`-compatible
   (`TauCeti.SmoothTwoForm.Compatible`) unless a statement says tame (`TauCeti.SmoothTwoForm.Tames`).
   On a cylinder the equation is `u_s + J(u_t − X_H) = 0`. Positive ends are inputs and negative ends
   are outputs, as in DGFloer §7.C.
4. **Caps, action and grading** (DGFloer §7.C.1). A cap `D` of an orbit `x` is a disc bounding it, up
   to the equivalence of DGFloer §7.C.1. The action is `A_H(x, D) = ∫ D^*ω + ∫₀¹ H(t, x(t)) dt` and
   the grading is `μ = −CZ`, normalised so that a constant orbit at a critical point `p` of a
   `C²`-small autonomous `H` has `μ = ind_H(p) − n`. If `D′ − D = B`, the action increases by `ω(B)`
   and `μ` by `2c₁(B)`.
5. **Periods.** `S_sph ⊂ H₂(X; ℤ)` is the image of the spherical Hurewicz map, with the homomorphisms
   `ω, c₁ : S_sph → ℝ, ℤ`, and `Γ = S_sph ⁄ (ker ω ∩ ker c₁)` is `TauCeti.Floer.PeriodGroup ω c₁`.
   The joint kernel, not the kernel of `ω` alone, is quotiented, so that classes of equal area and
   different degree stay apart.
6. **Branches.** *Positively spherically monotone*: `ω = τ c₁` on `S_sph` for some `τ > 0`.
   *Spherically `c₁`-zero*: `c₁ = 0` on `S_sph`. The *classical branch* is these two cases, with
   regular counts, first over `𝔽₂`, then oriented over `ℤ`, then extended to any commutative ring `R`
   by scalars. The *rational virtual branch* is every closed `X`, with `R = ℚ`. Integral products on
   the classical branch are kept; no integral virtual theory on an arbitrary closed `X` is inferred
   from a rational trace. The rational coefficients of GromovWittenTheory Layer 7 are the common
   coefficients of the comparison of Layer 7 here.
7. **Coefficients.** The Floer Novikov ring is `Λ_R = TauCeti.Floer.NovikovRing R ω c₁`: series
   `Σ a_γ e^γ` over `γ ∈ Γ`, with `e^γ` of degree `+2c₁(γ)` and valuation `ν(γ) = −ω(γ)`, finitely
   many terms below each valuation. Recapping by `B` is multiplication by `e^B`. The completed capped
   chains of `H` are `TauCeti.NovikovModule R A_H` on the capped orbits, with the action as potential.
   For general `Γ` the valuation need not be injective and `Λ_R` need not be a field; homogeneous
   pieces are taken inside the completion (`TauCeti.NovikovSeries.gradeBy`), never as an integer
   direct sum containing every inhomogeneous infinite series.
8. **Degrees.** `CF_*(H)` carries the raw homological grading `μ`, with differential of degree `−1`.
   The comparison cochain complex is `C^k(H) = CF_(n−k)(H)` with `d_C = d_CF`, of degree `+1`
   (`ChainComplex.regradeEquivalence` with shift `n`); `HF^*(H)` is its cohomology, so that
   `HF^k(H) = HF_(n−k)(H)`. Signs are Koszul signs in the cochain degree:
   the tensor differential is `d(a ⊗ b) = da ⊗ b + (−1)^a a ⊗ db`, and exchanging inputs of degrees
   `a`, `b` costs `(−1)^(ab)`.
9. **The class of a pair of pants.** For a pair of pants `u` with input orbits `x₁, x₂`, input caps
   `D₁, D₂`, output orbit `x₀` and output cap `D₀`, its class is `A = D₀ + u − D₁ − D₂ ∈ Γ`, formed
   with the oriented compactification; the cap glued from `D₁`, `u` and `D₂` is `(−A) + D₀`, so the
   coefficient of `u` in the basis of reference output caps is `e^(−A)`.
10. **Comparison with Gromov–Witten coefficients.** `q^A ↦ e^(−A)`: the quantum Novikov variable of a
    class `A` goes to the Floer monomial of `−A`, of valuation `ν(−A) = ω(A)`.
11. **Orientation conventions** (DGFloer §7.C.2a, §7.C.4). Input ends are oriented in the order
    `1, 2`, then the dual of the output; DGFloer's fixed cap pairing `γ_min`, coevaluation `q_min`,
    chain-compatible bidual `j_ch` and quotient-then-negative-flow convention for cylinders are used
    unchanged.
12. **Names.** Tau Ceti and Mathlib declarations are named in code font with their full names.
    `Suggested.lean` declares nothing, so every object this roadmap constructs is named in prose.

## Layer 1: coefficients, caps and the degree dictionary (H1)

This layer fixes everything about coefficients and degrees before any count exists. Its abstract
algebra is in Tau Ceti; the targets are its realisation on an actual closed target and the
regraded orientation data.

### 1.1 Cap gluing along a pair of pants

The cap cover of the contractible loops, the Γ-torsor of cap classes over each orbit, and the
recapping, cylinder gluing and reference-cap maps are DGFloer §7.C.1's; on each orbit the cap
classes are a torsor `TauCeti.Floer.CapClass ω c₁ P` for the raw caps `P`. Construct, for a homotopy
class of pairs of pants `u` from `x₁, x₂` to `x₀`, the gluing map sending cap classes `D₁, D₂` of the
inputs to the cap class of the output obtained by gluing them to `u`, and prove that it is
equivariant in each input under recapping. Then the class of Convention 9 is
`TauCeti.Floer.productClass` of this gluing map, and the following hold, each by the cited Tau Ceti
lemma once equivariance is proved.

- Recapping the output by `B` adds `B` to `A`; recapping an input by `B` subtracts `B`
  (`TauCeti.Floer.productClass_vadd_out`, `TauCeti.Floer.productClass_vadd_fst`,
  `TauCeti.Floer.productClass_vadd_snd`); for arbitrary caps, `A` is its value at reference caps plus
  the output recapping class minus the input recapping classes
  (`TauCeti.Floer.productClass_eq_add_sub`).
- The topological energy `A_H₁(x₁, D₁) + A_H₂(x₂, D₂) − A_H₀(x₀, D₀) + ω(A)` and the expected index
  `μ₁ + μ₂ − μ₀ − n + 2c₁(A)` do not depend on the caps
  (`TauCeti.Floer.add_sub_add_map_productClass_eq`,
  `TauCeti.Floer.add_sub_add_two_mul_chern_productClass_eq`).
- Class addition under sewing: when the output of one pair of pants is glued into an input of
  another, the class of the composite is the sum of the two classes, whatever the cap at the
  intermediate orbit (`TauCeti.Floer.productClass_comp_fst`, `TauCeti.Floer.productClass_comp_snd`),
  and the two ways of sewing three inputs give the same class exactly when the two glued output caps
  agree (`TauCeti.Floer.productClass_add_eq_add_iff`). Prove the same additivity when a Floer
  cylinder, with the cap gluing of DGFloer §7.C.1, or a PSS plane is glued into any end.

**Checks.**
- On `X = S² × S²` with areas `1` and `2`, `S_sph = ℤ²` with `ω(a, b) = a + 2b` and
  `c₁(a, b) = 2a + 2b`. The class `B = (−2, 1)` has area `0` and degree `2c₁(B) = −4`, and the joint
  kernel is `0`, so `Γ = ℤ²`. A quotient by `ker ω` alone would identify `B` with `0` and give the
  monomial `e^B` two degrees.
- If `A` were formed with the opposite orientation, `D₁ + D₂ − D₀ − u`, recapping `D₁` by `B` would
  change `μ₁ + μ₂ − μ₀ − n + 2c₁(A)` by `4c₁(B)` instead of `0`.

*Needs:* DGFloer §7.C.1; Tau Ceti `TauCeti.Floer.CapClass`, `TauCeti.Floer.productClass` and the
lemmas listed.

### 1.2 The coefficient ring and its branch models

The coefficient ring of `X` is `Λ_R = TauCeti.Floer.NovikovRing R ω c₁` (Convention 7), and the
completed capped chains of DGFloer §7.C.6 are modules over it. Record on `X`:

- `Λ_R` is graded by `TauCeti.Floer.PeriodGroup.degree`, and recapping by `B` shifts both action and
  degree as in Convention 4.
- On the positively monotone branch, `Γ` is cyclic
  (`TauCeti.Floer.PeriodGroup.isAddCyclic_of_area_eq_mul_chern`). If `c₁ ≠ 0` on `S_sph`, the
  finitely supported series are the finite Laurent model
  `TauCeti.Floer.NovikovRing.ofLaurentPolynomial`
  (`TauCeti.Floer.NovikovRing.mem_range_ofLaurentPolynomial_iff`), available before completion, and
  the completion is formal Laurent series (`TauCeti.Floer.NovikovRing.toLaurentSeries`); the
  Laurent variable is the monomial of minus the positive Chern generator. If `c₁ = 0` on `S_sph`,
  monotonicity forces `ω = 0` there and `Γ = 0`.
- On the spherically `c₁`-zero branch, area embeds `Γ` in `ℝ`
  (`TauCeti.Floer.PeriodGroup.area_injective_of_chern_eq_zero`), every series has degree `0`
  (`TauCeti.Floer.NovikovRing.gradeBy_degree_zero_eq_top_of_chern_eq_zero`), and the integer
  grading of the completed complex is carried by the generators.
- For general `Γ` the homogeneous pieces of the completion, or the residue grading they induce, are
  used; `Γ = 0` exactly when `ω` and `c₁` vanish on `S_sph`
  (`TauCeti.Floer.PeriodGroup.subsingleton_iff`).

**Checks.**
- On `ℂP¹`, `S_sph = ℤL` with `c₁(L) = 2`, so `Γ ≅ ℤ` and the Laurent variable `T = e^(−L)` has raw
  degree `−4` and valuation `ω(L) > 0`. The series `Σ_(k ≥ 0) e^(−kL)` lies in `Λ`, its valuations
  `kω(L)` tending to infinity; `Σ_(k ≥ 0) e^(kL)` does not. A ring with valuation `+ω` would reverse
  this and could not receive the quantum corrections of §1.4.

*Needs:* DGFloer §7.C.1, §7.C.6; Tau Ceti `TauCeti.Floer.NovikovRing` and the lemmas listed.

### 1.3 The expected index, the degree of the product and the cochain regrading

For a pair of pants in class `A` (Convention 9), call `μ₁ + μ₂ − μ₀ − n + 2c₁(A)` its expected index;
§2.4 proves that it is the Fredholm index of the linearised operator. A rigid coefficient therefore
has `μ₀ − 2c₁(A) = μ₁ + μ₂ − n`: in raw degrees the product is a map
`CF_i ⊗ CF_j → CF_(i+j−n)` of degree `−n`. On the comparison cochain complex
`C^k = CF_(n−k)`, `d_C = d_CF` (Convention 8; `ChainComplex.regradeEquivalence`,
`ChainComplex.regradeHomologyIso`) the product has degree `0` and `d_C` degree `+1`; for the
completed product of a supported kernel this is `TauCeti.Floer.kernelProduct_mem_cochain_gradeBy`.
Construct the regrading of the cap-dependent orientation lines of DGFloer §7.C.2a at the same time,
assigning to the line of `(x, D)` the cochain degree `n − μ(x, D)`, and prove the sign and shift
identities relating the tensor differentials, duals and input exchanges formed with raw degrees to
those formed with cochain degrees. The regrading is this construction with its identities, not a
renaming of an unrelated complex.

**Checks.**
- Among regradings `C^k = CF_(c ± k)`, only `C^k = CF_(n−k)` makes the product of degree zero and
  the differential of degree `+1`: `C^k = CF_(c+k)` needs `c = n` for degree zero but makes the
  differential lower degree, and `C^k = CF_(c−k)` needs `c = n`.

*Needs:* §1.1; DGFloer §7.C.2a; Tau Ceti `ChainComplex.regradeEquivalence`,
`ChainComplex.regradeHomologyIso`, `ChainComplex.regradeIsoShift`,
`TauCeti.Floer.kernelProduct_mem_cochain_gradeBy`.

### 1.4 The coefficient comparison with Gromov–Witten theory

GromovWittenTheory §0.1–§0.2 fixes its class group `H₂(X; ℤ)` with area and Chern maps and its
Novikov ring `Λ_ω`, in which `q^A` has degree `+2c₁(A)`. Take as common class group the spherical
classes `S_sph ⊂ H₂(X; ℤ)` with the restrictions of `ω` and `c₁`, and prove that the genus-zero
three-point classes of GromovWittenTheory §7.2 vanish in every class outside `S_sph`, a genus-zero
stable map having spherical class, so that the quantum product is defined over the Novikov series on
`S_sph`. The comparison is the descent to the joint-period quotient with finite coefficient sums,
`TauCeti.Floer.periodGroupComparison`, the instance for the quotient map of
`TauCeti.Floer.coefficientComparison`; for the quotient by any subgroup of the joint kernel it is
`TauCeti.Floer.coefficientComparison` for that quotient map. It sends `q^A` to `e^(−A)`, so
`ν(−A) = ω(A)`, it sums the coefficients of all classes with the same image in `Γ`, and no
Gromov–Witten invariant is assumed to descend to `Γ` individually.

- It is a continuous unital ring homomorphism for the period topologies
  (`TauCeti.Floer.continuous_coefficientComparison`), resting on the positive-rescaling period
  identity of `TauCeti.NovikovSeries.mapRingHom`; no map `t ↦ 1` on the whole completed ring is used.
- It negates the Chern number on homogeneous supports
  (`TauCeti.Floer.chern_support_coefficientComparison`): the quantum degree `+2c₁(A)` becomes the
  raw Floer degree `−2c₁(A)` of `e^(−A)`, which is the cochain coefficient degree `+2c₁(A)`.
- Two monomials with the same nonzero coefficient have the same image exactly when their areas and
  Chern numbers agree (`TauCeti.Floer.periodGroupComparison_single_eq_iff`).

The degree comparison on cohomology is `H^k(X; ℚ) → H_(2n−k)(X; ℚ) → FH_(n−k)`, Poincaré duality
followed by PSS, and `FH_(n−k)` is `HF^k` in the regrading of Convention 8. Over a ring other than
`ℚ`, the orientation, universal coefficient, tensor and base-change and perfect-pairing hypotheses
are carried explicitly; the rational comparison of GromovWittenTheory Layer 7 does not supply them.

**Checks.**
- On `ℂP¹` the quantum relation `x ⋆ x = q^L · 1` (GromovWittenTheory §7.2) has `deg q^L = 4`. Its
  image `e^(−L)` has raw degree `−4`, so cochain degree `4 = 2 + 2`. The comparison `q^A ↦ e^A`
  would give cochain degree `−4`, and the image of `x ⋆ x` would not be homogeneous of degree `4`.

*Needs:* §1.2; GromovWittenTheory §0.1–§0.2, §7.2; DGFloer §7.C.5b (PSS);
HeegaardFloer §1.4, §1.9 (Morse and singular comparison, duality); Tau Ceti
`TauCeti.Floer.periodGroupComparison`, `TauCeti.Floer.coefficientComparison` and the lemmas listed.

### Examples

- On a symplectically aspherical `X` (`ω` and `c₁` vanish on `S_sph`), `Γ = 0` and `Λ_R = R`.
- On a K3 surface `c₁ = 0`, so area identifies `Γ` with a subgroup of `ℝ`, and every coefficient has
  degree `0`.
- On `ℂPⁿ`, `Γ = ℤL` with `c₁(L) = n + 1`, and the product coefficient of a rigid pair of pants in
  class `kL` is `e^(−kL)`, of raw degree `−2k(n + 1)`.

### Dependencies

DGFloer §7.C.1, §7.C.2a, §7.C.5b, §7.C.6; GromovWittenTheory §0.1–§0.2, §7.2; HeegaardFloer §1.4,
§1.9; Tau Ceti's period group, cap classes, product class, Floer Novikov ring, coefficient comparison
and regrading equivalence.

## Layer 2: punctured domains and perturbation data (H2)

### 2.1 The pair-of-pants domain and its families

The domain is `S = ℙ¹` minus three distinct ordered points, with two positive cylindrical ends `e₁`,
`e₂` (the inputs) and one negative cylindrical end `e₀` (the output), each of period one in the
angular coordinate and oriented by `ds ∧ dt`. Tau Ceti's model is `ℂ ∖ {0, 1}` with input ends at `0`
and `1` and output end at `∞`, end coordinates `TauCeti.ThricePuncturedSphere.Puncture.endCoord`,
end parametrisations `TauCeti.ThricePuncturedSphere.Puncture.cylindricalEndLift` and compact
truncations `TauCeti.ThricePuncturedSphere.truncation`. Fix asymptotic markers, end coordinates and
collars and their changes. `S` has Euler characteristic `−1`, and no automorphism of `ℙ¹` fixes three
points, so the pair-of-pants domain has no translation quotient. Use this fixed three-marked sphere
model, and for compositions explicit plumbing families built on
`TauCeti.ThricePuncturedSphere.Puncture.plumbingMap`. Construct:

- the compactified one-parameter family of four-punctured spheres whose two ends are the two ways
  of plumbing a pair of pants into an input of another, and the family exchanging the two inputs;
- the plumbing of a Floer cylinder or a PSS plane into any end.

Map-stable domains, where a nonconstant map stabilises the domain, are distinguished from stable
pointed domains. An inserted Floer cylinder has its own translation quotient, and a stationary
cylinder is treated through its invertible linearised block.

**Checks.**
- For a Floer cylinder the moduli space is divided by `ℝ`-translation, so rigid differentials have
  index `1`; for the pair of pants nothing is divided, so rigid products have index `0`. Dividing
  the pair-of-pants moduli space by a translation would shift every count by one degree.

*Needs:* Tau Ceti `TauCeti.ThricePuncturedSphere.Puncture.endCoord`,
`TauCeti.ThricePuncturedSphere.Puncture.cylindricalEndLift`,
`TauCeti.ThricePuncturedSphere.truncation`, `TauCeti.ThricePuncturedSphere.Puncture.plumbingMap`,
`TauCeti.ThricePuncturedSphere.Puncture.plumbingMap_image_union`.

### 2.2 Perturbation data and almost complex structures

Perturbation data on `S` are a Hamiltonian one-form `K ∈ Ω¹(S; C^∞(X))` equal to `H_i(t) dt` on the
end `e_i`, and a domain-dependent compatible `J_z` equal to the already selected `J_i(t)` there.
For any three period-one Hamiltonians on a manifold, Tau Ceti's
`TauCeti.Floer.pairOfPantsPerturbation` is such a `K`, smooth on `S × X`
(`TauCeti.Floer.contMDiffAt_pairOfPantsPerturbation`), equal to `H_q(t) dt` far out on the end `q`
(`TauCeti.Floer.pairOfPantsPerturbation_cylindricalEndLift`) and zero off the ends; its plumbed
version is `TauCeti.Floer.plumbedPerturbation`. Tau Ceti's `TauCeti.Floer.pairOfPantsAlmostComplex`
and `TauCeti.Floer.plumbedAlmostComplex` build the almost complex data for structures on a fixed
symplectic vector space. Construct the almost complex data on the tangent bundle of `X`: a smooth
family of compatible structures on `S × X` equal to `J_i(t)` far out on each end, and its plumbed
version.

The variations used for transversality are:

- on the compact core, independent localised variations `δK` of the perturbation, which in local
  coordinates realise every value of the Floer operator
  (`TauCeti.SymplecticForm.exists_contDiff_floerOperator_add_const_mul_left`);
- domain-dependent variations `Y` of `J`, satisfying the compatible tangent condition
  `JY + YJ = 0` and `ω(Y·, J·) + ω(J·, Y·) = 0`, and for tame structures only `JY + YJ = 0`.

Construct nonempty extensions of all fixed end and corner data, and the complete smooth coefficient
spaces, before any regularity selection. Prescribed product, continuation and cap faces are extended
with all corner jets and with interior variations flat to all orders at the faces. Genuine unary
operations, nonconstant components, curvature data and marked or unit insertions are kept; only
undecorated unstable metric or combinatorial subdivisions are suppressed.

*Needs:* §2.1; Tau Ceti `TauCeti.Floer.pairOfPantsPerturbation`, `TauCeti.Floer.plumbedPerturbation`,
`TauCeti.Floer.pairOfPantsAlmostComplex`, `TauCeti.Floer.plumbedAlmostComplex`,
`TauCeti.SymplecticForm.exists_contDiff_floerOperator_add_const_mul_left`,
`TauCeti.SmoothTwoForm.Compatible`.

### 2.3 Curvature and the inhomogeneous equation

For `K = K_s ds + K_t dt` in local coordinates `z = s + it` define the curvature
`R_K = ∂_s K_t − ∂_t K_s − {K_s, K_t}` (`TauCeti.SmoothTwoForm.hamiltonianCurvature`;
`TauCeti.SymplecticForm.hamiltonianCurvature` on a vector space). The equation is
`(du − X_K)^(0,1) = 0`, in coordinates `u_s − X_(K_s) + J(u_t − X_(K_t)) = 0`
(`TauCeti.SmoothTwoForm.isComplexLinearMap_perturbedMFDeriv_iff`). Prove that `R_K ds ∧ dt` is a
well-defined two-form on `S` with values in functions on `X`, and that the equation is independent
of the holomorphic coordinate, by the coordinate-change laws of
`TauCeti.SymplecticForm.hamiltonianCurvature_perturbationPullback` and
`TauCeti.SymplecticForm.isComplexLinearMap_perturbedFDeriv_perturbationPullback` applied chart by
chart.

**Checks.**
- On a cylindrical end, `K = H(t) dt` has `R_K = ∂_s H − 0 − {0, H} = 0`
  (`TauCeti.SymplecticForm.hamiltonianCurvature_cylindrical`).
- On `(ℝ², dq ∧ dp)` with `K = q ds + p dt`, `X_q = −∂_p` and `X_p = ∂_q`, so `{q, p} = 1` and
  `R_K = −1`, while `∂_s K_t − ∂_t K_s = 0`. A constant map has energy density
  `ω(X_q, X_p) = 1 = −R_K`, as the energy identity of §3.1 requires; a curvature without the bracket
  would give `0` and break that identity.

*Needs:* §2.1–§2.2; Tau Ceti `TauCeti.SmoothTwoForm.hamiltonianCurvature`,
`TauCeti.SmoothTwoForm.isComplexLinearMap_perturbedMFDeriv_iff`,
`TauCeti.SymplecticForm.hamiltonianCurvature_perturbationPullback`,
`TauCeti.SymplecticForm.isComplexLinearMap_perturbedFDeriv_perturbationPullback`.

### 2.4 The linearised operator, its index and the differentiability budget

Prove the covariant linearisation of the equation at a solution `u`, with the terms coming from `K`
and from `∇J`, its weighted end operator at each end, and its evaluation constraints; in local
coordinates it is Tau Ceti's `TauCeti.SymplecticForm.floerLinearization`
(`TauCeti.SymplecticForm.fderiv_floerOperator_apply`). Prove that on the weighted Sobolev completion
of HeegaardFloer §3.1 and §3.5 it is Fredholm of index `μ₁ + μ₂ − μ₀ − n + 2c₁(A)`, the expected
index of §1.3. In every compact parameter, energy and index window fix the full differentiability
list of HeegaardFloer Layer 2 (§2.2), including all moving-domain, neck, incidence and external
parameters. Genericity on a face is never inferred from genericity of its pieces.

**Checks.**
- For a `C²`-small Morse Hamiltonian and `A = 0`, a pair of pants whose first input is the maximum
  (`μ = n`) and whose second input and output are the same critical point `p` has index
  `n + (ind p − n) − (ind p − n) − n = 0`: these products are rigid, as products with a unit must
  be. Without the term `−n` the index would be `n`.

*Needs:* §1.3, §2.2–§2.3; HeegaardFloer §2.2, §3.1, §3.4–§3.5; Tau Ceti
`TauCeti.SymplecticForm.floerLinearization`, `TauCeti.SymplecticForm.fderiv_floerOperator_apply`.

### Examples

- For `K = TauCeti.Floer.pairOfPantsPerturbation`, built from the end Hamiltonians `H_q`, the
  curvature is supported in the three collars `1 ≤ ±s ≤ 2`, where it is `±β′(±s − 1) H_q(t)` with
  `β` the smooth transition from `0` to `1` on `[0, 1]`.

### Dependencies

Layer 1; HeegaardFloer §2.2, §3.1, §3.4–§3.5; Tau Ceti's thrice-punctured sphere with its ends and
plumbing, the pair-of-pants perturbation and almost complex data, the curvature, the perturbed
derivative and the local linearisation.

## Layer 3: energy, support and raw compactness before regular counts (H3)

### 3.1 The energy identity on capped pairs of pants

For compatible `J` the energy of a solution is `E(u) = ∫_S ω(u_s − X_(K_s), u_t − X_(K_t)) ≥ 0`
(`TauCeti.SmoothTwoForm.floerEnergyDensity`, `TauCeti.SmoothTwoForm.floerEnergyDensity_nonneg`).
Prove for a finite-energy solution on a closed `X`, with caps `D₁, D₂, D₀` and class `A`:

    E(u) = ∫ u^*ω + ∫_∂ K(u) − ∫ R_K(u)
         = A_H₁(x₁, D₁) + A_H₂(x₂, D₂) − A_H₀(x₀, D₀) + ω(A) − ∫ R_K(u).

Route: the rectangle identity `TauCeti.SymplecticForm.integral_floerEnergyDensity`, its pointwise
manifold form `TauCeti.SmoothTwoForm.IsNondegenerate.floerEnergyDensity_eq`, its invariance under
coordinate changes (`TauCeti.SymplecticForm.integral_floerEnergyDensity_image`), and on the
truncation `S_R` the vector-space identity
`TauCeti.SymplecticForm.integral_floerEnergyDensity_pairOfPantsPerturbation_truncation`; the caps
enter through §1.1. On tame compact windows use the actual positive symmetric metric, the
coercivity estimate `TauCeti.SymplecticForm.mul_norm_sq_add_norm_sq_perturbedFDeriv_le_mul_floerEnergyDensity`
and an operator homotopy; `ω(·, J·)` is not called a symmetric metric for a merely tame `J`.

**Checks.**
- On a cylindrical region the identity reduces to `E = A_H(x₊) − A_H(x₋)` for a Floer cylinder
  (`TauCeti.SymplecticForm.integral_floerEnergyDensity_eq_hamiltonianAction_sub`), with the input
  at `s → +∞` of larger action.

*Needs:* §1.1, §2.2–§2.3; Tau Ceti `TauCeti.SymplecticForm.integral_floerEnergyDensity`,
`TauCeti.SmoothTwoForm.IsNondegenerate.floerEnergyDensity_eq`,
`TauCeti.SymplecticForm.integral_floerEnergyDensity_image`,
`TauCeti.SymplecticForm.integral_floerEnergyDensity_pairOfPantsPerturbation_truncation`,
`TauCeti.SymplecticForm.mul_norm_sq_add_norm_sq_perturbedFDeriv_le_mul_floerEnergyDensity`.

### 3.2 Support bounds and energy cutoffs

Let `B = −A` be the output monomial, so `ν(B) = ω(A)`. Prove: if `∫_S sup_X |R_K| ≤ C`, every solution
contributing a nonzero coefficient has `ν(B) ≥ −A_H₁(x₁, D₁) − A_H₂(x₂, D₂) + A_H₀(x₀, D₀) − C`;
conversely `ν(B) < L` gives `E(u) ≤ A_H₁ + A_H₂ − A_H₀ + L + C`. These are the lower-support and
energy-cutoff implications, both from `E ≥ 0` and §3.1. Carry them with the reference-cap constants,
changes of normalisation of the Hamiltonians, all inhomogeneous terms and class splitting under
degeneration.

**Checks.**
- With `C = 0` and actions `A_H₁ = 3`, `A_H₂ = 2`, `A_H₀ = 1`, every contributing class has
  `ν(e^(−A)) = ω(A) ≥ −4`, and `ν < 0` bounds the energy by `4`. If the output monomial were taken
  to be `e^A`, the same inequality would bound its valuation `−ω(A)` above by `4`, the coefficients
  could accumulate towards valuation `−∞`, and the output would not lie in `Λ`.

*Needs:* §3.1, §3.3.

### 3.3 Uniform curvature bounds over families

Prove uniform bounds on `∫ sup_X |R_K|` over every declared stretched, collapsed or relative family.
On long necks `K = H dt` and `R_K = 0`
(`TauCeti.SymplecticForm.integral_abs_hamiltonianCurvature_neckStretch_le`, for
`TauCeti.Floer.neckStretch`); transition collars have bounded fixed geometry; synthesised
perturbations carry the integrated coefficient and target-derivative controls of DGFloer §7.C.2b.
A pointwise bound times an unbounded neck length gives nothing. At cutoff-zero comparison faces,
`K` vanishes in the specified domain coordinates with an explicit uniform curvature allowance
(`TauCeti.SymplecticForm.integral_abs_hamiltonianCurvature_const_mul_le`,
`TauCeti.SymplecticForm.hamiltonianCurvature_mul`). Moving reference and cap terms carry their own
bounds. Tau Ceti has the bounds for the pair of pants and the plumbed four-punctured sphere on a
vector-space target
(`TauCeti.SymplecticForm.lintegral_enorm_hamiltonianCurvature_pairOfPantsPerturbation_le`,
`TauCeti.SymplecticForm.lintegral_enorm_hamiltonianCurvature_plumbedPerturbation_le`); prove them for
the manifold data of §2.2.

**Checks.**
- For the pair-of-pants perturbation with `|H_q| ≤ B_q`, the integrated curvature is at most
  `B₀ + B₁ + B_∞`, since `β′ ≥ 0` has total integral `1` on each end; a bound summing a pointwise
  supremum over an end of length `R` would grow like `R`.
- For `K_ρ = ρK`, `R_(ρK) = ρR_K + (ρ − ρ²){K_s, K_t}` and `0 ≤ ρ − ρ² ≤ 1/4` on `[0, 1]`, so the
  bound is uniform in `ρ`, including the cutoff-zero end; treating `R_(ρK)` as `ρR_K` would miss
  the bracket term.

*Needs:* §2.2–§2.3; DGFloer §7.C.2b; Tau Ceti `TauCeti.Floer.neckStretch` and the bounds listed.

### 3.4 Raw Gromov–Floer compactness

Prove convergence and compactness for solutions of bounded energy over compact parameter windows:
a sequence has a subsequence converging to a configuration with Floer breaking at each end, sphere
trees attached at the frozen structure `J_(p,z)` of the attachment point, marked-point collisions,
ghost components and all parameter faces. A bubble at an unstable attachment freezes `J` at that
attachment; a domain-dependent `J` does not turn it into a sphere for an unrelated global `J`. Work
with stable domain charts and their forgetful and attachment maps. Cap classes add under every
degeneration (§1.1). There is no symplectic-field-theory target level unless a separately specified
noncompact neck-stretching problem creates one. Route: Gromov's graph construction turns solutions
into pseudoholomorphic curves in `S × X` (`TauCeti.SymplecticForm.floerGraphAlmostComplex`,
`TauCeti.SymplecticForm.isJHolomorphicAt_graph_floerGraphAlmostComplex_iff`), and the attached,
fixed-asymptotic and varying frozen-`J` application of the unforced compactness of AnalyticStableMaps
§3.7 is constructed here; unforced compactness is not itself punctured Floer compactness.

*Needs:* §1.1, §2.1–§2.3, §3.1–§3.3; AnalyticStableMaps §3.7; HeegaardFloer §4.3, §4.6c; DGFloer
§7.C.3; Tau Ceti `TauCeti.SymplecticForm.floerGraphAlmostComplex`,
`TauCeti.SymplecticForm.isJHolomorphicAt_graph_floerGraphAlmostComplex_iff`.

### Examples

- For a symplectically aspherical `X`, no sphere bubbles occur and the limits of §3.4 are broken
  pairs of pants and cylinders only.

### Dependencies

Layers 1–2; AnalyticStableMaps §3.7; HeegaardFloer §4.3, §4.6c; DGFloer §7.C.2b, §7.C.3; Tau Ceti's
energy identities, curvature bounds, neck stretching and graph construction.

## Layer 4: classical range, tree exclusion, gluing and orientations (H4)

This layer is the classical branch (Convention 6).

### 4.1 Joint end and incidence data and the evaluation range

Choose the Floer ends jointly with their `t`-parametrised sphere and evaluation incidence data; tail
attachments at equal `t` share that `J_t`. At free core points prove the grouped frozen-`J` sphere and
core evaluation range on the actual equality partitions and full simple-image reductions. Each
inhomogeneous core has free `δK` directions detecting constant as well as nonconstant cokernels;
sphere components have `J` directions and their own simple-or-covered reduction, not `δK`. Prove
openness on each stratum, density, smoothing and a countable selection over classes, energies,
indices and parameters. For prescribed faces use their already regular matching problems and prove
the relative interior range with all parameters included.

*Needs:* §2.2–§2.4; HeegaardFloer §2.2, §4.2, §4.4, §4.6a–§4.6d; DGFloer §7.C.2b, §7.C.3.

### 4.2 Product-specific exclusion of sphere trees

For both classical branches prove a codimension and exclusion theorem for full trees, specific to
products, in the dimensions needed by rigid counts, chain maps, the commutativity, associativity,
unit and continuation homotopies and the PSS comparison. It includes multiple covers, repeated
simple images, constant cores and incidences. State exactly which strata are absent in each
fixed-class zero- or one-dimensional problem; not all spheres are declared absent, in particular at
the Gromov–Witten comparison end of Layer 7. A cylinder exclusion theorem is not a product exclusion
theorem. Positive monotonicity supplies its own energy ceiling for a fixed counting budget; the
`c₁`-zero branch keeps per-energy gluing neighbourhoods; neither branch receives a neighbourhood
for all energies from the index alone.

*Needs:* §1.3, §3.4, §4.1; DGFloer §7.C.3a.

### 4.3 Gluing and one-dimensional boundaries

Prove conditional local gluing on the extended operators with incidence constraints, then regular
nonlinear gluing, and the theorems identifying the compactified one-dimensional moduli spaces as
oriented one-manifolds with boundary the broken configurations. Construct parameter and corner jets
and uniform right-inverse and error estimates before face-flat relative selection.

*Needs:* §2.4, §3.4, §4.1–§4.2; HeegaardFloer §4.5; DGFloer §7.C.3, §7.C.3c.

### 4.4 Orientations and the operator realisation

Orient input ends in the order `1, 2`, then the output dual (Convention 11). Complex-orient the
sphere and domain deformation and node-normal factors, and order matching normals before their
stated contraction. Use the determinant exact sequences of HeegaardFloer §2.2 and §3.4 and DGFloer's
`γ_min`, `q_min`, `j_ch` and quotient-then-negative-flow convention. A pair of pants is not assigned
a free `ℝ`-translation factor. The regraded external kernel lies in `C₁^a ⊗ C₂^b ⊗ (C₀^c)^∨`; a count
functional is converted to an operator by the standard graded tensor and dual identification of
DGAInfinity Layers 0–1, not by an ungraded right trace. Construct this Fredholm realisation and its
sewing comparison explicitly.

*Needs:* §1.3, §4.3; HeegaardFloer §2.2, §3.4; DGFloer §7.C.2a, §7.C.4; DGAInfinity Layers 0–1.

### 4.5 The constant normalisation and the operator sign equations

Normalise the `A = 0` constant comparison by the complex-oriented diagonal and the signed Morse
intersection and Poincaré duality theorem, in every index, not by extrapolation from one minimum.
Unit-cap gluing uses the same cap and coevaluation and both parameter endpoint normals. Derive the
full operator sign equations of Layer 6 from these ordered sequences, including the sign `(−1)^a` of
the tensor differential and the sign `(−1)^(ab)` of input exchange. No count is multiplied by an
unspecified sign afterwards to force an identity.

**Checks.**
- On `T²` with `∫ α ⌣ β = 1`, the normalisation must give `m₂(α, β) = α ⌣ β = −m₂(β, α)` at
  `A = 0`. Products with the point class, of even degree `2`, cannot detect a sign error of the
  form `(−1)^(ab)`; the degree-one classes do, which is why every index is normalised.

*Needs:* §4.4; HeegaardFloer §1.3, §1.9, §1.9a; AlgebraicTopology §6.3–§6.4.

### Examples

- On a positively monotone `X`, a rigid product coefficient between given generators has
  `c₁(A) = (μ₀ − μ₁ − μ₂ + n)/2` fixed by the degrees (§1.3), hence `ω(A) = τc₁(A)` fixed, and its
  energy is at most `A_H₁ + A_H₂ − A_H₀ + τc₁(A) + C` (§3.2): the energy ceiling of §4.2. On a
  spherically `c₁`-zero target the degrees do not determine `ω(A)`.

### Dependencies

Layers 1–3; HeegaardFloer §1.3, §1.9–§1.9a, §2.2, §3.4, §4.2–§4.6d; DGFloer §7.C.2a–§7.C.4;
DGAInfinity Layers 0–1; AlgebraicTopology §6.3–§6.4.

## Layer 5: the rational virtual punctured application on arbitrary closed X (H5)

### 5.1 Compactified punctured moduli spaces and stabilisation

Construct the genus-zero punctured Hamiltonian compactifications: the relative cylinder and PSS
plane spaces, the product spaces and all comparison parameter families of Layers 6–7, with their
compact cutoff strata, finite isotropy, cap and end labels, obstruction bundles and evaluation maps.
Stabilise rank-two sphere components by full finite unordered preimages of target cuts, with
forgetting and isotropy compatibility. Rank-one or stationary inhomogeneous cores use their domain
or end-marker model, or the translation slice and the invertible model, never codimension-two cuts
at nontransverse preimages.

*Needs:* §2.1–§2.4, §3.4; AnalyticStableMaps §3.7.

### 5.2 Thickened gluing and atlas data

Construct thickened conditional gluing for the extended Cauchy–Riemann, incidence and normalisation
operator, with constrained right inverses, extra-obstruction projection coordinates, orientation
local systems, the chart and footprint cover and the coordinate cocycles, including ghost
normalisation, domain plumbing and branch matching. Construct the finite cell-like, product and
relative corner data required by ImplicitAtlases Layer 6. For target diagonals construct the ambient
joint extra-obstruction and matching projections of ImplicitAtlases Layer 7 before imposing the
diagonal. Boundary and relative variants are supplied on the application charts: the boundaryless
manifold statement of ImplicitAtlases §7.1–§7.3 is not automatically that variant.

*Needs:* §5.1; ImplicitAtlases §1.1–§1.2, §6.1–§6.4, §7.1–§7.4; HeegaardFloer §4.5.

### 5.3 Coherent trace systems

Apply ImplicitAtlases Layers 4–5 only with specified finite-union, refinement, concordance and
cobordism witnesses. Construct coherent relative trace-complex maps indexed by the finite product,
cap, continuation and comparison diagrams and their common refinements, and prove their boundary,
concatenation and homotopy laws. A collection of independent virtual numbers, or a global
homology-level functional alone, gives neither a chain product nor coherent homotopies.

*Needs:* §5.2; ImplicitAtlases §4.2–§4.3, §5.2–§5.3.

### 5.4 The rational supported package and the classical overlap

Construct the supported rational cylinder and PSS package of this branch, outside the classical scope
of DGFloer §7.C: the rational Floer complex, its continuation maps and the module PSS chain maps with
both inverse homotopies, on every closed `X`; then define the virtual product on that complex
(Layer 6). Prove regular normalisation against Layer 4 and the overlap comparison on classical
targets: there the virtual counts are the regular counts tensored with `ℚ`. The generic engine never
depends back on this application or on the quantum ring of GromovWittenTheory.

*Needs:* §5.3, Layer 4; DGFloer §7.C.4–§7.C.6; ImplicitAtlases §5.6; HeegaardFloer Layer 1.

### Examples

- A symplectically aspherical `X` is spherically `c₁`-zero, so it lies on both branches, and the
  overlap comparison of §5.4 makes its virtual counts the regular counts tensored with `ℚ`.

### Dependencies

Layers 1–4; ImplicitAtlases Layers 0–7; AnalyticStableMaps §3.7; DGFloer §7.C.4–§7.C.6;
HeegaardFloer Layer 1 and §4.5.

## Layer 6: supported product, unit and sewing equations (H6)

### 6.1 Product coefficients and their support

For each ordered triple of reference generators and each class `A` define the zero-dimensional
oriented (Layer 4) or virtual (Layer 5) count `n(x₁, x₂; x₀; A)`. Prove that for each `L` only
finitely many classes with `ν(−A) < L` have a nonzero count, from the compactness of §3.4 and the
rigid boundary and atlas results of Layers 4–5, including dense period groups. A noncompact broken
rigid locus is never counted: the theorem identifies the countable moduli strata and their finite
cutoff compactifications. First construct the finite geometric sums, then their supported matrix,
then the continuous `Λ`-bilinear product. Prove a lower valuation bound uniform over the finite
reference triples; the product is then Tau Ceti's `TauCeti.NovikovModule.kernelProduct` of the count
kernel, `Λ`-bilinear as `TauCeti.NovikovModule.novikovKernelProduct`, with matrix
`TauCeti.NovikovModule.kernelMatrix` in reference caps (`TauCeti.NovikovModule.coordinates_kernelProduct`),
jointly continuous (`TauCeti.NovikovModule.continuous_kernelProduct`) with filtration shift the
constant of the bound. Input series support and geometric matrix support together give finite
convolution. The completed tensor product is used through its proved universal property
(`TauCeti.NovikovModule.externalProduct`, `TauCeti.NovikovModule.lift`,
`TauCeti.NovikovModule.lift_unique`), never as an algebraic tensor product.

**Checks.**
- On `S² × S²` with areas `1` and `√2`, `Γ = ℤ²` and the classes `(−⌊b√2⌋, b)`, `b ∈ ℤ`, are
  infinitely many with area in `[0, 1)` and Chern numbers `2(b − ⌊b√2⌋)` unbounded. Finiteness
  below a valuation level therefore cannot come from discreteness of the periods; it comes from
  §3.4.

*Needs:* §1.2, §3.2, §3.4, §4.3 or §5.3; Tau Ceti `TauCeti.NovikovModule.kernelProduct`,
`TauCeti.NovikovModule.novikovKernelProduct`, `TauCeti.NovikovModule.kernelMatrix`,
`TauCeti.NovikovModule.coordinates_kernelProduct`, `TauCeti.NovikovModule.continuous_kernelProduct`,
`TauCeti.NovikovModule.externalProduct`, `TauCeti.NovikovModule.lift`,
`TauCeti.NovikovModule.lift_unique`.

### 6.2 The chain-level product and the Leibniz rule

On `C^* = CF_(n−*)` define `m₂ : C₁^a ⊗ C₂^b → C₀^(a+b)` as the product of §6.1. Prove

    d m₂(a, b) = m₂(da, b) + (−1)^a m₂(a, db)

from the oriented boundary of the one-dimensional product moduli spaces, whose ends are cylinder
breakings at the three ends: this boundary count is the kernel identity of
`TauCeti.NovikovModule.kernelMap_kernelProduct_eq_add`, which then gives the Leibniz rule on
completed chains. For the product on a fixed complex choose all three Hamiltonians equal, or keep the
labels `H₁, H₂, H₀` and the continuation comparisons explicitly. End Hamiltonians on an arbitrary
closed target admit interpolation of finite curvature; no flat connection with prescribed holonomy
is assumed.

**Checks.**
- For `a` of degree `1` with `da = 0` and `db = c`, the formula gives `d m₂(a, b) = −m₂(a, c)`; with
  the sign `+` both for odd and even `a`, `d²` on the tensor complex would not vanish: for `a, b` of
  degree `1` with `da = x`, `db = y`, the mixed terms of `d²(a ⊗ b)` would be `2 x ⊗ y`.

*Needs:* §1.3, §4.3–§4.5 or §5.3, §6.1; Tau Ceti `TauCeti.NovikovModule.kernelMap_kernelProduct_eq_add`,
`TauCeti.NovikovModule.tensorDifferential`.

### 6.3 Continuation, exchange and associativity

Continuation changing the end Hamiltonians, exchange of the inputs, and the two decompositions of a
four-punctured sphere each have their own regular or virtual family, finite cutoff support and
determinant orientation diagram. The two ends of the associativity family are the two broken
products; its other codimension-one faces are exactly differentials. Sphere-tree strata allowed in
the branch are included in the virtual or boundary calculation, never silently dropped. Orient each
parameter interval so that its boundary is the declared right expression minus the left expression,
and use the corresponding Hom differential. Prove:

- continuation maps intertwine the products on homology
  (`TauCeti.NovikovModule.kernelMap_kernelProduct_sub_kernelProduct_kernelMap_of_mem_gradeBy`,
  `TauCeti.NovikovModule.cohomologyMap_cohomologyProduct_kernelProduct`), so, being isomorphisms
  on homology (DGFloer §7.C.4, §5.4), they are algebra isomorphisms;
- graded commutativity on homology, `m₂(a, b) = (−1)^(ab) m₂(b, a)`
  (`TauCeti.NovikovModule.kernelProduct_sub_negOnePow_smul_kernelProduct_of_tensorDifferential`);
- associativity on homology
  (`TauCeti.NovikovModule.kernelProduct_kernelProduct_sub_kernelProduct_kernelProduct_of_mem_gradeBy`).

In each case the kernel identity is the boundary count of the family, and the Tau Ceti theorem turns
it into the chain homotopy. The chain product need not be strictly associative or strictly
commutative.

*Needs:* §2.1, §3.3–§3.4, §4.2–§4.5 or §5.3, §6.1–§6.2; DGFloer §7.C.4; Tau Ceti the theorems
listed.

### 6.4 The unit

The unit cycle is the negative-plane PSS count `F_H(z_X)` of the oriented Morse fundamental cycle
`z_X`, not a degenerate generator of `H = 0` at infinity. It has raw degree `n`, hence cochain degree
`0`. Construct the left and right cap-gluing and cylinder families and prove their support,
orientations and chain homotopies; with different Hamiltonians their ends are the specified
continuation maps, and on a common complex they make the class of `F_H(z_X)` a left and right
identity on homology (`TauCeti.NovikovModule.kernelProduct_sub_kernelMap_right`,
`TauCeti.NovikovModule.kernelProduct_sub_kernelMap_left`,
`TauCeti.NovikovModule.cohomologyProduct_kernelProduct_unit_mk`,
`TauCeti.NovikovModule.cohomologyProduct_kernelProduct_mk_unit`). Prove that the class is
independent of `z_X` by the PSS chain map. Regular integral counts and their coefficient changes
stay separate from rational virtual counts.

**Checks.**
- The Morse fundamental cycle of a Morse function with one maximum is the maximum, of Morse index
  `2n`, and its PSS image has raw degree `2n − n = n` and cochain degree `0`. With the opposite
  normalisation `μ = n − ind` it would have cochain degree `2n`, and could not be a unit of a degree
  zero product.

*Needs:* §1.3, §2.1, §4.5 or §5.4, §6.1–§6.3; DGFloer §7.C.5b; HeegaardFloer §1.3; Tau Ceti the
theorems listed.

### 6.5 Independence of the auxiliary data

Compare two choices of perturbation data, almost complex structures and reference data with the
same ends by a path of data with fixed ends, and two such paths by a two-parameter family, with all
their parameter dimensions and shared true faces, using common refinements on the virtual branch.
Prove that the product and the unit on homology do not depend on the choices.

*Needs:* §6.2–§6.4; ImplicitAtlases §5.3 on the virtual branch.

### Examples

- On a symplectically aspherical `X` with a `C²`-small Morse Hamiltonian, every rigid product
  coefficient has `A = 0`, and §8.1 identifies the product with the cup product.

### Dependencies

Layers 1–5; DGFloer §7.C.4, §7.C.5b; HeegaardFloer §1.3; ImplicitAtlases §5.3; Tau Ceti's kernel
maps, kernel products, completed tensor products and the Leibniz, continuation, commutativity,
associativity and unit theorems.

## Layer 7: multiplicative PSS is a geometric comparison (H7)

### 7.1 The Morse quantum operation

Construct the Morse quantum operation `Q_M` as an application of the three-point stable-map
virtual correspondence of GromovWittenTheory Layer 7 to two incoming unstable and one outgoing stable
Morse incidence. Use the Morse and singular comparison, Poincaré duality and the ordered target
diagonal to identify the product it induces with the formula of GromovWittenTheory §7.2, including
the left Poincaré dual reconstruction and all odd signs. Its geometric chain lift and the
relative-family comparison are constructed here; GromovWittenTheory owns the closed invariant and
its ring identities. Coefficients pass by `q^A ↦ e^(−A)` (§1.4). `Q_M` is not defined by
transporting `m₂`, nor `m₂` by transporting `Q_M`.

**Checks.**
- The `A = 0` term of `Q_M` is the geometric Morse cup product of HeegaardFloer §1.9a. On `T²` with
  `∫ α ⌣ β = 1`, its reconstruction gives `α ⋆ 1 = (∫ α ⌣ β) e^β = α` with the left dual
  `e^β = α` of GromovWittenTheory §7.2; the right dual `e^β = −α` would give `α ⋆ 1 = −α`.

*Needs:* §1.4; GromovWittenTheory §5.2, §6.1, §7.1–§7.2; HeegaardFloer §1.4, §1.9, §1.9a;
ImplicitAtlases §7.3; MorseTheory Layers 1–2 and 6.

### 7.2 The comparison family

Attach two negative PSS planes to the positive (input) ends of the pair of pants and one positive PSS
plane to its negative (output) end. The resulting closed genus-zero core has three ordered Morse
incidence poles. Construct a compactified one-parameter family with a long-neck end equal to
`G₀ m₂(F₁ ⊗ F₂)` and a zero-Hamiltonian end equal to the three-marked unforced Gromov–Witten and Morse
problem `Q_M`, as follows.

- Fix common pole discs, `J₀` and end markers before gluing.
- On a fixed smooth three-pole sphere, interpolate `K_R = ρ(R) K₁` for `0 ≤ R ≤ 1`, with `ρ`
  smooth, `ρ(R) = R` near `0` and `ρ = 1` near `1`, and use the compatible-`J` chart and contraction
  to start at the domain-independent `J₀` and reach the chosen glued datum.
- For `R ≥ 1` choose a smooth `L(R) ≥ 0` with `L = 0` on a neighbourhood of `1` and `L(R) = R − 1`
  for all large `R`. Insert three cylindrical necks of length `L(R)` with `K = H_i dt`, using the
  selected cap and product pieces and transition collars of fixed width; the family is constant on
  the collar where `L = 0`.
- The punctures of the separated pieces appear only at the broken long-neck end; every closed domain
  at finite `R` is smooth.

Prove the coordinate and cutoff gluing laws of this family; the uniqueness of the conformal type of a
three-marked sphere does not supply this analytic family. Prove existence, regular or virtual
true-face matching, uniformly bounded curvature (§3.3), compactness and orientations with all Morse
and sphere incidence data. The whole stable sphere tree in class `A` survives at the zero end: its
nonconstant spheres are the quantum corrections. The two-marked constant normalisation of DGFloer is
not a substitute for this three-marked comparison. Prove the identification of the unforced end with
GromovWittenTheory Layer 7 at the level of charts and virtual traces, not only of expected
dimensions.

**Checks.**
- `L(R) = R − 1` for all `R ≥ 1` is excluded: the family would have `R`-derivative `1` at `R = 1⁺`
  and `0` at `R = 1⁻`, where `ρ = 1`, so it would not be smooth across `R = 1`.
- At `R = 0`, `K₀ = ρ(0)K₁ = 0`: the zero-Hamiltonian end is unperturbed, as the comparison with
  closed Gromov–Witten theory needs.

*Needs:* §2.1–§2.2, §3.3–§3.4, §4.2–§4.5 or §5.1–§5.3, §6.1, §7.1; GromovWittenTheory Layer 7;
DGFloer §7.C.5b; Tau Ceti `TauCeti.Floer.neckStretch`,
`TauCeti.SymplecticForm.integral_abs_hamiltonianCurvature_const_mul_le`.

### 7.3 The comparison homotopy

Prove that counting the boundary of the one-dimensional moduli spaces of the family of §7.2 gives a
parameter homotopy `K` with, in the regraded complexes,

    G₀ m₂(F₁ ⊗ F₂) − Q_M = dK + K d_tensor.

This is a geometric comparison identity, not a formal consequence of module PSS. Its construction
uses the supported PSS maps `F`, inverse maps `G` and cylinder complexes of the branch, and no
multiplicative PSS conclusion.

*Needs:* §6.1–§6.2, §7.2; DGFloer §7.C.5b or §5.4.

### 7.4 Multiplicative PSS

Let `T = m₂(F₁ ⊗ F₂)`, and let `H₀` satisfy `F₀G₀ − Id = dH₀ + H₀d`, from the independently
constructed module inverse (DGFloer §7.C.5b on the classical branch, §5.4 on the rational branch).
Prove

    T − F₀ Q_M = d(F₀K − H₀T) + (F₀K − H₀T) d_tensor,

with signs fixed by the degree-zero chain maps and degree `−1` homotopies. Conclude that, over `ℚ`
and after extending coefficients along §1.4, `F ∘ PD` is an isomorphism of rings from the quantum
cohomology of GromovWittenTheory §7.2 to the Floer cohomology of Layer 6, and that it sends `1` to
the unit of §6.4, by the cap and Gromov–Witten unit diagrams (GromovWittenTheory §5.2). Neither the
algebraic rearrangement nor the module inverse supplies `K`. On a general closed target the theorem
needs the rational supported module PSS of §5.4; the classical equivalence of DGFloer cannot
instantiate it there.

**Checks.**
- The identity follows from §7.3: applying `F₀` gives `F₀G₀T − F₀Q_M = d(F₀K) + (F₀K)d_tensor`,
  and `F₀G₀T − T = d(H₀T) + (H₀T)d_tensor` because `T` is a chain map; subtracting gives the
  displayed identity. A version with `H₀` on the other side, `G₀F₀ − Id`, would not compose with
  `T`, whose values lie in the Floer complex.

*Needs:* §6.4, §7.3; DGFloer §7.C.5b or §5.4; GromovWittenTheory §5.2, §7.2.

### Examples

- On a symplectically aspherical `X`, `Q_M` has only the term `A = 0`, the Morse cup product, and
  §7.4 recovers the classical statement that PSS intertwines the cup product with the pair-of-pants
  product.

### Dependencies

Layers 1–6; GromovWittenTheory §5.2, §6.1, Layer 7; HeegaardFloer §1.4, §1.9, §1.9a;
ImplicitAtlases §7.3; MorseTheory Layers 1–2 and 6; DGFloer §7.C.5b.

## Layer 8: computations (H8)

The computations of this layer test the finished construction. None uses an unproved monotone
specialisation or a completed augmentation; the `ℂPⁿ` formulas consume the enumerative computation
of GromovWittenTheory §7.2 and cannot be deduced from the cyclic module rank formula of DGFloer.

### 8.1 The point and symplectically aspherical targets

Prove that on the point the product is multiplication in `R`, and that on a symplectically aspherical
`X` (`Γ = 0`) the Floer cohomology ring over `ℚ` is the ordinary cohomology ring with the cup
product, equivalently the intersection product, by §7.4 and the `A = 0` normalisation of §4.5.

*Needs:* §4.5, §6.4, §7.4.

### 8.2 Coefficients at a sphere and change of reference caps

Prove, for a sphere class `A`, that `q^A ↦ e^(−A)` matches the action and recapping at the sphere:
recapping a generator by `A` raises its action by `ω(A)` and its degree by `2c₁(A)` and is
multiplication by `e^A`. Prove that changing the reference output cap by `B` multiplies each product
coefficient into it by `e^(−B)`, that changing a reference input cap by `B` multiplies the
coefficients out of it by `e^B`, and that the product on completed chains does not change.

*Needs:* §1.1, §1.4, §6.1; Tau Ceti `TauCeti.Floer.productClass_eq_add_sub`.

### 8.3 Small Morse Hamiltonians

For a `C²`-small Morse Hamiltonian prove that the `A = 0` part of `m₂` is the signed intersection
product of HeegaardFloer §1.9a, with the time-independent Floer solutions identified with gradient
lines (in a chart, `TauCeti.SymplecticForm.Invariant.isComplexLinearMap_perturbedFDeriv_comp_fst_iff`).

*Needs:* §4.5, §6.2; HeegaardFloer §1.9a; Tau Ceti
`TauCeti.SymplecticForm.Invariant.isComplexLinearMap_perturbedFDeriv_comp_fst_iff`.

### 8.4 Projective spaces

Prove, at the enumerative normalisation of GromovWittenTheory §7.2 and transported to the counted
product through §7.4: on `ℂP¹`, with `x` the image of the point class, of degree `2`,
`m₂(x, x) = e^(−L) · 1` and the unit is the image of `1`; on `ℂPⁿ`, the `(n+1)`-fold product of the
image of the hyperplane class is `e^(−L) · 1`, `L` the line class. GromovWittenTheory §7.2 computes
`ℂP¹` and `ℂP²`; for `n ≥ 3` the quantum relation `x^(⋆(n+1)) = q^L · 1` is proved here from its
product formula: with the basis `x^j` and left duals `x^(n−j)`, `x^(⋆k) = x^k` for `k ≤ n`, since a
degree-one three-point class `⟨x^a, x^b, x^c⟩_L` vanishes unless `a + b + c = 2n + 1`, and
`x ⋆ x^n = q^L ⟨x, x^n, x^n⟩_L · 1` with `⟨x, x^n, x^n⟩_L = 1`, the one line through two general
points, which meets a hyperplane once, counted by the regular-manifold normalisation.

**Checks.**
- On `ℂPⁿ`, `x^(n+1)` has degree `2n + 2` and `e^(−L)` has cochain degree `2c₁(L) = 2n + 2`.

*Needs:* §1.4, §7.4; GromovWittenTheory §7.2; ImplicitAtlases §5.6.

### 8.5 Odd classes on an aspherical torus

On `T^(2m)`, which is symplectically aspherical, prove `m₂(α, β) = −m₂(β, α)` on homology for classes
of degree one, the exchange sign `(−1)^(ab)` of §6.3.

**Checks.**
- On `T²` with `∫ α ⌣ β = 1`, an exchange without sign would give `α ⌣ β = β ⌣ α = −α ⌣ β`, so
  `2 α ⌣ β = 0`, false over `ℚ`.

*Needs:* §6.3, §8.1.

### 8.6 A finite-energy dense-period support example

On `S² × S²` with areas `1` and `√2`, where the period group is `ℤ²` with dense image of the area,
prove that the product coefficients are supported, below each valuation level, on finitely many
classes, by §6.1.

*Needs:* §6.1.

### Examples

- On `ℂP²`, the product of the hyperplane class with itself is the class of a point, and its cube is
  `e^(−L) · 1`.

### Dependencies

Layers 1–7; GromovWittenTheory §7.2; HeegaardFloer §1.9a; ImplicitAtlases §5.6.

## Scope and ownership

**This roadmap owns** the three-ended application of capped Floer theory on closed symplectic
targets: the pair-of-pants cap gluing, the regraded orientation lines and the coefficient comparison
on `X` (Layer 1); the perturbation and almost complex data on the punctured domains and their
families, with the curvature, linearisation and index (Layer 2); the energy identity, support bounds,
uniform curvature bounds and raw Gromov–Floer compactness for these domains (Layer 3); the classical
evaluation range, product-specific tree exclusion, gluing, orientations and sign normalisation
(Layer 4); the punctured implicit atlases, thickened gluing, coherent trace systems and the rational
supported cylinder and PSS package on every closed target (Layer 5); the counted product, its
Leibniz rule, continuation, exchange, associativity and unit homotopies and its independence of
choices (Layer 6); the Morse quantum operation, the comparison family and multiplicative PSS
(Layer 7); and the computations of Layer 8. It exports the labelled capped product moduli spaces
with their equation, energy, index and class identities, the ordered determinant maps, the compact
cutoff counts, the continuous supported bilinear maps, all the named homotopies and multiplicative
PSS.

**Already in Tau Ceti and consumed above, not planned again:** the period group, cap classes as
torsors, the product class with its recapping and sewing laws, the Floer Novikov ring with its
Laurent and `c₁`-zero models, the coefficient comparison and its descent; the regrading equivalence
`C^k = CF_(n−k)` and the degree of a supported product; the thrice-punctured sphere with its ends,
truncations and plumbing; the pair-of-pants perturbation (on any manifold target) and almost complex
data (for structures on a vector space), and their plumbed versions; the curvature, the energy
identity on rectangles, its invariance under coordinate change and its pair-of-pants form on a
vector-space target, the curvature bounds for necks, cutoffs, the pair of pants and the plumbed
sphere on a vector-space target; the local linearisation and the localised perturbation directions;
Gromov's graph construction; and the algebraic shell of the product, the kernel maps and kernel
products of completed Novikov modules with their completed tensor product and its universal
property, and the Leibniz, associativity, commutativity, continuation and unit homotopies that
follow from kernel identities. The period-controlled completed group ring that MorseNovikov Layer 1
plans is in Tau Ceti as `TauCeti.NovikovSeries`.

**Owned elsewhere and consumed.**

- DGFloer §7.C: the cap cover and its Γ-torsors, the period datum, cylinders, continuation, the ordered
  orientation conventions and the module PSS isomorphism on its positively spherically monotone and
  spherically `c₁`-zero branches. This roadmap consumes the supported complexes and both module
  inverse homotopies, not a bare isomorphism type. The DGFloer atoroidal, arbitrary-seam and
  Liouville targets stay with DGFloer on their own hypotheses; an application of the product to
  them needs its own relative cap and reference data and no-escape and sewing contracts, and is not
  a consequence of the closed theorem here.
- HeegaardFloer Layers 2–4: the Banach and Sobolev, punctured linear Fredholm, Conley–Zehnder,
  relative Chern, determinant and local curve theory at their hypotheses; HeegaardFloer Layer 1: the
  oriented Morse complex and its singular comparison, continuation, products and duality.
- AnalyticStableMaps Layer 3: unforced marked genus-zero stable-map compactness, evaluation and class
  splitting.
- GromovWittenTheory Layers 0 and 5–7: the closed stable-map invariants, the class group and Novikov
  ring, the unit, the ordered diagonal and left-dual conventions and the quantum ring. This roadmap
  does not rebuild that closed theory.
- ImplicitAtlases Layers 0–7: the implicit atlas, relative virtual complex, homology-level trace,
  refinement and concordance, cell-like and product strata and transverse diagonal.
- MorseTheory, AlgebraicTopology and DifferentialGeometry: the finite Morse core and gradient
  convergence, the fundamental class and Poincaré duality, forms, orientations and flows.
- DGAInfinity Layers 0–1: graded tensor, Hom, differential, shift and DG-algebra vocabulary.

**Outside this roadmap.** Contact and Reeb buildings and the contact and full symplectic field
theory levels belong to SymplecticFieldTheory; its count package is distinct from this Hamiltonian
application. The Lagrangian product `m₂` belongs to FukayaTheory. The closed quantum product here
asserts no product on every component of the group of symplectomorphisms, no full extended field
theory, no multiplicativity of symplectic homology or of the Viterbo isomorphism, and no invariant
of an unrestricted noncompact target.

## Exact supplier contracts

### From Mathlib

- `ChainComplex`, `CochainComplex` and `HomologicalComplex.homology`: the Floer complexes and their
  homology; `ComplexShape.up` and `ComplexShape.down` with Tau Ceti's embeddings for the regrading.
- `LaurentPolynomial` and `LaurentSeries`: the targets of the monotone coefficient models.
- `AddTorsor` and `AddAction.orbitRel.Quotient`: cap classes as torsors.
- `Real.smoothTransition`: the cutoff of the end perturbations and of `ρ` in §7.2.
- `Int.negOnePow`: the Koszul and exchange signs.

### From Tau Ceti

Assumed exactly as stated at the pin; each is applied with its own hypotheses.

- `TauCeti.SmoothTwoForm.IsSymplectic`, `TauCeti.SmoothTwoForm.Tames`,
  `TauCeti.SmoothTwoForm.Compatible`, `TauCeti.SmoothAlmostComplexStructure`
  (TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean, AlmostComplex/Basic.lean): the target and its
  almost complex structures.
- `TauCeti.Floer.PeriodGroup` (TauCeti/Geometry/Symplectic/Floer/PeriodGroup.lean), for an additive
  group with `ω : S →+ ℝ` and `c : S →+ ℤ`, the quotient by the joint kernel, with
  `TauCeti.Floer.PeriodGroup.area`, `TauCeti.Floer.PeriodGroup.degree` (twice the Chern number),
  `TauCeti.Floer.PeriodGroup.subsingleton_iff`, `TauCeti.Floer.PeriodGroup.isAddCyclic_of_area_eq_mul_chern`
  and `TauCeti.Floer.PeriodGroup.area_injective_of_chern_eq_zero`. Tau Ceti states these for an
  abstract group; §1.1–§1.2 apply them to `S_sph`.
- `TauCeti.Floer.CapClass` and `TauCeti.Floer.productClass` (TauCeti/Geometry/Symplectic/Floer/Cap/Basic.lean,
  Cap/Sewing.lean): cap classes as torsors over the period group, and the class `D₀ −ᵥ glue D₁ D₂` of
  a product coefficient for a given gluing map; `TauCeti.Floer.productClass_vadd_out`,
  `TauCeti.Floer.productClass_vadd_fst`, `TauCeti.Floer.productClass_vadd_snd`,
  `TauCeti.Floer.productClass_eq_add_sub`, `TauCeti.Floer.add_sub_add_map_productClass_eq`,
  `TauCeti.Floer.add_sub_add_two_mul_chern_productClass_eq`, `TauCeti.Floer.productClass_comp_fst`,
  `TauCeti.Floer.productClass_comp_snd` and `TauCeti.Floer.productClass_add_eq_add_iff`, each
  assuming equivariance of the gluing maps, which §1.1 proves for the geometric gluing.
- `TauCeti.Floer.NovikovRing` (TauCeti/Geometry/Symplectic/Floer/NovikovRing.lean, Laurent.lean):
  `NovikovSeries R (PeriodGroup ω c) (−area)` graded by the degree, with
  `TauCeti.Floer.NovikovRing.gradeBy_degree_zero_eq_top_of_chern_eq_zero`,
  `TauCeti.Floer.NovikovRing.ofLaurentPolynomial`,
  `TauCeti.Floer.NovikovRing.mem_range_ofLaurentPolynomial_iff` and
  `TauCeti.Floer.NovikovRing.toLaurentSeries` (for `ω = τ c`, `c ≠ 0`, `τ > 0`).
- `TauCeti.Floer.coefficientComparison` and `TauCeti.Floer.periodGroupComparison`
  (TauCeti/Geometry/Symplectic/Floer/CoefficientComparison.lean): the ring homomorphism
  `q^A ↦ e^(−q A)` for an area-preserving class map, and its instance for the joint-period quotient,
  with `TauCeti.Floer.continuous_coefficientComparison`,
  `TauCeti.Floer.chern_support_coefficientComparison` and
  `TauCeti.Floer.periodGroupComparison_single_eq_iff`.
- `TauCeti.NovikovSeries`, `TauCeti.NovikovSeries.mapRingHom`, `TauCeti.NovikovSeries.gradeBy`
  (TauCeti/RingTheory/NovikovSeries/): Novikov series, their pushforward along a class map with a
  positive rescaling of periods, and homogeneous pieces.
- `ChainComplex.regradeEquivalence`, `ChainComplex.regradeHomologyIso`, `ChainComplex.regradeIsoShift`
  (TauCeti/Algebra/Homology/Embedding/Regrade.lean): `C^k = K_(n−k)` with the same differential, as an
  equivalence of categories, with its homology isomorphisms and its compatibility with shifts.
- `TauCeti.Floer.kernelProduct_mem_cochain_gradeBy` (TauCeti/Geometry/Symplectic/Floer/Grading.lean): a
  supported product kernel of raw degree `−n` has cochain degree `0`.
- `TauCeti.ThricePuncturedSphere.Puncture.endCoord`,
  `TauCeti.ThricePuncturedSphere.Puncture.cylindricalEndLift`, `TauCeti.ThricePuncturedSphere.truncation`,
  `TauCeti.ThricePuncturedSphere.Puncture.plumbingMap`,
  `TauCeti.ThricePuncturedSphere.Puncture.plumbingMap_image_union`
  (TauCeti/Analysis/Complex/ThricePuncturedSphere/): the domain `ℂ ∖ {0, 1}`, its end coordinates,
  truncations and plumbing into a four-punctured sphere.
- `TauCeti.Floer.pairOfPantsPerturbation`, `TauCeti.Floer.contMDiffAt_pairOfPantsPerturbation`,
  `TauCeti.Floer.pairOfPantsPerturbation_cylindricalEndLift`, `TauCeti.Floer.plumbedPerturbation`,
  `TauCeti.Floer.pairOfPantsAlmostComplex`, `TauCeti.Floer.plumbedAlmostComplex`
  (TauCeti/Geometry/Symplectic/Floer/PairOfPants/): the end perturbation for three period-one
  Hamiltonians on a manifold, and the almost complex data for structures on a fixed symplectic
  vector space with a manifold parameter.
- `TauCeti.SymplecticForm.hamiltonianCurvature`, `TauCeti.SymplecticForm.hamiltonianCurvature_cylindrical`,
  `TauCeti.SymplecticForm.hamiltonianCurvature_mul`, `TauCeti.SymplecticForm.integral_floerEnergyDensity`,
  `TauCeti.SymplecticForm.mul_norm_sq_add_norm_sq_perturbedFDeriv_le_mul_floerEnergyDensity`
  (TauCeti/Geometry/Symplectic/Floer/Energy.lean, Cutoff.lean): the curvature, the energy identity on
  rectangles and the coercivity estimate for tame structures, on a symplectic vector space.
- `TauCeti.SmoothTwoForm.hamiltonianCurvature`, `TauCeti.SmoothTwoForm.floerEnergyDensity`,
  `TauCeti.SmoothTwoForm.floerEnergyDensity_nonneg`, `TauCeti.SmoothTwoForm.IsNondegenerate.floerEnergyDensity_eq`,
  `TauCeti.SmoothTwoForm.isComplexLinearMap_perturbedMFDeriv_iff`
  (TauCeti/Geometry/Symplectic/Floer/Manifold.lean): the curvature, energy density, pointwise energy
  identity and Floer equation on a manifold target.
- `TauCeti.SymplecticForm.hamiltonianCurvature_perturbationPullback`,
  `TauCeti.SymplecticForm.isComplexLinearMap_perturbedFDeriv_perturbationPullback`,
  `TauCeti.SymplecticForm.integral_floerEnergyDensity_image`
  (TauCeti/Geometry/Symplectic/Floer/Pullback.lean): coordinate-change laws.
- `TauCeti.SymplecticForm.hamiltonianAction`,
  `TauCeti.SymplecticForm.integral_floerEnergyDensity_eq_hamiltonianAction_sub`
  (TauCeti/Geometry/Symplectic/Floer/Action.lean): action and the energy of a cylinder.
- `TauCeti.Floer.neckStretch`, `TauCeti.SymplecticForm.integral_abs_hamiltonianCurvature_neckStretch_le`,
  `TauCeti.SymplecticForm.integral_abs_hamiltonianCurvature_const_mul_le`,
  `TauCeti.SymplecticForm.lintegral_enorm_hamiltonianCurvature_pairOfPantsPerturbation_le`,
  `TauCeti.SymplecticForm.integral_floerEnergyDensity_pairOfPantsPerturbation_truncation`,
  `TauCeti.SymplecticForm.lintegral_enorm_hamiltonianCurvature_plumbedPerturbation_le`
  (TauCeti/Geometry/Symplectic/Floer/Neck.lean, Cutoff.lean, PairOfPants/Curvature.lean,
  PairOfPants/Plumbing.lean): curvature bounds uniform in neck length and cutoff, and the
  pair-of-pants and plumbed bounds, on a vector-space target.
- `TauCeti.SymplecticForm.floerLinearization`, `TauCeti.SymplecticForm.fderiv_floerOperator_apply`,
  `TauCeti.SymplecticForm.exists_contDiff_floerOperator_add_const_mul_left`
  (TauCeti/Geometry/Symplectic/Floer/Linearization.lean, Perturbation.lean): the local linearisation
  and the localised perturbation directions, at the coordinate level.
- `TauCeti.SymplecticForm.floerGraphAlmostComplex`,
  `TauCeti.SymplecticForm.isJHolomorphicAt_graph_floerGraphAlmostComplex_iff`
  (TauCeti/Geometry/Symplectic/Floer/Graph.lean): Gromov's graph construction.
- `TauCeti.SymplecticForm.Invariant.isComplexLinearMap_perturbedFDeriv_comp_fst_iff`
  (TauCeti/Geometry/Symplectic/Floer/TimeIndependent.lean): time-independent Floer solutions are
  gradient lines.
- `TauCeti.NovikovModule` and `TauCeti.NovikovModule.kernelMap`, `TauCeti.NovikovModule.kernelProduct`,
  `TauCeti.NovikovModule.novikovKernelProduct`, `TauCeti.NovikovModule.kernelMatrix`,
  `TauCeti.NovikovModule.coordinates_kernelProduct`, `TauCeti.NovikovModule.continuous_kernelProduct`,
  `TauCeti.NovikovModule.tensorDifferential`, `TauCeti.NovikovModule.externalProduct`,
  `TauCeti.NovikovModule.lift`, `TauCeti.NovikovModule.lift_unique` (TauCeti/RingTheory/NovikovModule/):
  completed combinations on torsor orbits with a potential, maps and bilinear products given by
  kernels with a potential bound and finite output support, their reference-cap matrices, continuity,
  the Koszul tensor differential and the completed external product with its universal property.
- `TauCeti.NovikovModule.kernelMap_kernelProduct_eq_add`,
  `TauCeti.NovikovModule.kernelMap_kernelProduct_sub_kernelProduct_kernelMap_of_mem_gradeBy`,
  `TauCeti.NovikovModule.cohomologyMap_cohomologyProduct_kernelProduct`,
  `TauCeti.NovikovModule.kernelProduct_sub_negOnePow_smul_kernelProduct_of_tensorDifferential`,
  `TauCeti.NovikovModule.kernelProduct_kernelProduct_sub_kernelProduct_kernelProduct_of_mem_gradeBy`,
  `TauCeti.NovikovModule.kernelProduct_sub_kernelMap_right`,
  `TauCeti.NovikovModule.kernelProduct_sub_kernelMap_left`,
  `TauCeti.NovikovModule.cohomologyProduct_kernelProduct_unit_mk`,
  `TauCeti.NovikovModule.cohomologyProduct_kernelProduct_mk_unit` (TauCeti/RingTheory/NovikovModule/):
  each turns a kernel identity, the boundary count of a one-dimensional family, into the Leibniz
  rule or the corresponding chain homotopy, and into the statement on cohomology. The kernel
  identities and potential bounds are hypotheses of these theorems; Layers 3–6 prove them.

### From TauCetiRoadmap.DGFloer

- §7.C.1: the spherical periods, `Γ`, the cap cover and its Γ-torsors with recapping, gluing and
  reference-cap maps, and the finiteness of the nondegenerate contractible orbits.
- §7.C.2a: ordered determinant kernels, count functionals and family conventions; §7.C.2b: raw
  continuation sections with finite `∫ sup_X |∂_s H|`; §7.C.3, §7.C.3a, §7.C.3c: raw compactness,
  conditional gluing, exclusion and face-flat relative perturbations for cylinders; §7.C.4: coherent
  counts and continuation; §7.C.5b: the PSS maps and both inverse homotopies; §7.C.6: geometric
  support and completed matrices. Assumed on the positively spherically monotone and spherically
  `c₁`-zero branches only.

### From TauCetiRoadmap.HeegaardFloer

- Layer 1 (§1.3, §1.4, §1.5, §1.9, §1.9a): integral orientations of the Morse complex, its geometric
  comparison with singular homology, continuation, products and duality, and the geometric Morse cup
  product.
- Layer 2 (§2.2): generic Fredholm maps, sections and determinant lines, with their differentiability
  budgets.
- Layer 3 (§3.1, §3.4, §3.5): Sobolev adapters, Maslov and Conley–Zehnder conventions and determinant
  lines, Riemann–Roch with weighted ends.
- Layer 4 (§4.2–§4.5, §4.6a–§4.6d): local theory, compactness, transversality, gluing and sphere
  domains, simple maps and their energy.

### From TauCetiRoadmap.AnalyticStableMaps

- §3.7: Gromov compactness of the coarse stable-map space for fixed genus, marks and class over a
  compact tame family; Layer 3 here constructs its attached, fixed-asymptotic and varying frozen-`J`
  application.

### From TauCetiRoadmap.MorseNovikov

- Layer 1 (§1.1, §1.2, §1.5): finite-sublevel completion, convolution, continuous pushforward and
  finite-orbit modules, consumed through their Tau Ceti carriers `TauCeti.NovikovSeries` and
  `TauCeti.NovikovModule`; Layers 3 and 6 here prove the geometric support hypotheses, Layers 1 and 7
  the coefficient comparison.

### From TauCetiRoadmap.GromovWittenTheory

- §0.1–§0.2: the class group `H₂(X; ℤ)` with area and Chern maps and the Novikov ring `Λ_ω` with
  `deg q^A = 2c₁(A)`; §5.2: the fundamental-class identity and the unit; §6.1: the Casimir and the
  ordered diagonal; §7.1–§7.2: the three-point classes and the quantum product with the left-dual
  convention, and its `ℂP¹` and `ℂP²` computations.

### From TauCetiRoadmap.ImplicitAtlases

- §1.1–§1.2: implicit atlases with boundary; §4.2–§4.3: the global relative trace and the rational
  virtual class; §5.2–§5.3: boundary, cobordism and refinement laws; §5.6: regular-manifold
  normalisation; §6.1–§6.4: cell-like strata and product atlases; §7.1–§7.4: fiber products over a
  manifold, the supported Gysin map and the application interface, for boundaryless manifolds.

### From TauCetiRoadmap.MorseTheory, TauCetiRoadmap.AlgebraicTopology and TauCetiRoadmap.DifferentialGeometry

- MorseTheory Layers 1–2 and 6: the finite Morse core and gradient convergence.
- AlgebraicTopology §6.2–§6.4: cup products, fundamental classes and Poincaré–Lefschetz duality.
- DifferentialGeometry Layers 0–3 and 9: forms, orientations, flows and Poincaré duality.

### From TauCetiRoadmap.DGAInfinity

- Layers 0–1: signed graded tensor, Hom, differential and shift conventions and DG algebras.

## References

- S. Piunikhin, D. Salamon and M. Schwarz, *Symplectic Floer–Donaldson theory and quantum
  cohomology*, in *Contact and symplectic geometry*, Publ. Newton Inst. 8, Cambridge University
  Press (1996), 171–200: the comparison of Floer cohomology with quantum cohomology (Layer 7).
