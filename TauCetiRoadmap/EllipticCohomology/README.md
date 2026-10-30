# Roadmap: elliptic cohomology and topological modular forms

**Summary.** Construct elliptic cohomology theories and the topological modular-form
spectra tmf, Tmf and TMF, with their sheaves, coefficients, orientations and
q-expansion comparisons. Include the algebraic and obstruction-theoretic
foundations of the realization theorem. A ring of modular forms is not a
spectrum, and a Landweber-exact theory does not automatically have an E∞
structure.

## Scope and ownership

BordismFormalGroups F4 supplies every Toda operation used here: three-fold
brackets of spectra and of right modules over a ring spectrum, the
higher-arity coherent systems and their reversal and juggling comparisons.
No other Toda-bracket supplier is used.

Use GeneralizedCohomology's chosen spectral models, commutative spectral rings,
derived limits and Postnikov/connective-cover machinery. BordismFormalGroups
owns the native formal-group, MU/BP, exact-functor and algebraic Lubin–Tate
deformation theory and F6's Bousfield/chromatic localization. ModularCurves
owns elliptic schemes over arbitrary bases, their Weierstrass presentation,
effective descent, complete-local formal completions, p-divisible groups and
its specified Serre–Tate comparison. EllipticCurves Layer 1(i) supplies the
formal group law over the coefficient ring; this roadmap owns its descent
under coordinate changes and the residue-field descent required below.
Consume SchemeAndStackFoundations §§1.18–1.22 for stacks, presentations,
quasi-coherent modules and descent, and §4.15's `StableCurves.Mbar 1 1`,
smooth locus, proper DM structure, node-smoothing coordinates and level
normalizations. Reuse Mathlib's schemes, étale
sites, `Pseudofunctor.IsStack`, `DescentData`,
`SheafOfModules.IsQuasicoherent`, `WeierstrassCurve` and `FormalGroup`.

ModularForms owns the analytic modular forms and q-expansions; this roadmap
owns their algebraic stack sections and the comparison with that analytic
theory. This roadmap owns the E∞ String bordism spectrum MString, the Thom
spectrum of the 7-connected cover BString=BO⟨8⟩→BO, the Ando–Hopkins–Rezk
E∞ orientation σ:MString→tmf, and the characteristic series and q-expansion
of σ on π_*MString, which is the Witten genus in spectral form. Geometric
String structures, geometric String bordism, the index-theoretic Witten
genus of String manifolds and the Cayley-plane kernel questions are not
constructed here; a geometric consumer compares its genus with E5's
spectral one. Neither the orientation nor the genus constructs the elliptic
sheaf or proves its existence.

## Conventions

Write Gk for GeneralizedCohomology Gk and Fk for BordismFormalGroups Fk.
All rings are commutative; coefficient rings and test schemes range in a
fixed universe, with universe-lift comparisons for the sheaf constructions.
A prime-local assertion is labelled by its prime; the global construction
includes every prime.

Let M_ell be the stack of smooth elliptic curves and Mbar_ell its
proper compactification of stable one-pointed genus-one curves over ℤ:
its geometric fibres are smooth elliptic curves or the Néron 1-gon.
Generalized n-gons with level structure belong to E6, with contraction to
this level-one compactification.
Let ω be the Hodge line. Construct
TMF=RΓ(M_ell,O^top), Tmf=RΓ(Mbar_ell,O^top),
and tmf=τ_(≥0)Tmf, with the designated commutative-ring models and maps.
At level one use the ordinary étale site of Mbar_ell, including its nodal
curves, as in the chosen DFHH construction. E6 constructs the log-étale
level extensions and their comparison with this sheaf.
Weight k corresponds to spectral degree 2k. These spectra are distinct;
negative homotopy, torsion and periodic localization must be compared through
their actual maps.

## Exact supplier contracts

### From Mathlib

Consume `WeierstrassCurve` and its coefficient invariants from
Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean; this five-coefficient
carrier allows singular cubics, while `WeierstrassCurve.IsElliptic`
requires an invertible discriminant. Consume `WeierstrassCurve.VariableChange`,
`WeierstrassCurve.variableChange_def`, `variableChange_c₄`,
`variableChange_c₆`, `variableChange_Δ`, `VariableChange.mapHom` and
`map_variableChange` from Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean,
with their commutative-ring hypotheses and inverse powers of the unit.
Polynomial evaluation, subalgebras and weight grading use `MvPolynomial.aeval`,
`Algebra.adjoin` and `MvPolynomial.IsWeightedHomogeneous`.
Consume `FormalGroup` and the separate `FormalGroup.IsComm` condition from
Mathlib/RingTheory/FormalGroup/Basic.lean, the stack predicate
`Pseudofunctor.IsStack`, `DescentData`, and `SheafOfModules.IsQuasicoherent`;
these are carrier/descent interfaces, not a constructed elliptic stack.
For continuous functions use `mahler`, `PadicInt.hasSum_mahler` and
`PadicInt.mahlerEquiv` from Mathlib/NumberTheory/Padics/MahlerBasis.lean,
retaining completeness, the ultrametric norm and bounded ℤ_p action.
Use `Matrix.orthogonalGroup` from Mathlib/LinearAlgebra/UnitaryGroup.lean
for E5's finite orthogonal groups.

### From Tau Ceti

No Tau Ceti declaration is used by the target signatures. The mathematical
constructions below use the named roadmap contracts as well as Mathlib.

### From TauCetiRoadmap.GeneralizedCohomology

G2 supplies the chosen enriched spectral and commutative-ring models;
G2.5 supplies Freudenthal and spectral/topological comparisons, and G2.8
supplies multiplicative construction and localization. G3.8 supplies
derived tower limits, their Milnor sequence and connective/Postnikov
covers. G5.3 supplies Thom diagrams and G5.4 supplies ko, KO and MSpin;
G5.5-ABS supplies the E∞ Atiyah–Bott–Shapiro orientation and its normalization.

### From TauCetiRoadmap.BordismFormalGroups

F1–F3 supply formal groups, MU/BP and the Steenrod comparisons; F4 supplies
graded comodules, resolutions, the Adams–Novikov spectral sequence and
coherent Toda systems with their chosen nullhomotopies. F5 supplies
Landweber exactness and marked Lubin–Tate deformations over perfect fields;
F6 supplies chromatic localization, fracture and the local norm/completion
comparisons. Spectral realization of the elliptic inputs is E2's target.

### From TauCetiRoadmap.ModularCurves

Layers 0–2 supply elliptic schemes, their Weierstrass presentations and
effective descent; §5B supplies ordered full level with its determinant
character, without fixing a Weil pairing. §§7C–7F supply complete-local
formal groups, p-divisible groups and the marked Serre–Tate comparison
in their stated residue-field setting. Layer 10 supplies its coarse
compactification; E6 compares the generalized-elliptic boundary stacks.

### From TauCetiRoadmap.SchemeAndStackFoundations

§§1.18–1.22 supply stackification, 2-fibre products, presentations and
quasi-coherent modules. §4.15 supplies the stable pointed-curve stack,
its smooth locus and nodal charts; (g,n)=(1,1) satisfies 2g−2+n=1>0.

### From TauCetiRoadmap.EllipticCurves and TauCetiRoadmap.ModularForms

EllipticCurves Layer 1(i) supplies the curve's formal group law.
ModularForms' standing conventions, library comparison and Layer 1
supply the analytic level-one forms and their q-expansions and valence
principle; E1 constructs the integral algebraic comparison.

## How to read the build

E1 and F5's deformation and F6's localization lanes precede E2. E2 plus E1 descent supplies E3;
E6’s early log-level construction then supplies E4’s synthetic transfers;
E4.S independently constructs the needed sphere classes, relations,
nullhomotopies and 3-primary differential using F4. E4.A constructs the
full/even category adapters and synthetic sphere, then Smf and E4.U's
unit/normalization/atomic comparisons. These and the early E6 lane
supply E4's independent DSS/Gap computation; completed tmf coefficients
are not inputs. After the Gap Theorem E6 proves the connective DA(1)
comparison. E5 uses E3/E4 and E6’s independently constructed Γ₁(3)/DA(1)
sublane; its MString, units and J-homomorphism targets use only G2–G5,
and its orientation, genus and surjectivity targets use those together
with E2's K(1)-local realization. E6’s early lane uses E1–E3 and the
specified ModularCurves level problems; its connective coefficient lane
additionally uses E4. All obstruction, convergence and descent inputs are
targets in these layers.

## Layer 1: E1. Algebraic moduli and its formal neighbourhoods

Construct the equivalence of ModularCurves' elliptic-scheme moduli functor
with §4.15's smooth locus M_(1,1), preserving the marked identity,
group law and isomorphisms. Consume its fppf descent, representable
unramified diagonal and étale atlases on §1.18's stack carrier.
Consume its generic 2-fibre products, atlas-independent descent and
§1.22's quasi-coherent stack modules. Identify the elliptic instances and
their étale/fppf comparisons; retain the moduli groupoid over each test
scheme, its automorphisms and pullbacks.

*Needs:* ModularCurves Layers 0–2's elliptic-scheme moduli and descent;
SchemeAndStackFoundations §§1.18–1.22 and §4.15's smooth genus-one locus.

**Checks.**
- Over ℚ the pointed curve y²=x³−x has the two distinct automorphisms
  identity and [−1]; the moduli comparison keeps both arrows, whereas
  passing to the j-invariant makes both into the identity of one point.
- Pullback along the identity on Spec R leaves the coefficients and marked
  identity unchanged; two successive base changes R→S→T evaluate each
  coefficient by the composite R→T, not by an inverse map.
- The nodal y²=x³+x² over ℚ belongs to Mbar_ell but not its smooth locus;
  its cusp degeneration y²=x³ belongs to neither. Thus neither all cubics
  nor only their j-values is the required elliptic moduli groupoid.

Own the small étale site of these DM stacks: representable étale test
schemes, fibre products, jointly surjective covering families and atlas
refinements. Construct its sheaf/module categories, derived global
sections and hypercover descent, and the comparison of quasi-coherent
cohomology with the atlas nerve and its normalized cobar complex.
Prove independence of the étale atlas and comparison with the smooth
Weierstrass presentation, including derived base change with its stated
flatness hypotheses. Construct local cohomology with support, its
localization triangle and long exact sequence. These are stack targets
here; the scheme/algebraic-space site and cohomology suppliers do not
already give them. Construct the compactified stack's coherent trace
and derived duality comparisons needed in E4. After inverting 6 identify
the dualizing line as ω^(−10) with cohomological shift 1 and prove the
perfect pairing of finitely generated projective ℤ[1/6]-modules
`H⁰(ω^k)⊗H¹(ω^(−10−k))→H¹(ω^(−10))≃ℤ[1/6]`.
Integrally construct the
presentation resolutions and retain all higher stabilizer cohomology
and derived torsion terms in the trace/duality comparison; do not replace
them with a perfect H⁰/H¹ pairing or a cohomological-dimension-one claim.

*Needs:* SchemeAndStackFoundations §§1.18–1.22's descent and quasi-coherent
modules; §4.15's stable genus-one stack; E1's moduli comparison.
The site, cohomology and duality constructions use the atlas/cobar route
of Goerss §3 and CDvN §4.1, with the integral stabilizers retained.

**Checks.**
- For the identity atlas, the augmented Čech nerve contracts to the
  original sheaf: its degree-zero equalizer is the original module and
  its higher Čech cohomology is zero. For the empty test scheme, sections
  of a module are zero; an empty family does not cover a nonempty chart.
- For an affine chart Spec A with its quasi-coherent module M, derived
  sections have H⁰=M and H¹=0; adjoining the identity chart to a cover
  leaves both values unchanged. This tests refinement and normalization.
- Local cohomology with empty support is zero and restriction to the
  complement is the identity; with full support it is the original
  complex and the complement contributes zero. These give respectively
  the triangles 0→C→C and C→C→0.
- Away from 6, H⁰(O)=ℤ[1/6] pairs with H¹(ω⁻¹⁰)=ℤ[1/6] by 1⊗1↦1.
  H¹(O)=0 there; replacing ω⁻¹⁰ by O makes this pairing zero.
  For a trivial C₂-action on ℤ, H²(C₂,ℤ)=ℤ/2, so integral stabilizer
  cohomology cannot be discarded by copying that dimension-one formula.

Consume the Weierstrass change-of-variable group and discriminant-open
presentation. Prove this is a smooth atlas, its groupoid presentation and
comparison with the étale atlas, including local coordinates and their
line-bundle descent. Define ω, c₄∈H⁰(ω⁴), c₆∈H⁰(ω⁶), Δ∈H⁰(ω¹²),
with c₄³−c₆²=1728Δ, their coordinate weights and base-change laws.
Use native `WeierstrassCurve` on the atlas and its `IsElliptic` instance.

**Checks.**
- On the Γ₁(3) form y²+a₁xy+a₃y=x³ the native invariants are
  c₄=a₁⁴−24a₁a₃, c₆=−a₁⁶+36a₁³a₃−216a₃² and Δ=a₁³a₃³−27a₃⁴; at
  (a₁,a₃)=(0,1) they are (0,−216,−27) and at (1,0) they are (1,−1,0),
  and c₄³−c₆²=1728Δ holds at both (−46656=1728·(−27) and 1−1=0). The
  opposite discriminant sign, used in part of the literature, gives
  c₄³−c₆²=−1728Δ and fails the first instance.
- The sign of c₆ is invisible to the relation c₄³−c₆²=1728Δ; it is pinned
  by the Tate curve, whose c₆ has q-expansion −E₆(q)=−1+504q+…, as in
  E4's q-expansion pin. The convention c₆=b₂³−36b₂b₄+216b₆ gives the
  constant term +1 and is excluded.
- Under the scaling C=(u,0,0,0) the native laws give c₄↦u⁻⁴c₄,
  c₆↦u⁻⁶c₆ and Δ↦u⁻¹²Δ, so c₄,c₆,Δ have weights 4,6,12 for the
  transformation law u⁻ᵏ of a weight-k section; reading the weights off
  u⁴,u⁶,u¹² contradicts the invariant-differential law
  φ_C*ω_W=u⁻¹ω_(C•W) below.
- The nodal cubic y²=x³+x² has (c₄,c₆,Δ)=(16,−64,0) and lies in the
  compactified stack but not in M_ell; the cuspidal cubic y²=x³ has
  c₄=c₆=Δ=0 and lies in the excluded locus V(c₄,Δ); the elliptic curve
  y²=x³+1 has c₄=0 and Δ=−432. So the compactified locus is where
  (c₄,Δ) generates the unit ideal: Δ≠0 alone excludes the nodal curve and
  c₄≠0 alone excludes y²=x³+1.

*Needs:* E1's moduli/site comparison; ModularCurves' Weierstrass
presentation; Mathlib `WeierstrassCurve.c_relation`, `variableChange_c₄`,
`variableChange_c₆` and `variableChange_Δ`.

Consume the stable genus-one compactification and labelled nodal charts
from §4.15 and construct their comparison with one-component generalized
elliptic curves. Extend ω and Δ through these supplied curves and
coordinate transitions. E6 owns logarithmic structures and n-gon/level
comparisons on this same compactification; it does not reconstruct its
proper DM property. Construct the cubic stack
`M_cub=[Spec ℤ[a₁,a₂,a₃,a₄,a₆]/G]`. Define the coordinate-change
group scheme G=Spec ℤ[u,u⁻¹,r,s,t] by x=u²x′+r and
y=u³y′+su²x′+t. Identify its R-points with native
[`WeierstrassCurve.VariableChange`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean).
Use its group multiplication and left action on coefficients: the product is
`(u,r,s,t)(v,R,S,T)=(uv,rv²+R,vs+S,tv³+rSv²+T)`.
For the curve morphism φ_(C,W):C•W→W given by
`(x′,y′)↦(u²x′+r,u³y′+su²x′+t)`, prove
`φ_(CC′,W)=φ_(C′,W)∘φ_(C,C′•W)`: it is
an anti-homomorphism, giving the native left action C•W on coefficients.
An arrow has source W and target C•W; applying C′ first and then C
has composite CC′. Set A=ℤ[a₁,a₂,a₃,a₄,a₆] and
Γ=A[u,u⁻¹,r,s,t]. Pin η_L to the source coefficients and η_R to
native `WeierstrassCurve.variableChange_def`. In Γ⊗_AΓ, with the
left factor the first arrow and right factor the second, pin
`Δu=u₁u₂`, `Δr=r₁+u₁²r₂`, `Δs=s₁+u₁s₂` and
`Δt=t₁+u₁³t₂+s₁u₁²r₂`. Prove the unit, counit, inverse and
cobar/groupoid comparisons in this order.
For the invariant differential, prove φ_C*ω_W=u⁻¹ω_(C•W).
Thus the new trivialization is u times the pulled-back old one, and
a weight-k coefficient transforms by u⁻k. Consume native
`variableChange_c₄`, `variableChange_c₆`, `variableChange_Δ`,
`VariableChange.mapHom` and `map_variableChange` for R-point weights
and base change. Own the group-scheme representability and descent
comparison of these native laws. Give the explicit dictionary to Bauer's
Hopf-algebroid/cobar conventions, including this arrow/composition order,
right unit, invariant-differential character and c₆ normalization; use
E4's fixed native q-expansion to identify any reference sign change. The u=1
subgroup is the noncommutative central extension of 𝔾ₐ² by 𝔾ₐ
with t-cross-term rS; G is its
semidirect product with 𝔾ₘ, rather than with an additive 𝔾ₐ³. Own Riemann–Roch and cohomology/
base-change for O(2e) and O(3e) on the smooth and nodal stable genus-one
families used to construct this presentation. Prove the compactified
one-pointed stable elliptic stack identifies with the open locus where
(c₄,Δ) generates the unit ideal: its geometric fibres are smooth or
nodal, and the excluded locus V(c₄,Δ) is cuspidal. Construct the open
immersion and line-bundle comparison. Prove this excluded support has
codimension two in the smooth cubic atlas, with the depth-two extension
criterion equivariantly under the coordinate-change group, and deduce
the Hartogs comparison on H⁰(ω^k) before computing those sections.

*Needs:* SchemeAndStackFoundations §4.15's nodal charts; E1's site,
cohomology and Hodge line; ModularCurves' Weierstrass presentation;
Mathlib `WeierstrassCurve.variableChange_def`, `VariableChange.mapHom`
and `map_variableChange`. The cubic presentation and its invariant ring
follow Bauer §3 and Goerss §3.1.

**Checks.**
- For u=v=1, C=(1,1,0,0) and C′=(1,0,1,0), CC′=(1,1,1,1),
  but C′C=(1,1,1,0). The difference of 1 in t excludes an additive
  three-dimensional unipotent subgroup and tests the coproduct order.
- The identity (1,0,0,0) fixes all five coefficients and ω. Over ℚ,
  (2,0,0,0) multiplies the differential pullback by 1/2 and the c₄
  coefficient by 1/16; using 2 and 16 reverses the action.
- On the dual numbers ℚ[ε]/(ε²), C=(1,ε,0,0) sends a₂=0 to 3ε;
  its inverse sends 3ε back to 0. A construction using only geometric
  points loses this nonzero infinitesimal coordinate change.
- On a smooth genus-one curve, and on the pointed nodal rational cubic,
  h⁰(O(2e))=2 and h⁰(O(3e))=3, with h¹=0 in both cases. These ranks
  supply the same Weierstrass presentation through the boundary.
- In the universal coefficient ring, the excluded cusp V(c₄,Δ) has
  codimension two, while the discriminant divisor has codimension one. Inverting Δ alone deletes the nodal cubic (16,−64,0), so it cannot
  give the compactified H⁰ comparison.

Compute the Weierstrass Hopf-algebroid/cobar comparison with the supplied
stack cohomology. Prove the integral algebraic modular-form ring is
H⁰(Mbar_ell,ω^*)=ℤ[c₄,c₆,Δ]/(c₄³−c₆²−1728Δ), with weights 4,6,12, and its
ℤ[1/6] presentation. In Hopf-algebroid form this is Deligne's computation
of the invariants of (A,Γ) (Bauer, *Computation of the homotopy of the
spectrum tmf*, §3), stated on the universal curve `universalWeierstrass`
over ℤ[a₁,a₂,a₃,a₄,a₆]: a polynomial f in the five coefficients, evaluated
on a curve W over a commutative ring by `evalCoeff`, is an integral
modular form of weight k (`IsIntegralModularForm`: f(C•W)=u⁻ᵏf(W) for
every coordinate change C over every commutative ring) exactly when f lies
in the subring ℤ[c₄,c₆,Δ] and is weighted homogeneous of weight k for the
weights `coefficientWeight`=(1,2,3,4,6) of a₁,a₂,a₃,a₄,a₆
(`isIntegralModularForm_iff`); and the kernel of ℤ[C₄,C₆,D]→ℤ[a₁,…,a₆],
C₄,C₆,D↦c₄,c₆,Δ, is the principal ideal (C₄³−C₆²−1728D)
(`ker_aeval_c₄_c₆_Δ`). The relation holds by native
`WeierstrassCurve.c_relation`; the converse inclusion uses that c₄ and c₆
are algebraically independent (at a₁=a₂=a₃=0 they are −48a₄ and −864a₆)
and that ℤ[C₄,C₆,D]/(C₄³−C₆²−1728D) is ℤ-torsion-free, the relation being
a primitive polynomial. The weight condition is forced by the scalings
C=(u,0,0,0) over ℤ[u,u⁻¹]; the quantification over all coefficient rings
matters, since over ℤ alone u=±1 separates weights only modulo 2. The
compactified-stack form follows through the depth-two Hartogs comparison
above.

**Checks.**
- c₄ is an integral modular form of weight 4 and of no other weight: its
  monomials a₁⁴, a₁²a₂, a₂², a₁a₃ and a₄ have weight 4, and
  c₄(C•W)=u⁻⁴c₄(W) by the native law.
- c₄+Δ lies in ℤ[c₄,c₆,Δ] but is an integral modular form of no weight:
  under C=(u,0,0,0) it becomes u⁻⁴c₄+u⁻¹²Δ, which is no single power of
  u⁻¹ times c₄+Δ. A weight-free statement, membership in ℤ[c₄,c₆,Δ]
  equivalent to having some weight, is therefore false, and the theorem
  is stated weight by weight.
- a₁ and b₂=a₁²+4a₂ are weighted homogeneous of weights 1 and 2 but not
  invariant: a₁(C•W)=u⁻¹(a₁+2s) and b₂(C•W)=u⁻²(b₂+12r); the subring
  ℤ[c₄,c₆,Δ] has no nonzero element of weight 1, 2 or 3.
- The zero polynomial has every weight and 1 has weight 0 only. With the
  coefficient ring restricted to ℤ, u=±1 and 1 would also pass the
  weight-4 test, so a definition quantified over ℤ-points alone is wrong.

*Needs:* E1's cubic groupoid, Hodge descent and depth-two extension;
Mathlib `MvPolynomial.aeval`, `Algebra.adjoin`,
`MvPolynomial.IsWeightedHomogeneous` and `WeierstrassCurve.c_relation`.
The universal curve and coefficient evaluation have the following API:
- Evaluating its five coordinate polynomials on W returns W's five
  coefficients, and evaluation preserves sums, products and integer constants.
- Weight-k invariance is preserved under addition and scalar multiplication;
  the product of weights k and l has weight k+l over every commutative ring.
- Coefficient weights are 1,2,3,4,6; they grade the integral invariant
  subring and its presentation by the displayed homogeneous relation.

**Checks.**
- Evaluating the universal curve at (0,0,0,−1,0) returns y²=x³−x;
  evaluation of a₄ is −1, not the fourth entry of a reordered list.
- Evaluation of 1+a₁a₃ at (a₁,a₃)=(2,3) is 7 and evaluation of zero is
  zero, also over the zero ring; the predicate still quantifies over
  every ring, so testing the zero ring alone proves no invariance.
- The weights of a₁a₃ and a₄ both equal 4, while a₆ has weight 6;
  an unweighted total-degree convention would give 2,1,1.

Compare over ℂ with ModularForms' level-one
analytic forms through the Tate q-expansions, the ring presentations and
q-expansion injectivity, including holomorphy at the cusp and the integral
lattice. This specifies the comparison without assuming an unnamed
complex uniformization theorem.

*Needs:* E1's integral invariant-ring calculation and Hodge descent;
ModularForms' level-one q-expansion theory; E1's Tate construction below
for the comparison route (Goerss §3.1).

**Checks.**
- The weight-zero constant 1 maps to the analytic constant 1; c₄ has
  first coefficients 1+240q and c₆ has −1+504q. These detect the c₆ sign.
- Δ begins q−24q², so it vanishes once at the cusp, while Δ⁻¹ begins
  q⁻¹+24 and fails holomorphy there.
- In weight 12, c₄³−c₆² begins 1728q; 1728Δ has the same coefficient.
  Omitting the cusp condition would admit negative powers of Δ.

Construct the formal generalized Tate 1-gon over ℤ[[q]], its canonical
differential, and its smooth Tate curve after inverting q. Identify the
latter over ℤ[1/N]((q)) with ModularCurves' Tate curve and level maps.
Construct the formal cusp neighbourhood and transition maps; the formal
multiplicative group belongs to the smooth identity component, including
at q=0. Prove the ordinary height 1 and supersingular height 2 strata and
their formal deformation comparison, including p=2,3. Consume
ModularCurves' algebraically closed residue-field Serre–Tate theorem and
F5's algebraic Lubin–Tate deformation. Construct the Tate–Messing
equivalence between deformations of a connected p-divisible group and
its formal group, preserving the marked special fibre and the chosen
coordinate. Pass from the artinian comparison to complete local rings
by compatible inverse limits and effective formal deformation, and
prove the elliptic algebraization comparison. Then prove descent along separable
residue-field extensions and the resulting perfect-field comparison with
its automorphism data. This descent precedes the spectral realizations.
Separate the supersingular and ordinary cases. At supersingular points
C[p^∞] is connected, so Def(C)≃Def(Ĉ) by Serre–Tate and Tate–Messing.
At an ordinary point, Serre–Tate identifies Def(C) with deformations of
the full connected–étale p-divisible extension. The map to the height 1
connected formal-group deformation is formally smooth of relative
dimension 1, with the extension's Serre–Tate parameter; it is not an
equivalence. Prove these two statements with their marked special-fibre
and residue-field descent data. The nodal Tate chart uses its separately
constructed q-parameter and multiplicative identity component.

*Needs:* ModularCurves §§7C–7F's formal completions and marked
Serre–Tate comparison; EllipticCurves Layer 1(i)'s formal group;
BordismFormalGroups F5's algebraic deformation theory; E1's nodal charts
and differential descent (Goerss §§3.2–3.3 and §4.3).

**Checks.**
- At q=0 the Tate chart has multiplicative identity component with
  formal law X+Y+XY; its 2-series in characteristic 2 is X² and its
  3-series in characteristic 3 is X³. The additive law has zero p-series
  and gives the wrong height.
- Over an algebraically closed field of characteristic p, a height-two
  formal group has deformation ring W(k)[[u₁]], whereas height one has
  W(k). Ordinary elliptic deformations retain one extra extension
  parameter, so forgetting that extension cannot be an equivalence.
- Over k[ε]/(ε²) the ordinary Serre–Tate parameters 1 and 1+ε give two
  marked extension deformations with the same connected formal group.
  The cusp parameters 0 and ε likewise differ although their geometric
  special fibres agree; inverse-limit descent must retain them.

### Examples

The Γ₁(3) invariants, nodal/cuspidal cubics and dual-number coordinate changes
above test the stack, Hodge and formal-deformation constructions.

### Dependencies

E1 uses the algebraic supplier contracts above; its analytic comparison
uses its Tate chart after that chart is constructed.

## Layer 2: E2. Elliptic theories and local spectral realization

For a generalized elliptic curve E with irreducible geometric fibres
(smooth elliptic curves or Néron 1-gons) over a ring R with a chosen Hodge-line
trivialization, construct its formal group on the native carrier and
the graded periodic coefficient ring R[u,u⁻¹], |u|=2. Prove the
Landweber condition when the classified map Spec R→Mbar_ell is flat,
using F5: for each prime p, p is injective on R, v₁ is injective on
R/p, and v₂ is a unit on the height 2 quotient (higher quotients vanish).
Identify v₁ with the Hasse invariant in the chosen coordinate and
prove that it is a unit on the nodal multiplicative locus. Apply F6's
p-local height-bound theorem to the localized theory E_(p), obtaining
its E(2)-locality for each prime p.
Also give the direct regular-sequence criterion for a supplied curve
when the map is not flat;
construct the represented elliptic homology theory with its formal-group
comparison and dependence on the coordinate/differential. For families
without a global trivialization use the graded line powers, and glue after
trivializing ω. Include multiplicative K-theory at the Tate boundary.

*Needs:* E1's formal-group/Hodge descent and height strata;
BordismFormalGroups F5's exact-functor theorem and F6's height-bound
localization (Goerss §3.2).

**Checks.**
- With trivialized ω the coefficient groups in degrees −2,0,2 are
  Ru⁻¹,R,Ru, and multiplication sends u⁻¹u to 1; a polynomial ring R[u]
  omits the first group and is not periodic.
- Over a characteristic-p field the map p:R→R is zero on 1≠0, so
  Landweber regularity fails even for an ordinary elliptic curve.
  Smoothness of the curve alone is therefore not the stated hypothesis.
- For the multiplicative law over ℤ_(p), v₁ is a unit modulo p, so
  R/(p,v₁)=0; at the universal height-two deformation v₁ is the parameter
  modulo p and v₂ is a unit modulo (p,v₁). Both have zero higher-height
  quotient, but their first nonzero height is respectively 1 and 2.

Use the ordinary/supersingular/rational construction of
Douglas–Francis–Henriques–Hill, Chapters 6–8, 12 and 16. The following
construction targets precede the elliptic gluing.

1. Consume F6's K(1)- and K(2)-local categories, finite-group norm/Tate comparisons and fracture squares and
   G3's derived limits/completions. Construct continuous actions and
   homotopy fixed points for profinite groups by continuous cochains on
   finite quotients and derived limits, with their descent spectral
   sequences, products, naturality and convergence hypotheses.
   Consume native root `mahler`, `PadicInt.hasSum_mahler` and
   `PadicInt.mahlerEquiv`, with their complete ultrametric normed additive
   group, bounded ℤ_p-module and continuous-function hypotheses,
   for continuous functions on ℤ_p; use completed function/tensor modules,
   not uncompleted polynomial rings. Prove the translation-difference exact
   sequence on C(ℤ_p,ℤ_p) from the binomial basis and transport through a
   chosen generator ℤ_p×/μ≃ℤ_p. Construct completed KU cooperations as
   continuous functions on ℤ_p×, and the Adams-summand/KO comparisons by
   μ-homotopy fixed points. For K(1)-local X, establish the fibre sequence
   `X→L_K(1)(B smash X)→L_K(1)(B smash X)` with second map ψ_g−1,
   where B is the odd-prime Adams summand or KO at 2. Retain the generator
   dependence and the distinction between the summand and the 2-primary case.
*Needs:* BordismFormalGroups F6's local categories and norm comparisons;
   GeneralizedCohomology G3.8's derived limits; Mathlib `mahler`,
   `PadicInt.hasSum_mahler` and `PadicInt.mahlerEquiv` (DFHH Chapter 6).

   **Checks.**
   - For the trivial profinite group, continuous cochains give X^(h1)=X
     and H_c^s(1,M)=0 for s>0; adding a nonzero higher term is incorrect.
   - Translation difference f(x+1)−f(x) sends 1 to 0, x to 1 and
     binomial(x,2) to x. Reversing the chosen generator reverses the
     corresponding translation operator, rather than fixing this formula.
   - Constant functions on ℤ_p× multiply as scalars; the characteristic
     functions of two disjoint clopen subsets multiply to 0. Ordinary
     polynomials cannot supply all these idempotents.

2. For h∈{1,2}, realize F5's Lubin–Tate deformation as the even-periodic
   Morava E spectrum of a specified height-h formal group over a perfect
   field k. Prove π₀=W(k)[[u₁,…,u_(h−1)]], π₂ an invertible module,
   the formal-group identification, and the Goerss–Hopkins–Miller E∞
   existence/uniqueness and coherent automorphism action. For the standard Honda height-h group over F_(p^h), prove the
   K(h)-local completed E_*E comparison with continuous functions on
   its extended stabilizer group, including its profinite topology,
   Galois action and completed tensor products. Compare other residue
   fields/groups by the specified scalar extension and descent;
   do not assert that unchanged cooperation formula for every perfect
   field. State each residue-field/Galois action explicitly.
*Needs:* BordismFormalGroups F5's Lubin–Tate deformation and F6's
   K(h)-localization; E1's perfect-field descent; E2.3's obstruction
   machinery for the realization proof (Goerss Theorem 3.6).

   **Checks.**
   - At h=1, k=𝔽_p, π₀ is ℤ_p; at h=2 it is ℤ_p[[u₁]]. Giving both
     rings zero parameters erases the height-two deformation direction.
   - Reduction modulo (p,u₁) at height two gives k, and u₁=ε over
     k[ε]/(ε²) differs from u₁=0. Merely fixing the closed point does not
     determine the marked deformation.
   - In the Honda cooperation algebra the constant unit evaluates to 1
     at every stabilizer element, while pullback along the identity
     fixes each continuous function. Omitting the Galois action would
     fix every element of 𝔽_(p²), whereas Frobenius sends a to a^p≠a
     for a outside 𝔽_p.

3. Prove the required Adams condition for the realization theory:
   express the homology spectrum as a filtered homotopy colimit of
   finite cellular spectra with projective homology of their duals,
   and prove the module-map/homology-Hom comparison, cooperation
   flatness and Künneth spectral sequence. Own the realization/obstruction machinery: simplicial resolutions of
   commutative spectral algebras, cotangent complexes and André–Quillen
   cohomology, the Goerss–Hopkins obstruction tower for the supplied
   complete cooperation algebra, mapping-space classification, convergence
   and the vanishing calculations in the universal deformation case.
   Prove its homotopy-coherent functoriality on the elliptic deformation
   maps, including changes of coordinate and differential.
*Needs:* GeneralizedCohomology G2's commutative spectra and cell models;
   BordismFormalGroups F4's projective resolutions/cooperations and F6's
   completed local categories; E2.1's continuous modules (DFHH Chapters
   7–8, especially the universal-deformation realization).

   **Checks.**
   - For a finite projective homology module A⊕A, the Hom comparison
     gives Hom_A(A⊕A,M)=M⊕M and Tor_i(A⊕A,M)=0 for i>0; an unrestricted
     replacement A/p has Tor₁^A(A/p,A/p)=A/p when A=ℤ_p.
   - The relative cotangent complex of A→A is zero; an étale map likewise
     has zero relative cotangent complex, whereas A→A[x] has the
     nonzero degree-zero module A[x] dx.
   - The zero cotangent complex gives zero positive obstruction groups;
     a free rank-one degree-zero cotangent module has Hom(A,M)=M.
     Thus functorial uniqueness cannot be inferred for arbitrary maps
     by declaring every cotangent complex zero.

4. On the ordinary locus (including the nodal identity component)
   construct the Igusa stages classifying μ_(p^k)≃Ĉ[p^k], their
   étale torsor maps and the ℤ_p× tower action. Prove affine
   representability at k≥1 for odd p and k≥2 at 2, including the
   Weierstrass jet/rigidity calculations at 2 and 3. Set
   `V∞hat=lim_m colim_k V_k/p^m`, with the completion/continuous-action
   comparisons. Construct Frobenius lift ψᵖ, θ with ψᵖ(a)=aᵖ+pθ(a),
   and continuous Adams operations, using the canonical subgroup quotient
   and proving its extension across the nodal fibres by q-expansions.
   Construct the K(1)-local θ-algebra realization and map obstruction
   theory. For p-complete K-homology A_*, realization obstructions have
   shifts−s+2 for s≥3, uniqueness shifts−s+1 for s≥2; map existence
   has shifts−s+1 for s≥2, uniqueness−s for s≥1. Pin these as
   θ-André–Quillen groups relative to (K_p)_*, and construct the
   mapping-space spectral sequence and continuous cotangent resolutions.
   Prove vanishing from formal smoothness of invariant mod-p functions,
   ind-étaleness and positive-degree continuous-cohomology vanishing.

   **Checks.**
   - Spf V∞hat represents pairs (C,φ) of a curve of Mbar_ell over a ring
     with p nilpotent and an isomorphism φ:Ĝ_m≃Ĉ (such C are ordinary);
     V∞hat is Katz's ring of generalized p-adic modular functions, the
     p-complete K-homology K₀tmf (Goerss, Theorem 4.13 and the discussion
     before it). The element −1∈ℤ_p× acts trivially, since [−1]:C→C is
     an isomorphism from (C,φ) to (C,φ∘[−1]); so Γ=ℤ₂×/{±1} at 2 loses
     nothing.
   - On the Tate curve with its canonical trivialization the canonical
     subgroup is μ_p and Tate(q)/μ_p=Tate(q^p), so ψᵖ acts on
     q-expansions by f(q)↦f(q^p), and θ(f)=(f(q^p)−f(q)^p)/p is integral
     because a^p≡a mod p on ℤ_p: at p=2, θ(1+q)=−q. The identity is not a
     Frobenius lift: it would make θ(1+q)=(−q−q²)/2.
   - At p=2 the level-1 stage trivializes Ĉ[2]≃μ₂, whose automorphism
     group (ℤ/2)× is trivial, so that stage is the ordinary locus itself,
     with [−1] in every stabilizer, and is not representable; at level 2,
     [−1] acts on μ₄≃Ĉ[4] by inversion, which is nontrivial, so the stage
     is a scheme. For odd p inversion is already nontrivial on μ_p, which
     is why level 1 suffices there.

*Needs:* E1's ordinary/Tate deformation charts; E2.1's continuous
   actions and E2.3's cotangent resolutions; the canonical-subgroup
   construction in this E2.4 (Goerss §4.5, Theorem 4.13).

   For odd p realize the finite p-level model and lift its (ℤ/p)×
   action coherently by the group-cohomology obstruction tower; prove
   vanishing using p-completeness and the prime-to-p group order.
   Take homotopy fixed points and use F6's K(1)-local norm comparison.
   At 2 use the separate reduced-θ construction of DFHH Chapter 12 §7 and
   Appendix A: Γ=ℤ₂×/{±1}, graded algebra (KO₂)_*⊗_(ℤ₂)V_red,
   with Bott-periodic meaning this specified KO-module shape. Prove
   its ordinary instance has V_red=V∞hat; V_red is not the Igusa
   level-zero ring. For shrinking open subgroups G_j⊂Γ construct
   T_j=KO₂^(hG_j), the restriction maps T_j→T_(j+1), and
   KO₂≃L_K(1) hocolim_j T_j. Prove the completed K-homology,
   continuous-function/coinduction and local-completion comparisons
   giving this equivalence and the projective resolution below.
   [-1] acts trivially on V∞hat, the level 4 affine comparison and
   H_c^s(Γ,V∞hat/2)=0 for s>0. Build the KO-based simplicial free
   resolution, its finite-Galois dualizable projective spectra,
   spiral exact sequence and reduced-θ obstruction theory in this
   restricted category, verifying its continuous-cohomology hypotheses.
   Prove the KO/K completed-homology comparison and degreewise
   vanishing, including the modulo 8 shifts, before constructing the
   2-primary ordinary model. The odd-prime finite-action argument
   is not used for a group whose order is divisible by 2.

   For étale charts over the ordinary locus prove relative θ-cotangent
   complexes vanish, construct the local algebra spectra, and lift the
   diagram by contractible mapping-space components. Compare with
   completed K-theory on the Tate curve.
*Needs:* E2.4's Igusa θ-algebra and E2.1's KO/cooperation comparison;
   BordismFormalGroups F6's K(1)-local norm theorem; GeneralizedCohomology
   G3.8's completions (DFHH Chapter 12 §7 and Appendix A).

   **Checks.**
   - At an odd p the finite group has order p−1, a unit in ℤ_p; at
     p=3 its averaging factor is 1/2. At p=2, averaging over {±1}
     would require 1/2 outside ℤ₂ and cannot justify the same vanishing.
   - For the reduced algebra at 2, the KO coefficient factors in degrees
     0,1,2,3 are ℤ₂,ℤ/2,ℤ/2,0; tensoring with V_red preserves these
     degrees. Replacing KO by even-periodic KU makes degree 1 zero.
   - On an étale ordinary chart the relative θ-cotangent complex is
     zero, so its positive relative obstruction groups are zero;
     the identity chart gives the identity algebra map and the Tate
     chart gives q↦q^p, not q↦q.

5. Form the supersingular model from the height-two realizations and
   continuous automorphism/Galois descent. Fix an auxiliary full ordered
   level N≥3 with p∤N. Consume ModularCurves' level-N representability
   and the supplied level covers directly here, before E6. Construct
   the étale GL₂(ℤ/N)-torsor forgetting its ordered basis, including the
   Weil-pairing action; no primitive Nth root is fixed unless the base
   and level problem specify it. Algebraize the universal formal
   supersingular curve with this level and construct its ordinary
   restriction and completed Igusa pullbacks. Prove DFHH Chapter 12 §8, Lemmas 8.3–8.6:
   completed coinduction/descent identifies the homology rings, positive
   group cohomology vanishes for these torsor modules, and the resulting
   homotopy-fixed-point spectral sequences collapse. Prove the K(1)-local
   finite homotopy-fixed-point comparison for these supplied models;
   this comparison carries the torsor/coinduction hypotheses.
   Construct its K(1)-local
   restriction and the comparison to the ordinary model, proving that
   the algebraic maps lift with the stated derived mapping-space
   uniqueness. Construct the rational even-periodic model from algebraic
   modular forms and compare it with the rationalized p-adic models.
   Glue by F6's chromatic fracture squares and the arithmetic square,
   with all transition homotopies and completion/limit comparisons.
   On a p-complete étale chart with graded line-power ring R_*, prove
   (p,v₁) is regular and compare ordinary coefficients
   `(R_*[v₁⁻¹])^hat_p`, supersingular coefficients
   `(R_*)^hat_(p,v₁)` and their ordinary overlap. Prove the coefficient
   pullback square using the non-zero-divisor localization/completion
   lemma and completion exactness in this regular chart setting.
   Prove the general lemma that p-adic completion preserves a short
   exact sequence with p-torsion-free cokernel: reduction modulo p^m
   stays exact, and the left inverse system is surjective, so its
   Mittag–Leffler lim¹ vanishes. Verify this cokernel hypothesis for
   the localization/completion square from (p,v₁)-regularity before
   completing it; compare with G3's derived completion.
   Prove the spectral pullback has the original
   line-power coefficients and the specified formal group.
   At 2 construct the chromatic transition with reduced-θ/KO obstruction
   groups and the level 4 comparison; the odd-prime prime-to-p action proof
   does not replace it. For the rational model use the normalized formal
   logarithm and the Hℚ-algebra on the graded line powers. Cover rational
   moduli by c₄≠0 and Δ≠0, construct their compatible arithmetic maps
   into `(product_p O_p)^rational`, and prove the relative étale cotangent
   vanishing and coherent diagram-lifting on every chart. Keep
   rationalization outside the infinite product. Establish the presheaf
   hypercover model/descent and rectification comparisons on G's spectral
   category before identifying this gluing with O^top.

*Needs:* ModularCurves §5B's ordered full-level cover; E1's
   deformation/algebraization and E2.1–E2.4's local realizations;
   BordismFormalGroups F6's fracture squares; GeneralizedCohomology
   G3.8's derived limits (DFHH Chapter 12 §8, Lemmas 8.3–8.6 and §9).

   **Checks.**
   - Over an algebraically closed residue field with p∤N, an ordered
     basis has |GL₂(ℤ/N)| translates: for N=3 this is (9−1)(9−3)=48.
     Fixing its Weil pairing instead leaves |SL₂(𝔽₃)|=24, a different
     cover.
   - For A=ℤ_p[[v]], p is injective, v is injective modulo p, and
     A/(p,v)=𝔽_p. Setting v=0 before testing regularity makes the
     second map zero on 𝔽_p and invalidates the overlap argument.
   - The sequence 0→ℤ_p→ℤ_p⊕ℤ_p→ℤ_p→0 stays exact modulo p^m,
     with surjective left transition maps and lim¹=0. In contrast,
     reducing 0→ℤ_p→ℤ_p→𝔽_p→0 (first map p) modulo p makes that first
     map zero; the torsion-free-cokernel hypothesis is essential.
   - Rationalization of ∏_pℤ_p permits a single common denominator:
     (1/p)_p lies in ∏_pℚ_p but not in (∏_pℤ_p)⊗ℚ. This tests the
     arithmetic-square target and forbids interchanging these operations.

For each test étale chart prove the resulting formal group is that of its
elliptic curve and establish base change, coordinate independence and
the local E∞ uniqueness needed for sheaf descent. Treat the nodal cusp
by E2.4's ordinary Tate/K-theory model. Landweber
exactness supplies the represented theory comparison; these realization
and gluing theorems supply its commutative spectral refinement.

*Needs:* E2.1–E2.5's comparison diagrams and E1's site/Hodge descent;
the ordinary Tate model for the nodal chart (DFHH Chapter 12 §§8–9).

### Examples

The multiplicative p-series, Honda residue field, Mahler difference and
Tate Frobenius tests distinguish the local models at every prime.

### Dependencies

E2 uses E1, G2/G3.8 and F4–F6. The obstruction machinery in E2.3
precedes its realization applications in E2.2 and E2.4–E2.5.

## Layer 3: E3. The elliptic sheaf and global spectra

Assemble O^top on the ordinary étale site of Mbar_ell from E2's
smooth and nodal charts, and restrict it to M_ell. Prove
hyperdescent, atlas independence, multiplicative transition maps and
compatibility with the local realizations. Prove the homotopy-sheaf
identifications π_(2k)O^top≃ω^k and π_(2k+1)O^top=0, with products.
The sheaf is locally even-periodic; its global sections need not be.

*Needs:* E2's local E∞ realizations, transition homotopies and hypercover
models; E1's small étale site and Hodge descent (Goerss Theorem 1.2).

The local sheaf has the following API:
- Restriction and base change intertwine the elliptic formal group and
  all tensor powers of ω, including negative powers.
- Multiplication on π_(2k) and π_(2l) is the tensor map ω^k⊗ω^l→ω^(k+l).
- Hypercover totalization and refinement identify the same commutative
  spectral sheaf, with its unit and local realization maps.

**Checks.**
- On a trivialized étale affine chart the homotopy groups in degrees
  0,1,2 are R,0,Ru; thus the odd homotopy sheaf is zero, not a copy of R.
- In degrees −2 and 2, u⁻¹·u=1 gives ω⁻¹⊗ω→O; a connective local
  model loses this invertible pairing.
- On two trivializations related by u, a weight-k coefficient changes
  by u⁻k; for k=1 and u=2 over ℚ the factor is 1/2. On the identity
  cover the Čech totalization returns the original chart spectrum.

Construct the three spectra in the conventions, their comparison maps,
unit, products and represented theories on CW pairs. Construct the
descent spectral sequences H^s(M,ω^k)⇒π_(2k−s)RΓ(M,O^top),
with naturality, edge maps, products, filtration, all convergence and
lim¹ conditions.

*Needs:* E3's sheaf and hyperdescent; E1's derived sections;
GeneralizedCohomology G3.8's connective covers and tower limits
(Goerss §1, descent spectral sequence following Theorem 1.2).

The global construction has the following API:
- Restriction gives Tmf→TMF; the connective-cover map gives tmf→Tmf
  and is an isomorphism on nonnegative homotopy groups.
- The unit and multiplication induce those of the represented theories
  and the multiplicative descent spectral sequences.
- A section in H^s(ω^k) has abutment degree 2k−s, with its actual
  convergence filtration, not degree 2k.

**Checks.**
- H⁰(ω⁴) lies in stem 8, whereas H¹(ω⁴) lies in stem 7; forgetting
  cohomological degree shifts the latter by one.
- The connective-cover map gives π₀tmf=π₀Tmf and π_(−1)tmf=0;
  more generally every negative group of tmf is zero by construction,
  without asserting the same for Tmf.
- After inverting 6, c₄ is in π₈tmf and Δ in π₂₄tmf; Δ⁻¹ is in
  π_(−24)TMF but not in connective tmf. Thus the global spectra cannot
  all be replaced by the same periodic ring.

Prove the corresponding Tate q-expansion map into
KO[[q]] and its localization KO((q))=KO[[q]][q⁻¹]. Construct KO[[q]]
as the derived inverse limit of truncated polynomial KO-algebras and
prove its coefficient/product and completion comparisons; construct
localization on G's ring-spectrum model. Pin the connective/compactified
q-expansion to KO[[q]] and the periodic punctured-boundary map to
KO((q)), together with their KU complexification maps. Prove restriction to
the boundary and rational/algebraic modular-form comparisons.

*Needs:* E1's formal Tate chart; E2.4's Tate/K-theory realization;
E3's restriction maps; GeneralizedCohomology G2.8's commutative-ring
localization and G3.8's derived inverse limits (DFHH Chapter 12;
Ando–Hopkins–Rezk Theorem 6.1 for the orientation comparison).

The completed boundary algebra has the following API:
- For m≥1, projection to KO[q]/(q^m) preserves the unit, coefficients
  and products; the compatible projections exhibit KO[[q]] as their limit.
- In each homotopy degree, π_*KO[[q]] is the product of the coefficient
  groups, and multiplication is coefficient convolution; the split
  truncation maps have zero lim¹.
- Evaluation q↦0 and complexification commute with truncation; inverting
  q gives KO((q)) with Laurent series bounded below in q in each degree.

**Checks.**
- Constant-term evaluation sends a₀+a₁q to a₀; in particular it sends
  q to 0 and 1 to 1, excluding evaluation at q=1.
- Truncation modulo q² sends a₀+a₁q+a₂q² to a₀+a₁q. At m=1 it gives
  just a₀; both maps preserve multiplication modulo the indicated power.
- In π₀KO[[q]], (1−q)·Σ_(n≥0)qⁿ has constant coefficient 1 and every
  higher coefficient 1−1=0. Thus it equals 1, whereas 1−q has no
  polynomial inverse in ℤ[q].
- In π₀KO((q)), q⁻¹q=1; Σ_(n≥1)q⁻ⁿ is not an element because it has
  no lower bound. The constant-term map on KO[[q]] cannot extend to
  KO((q)), since it would send the unit q⁻¹q to 0.

### Examples

The chart groups R,0,Ru, the stem 2k−s and the geometric-series inverse
above test sheaf grading, global sections and the completed boundary.

### Dependencies

E3 uses E1 sites, E2 realizations, G2.8 localization and G3.8 limits
and covers; it does not require the E4 coefficient computation.

## Layer 4: E4. Coefficients and connective/periodic comparisons

Separate the stack of Weierstrass cubic curves from the compactified
stable elliptic stack. Construct the restriction/localization comparison
between their Hopf-algebroid/cobar complexes and stack cohomology, pinning
the range supplying connective tmf and the additional compactified input
for Tmf. Compute H^s(Mbar_ell,ω^k) for all s≥0 and every negative
weight k. Use E1's local-cohomology triangle for the cuspidal support
removed from the cubic stack, its cobar/localization comparison and
derived coherent duality. Prove the cubic cobar complex has no negative-
weight terms, and derive the negative-weight groups from supported
cohomology, retaining the integral higher-filtration torsion at 2 and 3,
base change and product pairings. Consume E1's depth-two Hartogs
comparison for H⁰. Include these groups and their differentials/extensions in the compactified
descent calculation. Identify the connective cover through E3's actual map.

*Needs:* E1's local cohomology, Hodge line, cobar comparison and integral
duality; E3's actual global-section and connective-cover maps (CDvN §4.1).

**Checks.**
- The cubic coefficient ring has generator weights 1,2,3,4,6 and hence
  no negative-weight monomials; a negative-weight compactified class
  cannot be supplied by pretending such a monomial exists.
- Away from 6, H¹(ω⁻¹⁰)=ℤ[1/6] contributes in stem −21, while
  H¹(ω⁻⁹)=0. Thus the endpoint −21 is excluded from the open Gap range.
- H⁰(ω⁰)=ℤ and restriction sends 1 to 1; after inverting Δ, Δ⁻¹ has
  weight −12. The open-stack comparison must allow this new section.

### E4.S. Independent sphere inputs

Own the following specific sphere calculations here, using F4's single
MU/BP resolution, normalized cobar, convergence and coherent Toda APIs.
These are upstream of the elliptic DSS and Gap Theorem. Use the same
spectral sphere and its p-localizations, not a private stable-stem carrier.

1. At 2 construct homogeneous normalized BP-cobar representatives and
   their resolution lifts detecting η, ν, ε and κ, with κ in stem 14
   and Adams–Novikov filtration 2. Prove that these classes are permanent
   cycles with nonzero image, and prove 2κ=0. The proof computes the
   2-local Adams–Novikov E₂-term Ext_(BP_*BP)^(s,t)(BP_*,BP_*) in the
   finite range of internal degrees needed for stems 14, 20 and 29 and
   their adjacent differentials, and identifies its classes with the
   exact-couple classes of the actual sphere tower. Prove the
   filtration and connectivity bounds showing that no differential
   enters or leaves this range outside the ones computed, so that
   survival is a theorem and not read off a chart. Resolve the needed
   additive extensions by the tower and Moore-spectrum connecting maps.
2. Construct compatible nullhomotopies of the consecutive composites
   and chosen lower faces defining ⟨κ,2,η,ν⟩ in π₂₀S_(2).
   Compute its indeterminacy as ⟨ν²κ⟩, prove that π₂₀S_(2) is cyclic
   of order 8 and that this bracket is a coset of generators, and prove
   ν²κ is its nonzero order 2 element (the sphere facts of
   Carrick–Davies–van Nigtevecht, below CDvN, Lemma 5.6). Choose κ̄_S in this bracket with
   its complete defining system; prove 4κ̄_S=ν²κ and keep the change
   of choice κ̄_S↦κ̄_S+ν²κ explicit. Construct the corresponding
   filtration 2 sphere ANSS detection and its comparison with the
   classical bracket via F4's tower maps. This calculation includes
   the lower κ/η/ν/ε bracket and product relations used for detection;
   in particular construct ηκ∈⟨2ν,ν,ε⟩ with its actual stem 15 target
   and indeterminacy (CDvN Proposition 5.4). Do not infer κ from cancellation of η.
3. In the same independent sphere calculation prove π₂₉S_(2)=0
   (CDvN Lemma 5.8):
   give the finite cobar/resolution reductions, all relevant sphere
   differentials and convergence/extension bounds making the stem's
   associated graded zero. Turn this into an actual nullhomotopy of
   ν³κ̄_S for each allowed bracket choice. The nullhomotopy, rather
   than an imported sphere table or a completed tmf calculation, is
   the exported input. A nullhomotopy is supplied as a map in the
   chosen sphere model, with its change-of-choice comparison.
4. At 3 construct α₁ in stem 3 and β₁ in stem 10, with a complete
   defining system for β₁∈⟨α₁,α₁,α₁⟩. In F4's BP-cobar convention
   construct the algebraic Greek-letter class β₃/₃ in E₂^(2,36),
   and representatives for α₁∈E₂^(1,4) and β₁∈E₂^(2,12).
   Prove in the SPHERE ANSS that
   d₅(β₃/₃)=±α₁β₁³ in E₅^(7,40), with nonzero target and a single
   consistent generator/sign choice (the Toda differential used in CDvN
   Proposition 7.2). Construct the filtered lift of
   the β₃/₃ representative through the first four stages; calculate
   its fifth obstruction using the Moore/cofiber connecting maps
   and chosen defining homotopies, identify that obstruction with
   the displayed cobar product, and prove the lower obstructions
   vanish with their indeterminacies. Check the required finite
   Ext-region, no earlier hit and no alternative source/target by
   explicit cobar reductions and the sphere filtration bounds.
   β₃/₃ is a page class, not a falsely asserted permanent stable
   sphere element. This is a separate construction/proof target in
   this lane; generic naturality does not establish the differential.

*Needs:* BordismFormalGroups F4's BP/MU cobar resolutions, sphere
convergence, Moore connecting maps and coherent Toda systems. E4.S.2
uses E4.S.1's κ,η,ν,ε detections; E4.S.3 uses that chosen κ̄ system;
E4.S.4 uses F4's 3-local BP resolution, independently of the 2-local
calculation (CDvN Proposition 5.4, Lemmas 5.6–5.8 and Proposition 7.2).

**Checks.**
- The fourfold bracket has stem 14+0+1+3+2=20; its classical
  indeterminacy is {0,4κ̄_S} in ℤ/8, giving the two choices κ̄_S and
  5κ̄_S. A threefold degree formula would give 19 and is wrong.
- ν³κ̄_S has stem 3·3+20=29, whose 2-local group is zero; this does
  not assert ν³κ̄_ell=0 before the synthetic τ-power is accounted for.
- At 3 the source β₃/₃ has (s,t)=(2,36), hence stem 34; its d₅ target
  has (7,40), stem 33=3+3·10. Treating β₃/₃ as permanent contradicts
  the nonzero target α₁β₁³.

After the synthetic sphere exists below, transport these actual sphere
classes, choices and tower comparisons to it. The chosen proof follows
the sphere inputs isolated in [Carrick–Davies–van Nigtevecht §5.2 and
§7.1](https://arxiv.org/abs/2412.01640v2), while the resolution reductions,
nullhomotopies and fifth obstruction above are assigned here, not assumed
from that citation. F4 remains the sole owner of the generic machinery.

### E4.A. Algebraic and synthetic descent

Compute the algebraic cubic and compactified stack cohomology before
identifying either with an Adams–Novikov E₂ page for tmf. On the E3-defined
Tmf descent tower prove the Gap Theorem π_n Tmf=0 for −21<n<0,
independently of MU_*tmf or an assumed tmf homotopy computation. Supply
the multiplicative filtered refinement needed for this independent descent
calculation: construct MU-synthetic spectra from spherical sheaves of spectra
on the enriched site of finite MU-projective spectra (covers are
MU_*-surjections). Choose a universe-controlled small enriched model
with simplicial enrichment by derived Kan mapping spaces, finite sums,
smash, retracts and Spanier–Whitehead duals; prove the MU-projectivity
and duality comparisons and invariance under bifibrant replacement.
Prove MU is Adams-type from its finite Thom stages. Prove the covering/pullback and
tensor-compatibility axioms. Construct spectrum-valued homotopy-coherent
presheaves on that simplicially enriched site, with objectwise stable
equivalences and derived mappings. This uses the mapping-space enrichment,
not an imposed spectral-linearity/exactness condition. Construct
its localization at finite-sum-to-product and Čech-descent maps.
Prove smallness, localization existence and its universal property;
hypercompletion is a separate localization. Construct derived Day tensor,
its compatibility with these localizations, stable mapping objects and
bigraded spheres. Construct the connective synthetic analogue ν and its lax symmetric monoidal
structure. Prove the homology-short-exact cofiber comparison and specify
its exactness hypotheses. Use Adams coordinates S^(n,s)=Σ^(−s)ν(S^(n+s)) and
π_(n,s)=[S^(n,s),−], with τ:S^(0,−1)→S^(0,0). Construct
τ-inversion recovering ordinary spectra and the commutative τ-cofiber Cτ.
For k≥1 construct compatible E₂ structures on the cofibers Cτ^k of τ^k,
their unit and reduction maps, and on R/τ^k for the synthetic E∞ rings R
used here. Construct their module categories and base-change functors.
For the cofiber triangle from τ^k and τ^j construct the connecting map
`δ_k^(k+j):R/τ^k→Σ^(1,−k−1)R/τ^j` as an R/τ^(k+j)-module map,
with the action on the ends induced by the quotient maps. Prove the
canonical splitting `(R/τ^(s+k))/τ^s≃R/τ^s⊕Σ^(1,−s−k−1)R/τ^s`
and its two truncated signature comparisons, including the connecting
maps and Massey-system compatibility.
Construct Hovey’s stable graded MU_*MU-comodule category from F4’s
graded comodule and dualizable-object APIs, and the Cτ-module comparison.
Prove the finite-projective-generation hypothesis for MU that makes this
an equivalence. Construct the νMU-local full subcategory of Cτ-modules
and its comparison with the ordinary derived graded-comodule category.
Construct hypercompletion separately and prove its relation to the local
branch under the hypotheses used below; the unrestricted stable-comodule
category remains distinct. Construct the τ-adic truncation towers, connecting
maps and Bockstein/signature spectral sequence with their descent and
completeness hypotheses. Construct the filtered-spectra model
and its Day tensor product. Construct the signature functor
σ:Syn_MU→Fil(Sp) with its lax symmetric monoidal unit and product maps,
and the comparison of filtered and synthetic total differentials. This
signature is distinct from strong symmetric monoidal τ-inversion
Syn_MU→Sp; prove the unit/product and algebra/module comparison diagrams
for each named functor separately. These categorical,
localization and comparison constructions are targets here, using E1/E2's
homotopy-sheaf machinery and F4's MU comodules; no synthetic category is
assumed as a native supplier.

*Needs:* GeneralizedCohomology G2's enriched spectra and G3.8's derived
limits; BordismFormalGroups F4's finite MU-projectives, comodules and
resolutions; E1/E2's sheaf and localization constructions (Pstrągowski
§§4–5; CDvN §§2–3; synthetic-descent Definitions 1.9–1.10).

The synthetic constructions have the following API:
- Finite-sum descent sends the empty object to the terminal spectrum and
  a finite coproduct to a product; cover descent is invariant under refinement.
- Tensor, bigraded suspension and τ-localization preserve their designated
  unit maps; τ-inversion is strong monoidal, while ν and signature have
  the stated lax structure.
- Quotient reduction and connecting maps respect the R-module structures,
  their iterated cofiber triangles and truncated signature comparisons.

**Checks.**
- The zero MU-projective object has zero represented section spectrum;
  a sum P⊕Q gives a product of sections. On the identity cover, Čech
  descent gives the same section spectrum, not its ungraded homology.
- S^(0,0)=νS and τ has degree (0,−1); τ² carries (20,4) to (20,2),
  and τ-inversion sends every S^(n,s) to S^n. Inverting τ sends Cτ
  and every Cτ^k to zero, while leaving the sphere nonzero.
- For k=j=1, the connecting map has target Σ^(1,−2)R/τ; for s=k=1,
  (R/τ²)/τ splits as R/τ⊕Σ^(1,−3)R/τ. Replacing the second shift by
  (1,−2) confuses the two different cofiber constructions.
- The signature of the zero object is the zero filtration; its level-n
  transition is induced by τ from shift (0,−n) to (0,1−n). At n=1
  the map goes from (0,−1) to (0,0), fixing the filtration direction.
- In the local Cτ comparison, the zero comodule gives the zero module
  and the unit gives MU_* in internal degree 0; its internal shift by
  2 stays distinct from a cochain shift by 1. The ordinary derived and
  unrestricted stable categories retain their separately specified maps.

Construct the fpqc moduli stack M_FG of one-dimensional commutative formal
groups from the MU Hopf algebroid, with its coordinate-change and
invariant-differential line ω. Write C_Z for F4's full internally
ℤ-graded MU_*MU-comodules and C_ev for its even-internal-degree full
subcategory. MU_* and MU_*MU are even, so every comodule splits into its
even and odd components. Keep C_Z, its Hovey stable category, ordinary
derived category, local branch and hypercompletion throughout this
programme; none is replaced by an even-only theory.

Construct the exact symmetric monoidal equivalence
E:QCoh(M_FG)≃C_ev, with topological internal degree 2k corresponding
to Hodge weight k. Pin the shift direction: define (T_kM)_n=M_(n+2k)
and prove E(P⊗ω^k)≃T_kE(P). Thus the free unit whose generator is in
degree −2 maps to ω, and one whose generator is in degree +2 maps to
ω⁻¹. On cohomology fix
Ext^(s,2k)(MU_*,E(P))≃H^s(M_FG,P⊗ω^k), with the same cobar and
Hodge-trivialization convention. Construct the exact fully faithful
strong symmetric monoidal inclusion i:C_ev→C_Z, its unit/tensor maps,
and the even/odd projections; its image is not all of C_Z.

*Needs:* BordismFormalGroups F1/F4's MU Hopf algebroid and graded
comodules; SchemeAndStackFoundations §§1.18–1.22's fpqc descent;
E4.A's stable/local comodule comparisons (Goerss §3.1; Mathew §2).

**Checks.**
- The comodule unit corresponds to O; T₁ of the unit has generator in
  internal degree −2 and corresponds to ω. T_(−1) has generator in
  degree +2 and corresponds to ω⁻¹, excluding the reversed twist.
- A comodule supported only in degree 1 has even projection 0 and odd
  projection itself, and is not in the image of i. The zero comodule
  has both projections zero, while the unit has odd projection zero.
- For s=k=0 the Ext/cohomology dictionary gives invariant elements on
  both sides; for internal degree 2 and s=0 it gives weight 1, not
  weight 2. On the rational multiplicative-group chart the character
  for ω has exponent 1, and no integer character squares to it.

Retain the full category explicitly by its parity-pair comparison.
For the internal shift (SM)_n=M_(n−1), construct
M≃iE(P)⊕S iE(Q), where P and Q correspond to M_(2k) and M_(2k+1).
Prove S²=T_(−1) and the tensor formula
(P,Q)⊗(P′,Q′)≃
(P⊗P′ ⊕ Q⊗Q′⊗ω⁻¹, P⊗Q′ ⊕ Q⊗P′).
Construct the associativity/unit/distributivity and symmetry comparisons
from the actual graded tensor product: odd–odd interchange has sign −1,
even–odd has sign +1, with the canonical ω⁻¹ line transports. Prove the
pentagon, hexagon, reindexing and S/T_k diagrams, including the triple-
odd associator and the square of (0,O), which is (ω⁻¹,0).
This retains odd objects without creating a square root of ω in ordinary
QCoh. The rational BG_m character test must recover the primitive Hodge
character, not a half-integral character. Internal shifts and
cohomological shifts are different: on complexes use braiding
(−1)^(ab+ij) for internal/cohomological bidegrees (a,i),(b,j).
In internal degree a take the totalized differential to be (−1)^a
times the original cochain differential, with total stem n=a−i.
On finite-supported bidegree models write Tot(C)_n=⊕_(a−i=n) C_a^i.
Define Tot(C)⊗Tot(D)→Tot(C⊗D) on x∈C_a^i and y∈D_b^j by
x⊗y↦(−1)^(ib)x⊗y; construct its general-complex extension in each derived branch
through the actual K-flat/resolution and required derived-limit
comparisons, without exchanging arbitrary product and sum totalizations; prove it carries that braiding to
(−1)^((a−i)(b−j)) in total stem degree, with its differential and
associativity diagrams. Do not identify the two shift functors.

*Needs:* E4.A's even/full equivalence, internal shifts and tensor;
GeneralizedCohomology G3.8's derived limits for unbounded comparisons
(Mathew §2 for the even stack/comodule dictionary).

**Checks.**
- The unit pair is (O,0); (0,O)⊗(0,O)=(ω⁻¹,0), and its triple
  product is (0,ω⁻¹) under either association. Omitting the Hodge twist
  gives (O,0) for the square and the wrong internal degree.
- Two internal odd generators in cochain degree zero interchange with
  sign −1; an even and odd generator interchange with sign +1. In
  characteristic 2 both signs reduce to +1, so ℤ is needed to test them.
- For (a,i)=(0,1), (b,j)=(1,0), the original braiding is +1, the
  tensor comparison contributes (−1)^(ib)=−1 and the total braiding is
  (−1)^((a−i)(b−j))=−1. Dropping the comparison sign fails this test.
- An internal-degree-1 two-term complex with differential identity
  totalizes with differential −identity from stem 1 to stem 0;
  in internal degree 0 it is +identity. These pin the differential
  sign independently of the tensor sign.

Derive E and i degreewise with the actual quasi-isomorphism and tensor
comparisons. For each chosen stack/cobar derived carrier construct the
needed resolution/descent comparison before identifying its pushforward;
this is not an unqualified equivalence between all possible unbounded
stack-derived models. Construct the cubic and elliptic derived
pushforwards of their structure sheaves first in the geometric even
category, with lax symmetric monoidal pushforward, and then apply i.
Construct their E∞ algebras in the full derived graded-comodule category,
including the map from the elliptic open in the cubic stack. Identify
the cubic algebra with its normalized Hopf-algebroid cochain model and
E∞ multiplication using this same regrading. Carry these functors,
shifts, units and products into the local Cτ-module comparison above.
For an arbitrary parity pair retain both group formulas: its even
internal degree 2k gives H^s(P⊗ω^k), and degree 2k+1 gives
H^s(Q⊗ω^k); their tensor/symmetry comparisons use the displayed twist.
Only the structure-sheaf pushforwards used below have Q=0.

*Needs:* E1's cubic/elliptic cobar and descent resolutions; E4.A's
parity adapter, local Cτ comparison and derived tensor (CDvN §4.1).

**Checks.**
- The structure-sheaf pushforward has parity pair (P,0), so its
  odd-internal-degree component is zero; a general (0,Q) instead has
  degree 2k+1 cohomology H^s(Q⊗ω^k), which must not be deleted.
- Identity pushforward has unit 1↦1 and product 1·1↦1; the zero map
  fails the unit comparison, even though it preserves additive grading.
- Cubic restriction sends c₄,c₆,Δ to the identically named elliptic
  sections and sends c₄³−c₆²−1728Δ to zero. Replacing restriction by
  zero would also kill 1 and cannot be a unital E∞ algebra map.

Construct the synthetic sphere 𝟙_syn=νS and its τ-localization and
Cτ/tower comparisons using the full C_Z theory. Lift E4.S's sphere
classes with their stated ANSS filtrations, prove τ-inversion is
injective in the (14,2) and (20,2) groups used for the relations, and
construct the complete synthetic defining system
κ̄_S∈⟨κ,2,η,ν⟩⊆π_(20,2)𝟙_syn,(2).
Prove 4κ̄_S=τ²ν²κ by the classical relation and this injectivity.
From E4.S's actual classical nullhomotopy and the filtered-colimit
model of τ-inversion, extract a finite exponent N and a nullhomotopy
τ^Nν³κ̄_S=0 in π_(29,5−N)𝟙_syn,(2), for each allowed choice.
Do not assign a uniform exponent without proving it or infer this
nullhomotopy from elliptic coefficients.

*Needs:* E4.S's chosen sphere classes, defining systems and nullhomotopy;
E4.A's synthetic sphere and τ-inversion comparison (CDvN Lemmas 5.6–5.8).

**Checks.**
- κ has degree (14,2), so ν²κ has (20,4), and τ²ν²κ has (20,2),
  the degree of 4κ̄_S. The same product without τ² is in a different group.
- Inverting τ turns 4κ̄_S=τ²ν²κ into the classical equality in stem 20;
  changing the choice by τ²ν²κ adds the order-two element 4 in ℤ/8.
- ν³κ̄_S starts in (29,5); multiplying by τ^N gives (29,5−N).
  At N=0 the classical nullhomotopy alone gives no synthetic vanishing;
  it only yields zero after passing to the τ-inverted colimit.

Construct the synthetic elliptic sheaf and Smf global sections from E3,
with τ-inversion Tmf. Through the even equivalence and inclusion above
prove the bigraded comparison
π_(n,s)(Smf/τ)≃H^s(Mbar_ell,ω^((n+s)/2)) when n+s is even,
and zero otherwise; it is the Q=0 case of the full parity dictionary.
In the νMU-local Cτ-module branch prove its E∞ algebra identification
with i of the elliptic derived pushforward, with its actual unit.

*Needs:* E3's sheaf and descent; E4.A's synthetic localization and
full/even pushforward comparison (synthetic-descent Corollaries 4.15,
4.17; CDvN §4.1).

**Checks.**
- At (n,s)=(0,0) the mod-τ formula gives H⁰(O)=ℤ, and the unit
  maps 1 to 1; a zero unit map fails this check.
- At (n,s)=(1,0), n+s is odd and the group is zero, whereas at
  (8,0) it gives H⁰(ω⁴), containing c₄. Rounding the half-weight
  instead of retaining parity would produce a spurious odd group.
- After inverting 6, (n,s)=(−21,1) gives H¹(ω⁻¹⁰)=ℤ[1/6]; the
  homotopy degree is −21, not −20. τ-inversion gives Tmf rather than
  forcing the connective cover tmf.

**E4.U: unit and atomic inputs, before DSS/Gap.** Construct the
unit-induced map from the sphere's MU Adams–Novikov resolution to the
elliptic descent tower. On E₂ identify it with the formal-group map
Mbar_ell→M_FG and the MU/Weierstrass Hopf-algebroid map, through E and i
with the stated internal grading, Hodge twists and filtration. Prove its
product, differential and abutment-detection diagrams. The sphere class
κ̄_S and the elliptic class below are distinct named data. From the
algebraic stack/cobar computation prove the mod-τ vanishings in
bidegrees (21,1),(21,2),(20,2),(20,3); use the τ² cofiber sequence to
prove τ²:π_(20,4)Smf_(2)→π_(20,2)Smf_(2) is an isomorphism (CDvN
Proposition 5.9). Define κ̄_ell as the unique preimage of unit(κ̄_S),
prove its mod-τ reduction is the order 8 generator g (Proposition 5.9,
Notation 5.10), and prove 4κ̄_ell=ν²κ (Corollary 5.11); the relation
4κ̄_S=τ²ν²κ in the synthetic sphere is Lemma 5.7.
Construct κ's detection by d using the ηκ bracket, the relevant
mod-τ vanishings and nonzero Massey detection; never cancel η
(Proposition 5.4).
Transport changes of the chosen sphere defining system and its
indeterminacy along the same unit map. These arguments use algebraic
cohomology and the constructed sheaf, not the Gap Theorem or MU_*tmf.

**Checks.**
- κ̄_S and unit(κ̄_S) lie in bidegree (20,2) and κ̄_ell in (20,4);
  π_(20,2)Smf/τ=H²(Mbar_ell,ω¹¹)_(2)=0, so unit(κ̄_S) reduces to zero
  mod τ, and defining κ̄_ell as unit(κ̄_S) itself, without the
  τ²-division, would name a class invisible on the E₂ page.
- 4κ̄_ell=ν²κ holds in π_(20,4)Smf_(2) and reduces to 4g=h₂²d; the
  change of synthetic sphere choice κ̄_S↦κ̄_S+τ²ν²κ=5κ̄_S (the
  indeterminacy ⟨τ²ν²κ⟩ with 4κ̄_S=τ²ν²κ) stays in bidegree (20,2)
  and replaces κ̄_ell by 5κ̄_ell and g by 5g, another generator of ℤ/8;
  4·5g=20g=4g. After τ-inversion this becomes the classical change
  κ̄_S↦κ̄_S+ν²κ.
- In π_(20,4)Smf/τ≅ℤ/8 the relation 4ȳ=4g has exactly the four
  solutions ȳ∈{g,3g,5g,7g}, so the relation alone does not determine
  κ̄_ell; the τ²-division does, by the injectivity of τ² on
  π_(20,4)Smf_(2), which rests on the vanishing of π_(21,1)Smf/τ².

*Needs:* E4.S's sphere systems; E4.A's synthetic sphere, Smf and
algebraic stack cohomology; the unit-induced resolution map constructed
in E4.U (CDvN Proposition 5.9, Notation 5.10 and Corollary 5.11).

Use the finite τ-torsion of ν³κ̄_S, the unit equation
unit(κ̄_S)=τ²κ̄_ell, the normalized h₂ and g detections, the synthetic
Leibniz/total-differential comparison and the algebraic source/target
bounds to force d₅(Δ)=±h₂g at 2 (CDvN Proposition 6.19). At 3 transport
E4.S's actual sphere
fifth obstruction and α₁/β₁ detections; the only possible hit on
α₁β₁³ is d₅(±β₁Δ), so permanence of β₁ and the product calculation
force d₅(Δ)=±α₁β₁² (CDvN Proposition 7.2). Prove these uniqueness/nonzero
assertions from
the computed E₂ groups, including all earlier differentials and
indeterminacy. Fix signs by the same generators, keep the later higher
atomic differentials as separate targets, and export these two atomic
inputs before the DSS/Gap calculation.

*Needs:* E4.U's τ² normalization, finite sphere τ-torsion and unit tower
map; E4.S.4's 3-primary fifth obstruction; E4.A's algebraic E₂ groups
and synthetic Leibniz comparison (CDvN Propositions 6.19 and 7.2).

**Checks.**
- At 2, Δ in (24,0) has d₅ target (23,5), matching h₂g in
  (3+20,1+4); using the undivided sphere class gives filtration 3.
- At 3, α₁β₁² has (23,5)=(3+2·10,1+2·2); its product with β₁
  has (33,7), matching the sphere fifth obstruction.
- Multiplying g by 5 replaces h₂g by 5h₂g; since h₂g is 2-torsion,
  5h₂g=h₂g. The initial differential therefore survives the allowed
  choice change, while its construction still records that choice.

Identify the signature filtered E∞ algebra of Smf[J⁻¹]
with the E3 Tmf[J⁻¹] descent tower for every set J of primes, including
products, abutment filtration and the actual convergence hypotheses.
Construct the analogous level/log-site comparison. These structured
identifications follow the synthetic-descent construction in
[Carrick–Davies–van Nigtevecht, *Descent spectral sequences through
synthetic spectra*](https://arxiv.org/abs/2407.01507v2), including its
derived-comodule and log-site comparisons. Before using the Gap Theorem, construct the map
Φ from the derived cubic-stack pushforward to Smf/τ as E∞ Cτ-algebras,
using the specified local derived-comodule comparison. Prove the split
injection on bigraded groups and isomorphism for 5s≤n+12 (CDvN
Proposition 4.3) by the full
cubic and compactified-stack cohomology computations in this E4,
using E1’s local-cohomology triangle and depth-two localization. Transport the normalized cobar
Massey systems along this algebra map. Prove
its algebra action from the synthetic sphere, total differentials, Leibniz
and coherent higher-bracket comparisons. Use E6’s early log-étale level
sheaves to construct synthetic transfers for finite log-étale maps:
construct the enriched span category, its pullback/composition coherence
and the additive extension of the spectral sheaf, with base change and
projection formulas. Identify reduction mod τ with the actual algebraic
cohomology trace (CDvN Theorem 4.4). In particular construct the 2-local Γ₁(3)-to-level-one
transfer and its cubic Hopf-algebroid comparison in the connective region.
Before the Gap Theorem compute H^s(Mbar₁(3)_(2),ω^t)=0 for s>1 and
all integral t, identify its synthetic signature E₂ page with these
groups, and prove its DSS collapses. Present the Bauer §7 change
`(A_(2),Γ_(2))→(A′,Γ′)` and the pushforward p_*O as the free rank 8
left A′-module Γ′, with basis 1,s,s²,s³,t,st,s²t,s³t. Construct the
transfer as the trace of multiplication and calculate its values on
this ordered basis:
`8,−4a₁,2a₁²,−a₁³,a₁³/3−4a₃,−2a₁a₃,−a₁⁵/3+9a₁²a₃,
a₁⁶/3−7a₁³a₃−27a₃²`
(CDvN Proposition 4.6).
Identify the right-unit formulas and prove
`Tr(1)=8`, `Tr(3η_R(a₁a₃))=2c₄` and
`Tr(27η_R(a₃²))=2c₆`; 27 is a unit in ℤ_(2), so 2c₆ lies in the
transfer image. Deduce that 8,2c₄,2c₆, and their ideal
in filtration 0, are permanent cycles in the level-one DSS (CDvN
Corollary 4.9, whose display has −η_R(a₃²) where the trace values
require 27η_R(a₃²)). These are
the transfer outputs used in the independent Gap calculation.

**Checks.**
- At (a₁,a₃)=(1,1) the eight basis traces give Tr(η_R(a₃²))=−362/27
  while 2c₆=−362: the displayed values force the unit factor 27, not a
  sign, and Tr(−η_R(a₃²))=2c₆ fails at this point.
- Tr(η_R(a₁))=0 and Tr(η_R(a₃))=0: the level-one ring has no forms of
  weight 1 or 3, so a nonzero value there would contradict the
  identification of Tr with the algebraic trace (CDvN Theorem 4.4).
- Tr(η_R(a₁⁴))=24c₄ and Tr(η_R(a₁³a₃))=2c₆, the latter an integral
  identity needing no 2-local unit; the trace is the sum of the eight
  conjugates, so Tr(1)=8, and a normalization by the average would give
  Tr(1)=1 and is not even 2-integral.

*Needs:* E1's local cohomology and cubic/compactified calculations;
E4.A's signature and local Cτ algebra comparison; E6's early log-level
sheaf; E4.U's unit (CDvN Propositions 4.3, 4.6, Theorem 4.4 and
Corollary 4.9). Transfer uses the early level sheaf, not the DA(1)
comparison or the Gap Theorem.

**Checks.**
- An identity finite cover has trace 1↦1; a disjoint double identity
  cover has trace (a,b)↦a+b, giving 2 on (1,1). Thus trace is additive,
  not an average, and agrees with the degree-8 Γ₁(3) trace on constants.
- Pulling the double cover back along the identity leaves that sum
  unchanged; the projection formula gives Tr((a,b)c)=(a+b)c. Taking
  (a,b,c)=(1,2,3) gives 9 on both sides.
- At (n,s)=(8,0), 5s≤n+12 reads 0≤20, and Φ carries c₄ to c₄;
  at (−21,1) it reads 5≤−9, which is false. The negative duality class
  is therefore not incorrectly claimed to come from the cubic algebra.

This level/sheaf/transfer sublane precedes coefficient calculations and
uses neither the Gap Theorem nor the DA(1) equivalence. Construct the
four-fold systems in Smf/τ¹⁰ detecting ν₂ and ν₆, first constructing
the prerequisite ν₄. Pin ν₆ to bidegree (147,1) and construct its
system `⟨ν₄,2ντ⁴,ντ⁴,κ̄²⟩` and all detection/extension choices
in full, as well as ν₂ (CDvN Proposition 6.69); the ν₆ argument is its
own construction.
Prove the singleton and mod-τ⁴ detection assertions before the
d₁₃ differentials that use them. In Smf/τ²⁴ construct
τ²κ̄∈⟨κ,2,η,ν⟩ and the compatible shuffle
`τ¹⁶κ̄⁴·⟨κ,2,η,ν⟩·τ⁴κ̄=⟨τ¹⁶κ̄⁴,κ,2,η⟩·τ⁴νκ̄`.
Prove every proper sub-bracket equals {0}, using the π_(95,1)
vanishing and the reduction-map injectivity lifting τ⁴νκ̄=0 from
mod τ¹² to mod τ²⁴ (CDvN Lemma 6.57). Derive τ²²κ̄⁶=0 and, by the
truncated signature comparison, d₂₃(h₁Δ⁵)=g⁶ (CDvN Proposition 6.58). Retain the defined systems and
actual indeterminacy. Carry out the 2- and 3-primary
DSS differentials and extension bounds in stems n>−21 to prove the Gap
Theorem, then the remaining negative stems. The MU-homology comparison
for Tmf comes from this sheaf construction. Only after the Gap Theorem,
prove Mathew's connective-cover comparison identifying MU_*tmf and its
cubic Hopf-algebroid presentation; construct its ANSS and compare it with
the computed descent filtration. Pin the induced retract and connective
region 5s≤n+12, the initial d₃ comparison at 2 and the no-line-crossing
statement from E₅ onward, with the corresponding 3-primary comparison.
Derive the mod-p homology comparisons
from these maps. This order does not use a tmf ANSS computation to
establish its own coefficient input. Supply the synthetic/filtered version
of each higher operation used in the independent DSS argument, on the
same coherent systems as F4's operations after τ-inversion.

*Needs:* E4.U's atomic differentials; E4.A's transfer, τ-quotients and
signature comparison; BordismFormalGroups F4's coherent higher systems
(CDvN Lemma 6.57, Propositions 6.58, 6.69). The connective MU comparison
additionally uses the completed Gap Theorem (Mathew §§3 and 5).

**Checks.**
- The fourfold ν₆ system has stem 99+3+3+40+2=147;
  ν₂ and ν₄ cannot be substituted for ν₆ by copying a low-stem label.
- The d₂₃ source h₁Δ⁵ has (121,1), while g⁶ has (120,24);
  1+23=24 pins the differential length and the target filtration.
- The Gap interval −21<n<0 excludes both −21 and 0; after inverting 6,
  π_(−21)Tmf and π₀Tmf are each ℤ[1/6], while the intervening groups
  are zero. A closed-interval version fails at both endpoints.

Consume E4.U's constructed unit-induced sphere-to-elliptic tower map,
including its even/full grading adapter, actual Hodge twists, products,
differentials and abutment detection. Instantiate F4's
ring/module-spectrum higher Toda comparisons in this descent tower.
Use its threefold Moss theorem only under its explicit synthetic
annihilation hypotheses. For each higher application construct the
filtered iterated-cofiber form, its attaching cells, extension/coextension
maps and all proper faces individually. Compute the τ-power
annihilations, total differentials, residual obstructions, values, full
indeterminacy and detection of the designated 2/3-primary classes. This
provides the required filtered system in each case before applying the
all-arity forward comparison.

*Needs:* E4.U's unit tower comparison; E4.A's τ-truncated modules,
Massey-system transport and detections; BordismFormalGroups F4's
threefold Moss theorem and higher coherent comparisons.

Compute the integral graded coefficient groups and products of tmf and
Tmf, using E4.S's independent sphere calculations, E4.U's unit and
atomic inputs, and F4's single generic Adams–Novikov/cobar and coherent
Toda APIs, with separate p=2 and p=3 descent calculations, the torsion-free
calculation away from 6 and the arithmetic square. In the 2-local
ring, construct the six-fold systems of Bauer Lemma 8.6 and Corollary 8.7,
including a value of `⟨ν,2ν,ν,4ν,ν,η⟩` detected by g and generating
the order 8 summand in degree 20, with its full indeterminacy. Choose
the representative called κ̄ through this system and its detection;
any inference from ηκ̄ must account for ker(η), including 2κ̄.
For degree 110 pin the common target form
`Δ⁴κ∈⟨κ,4ν,3ν,2ν,ν,κ̄⁴⟩`. Construct its complete system and
compare with Bauer’s `⟨κ̄⁴,ν,2ν,ν,4ν,κ⟩` using F4 reversal and
inner juggling: in π₃S_(2)≅ℤ/8 use 12ν=4ν and verify the proper
sub-bracket/compatible-choice hypotheses for moving the factor 3.
Construct the nested systems in Bauer Lemma 8.6 and Corollary 8.7 with
their actual inner choices; determine the sign and designated class
under this comparison. Derive the hidden 2-extension in stem 110 from
the appropriate τ-truncation connecting maps and total differentials,
checking all bidegrees. Prove the detection/injectivity on the relevant
filtration pieces used to pass from its κ̄³-multiple in stem 170; do not
cancel κ̄ as a unit. Give complete
generators, relations, additive orders, differentials and hidden
additive/multiplicative extensions, with their detection maps; a table
of E₂ terms alone is not a homotopy-ring computation. Prove the rational
comparison and
π_*tmf[1/6]≅ℤ[1/6][c₄,c₆], in degrees 8 and 12, with the designated
normalizations. Pin c₄(q)=E₄(q)=240G₄(q) and
c₆(q)=−E₆(q)=504G₆(q), where G_(2k)(q)=−B_(2k)/(4k)+Σ_(n≥1)σ_(2k−1)(n)qⁿ
is the Bernoulli-normalized Eisenstein series (Ando–Hopkins–Rezk (10.8));
B₄=−1/30 and B₆=1/42 give the constant terms 1 and −1.
The factors 240 and 504 are not units over ℤ[1/6]; the coefficient-ring
polynomial generators are c₄,c₆, not the unscaled G₄,G₆.

Construct the integral permanent-cycle lift of Δ²⁴ in degree 576 and
prove the corresponding localization tmf[(Δ²⁴)⁻¹]≃TMF and
Tmf[(Δ²⁴)⁻¹]≃TMF, with their ring and q-expansion maps. Include the
degree 192 periodicity at 2 from Δ⁸, degree 72 periodicity at 3 from Δ³ and the degree 24 period
after inverting 6, verifying the actual powers/permanent cycles.
Do not treat Δ as an integral degree 24 homotopy element without this
calculation. Construct tmf's connective-cover comparison with Tmf and
identify its effect on nonnegative and negative groups separately.
Build the edge map π_(2k)tmf→H⁰(Mbar_ell,ω^k) and determine its
integral image and kernel. Prove Hopkins–Mahowald's image basis
 a_(i,j,k)c₄^i c₆^j Δ^k, i,k≥0, j∈{0,1}, where a=1 for i>0,j=0,
 a=2 for j=1, and a=24/gcd(24,k) for i=j=0 (gcd(24,0)=24).
Compare the chosen native c₆ with the sign convention in each reference.
Compute the torsion kernel and its multiplicative extensions separately.
Construct the periodic edge map
`π_(2k)TMF→H⁰(M_ell,ω^k)=H⁰(Mbar_ell,ω^*)[Δ⁻¹]_k`,
with integral image, kernel and compatibility with the preceding
connective map and Δ²⁴ localization. Its target allows poles at the cusp;
the holomorphic target is the connective map's target.

*Needs:* E4.S's sphere inputs, E4.U's normalization, E4.A's independent
DSS/Gap and higher systems; E3's global spectra and q-expansion;
BordismFormalGroups F4 and F6 (Bauer §8; Hopkins Proposition 4.6).

**Checks.**
- The periodic classes at 2, at 3 and integrally have degrees
  24·8=192, 24·3=72 and 24·24=576. Δ itself is not asserted to lift
  integrally in degree 24; its connective edge-image multiple is 24Δ.
- For i=j=0 and k=0,1,2,3,4,5,6 the image coefficients are
  1,24,12,8,6,24,4. The k=0 value uses gcd(24,0)=24 and excludes a
  division-by-zero convention; at j=1 the coefficient is 2, not 1.
- The sixfold stem-110 system has degree 14+3+3+3+3+80+4=110;
  12ν=4ν in ℤ/8 but 12ν≠4ν in ℤ/24. The juggling identity is therefore
  explicitly 2-local.
- On the periodic target Δ⁻¹ has weight −12 and degree −24; on tmf
  the corresponding negative group is zero. The connective and periodic
  edge targets cannot both be the holomorphic modular-form ring.

### Examples

The τ² choice change, odd parity pair, degree-8 trace and Gap endpoints
above test the synthetic and classical coefficient comparisons.

### Dependencies

E4.S uses F4 independently. E4.A uses E1–E3, E4.S and the early E6
log-level construction; its Gap theorem precedes its connective homology
comparison. E4.U precedes the coefficient calculation.

## Layer 5: E5. Coherent String orientation and the Witten comparison

Construct the E∞ String bordism spectrum MString here. Form
bstring=τ_(≥8)ko from G5's connective real K-theory spectrum ko by G3.8's
connective cover and prove bstring≃Σ⁸ko by the Bott periodicity of G5.4's
KO, so that BString=Ω^∞bstring is the 7-connected cover BO⟨8⟩→BO, with
π₈BString≅ℤ and π_iBString=0 for i<8. Build the units spectrum gl₁(R) of
a commutative ring spectrum R on G's commutative-ring model, its
adjunction with Σ^∞_+Ω^∞ (Ando–Blumberg–Gepner–Hopkins–Rezk, below ABGHR,
Theorem 5.2) and bgl₁(R)=Σgl₁(R). Construct the stable J-homomorphism as
a map of spectra bo→bgl₁(S) whose infinite loop map BO→BGL₁(S)
classifies the universal stable spherical fibration, from G5.3/G5.4's
permutative Grassmannian model of BO under Whitney sum. Define MString as
the E∞ Thom spectrum of the composite bstring→bo→bgl₁(S) (ABGHR
Definition 4.2; Ando–Hopkins–Rezk §5, (5.1)). Prove that its underlying
spectrum is the Thom spectrum of the induced stable spherical fibration
over BString (ABGHR Lemma 4.8) and compare it with G5.3's sequential Thom
spectrum of the finite-rank diagram of 7-connected covers BO⟨8⟩(n)→BO(n)
with the pulled-back universal bundles. Construct the E∞ map
MString→MSpin along bstring→bspin=τ_(≥4)ko, and prove the E∞ comparison
between the Thom spectrum of bspin→bgl₁(S) and G5.4's commutative MSpin,
so that G5.5-ABS's E∞ orientation MSpin→KO restricts to MString.
*Needs:* GeneralizedCohomology G3.8's covers, G5.3's Thom diagrams,
G5.4's ko/KO/MSpin and G5.5-ABS's orientation; the E∞ units/Thom
constructions in this paragraph (ABGHR Definition 4.2, Lemma 4.8,
Theorems 4.9 and 5.2; Ando–Hopkins–Rezk §5).

The units and Thom constructions have the following API:
- π₀gl₁(R) is the multiplicative group of units of π₀R, and its positive
  homotopy groups agree with those of R; bgl₁ is its suspension.
- The Thom spectrum of the point with trivial spherical fibration is S;
  base change and block sum supply the unit and multiplication.
- The J-map classifies the spherical fibration of the specified stable
  bundle and the MString→MSpin comparison preserves the Thom unit.

**Checks.**
- For R=Hℤ, π₀gl₁(R)={1,−1}≅ℤ/2 and π₁gl₁(R)=0; it is not the
  additive group ℤ. For R=H𝔽₂ the units group is trivial, while the
  zero ring has a one-element units group, keeping this boundary case.
- Suspension gives π₁bgl₁(Hℤ)=ℤ/2 and π₀bgl₁(Hℤ)=0. The zero
  virtual bundle has trivial J-class, and its Thom spectrum over a
  point is S with unit 1↦1, not the zero spectrum.
- A trivial spherical fibration over S¹ has Thom spectrum Σ^∞_+S¹
  with cells in degrees 0 and 1; the point has only the degree-0 cell.
  Omitting the disjoint basepoint loses the Thom unit.

Construct the Ando–Hopkins–Rezk orientation σ:MString→tmf as an E∞ map.
Consume E2's K(1)-local realization, Igusa tower, p-adic modular forms
and θ operations. Construct Katz's p-adic modular-form completion and
its comparison with the Igusa functions, including weight/Adams actions
and q-expansion injectivity. Describe the space of E∞ maps MString→R as
the space of lifts of bstring→bgl₁(S)→bgl₁(R) through the fibre of
bgl₁(S)→bgl₁(R) (ABGHR Theorem 4.9; Ando–Hopkins–Rezk Definition 5.3),
with its obstruction fibre sequence. Construct p-adic measures and
moments, Kummer congruences and the Eisenstein-series integrality
relations used in the orientation criterion (Ando–Hopkins–Rezk §§10–12).
Prove the height 1/2 and arithmetic compatibility and the obstruction
vanishing, with the normalization selecting the orientation whose
characteristic series is the sequence of Eisenstein series {G_k}_(k≥4)
(Ando–Hopkins–Rezk Theorem 12.3); rational characteristic-series
equality is insufficient. Compute the genus of σ: the composite
π_*MString→π_*tmf→ℤ[[q]] through E4's edge map and E3's q-expansion is
the ring map whose KO-characteristic series is Witten's
`σ(L,q)=(L^(1/2)−L^(−1/2))∏_(n≥1)(1−qⁿL)(1−qⁿL⁻¹)/(1−qⁿ)²`
(Ando–Hopkins–Rezk §1). Its Hirzebruch characteristic power series is
the reciprocal `x/σ(eˣ,q)`, whose logarithm is
`Σ_(k≥1) 2G_(2k)(q)x^(2k)/(2k)!` in E4's Bernoulli normalization
(Ando–Hopkins–Rezk Proposition 10.9); the characteristic sequence
{G_k}_(k≥4) of Theorem 12.3 is half of these logarithm coefficients
(Ando–Hopkins–Rezk Proposition 5.14, `t_k=2b_k`), and the x² term
2G₂(q)x²/2 is not part of the sequence, which is indexed by
π_(2k)bstring for k≥4. Prove the comparison at the Tate cusp,
MString→tmf→KO[[q]], and the comparison with G5.5-ABS's orientation after
the constant-term map KO[[q]]→KO, q↦0 (Ando–Hopkins–Rezk Theorem 6.1).

**Checks.**
- BString=BO⟨8⟩→BO is an isomorphism on π_i for i≥8 and kills
  π₁BO=ℤ/2, π₂BO=ℤ/2 and π₄BO=ℤ, the only nonzero homotopy of BO below
  degree 8, while BSpin=BO⟨4⟩ keeps π₄. Accordingly the unit S→MString is
  an isomorphism on π_i for i≤6 and onto on π₇, so π₃MString≅ℤ/24 and
  π₄MString=0, whereas π₄MSpin≅ℤ: the Spin cover is the wrong input.
- bstring=τ_(≥8)ko≃Σ⁸ko has π₈=ℤ, π₉=π₁₀=ℤ/2, π₁₁=0 and π₁₂=ℤ; its
  complex analogue Σ⁸ku has π₉=0 and π₁₀=ℤ, so π₉BString=π₈O=ℤ/2 forces
  the real theory.
- At q=0 the Hirzebruch series x/σ(eˣ,0)=x/(e^(x/2)−e^(−x/2)) has
  logarithm −Σ_(k≥1)B_(2k)x^(2k)/(2k·(2k)!): its x⁴/4! coefficient is
  −B₄/4=1/120=2G₄(0), while log(σ(eˣ,0)/x) has −1/120 there. The
  reciprocal series, not σ itself, carries the Eisenstein coefficients,
  and the resulting sequence −B_(2k)/(4k)=G_(2k)(0) is the
  Atiyah–Bott–Shapiro sequence of Theorem 6.1 (Ando–Hopkins–Rezk
  Example 5.15).

*Needs:* E5's MString, units and obstruction fibre; E2.4's Igusa
realization and θ operations; E3's KO[[q]] and constant-term map;
E4's coefficients and normalized q-expansions; GeneralizedCohomology
G5.5-ABS (Ando–Hopkins–Rezk §§5,10–12, Theorems 6.1 and 12.3).

**Checks.**
- For ℤ_p-valued measures on ℤ_p×, the Dirac measure at 1 has kth moment
  1 for every k≥0; the measure
  δ₁−δ_(−1) has moment 0 for even k and 2 for odd k. Replacing measures
  by their total mass identifies δ₁−δ_(−1) with the zero measure and loses
  the odd moments.
- A Dirac measure at a satisfies every moment congruence inherited
  from evaluation at a; in particular (x^p−x)(a) is divisible by p for
  a∈ℤ_p×. At p=2,a=3 it equals 6, and at p=3,a=2 it equals 6.
- The characteristic series has constant term 1 and q=0 value
  x/(e^(x/2)−e^(−x/2))=1−x²/24+7x⁴/5760+… . Its logarithm has x⁴
  coefficient 1/2880, hence divided-power coefficient 1/120; reversing
  the reciprocal gives −1/120.
- The orientation maps the Thom unit to 1, and its constant q-term
  agrees with ABS. On modular forms c₄(0)=1, c₆(0)=−1 and Δ(0)=0;
  the zero genus fails already on the unit.

Determine the image of σ_* on π_* and its torsion information,
including the orientation's surjectivity theorem. Construct
Devalapurkar's loop-space Thom E1 ring B and its map to MString. Own the
finite unstable inputs of this construction: the fibre bundle
O(9)→O(10)→S⁹ given by the last column on Mathlib's
`Matrix.orthogonalGroup`, with S⁹=O(10)/O(9) and the associated bundle
O(10)×_(O(9))ℝ⁹ identified with the tangent bundle of S⁹, so that the
fibre sequence S⁹→BO(9)→BO(10) classifies that bundle; the stable
identification π₁₂S⁹≅π₃S≅ℤ/24 by G2.5's Freudenthal theorem and E4.S's
stem-3 calculation; and a clutching element f∈π₁₂O(10) whose boundary
image in π₁₂S⁹ is 2ν, equivalently the nullity of the composite of 2ν
with the tangent classifier S⁹→BO(9), proved from the fibrations
O(k)→O(k+1)→S^k for 9≤k≤12 and the EHP calculations of π₁₁S^k and π₁₂S^k
in that range (the group is Kervaire's π₁₂O(10)≅ℤ/12; Devalapurkar
Construction 3.1). Use f to construct BN as the homotopy pullback of
S¹³→BO(10)←BO(9), N=ΩBN with its fibre sequence ΩS⁹→N→ΩS¹³, and the loop
map N→BString extending the generator of π₈BString along the composite
S¹²→S⁹→B²String=Ω^∞Σbstring, the single delooping of BString.
Here π₉B²String=π₈bstring=ℤ and π₁₂B²String=π₁₁bstring=π₁₀O=0;
the generator extends to BN by the Atiyah–Hirzebruch–Serre argument
of Devalapurkar Construction 3.1, and looping gives N→BString.
Prove BP_*B=BP_*[b₄,y₆], degrees 8, 12, by the Thom
isomorphism and the even-cell collapse of the Atiyah–Hirzebruch spectral
sequence (Devalapurkar Proposition 3.2), the equivalence of B→MString→tmf
in dimensions at most 12, and the mod-2 homology F₂[ζ₁⁸,ζ₂⁴] with F2's
Steenrod-dual coaction. Prove the 2- and 3-local Adams–Novikov
differentials and Toda relations that lift all tmf generators. For the higher operations use F4's coherent
systems and E4's detections. In particular construct a system in B whose
image is the six-fold system
Δ⁴κ∈⟨κ,4ν,3ν,2ν,ν,κ̄⁴⟩⊆π_110 tmf_(2), and compute the target
indeterminacy needed for the lift. Construct the B-side defining systems
and image comparisons for all of Devalapurkar Proposition 5.9(a)–(h).
In particular the lift route for 2Δ⁵ν and Δ⁵ε uses its threefold
systems `⟨2ν,Δ⁴ν,κ̄⟩` and `⟨ε,Δ⁴ν,κ̄⟩`, with their coherent
B-side lifts. Separately construct the filtered J₅(S⁴)^μ Thom form
and prove the sevenfold computations
`2Δ⁵ν∈⟨2ν,5ν,4ν,3ν,2ν,ν,κ̄⁵⟩` and
`Δ⁵ε∈⟨ε,5ν,4ν,3ν,2ν,ν,κ̄⁵⟩`, including indeterminacy and
cell-by-cell obstructions. The surjectivity proof uses Proposition 5.9,
independently of these sevenfold computations.

**Checks.**
- H_*(ΩS⁹)=ℤ[x₈] and H_*(ΩS¹³)=ℤ[x₁₂], so the Serre spectral sequence
  of ΩS⁹→N→ΩS¹³ is even and collapses, H_*(N) has Poincaré series
  1/((1−t⁸)(1−t¹²)), and the Thom isomorphism gives BP_*B=BP_*[b₄,y₆];
  with S⁸ in place of S⁹ the fibre ΩS⁸ has the tensor algebra on an odd
  class x₇ and B would have odd cells.
- 2ν has order 12 in π₁₂S⁹≅π₃S≅ℤ/24, the order of π₁₂O(10)≅ℤ/12, so
  f↦2ν is injective and ν itself is not a boundary; the composite
  S¹²→S⁹→B²String is null because π₁₂B²String=π₁₁BString=π₁₀O=0,
  whereas the corresponding group for a 13-sphere, π₁₃B²String=π₁₁O=ℤ,
  does not vanish. The twice-suspended model Ω^∞Σ²bstring instead has
  (π₉,π₁₂,π₁₃)=(0,ℤ/2,0), so it cannot extend the degree-8 generator.
- H_*(B;F₂)=F₂[ζ₁⁸,ζ₂⁴] sits in H_*(tmf;F₂)=F₂[ζ₁⁸,ζ₂⁴,ζ₃²,ζ₄,…] with
  first missing class ζ₃² in degree 14, consistent with B→tmf being an
  equivalence in dimensions at most 12; rationally π_*B⊗ℚ=ℚ[b₄,y₆]→
  ℚ[c₄,c₆] is onto in degrees 8 and 12 (Devalapurkar Proposition 3.5).

*Needs:* GeneralizedCohomology G2.5's Freudenthal comparison and G5's
bundle classifiers; Mathlib `Matrix.orthogonalGroup`; E4.S's sphere
inputs and E4's tmf coefficients; E5's bstring and the loop Thom
construction below (Devalapurkar Construction 3.1, Proposition 3.2
and Proposition 5.9). The independent sevenfold systems additionally
use BordismFormalGroups F4 and the James filtration.

Own the special E1 Thom/quotient refinement for these loop maps: construct
the loop-multiplicative spherical-fibration diagram, its derived Thom
colimit with coherent associative multiplication, unit and maps, and its
comparison with G5.3's underlying bundle-diagram Thom spectrum. Construct
the relative Thom form over S//σ from ΩS⁹→N→ΩS¹³, and its multiplicative
comparison used for BP_*B and B→BP. Prove its
E1 cell-attachment/quotient universal property and the James-filtration
Thom comparisons used above. Compare the constructed E1 map B→MString,
the Thomification of N→BString into the E∞ MString above, with its
underlying E1 model.
*Needs:* E5's loop map and spherical fibration; GeneralizedCohomology
G5.3's underlying Thom colimit; BordismFormalGroups F4's attaching
systems (Devalapurkar Proposition 3.2 and its proof).

**Checks.**
- Restriction to the bottom S⁸→ΩS⁹ gives the J-class σ in π₇S;
  its image in the E1 quotient S//σ is zero. Using the trivial loop
  map instead retains σ and gives a different Thom spectrum.
- The relative degree-12 attachment detects a class in π₁₁(S//σ);
  under B→BP this class and σ map to zero because π₁₁BP=π₇BP=0.
  Those are the two extension conditions, not mere equality on π₀.
- The first James filtration stages on S⁸ have quotient cells in
  degrees 0,8,16; the second generator from ΩS¹³ has degree 12.
  The resulting first monomials in BP_*B are 1,b₄,y₆,b₄² in
  degrees 0,8,12,16, excluding a suspension-shifted quotient.

Build the auxiliary finite complex DA(1) and E6's specific 2-local
Γ₁(3) module comparison, including the unit-induced tmf→tmf∧DA(1)
map and its effect on the chosen classes. Own here the additional
B∧DA(1)≃T(2) construction: construct X(4)_(2), its Quillen-idempotent
summand T(2) and the equivalence, its maps to BP and tmf₁(3), the
commuting square over B→tmf, and the attaching-map/filtration comparison
used for the lifts. Prove the coefficient normalization and construct
classes in π_*B_(2) mapping to c₄Δ^k and 2c₆Δ^k in π_*tmf_(2),
for every k≥0. Use the DA(1) bottom-cell cofiber and its actual cell
filtration: choose the corresponding T(2) classes, compute and kill their
successive B-side attachment obstructions, and prove that the descended
B classes have the required tmf detections, including extension choices.
The commuting T(2) square is an input to these cell-by-cell lifts.
Then perform arithmetic reconstruction.
Keep the edge-map image a separate
calculation: surjectivity onto tmf does not make every integral modular
form a Witten genus. The geometric kernel questions, which String bordism
classes have vanishing image under σ and whether that kernel is a given
geometric ideal, belong to a consumer; this roadmap supplies the
spectrum, the orientation and the q-expansion/torsion comparisons they
require.

*Needs:* E6's DA(1) complex and tmf-module comparison; E5's B and its
Thom filtration; BordismFormalGroups F4's BP and idempotent machinery;
E4's coefficients and coherent detections (Devalapurkar §§4–5).

**Checks.**
- Rationally B has generators of degrees 8 and 12, and DA(1) has
  Poincaré polynomial (1+t²+t⁴+t⁶)(1+t⁶). Their product cancels
  (1−t⁸)(1−t¹²), leaving 1/((1−t²)(1−t⁶)), the degrees of T(2)'s
  two generators. A wedge with a different degree-6 multiplicity fails.
- The bottom-cell map sends 1 to 1 in B∧DA(1) and in tmf∧DA(1);
  hence both composites around the T(2) comparison square send 1 to 1.
- For k=0 the required lifts detect c₄ and 2c₆; for k=1 they detect
  c₄Δ and 2c₆Δ. Their degrees are 8,12,32,36, and the edge image
  permits coefficient 1 on c₄Δ but requires 2 on c₆Δ.

### Examples

The groups of bstring and its single delooping, units of Hℤ, Dirac
moments and the q=0 Hirzebruch series distinguish the orientation data.

### Dependencies

The MString construction uses G2–G5; orientation uses E2–E4; the B-side
surjectivity argument also uses the independently constructed E6 DA(1)
comparison. The sevenfold calculations are not surjectivity inputs.

## Layer 6: E6. Levels, boundary maps and reusable applications

The log-site, level-stack and spectral-sheaf construction below uses E1–E3
and precedes E4’s independent descent calculation. Its coefficient and
connective finite-complex comparisons use the completed E4 Gap Theorem.

Construct logarithmic structures on schemes and stacks, their pullbacks,
charts, fine saturated monoids, characteristic sheaves and the divisorial
log structure at the supplied nodal boundary. Construct Kato log-étale
morphisms, their chart criterion, base change, composition and descent,
the log-étale site and hypercovers. Compare the ordinary and log-étale
sites on the smooth locus and their boundary charts. These logarithmic
foundations and Hill–Lawson's spectral boundary extension use the existing
level-one compactification and its E3 ordinary-étale sheaf. Construct
their comparison on level one, preserving the Tate/K-theory model and
its transition maps, before identifying the level sheaf pullbacks.

*Needs:* E1's nodal charts and E3's level-one sheaf; the log charts,
sites and spectral extension constructed here (Hill–Lawson §2 and
Theorem 5.17).

**Checks.**
- The chart ℕ→ℤ[[q]], 1↦q has characteristic monoid ℕ at q=0 and
  zero characteristic on q≠0; a constant trivial log structure misses
  the boundary, while a constant ℕ misses the smooth locus.
- The tame chart q=t^N has characteristic group cokernel ℤ/N;
  for N=1 it is the identity, and for N=3 over ℤ[1/3] its order is
  invertible. Over characteristic 3 that same chart is not log-étale.
- On the smooth locus with trivial log structure an étale identity
  cover remains an identity cover; on the boundary, q=t² is ramified
  as a scheme map at t=0 but log-étale when 2 is invertible. Thus the
  two sites agree only on the stated locus.

Use ModularCurves' actual level structures to construct the elliptic
sheaf pullbacks and their global Tmf(Γ) spectra for the tame
Γ(N), Γ₁(N), Γ₀(N) problems, with the level inverted and the exact
stack/representability hypotheses. Construct the compactified level
stacks of generalized elliptic curves with the specified ample level
structure, including Néron n-gons, contraction/stabilization, properness,
log-étale transition maps and comparison with ModularCurves' coarse
compactifications. Prove their pullback/descent relation to the
level-one stable compactification. Prove forgetful and change-of-level
maps, descent under deck groups and boundary K-theory comparisons.
*Needs:* ModularCurves §5B's level moduli and Layer 10's coarse
compactification; E1's level-one stack; E6's log site and E3's sheaf
(Hill–Lawson §3 and Theorems 5.17, 6.1).

**Checks.**
- At level 1 forgetting the level is the identity on Tmf and on the
  Tate chart; for an ordered full level 3 at a smooth curve the 48
  bases include both Weil-pairing values, while fixing the pairing
  gives 24. Descent must use the actual deck group.
- On the Néron n-gon the smooth components form ℤ/n; contracting to
  the 1-gon sends every component to its single component. For n=1
  this is the identity and for n=2 it sends both 0 and 1 to 0.
- On a tame cusp with width N, q=t^N pulls back Δ=q+… to t^N+…;
  its vanishing order is N, not 1. At N=2 the first term is t²,
  distinguishing the level boundary map from an unchanged q-coordinate.

Define connective covers individually; a level theory is not obtained
by simply tensoring the level-one coefficient ring. For Γ₁(3), construct
the finite 2-local complex DA(1) with its cells, attaching maps and duality,
and prove the tmf_(2)-module equivalence
tmf_(2)∧DA(1)≃tmf₁(3)_(2). Pin the comparison of the bottom-cell/unit
map with the change-of-level map, the complex orientation and its
coefficient normalization, and the mod-2/MU/BP homology comparisons.
Use the Γ₁(3) Tate normal form y²+a₁xy+a₃y=x³ and prove
π_*tmf₁(3)_(2)≃ℤ_(2)[a₁,a₃], |a₁|=2, |a₃|=6. With
E1’s native sign convention pin
c₄↦a₁⁴−24a₁a₃,
c₆↦−a₁⁶+36a₁³a₃−216a₃² and
Δ↦a₁³a₃³−27a₃⁴. Compute the chosen complex orientation’s
BP/Hazewinkel coordinate conversion and distinguish its mod-2 or
indecomposable congruences from integral polynomial identities.
E5 constructs its B-smash comparison separately from this tmf-module
equivalence. Distinguish 2-localization from 2-completion in these statements and prove any
completion comparison used in the coefficient calculation.

**Checks.**
- The question-mark complex Q has cells in dimensions 0, 2, 6, so Q∧DQ
  has nine cells in dimensions −6,−4,−2,0,0,0,2,4,6 and Euler
  characteristic 9; splitting off S⁰ uses that χ(Q)=3 is a 2-local unit,
  and the six-fold suspension of the complement has cells in dimensions
  0,2,4,6,6,8,10,12 (Mathew Definition 4.2). At the prime 3 this
  splitting is unavailable and a different three-cell complex X₃ gives
  tmf∧X₃≃tmf₁(2).
- H_*(DA(1);F₂) is spanned by ξ₁^(2a)ζ₂^(2b), 0≤a≤3, 0≤b≤1, with
  Poincaré polynomial (1+t²+t⁴+t⁶)(1+t⁶)=(1−t⁸)(1−t¹²)/((1−t²)(1−t⁶)),
  the quotient of the Poincaré series of ℤ_(2)[a₁,a₃] by that of
  ℤ_(2)[c₄,c₆]: the rational comparison already forces eight cells in
  exactly these degrees.
- Sq² and Sq⁴ act nontrivially on the bottom class, so the 2-cell is
  attached by η and the 4-cell by a map detected by Sq⁴; a wedge of
  eight even spheres has the same cell count, but tmf∧(wedge) has
  η-torsion one degree above every cell, whereas ℤ_(2)[a₁,a₃] is
  torsion-free.

*Needs:* E6's Γ₁(3) sheaf; GeneralizedCohomology G3.8's connective
covers and G5's finite duality; E4's Gap and homology comparisons;
BordismFormalGroups F2/F4's Steenrod and BP comparisons (Mathew
Definitions 4.1–4.2 and §4; E1's native Weierstrass signs).

Construct the primary and secondary detection maps that String-bordism
consumers use: low-stem unit images, the q-expansion edge and the torsion
kernel, and the connective-to-periodic change, with the localization
criterion that x∈π_n tmf maps to zero in π_n TMF exactly when D^j·x=0 in
π_(n+576j)tmf for some j≥0, where D is E4's degree-576 permanent class
with tmf[D⁻¹]≃TMF.
Do not deduce torsion-sensitive vanishing from zero rational or modular
q-expansion. General elliptic indices of field theories are not
assumed in this spectral construction.

*Needs:* E4's permanent degree-576 class, localization and edge maps;
E3's q-expansion and E6's actual comparison maps.

**Checks.**
- Zero is killed by D⁰=1; the unit is not D-power torsion, since
  D^j is nonzero rationally for every j≥0, and maps to the unit in TMF.
- D^j·x has degree n+576j, so for j=1 and x=1 the degree is 576;
  using 24 here would silently localize at an unavailable integral Δ.
- The nonzero unit image η in π₁tmf has zero even modular-form edge
  image; therefore zero q-expansion alone does not imply a class is
  zero. The localization test asks for actual D-power annihilation.

### Examples

The tame chart q=t², Néron 2-gon contraction, eight DA(1) cells and
D-power annihilation tests distinguish levels and periodic detection.

### Dependencies

The early log-level construction uses E1–E3 and the ModularCurves level
contracts; its finite-complex and coefficient comparison uses E4's Gap
Theorem. The detection maps use E3's q-expansion and E4's localization.

## Downstream consumers

Downstream, the geometric String-bordism roadmap StringOrientation
consumes E4's permanent classes Δ⁸, Δ³ and Δ²⁴ with the localization
tmf[D⁻¹]≃TMF, E5's orientation and genus comparison, and E6's detection
maps and localization criterion; nothing in this roadmap is consumed from
it.

## References

- Goerss, [*Topological modular forms (after Hopkins, Miller, and Lurie)*](https://arxiv.org/abs/0910.5130), for the realization and algebraic geometry.
- Hill–Lawson, [*Topological modular forms with level structure*](https://arxiv.org/abs/1312.7394), for the log-étale sheaf and boundary construction.
- Douglas–Francis–Henriques–Hill (eds.), [*Topological Modular Forms*, author’s final version](https://www.math.ucla.edu/~mikehill/Research/surv-douglas2-201.pdf), Mathematical Surveys and Monographs 201, American Mathematical Society, 2014, Chapters 6–8, 12 and 16; in Chapter 12 use §7 and Appendix A for the 2-primary obstruction theory and §8, Lemmas 8.3–8.6 for the chromatic comparison.
- Hopkins, [*Algebraic topology and modular forms*](https://arxiv.org/abs/math/0212397), Proposition 4.6, for the integral edge-image basis (with the stated c₆ convention comparison).
- Bauer, [*Computation of the homotopy of the spectrum tmf*](https://arxiv.org/abs/math/0311328), for integral coefficients and higher Toda calculations.
- Pstrągowski, [*Synthetic spectra and the cellular motivic category*](https://arxiv.org/abs/1803.01804), for the spherical spectral-sheaf model and its algebraic/topological comparisons.
- Carrick–Davies–van Nigtevecht, [*The descent spectral sequence for topological modular forms*](https://arxiv.org/abs/2412.01640v2), for the independent DSS/Gap calculation and subsequent connective ANSS comparison.
- Mathew, [*The homology of tmf*](https://arxiv.org/abs/1305.6100), for the Gap-dependent connective homology and the Γ₁(3) finite-complex comparison.
- Ando–Hopkins–Rezk, [*Multiplicative orientations of KO-theory and of the spectrum of topological modular forms*](https://rezk.web.illinois.edu/koandtmf.pdf), preprint (2010), for the orientation criterion, the Eisenstein normalization and the ABS comparison.
- Ando–Blumberg–Gepner–Hopkins–Rezk, [*Units of ring spectra, orientations, and Thom spectra via rigid infinite loop space theory*](https://arxiv.org/abs/1403.4320), for the coherent Thom/units machinery.
- Devalapurkar, [*The Ando–Hopkins–Rezk orientation is surjective*](https://arxiv.org/abs/1911.10534), for the coefficient-image theorem and its additional proof constructions.
